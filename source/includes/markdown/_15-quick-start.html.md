<hr class="full-line">
<section class="full-section">

# Quick Start

## Triage Bot

>### Let’s start coding!

>Follow along below in the right pane to see the terminal commands 
and code for this tutorial. We will use a very basic file structure for the purposes of this guide. Start by making a project directory, moving into it, and running `npm init`.

```shell
!
$ mkdir triage-bot
$ cd triage-bot
$ npm init
```

> Install the Node Asana client library and create config and app files:  

```shell
!
$ npm install asana
$ touch config.js app.js

```
 
> Add gids (global ids) for the workspace, design request project, and designers that will be assigned requests 
(note that all gids in Asana should be strings).  You can get a project’s gid from its URL in the Asana web product 
(e.g. the structure of links for a task is www.asana.com/0/{project_gid}/{task_gid}). Similarly, you can get user’s 
gid from the URL of their task list (i.e. click on their name in Asana). To get your workspace gid(s), go to 
https://app.asana.com/api/1.0/users/me/workspaces.

```javascript
!
let config = {
  workspaceId: "15793206719",
  designRequestProjectId: "180350018127066",
  //gids of designers who are fulfilling design requests
  designers: ["180015866142449", "180015866142454", "180015886142844"]
};

module.exports = config;
```

> Next, let’s get started on our app.js file. Include the Asana node client library and the config file:
 
```javascript
!
let asana = require('asana');
let config = require('./config');
```

> Get your access token and use it to create an Asana client. At the time of writing this guide, the Asana API is going 
through two deprecations (moving to string gids and changing how sections function). You can learn about our 
[deprecations framework in our docs](#deprecations). 
To prevent my app from breaking when the deprecations are finalized, I'm passing headers to enable the new API 
behavior for string gids and sections. We will also set a delay to determine how quickly our parallel requests are sent.

```javascript
!
// Get personal access token (PAT) from environment variables.
const accessToken = process.env.triage_bot_pat;

const deprecationHeaders = {"defaultHeaders": {"asana-enable": "new_sections,string_ids"}};

// Create Asana client using PAT and deprecation headers.
const client = asana.Client.create(deprecationHeaders).useAccessToken(accessToken);

// Request delay in ms
const delay = 200;

```

> Use the search API to fetch unassigned tasks from the design requests project. 
Note that the search API doesn’t return paginated results so you need to pass the max 
limit which is 100. If there are often more than 100 unassigned tasks, you can add a 
function to keep running the script until there are no more unassigned tasks.

```javascript
!
function getUnassignedTasks() {
  let workspaceId = config.workspaceId;
  let params = {
    "projects.any" : config.designRequestProjectId,
    "assignee.any" : "null",
    "resource_subtype": "default_task",
    "fields": "gid",
    "limit": 100
  };
  client.tasks.searchInWorkspace(workspaceId, params).then(tasks => {
    randomAssigner(tasks.data);
  });
}
```

> We’ll need a few helper functions. One to shuffle an array and another to assign tasks.

```javascript
!
function shuffleArray(array) {
  for (let i = array.length - 1; i > 0; i--) {
      let j = Math.floor(Math.random() * (i + 1));
      let temp = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
  return array;
}

function assignTask(taskStringId, assigneeStringId) {
  client.tasks.update(taskStringId, {assignee: assigneeStringId})
}
```

> Our final function will take the array of unassigned tasks and round-robin assign them to the group of shuffled 
designers from the config file. We will use an interval to loop so we can control the speed of the requests. 
You can change the delay with the const you declared earlier. This is a balance between speed and staying within our 
[concurrent request limit](#concurrent-request-limits). 
In node, a normal loop would send all requests at once, which doesn’t work in larger projects.

```javascript
!
function randomAssigner(unassignedTasks) {
  let shuffledDesigners = shuffleArray(config.designers);
  let numDesigners = shuffledDesigners.length;

  // Let's use an interval to loop, so we control how quickly requests are sent
  let index = 0;
  let interval = setInterval(function() {
    assignTask(unassignedTasks[index].gid, shuffledDesigners[index % numDesigners]);
    index++;

    // When our index reaches the end, we're done
    if (index >= unassignedTasks.length) {
      clearInterval(interval);

      console.log("You've assigned " + unassignedTasks.length + " new design requests");
    }
  }, delay);
}

```

> Then we just need to call our getUnassignedTasks function to kick-off the script:

```javascript
!
getUnassignedTask();
```

> Now run your script, sit back, and watch the bot do your work.

```shell
!
$ node app.js
```

### Why build a bot?
When processes get complex in Asana there can begin to be work about work. This could be happening to you (or someone you love) if you find yourself spending time doing repetitive work such as triaging tasks, reminding people to do something, or adding/removing followers as you move a task through a workflow. 

### What we’re going to build
In this guide, we will build a simple triage bot that will assign tasks. This is a common Asana use case with support inboxes or request projects. 

If you want to skip ahead and see the code for the triage bot, it’s on Github in the Javascript folder of our [devrel-examples repo](https://github.com/Asana/devrel-examples).

For this guide, let’s suppose a design team has a requests project where people from the marketing team fill out an [Asana form](https://asana.com/guide/help/premium/forms) to request graphics from the design team. The form creates a task in the design requests project that needs to be assigned to a designer. 

Our triage bot will gather all unassigned tasks in the design request project and then randomly distribute the requests across a group of designers. 

For the purposes of this guide, we will keep it this simple, however, you could add more complex logic to your bot. For instance, you could check custom field values on the request task to see what type of request it is (e.g. video, graphic, logo, etc.) and then assign it to the designer that has those skills.  You could go even further and check the designers workload to see who currently has the least amount of work already assigned to them (this could be determined by a point value for tasks assigned to them in the project). You could then have the bot ping the design request task as it approaches the due date to ensure that the designer will have it completed on deadline.

### Helpful links
Before we get started, here are some helpful links for building on the Asana API:

* [Asana API reference docs](#asana)
* [Asana longform documentation](#why-use-asana-39-s-api)
* [Asana developer community](https://forum.asana.com/c/developersAPI) -- if you get blocked or have a question about the API, there are devs in our community that are eager to help. We also post API updates and news to the community forum.
* The [code for this bot on Github](https://github.com/Asana/devrel-examples/tree/master/javascript/triage_bot)

### Create your bot user in Asana
Create a new Asana account for your bot ([instructions for inviting users](https://asana.com/guide/help/organizations/members#gl-invite)). You want to create a distinct Asana account for your bot because any action it takes in Asana will be attributed to this user. Give your bot a name and photo that will be recognizable to users in Asana that encounter it. Note that if your bot is a guest member in Asana that it will need to be added to every project you need it to work in. Bots based on guest Asana accounts will also not have access to some API features such as defining new custom fields or modifying their settings.

### Authenticating your bot
We will authenticate our bot using a [Personal Access Token (PAT)](#personal-access-token). Log in to the Asana account that will be used for the bot and navigate to the developer console. You can get to your dev console by either using this URL https://app.asana.com/-/developer_console or from within Asana by clicking your photo icon in the upper right of Asana -> My Profile Settings -> Apps -> Manage Developer Apps.

Next, click “+ New access token” and follow the instructions to get your token. Treat this token like a username and password. Don’t share it with anyone and never publish it to a public repository. I like to save my PAT as an environment variable (here are instructions on [how to do this on Mac](https://medium.com/@himanshuagarwal1395/setting-up-environment-variables-in-macos-sierra-f5978369b255)). For this guide, I’ve saved a PAT as an env variable called `triage_bot_pat`.

### Create an Asana sandbox
Before we start coding, [create a project in Asana](https://asana.com/guide/help/projects/basics#gl-create) to use as a sandbox. While not required, I like to [set the project to private](https://asana.com/guide/help/permissions/project-permissions#gl-private-project) while developing. To get some users in the project, add your main Asana user as well as your bot account. You could also invite a personal email as a guest user.

### Choose an Asana client library 
The Asana API has [SDKs in several popular languages](#official-client-libraries). For most developers, we recommend using one of our client libraries because they help with some of the complexities of using an API such as authentication, pagination, and deprecations. 

For this guide, we will use the [Asana Node client library](https://github.com/Asana/node-asana), however, you can follow along in any language of your choice. 

Each library has an examples folder in addition to the readme, which can be helpful for getting started. The methods for each resource can be found in the “gen” folder of each client library (e.g. node-asana/lib/resources/gen/).

###Now head over to the top of the right pane to start coding your bot ----->

>### Congratulations! Now go above and beyond
You’ve created an Asana triage bot. Let’s explore a few ideas on how to make it even better.

>### Deploy your app 
While you can run your bot from the command line, that seems like a lot of work to run a bot that’s supposed to eliminate work about work.

>One option is to use launchd to automatically execute your script (launchd is like cron but better). Here’s a [tutorial to get you started with launchd](https://medium.com/@chetcorcos/a-simple-launchd-tutorial-9fecfcf2dbb3).

>The next step would be to deploy to a hosted server. [Here’s a guide](https://api.slack.com/docs/hosting) exploring some of the popular hosting providers. Hosting your app makes it more resilient and allows you to create more sophisticated apps (e.g. use webhooks).   

>### Use Asana as your config file 
To take your bot’s accessibility to the next level, put your configuration in an Asana task(s) and then have your script read that task(s) for instructions. This allows you (or anyone else) to make config changes without touching any code. For example, if a designer is on vacation, you can easily remove them from the group that gets assigned requests. Similarly, if a designer joins or leaves the team, this change could be easily configured in a task instead of having to change the bot’s code.

>To see this approach in the wild, checkout [Ohmega](https://github.com/Asana/ohmega), an automation framework we created. Here’s the [configuration service](https://github.com/Asana/ohmega/blob/master/ohmega/services/configuration_service.py) that reads a tree of tasks for its configuration. 

>### Use webhooks for real-time triaging 
If you need your bot to react to changes in real time, then you’ll need to use [webhooks](#asana-webhooks). We built a [python webhook inspector](https://github.com/Asana/devrel-examples/tree/master/python/webhooks) to help developers get started using Asana webhooks. 

---

## Python Hello World

```python
!
import asana

# replace with your personal access token. 
personal_access_token = '0/123456789....'

# Construct an Asana client
client = asana.Client.access_token(personal_access_token)
# Set things up to send the name of this script to us to show that you succeeded! This is optional.
client.options['client_name'] = "hello_world_python"

# Get your user info
me = client.users.me()

# Print out your information
print "Hello world! " + "My name is " + me['name'] + "!"

```

To get started, run `pip install asana` or follow the detailed installation instructions on the [GitHub page for the Python client library](https://github.com/Asana/python-asana/).  

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` in Python.


Save this file as something descriptive like "hello_world.py"

To run this script in your console, pass it as an argument to the python interpreter, i.e. `python hello_world.py` from the same directory as the file. You should see the message we wrote above with your user information.

As an aside, for clarity `python-asana` will also work with Python 3.x (with small changes to the above example to make it compatible.)

All of the built-in functions can be found in the [/gen folder of the client library](https://github.com/Asana/python-asana/tree/master/asana/resources/gen). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/python" target="_blank">Github examples repository</a>

---

## Node Hello World

```javascript
!
var asana = require('asana');

// replace with your personal access token. 
var personalAccessToken = '0/123456789....';

// Construct an Asana client
var client = asana.Client.create().useAccessToken(personalAccessToken);

// Get your user info
client.users.me()
  .then(function(me) {
    // Print out your information
    console.log('Hello world! ' + 'My name is ' + me.name + '!');
});
```

To get started, `npm install asana` or follow the detailed installation instructions on the [GitHub page for the Node client library](https://github.com/Asana/node-asana/).  

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` - the same request as above but in Javascript.

Save this file as something descriptive like "hello_world.js"

To run this script in your console, pass it as an argument to the node interpreter, i.e. `node hello_world.js` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in functions can be found in the [/gen folder of the client library](https://github.com/Asana/node-asana/tree/master/lib/resources/gen).

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/javascript" target="_blank">Github examples repository</a>

---

## Ruby Hello World

```ruby
!
require 'asana'

# replace with your personal access token. 

personal_access_token = '0/123456789....'

client = Asana::Client.new do |c|

  c.authentication :access_token, personal_access_token

end

me = client.users.me

puts "Hello world! " + "My name is " + me.name + "!"
```

To get started, `gem install asana` or follow the detailed installation instructions on the [GitHub page for the Ruby client library](https://github.com/Asana/ruby-asana/).  

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` - the same request as above but in Ruby.

Save this file as something descriptive like "hello_world.rb"

To run this script in your console, pass it as an argument to the ruby interpreter, i.e. `ruby hello_world.rb` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in methods can be found in the [/resources folder of the client library](https://github.com/Asana/ruby-asana/tree/master/lib/asana/resources). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/ruby" target="_blank">Github examples repository</a>

<div>
  <div class="docs-helpful-feedback-content">
      <h4>Was this section helpful? <a class="feedbackPositive" style="cursor:pointer;">Yes </a><a class="feedbackNegative" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
