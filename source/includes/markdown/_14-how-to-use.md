<hr class="full-line">

# How to use the API

> Request

```
https://app.asana.com/api/1.0/users/me
```

*If you're familiar with building against APIs, you can jump to our [Quick Start](#quick-start).*

<br></br>

If you’re new to developing on APIs, this is a great place to start.  You’ll learn in this guide how to make the simplest Asana API request -- getting your user information. 

To get started

1. Be [logged into Asana](https://app.asana.com).  
2. Go to this URL: <a href="https://app.asana.com/api/1.0/users/me?opt_pretty&opt_client_name=hello_world_browser" target="_blank">https://app.asana.com/api/1.0/users/me</a>

> Response

```json
{
  "data": {
    "gid": "12e345a67b8910c11",
    "email": "jonsnow@example.com",
    "name": "Jon Snow",
    "photo": {
      "image_21x21": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_21x21.png",
      "image_27x27": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_27x27.png",
      "image_36x36": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_36x36.png",
      "image_60x60": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_60x60.png",
      "image_128x128": "https://s3.amazonaws.com/profile_photos/121110987654321.hJGlskahcKA5hdslf4FS_128x128.png"
    },
    "resource_type": "user"
  }
}
```

And Congratulations! You’ve just made your first Asana API request.  

<br></br>

Let’s unpack what just happened. The base URL for all requests to the Asana API is `https://app.asana.com/api/1.0`. We want information about users, so we go down a level to the `https://app.asana.com/api/1.0/users` resource.  Within the set of all users in Asana, We’re specifically looking to get information about our own account, so we get more specific by adding `/me` to get `https://app.asana.com/api/1.0/users/me`. The `/me` part would ordinarily be an identifier (a long number) or email address of the user, but we've created this shorthand for getting the current user of Asana's API, whomever that may be.  Put it together and you have the above path to get your user information from Asana.

Since every API request you make will start with the same base URL ('https://app.asana.com/api/1.0'), we'll just talk about what comes next in the URL -- which is often referred to as a 'resource' or 'path'. For instance, when we say `/users/me` it's actually shorthand for the entire URL which would be `https://app.asana.com/api/1.0/users/me`.

After requesting information from the API, you will receive a resposne in [JSON](https://en.wikipedia.org/wiki/JSON) format, which can be read and understood by both humans and computers. It's structured in a particular way so programs can rely on a consistent format for the data.

Our API is documented for what resources are available and what sort of return data to expect.  For example, here are the [docs for the `/users` endpoint](#get-a-user) which we just called. This is where you can discover what's possible with our API.

Now, let’s make the same call to `/users/me` more like software would. Before we do so, we’ll need to get access outside of your web browser to the API.

---

## Authentication Quick Start

Similarly to entering your username/password into a website or logging into Asana with Google, when you access your Asana data via the API you need to authenticate.  In the above example, you were already logged into Asana in your browser so you were able to authenticate to the API with credentials stored by your browser.

If you want to write a script that interacts with the Asana API, the easiest method is to get a Personal Access Token (PAT), which you can think of as your unique password for accessing the API.

### App or PAT?

If your app needs to perform actions on behalf of users, you should use [OAuth](#oauth).

**Getting a Personal Access Token (PAT)**

> Example PAT

```
0/68a9e79b868c6789e79a124c30b0
```

1. Open the Developer App Management page by [using this permalink](https://app.asana.com/-/developer_console) or following these steps:

    * From within Asana, click your profile photo from the top bar and select **"My Profile Settings"**

    * Click the **"Apps"** tab

    * Click **"Manage Developer Apps"**

2. Click **"+ Create New Personal Access Token"**

3. Type a description of what you’ll use the Personal Access Token for.

4. Click **"Create"**

5. Copy your token. You will only see this one time, but you can always create another PAT later.

_**Note**: treat your PAT like you would a password. Do not share it or display it online_. 

---

## Accessing the API in the Terminal

> curl Request

```
curl https://app.asana.com/api/1.0/users/me \
  -H "Authorization: Bearer 0/123456789abcdef"
```

We’ll use cURL, a command line[^1] program to make HTTP requests. MacOS and many Linux distributions have cURL pre-installed, and it’s [available for download](https://curl.haxx.se/dlwiz/?type=bin) on Windows and many other operating systems.  If you’re curious, you can learn more about cURL [in its own documentation](https://curl.haxx.se/docs/httpscripting.html). 

**Let’s do this:**

> Response

```json
{
  data: {
    gid: "<your id>",
    email: "<your email>"
    name: "<your name>",
    ...
  }
}
```

1. Open a terminal (instructions for [Mac](https://www.wikihow.com/Open-a-Terminal-Window-in-Mac) and [Windows](https://www.wikihow.com/Open-the-Command-Prompt-in-Windows))

2. Copy/paste the cURL request on the right (make sure to enter your personal access token instead of the placeholder after the word "Bearer", or else you'll get a "Not Authorized" message):

3. Press Enter

Nice work! You just wrote a cURL command.

In our API documentation, we will often write examples as cURL commands since it's a middle-of-the-road approach to accessing our API: more flexible than using a browser, but user-friendly enough to be quick and easy to do.

You’re ready to start coding!

Asana has [client libraries](#official-client-libraries) in several popular coding languages. Using these libraries has several advantages (like managing authorization and retrying errors) that make them a good place to go from here. Let’s take a look at making the same `/users/me` request in Python, JavaScript, and Ruby (feel free to skip ahead to your favorite of the three languages).

<hr class="full-line">

### Accessing the API with Postman

> Download Postman

You can quickly get started on Asana's API with the Postman App. We have a collection that you can pull from 

# Quick Start

## Triage Bot

> We will use a very basic file structure for the purposes of this guide. Start by making a project directory, moving into it, and running `npm init`.

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
(note that all ids in Asana should be strings).  You can get a project’s gid from its URL in the Asana web product 
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

If you want to skip ahead and see the code for the triage bot, it’s on Github in the Javascript folder of our devrel-examples repo: https://github.com/Asana/devrel-examples.

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

### Let’s start coding!

If you haven't already, follow the code and headers in this section. This will walk you through the terminal commands 
and code with explainations along the way.

### Congratulations! Now go above and beyond
You’ve created an Asana triage bot. Let’s explore a few ideas on how to make it even better.

### Deploy your app 
While you can run your bot from the command line, that seems like a lot of work to run a bot that’s supposed to eliminate work about work.

One option is to use launchd to automatically execute your script (launchd is like cron but better). Here’s a [tutorial to get you started with launchd](https://medium.com/@chetcorcos/a-simple-launchd-tutorial-9fecfcf2dbb3).

The next step would be to deploy to a hosted server. [Here’s a guide](https://api.slack.com/docs/hosting) exploring some of the popular hosting providers. Hosting your app makes it more resilient and allows you to create more sophisticated apps (e.g. use webhooks).   

### Use Asana as your config file 
To take your bot’s accessibility to the next level, put your configuration in an Asana task(s) and then have your script read that task(s) for instructions. This allows you (or anyone else) to make config changes without touching any code. For example, if a designer is on vacation, you can easily remove them from the group that gets assigned requests. Similarly, if a designer joins or leaves the team, this change could be easily configured in a task instead of having to change the bot’s code.

To see this approach in the wild, checkout [Ohmega](https://github.com/Asana/ohmega), an automation framework we created. Here’s the [configuration service](https://github.com/Asana/ohmega/blob/master/ohmega/services/configuration_service.py) that reads a tree of tasks for its configuration. 

### Use webhooks for real-time triaging 
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

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` - the same request as above, but in Python.


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

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me`. - the same request as above, but in JavaScript.

Save this file as something descriptive like "hello_world.js"

To run this script in your console, pass it as an argument to the node interpreter, i.e. `node hello_world.py` from the same directory as the file. You should see the message we wrote above with your user information.

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

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me`.

Save this file as something descriptive like "hello_world.rb"

To run this script in your console, pass it as an argument to the ruby interpreter, i.e. `ruby hello_world.rb` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in methods can be found in the [/resources folder of the client library](https://github.com/Asana/ruby-asana/tree/master/lib/asana/resources). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/ruby" target="_blank">Github examples repository</a>
