<hr class="full-line">
<section class="full-section">
<section>

<a id="quick-start"></a>
# Examples

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
print("Hello world! " + "My name is " + me['name'] + "!")

```

<span class="description">
To get started, run `pip install asana` or follow the detailed installation instructions on the [GitHub page for the Python client library](https://github.com/Asana/python-asana/).  
</span>

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` in Python.


Save this file as something descriptive like "hello_world.py"

To run this script in your console, pass it as an argument to the python interpreter, i.e. `python hello_world.py` from the same directory as the file. You should see the message we wrote above with your user information.

As an aside, for clarity `python-asana` will also work with Python 3.x (with small changes to the above example to make it compatible.)

All of the built-in functions can be found in the [/gen folder of the client library](https://github.com/Asana/python-asana/tree/master/asana/resources/gen). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/python" target="_blank">GitHub examples repository</a>

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

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

<span class="description">
To get started, `npm install asana` or follow the detailed installation instructions on the [GitHub page for the Node client library](https://github.com/Asana/node-asana/).  
</span>

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` - the same request as above, but in JavaScript.

Save this file as something descriptive like "hello_world.js"

To run this script in your console, pass it as an argument to the node interpreter, i.e. `node hello_world.js` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in functions can be found in the [/gen folder of the client library](https://github.com/Asana/node-asana/tree/master/lib/resources/gen).

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/javascript" target="_blank">GitHub examples repository</a>

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

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

<p>
To get started, `gem install asana` or follow the detailed installation instructions on the [GitHub page for the Ruby client library](https://github.com/Asana/ruby-asana/).  
</p>

Once it’s installed, open your favorite text editor and we’ll code a GET request to `/users/me` - the same request as above, but in Ruby.

Save this file as something descriptive like "hello_world.rb"

To run this script in your console, pass it as an argument to the ruby interpreter, i.e. `ruby hello_world.rb` from the same directory as the file. You should see the message we wrote above with your user information.

All of the built-in methods can be found in the [/resources folder of the client library](https://github.com/Asana/ruby-asana/tree/master/lib/asana/resources). 

You can see a variant of this script, and other useful Asana API scripts, in our open-source <a href="https://github.com/Asana/DevRel-Examples/tree/master/ruby" target="_blank">GitHub examples repository</a>

## Workflow automation script

<span class="description">
Asana's API enables customization and automation of your organization’s workflow through scripts built to specialize your use of Asana. Using Asana to track your work and leveraging Asana’s API to automate your processes is a powerful combination which can make your team much more efficient. Here's one example of how we do it at Asana.
</span>

### Tracking timely responses to support questions

Asana’s developer relations team manages technical support for our API through a number of channels: support tickets, questions about our API and integrations forwarded on from our colleagues, the [Asana Community's Developer category](https://community.asana.com/c/developersAPI "Asana Developer Community"), Stack Overflow, pull requests and bug reports from open-source GitHub projects like our [client libraries](/docs/official-client-libraries "Official Asana client libraries"), and more. Staying on top of all of these channels can be daunting, but we want our users to reach us however works best for them. At the same time, we want to isolate the noisiness of incoming requests for our colleagues at Asana who are involved with only one channel.

Additionally, the management of the question and answer process, triaging the incoming requests, troubleshooting with our engineers, and measuring our response performance are all internal processes. Even if we have a workflow in place to support our developer relations team, we want the experience for other teams to be easy and lightweight. We want to ensure our coworkers do the right things by default without hindering the consistency of our work and our ability to track progress.

Our solution: automation and reporting through our API to provide consistent management of the whole process.

To do this, we wrote an integration with the following goals in mind:

* Maintain clarity amongst our teams by tracking work in Asana.
* Have only one place we have to look to stay in the loop.
* Ensure that no questions get missed, i.e. a [reminder bot](/docs/bot-examples "Reminder Bot").
* Let our API users know that they've been heard in a timely fashion.
* Track our performance in remaining responsive.
* Automate some of the bookkeeping required to maintain a consistent workflow.
* Separate the specifics of how we track our performance from our colleagues’ workflows.

The script we built does the following for us:

1. Integrate with external sources to put incoming questions into Asana, one project per channel.
2. Add question tasks from each incoming project into a [single combined project.](https://asana.com/guide/help/tasks/fields#gl-multi-home "Multi-Home")
3. Acknowledge a question has been received and begin tracking response times.
4. Upon first response, complete a task to signal relevant followers that we've reached out.

### Maintain focus

We use [webhooks](/docs/asana-webhooks "Webhooks documentation") to get notified in near-real time when new tasks are created in any of several Asana projects, one per incoming channel. Some of these projects are automatically synced with outside sources, others are available for our coworkers to create tasks in. Keeping tasks in their source channel helps keep us organized for where to go to respond. These projects are what our colleagues follow in order to remain focused on their own channels. 

Our script responds to these webhook notifications from each project by adding these tasks into a single "Developer Questions" project. Our developer relations team can then see all outstanding questions about our API in a single place. This is a key part of hitting our service level agreement (SLA) goals: not having to cycle through many projects and channels to see how we're progressing.

### Ensure timely responses

Once a question gets added to our Developer Questions project, our integration creates a subtask on it. This signals to our colleagues that we have received the question and will begin to triage and investigate. The subtask is completed when we first respond to our users to inform them that we're investigating. Completion of the question task itself signals that we've achieved a resolution for the person who reached out to us.

### Track progress

Our script can generate a simple report to see which questions are still open, how long they’ve been open, and how much time we have left to answer before we miss our service level agreement limits. A simple webpage that the integration creates enables a high level view of what's still in progress and how timely we've been in the past.

### Keep the process moving, automatically

Our integration also helps automate some of the routine steps to ensure questions get answered. After a task gets triaged for priority, our integration sets an appropriate due date. It can also set an assignee and followers based on current workload and by matching certain keywords in the task description. If the task approaches its due date and it has not received a response, the script comments on the task to alert us that the question is about to reach our SLA limit. This helps us keep the right people in the loop with minimal overhead and maximum clarity of what needs to be done by when.

By managing this routine and specialized workflow with automation through Asana’s API, our team is more efficient, more effective, and less likely to make a mistake. We know how responsive we've been and can see how we're doing at any time. We're better able to minimize the number of questions which slip through the cracks. The result is better support for outside developers and increased focus on core work, not work about work. 

Over time, we've continuously tweaked how our integration behaves to evolve our process, empowering us to adjust and iterate our approach. This is one of the key opportunities that Asana's API provides: ownership and control over how work gets done. Incremental improvements provide the chance to try out new workflows and settle on one that works well for everyone, leading to a more consistent and customized experience of using Asana.

To get started, check out our [examples](/docs/examples "Examples") page. For support or to generate ideas of how your team can work more effectively with Asana, head to the [Asana Community](https://community.asana.com/c/developersAPI "Asana Developers Community") to chat with Asana team members and users!

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

## Triage bot

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
[deprecations framework in our docs](/docs/deprecations). 
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
[concurrent request limit](/docs/concurrent-request-limits). 
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
<span class="description">
In this guide, we will build a simple triage bot that will assign tasks. This is a common Asana use case with support inboxes or request projects. 
</span>

If you want to skip ahead and see the code for the triage bot, it’s on GitHub in the JavaScript folder of our [devrel-examples repo](https://github.com/Asana/devrel-examples).

For this guide, let’s suppose a design team has a requests project where people from the marketing team fill out an [Asana form](https://asana.com/guide/help/premium/forms) to request graphics from the design team. The form creates a task in the design requests project that needs to be assigned to a designer. 

Our triage bot will gather all unassigned tasks in the design request project and then randomly distribute the requests across a group of designers. 

For the purposes of this guide, we will keep it this simple, however, you could add more complex logic to your bot. For instance, you could check custom field values on the request task to see what type of request it is (e.g. video, graphic, logo, etc.) and then assign it to the designer that has those skills.  You could go even further and check the designers workload to see who currently has the least amount of work already assigned to them (this could be determined by a point value for tasks assigned to them in the project). You could then have the bot ping the design request task as it approaches the due date to ensure that the designer will have it completed on deadline.

### Helpful links
Before we get started, here are some helpful links for building on the Asana API:

* [Asana API reference docs](/docs/asana)
* [Asana longform documentation](/docs/why-use-asana-39-s-api)
* [Asana developer community](https://forum.asana.com/c/developersAPI) -- if you get blocked or have a question about the API, there are devs in our community that are eager to help. We also post API updates and news to the community forum.
* The [code for this bot on GitHub](https://github.com/Asana/devrel-examples/tree/master/javascript/triage_bot)

### Create your bot user in Asana
Create a new Asana account for your bot ([instructions for inviting users](https://asana.com/guide/help/organizations/members#gl-invite)). You want to create a distinct Asana account for your bot because any action it takes in Asana will be attributed to this user. Give your bot a name and photo that will be recognizable to users in Asana that encounter it. Note that if your bot is a guest member in Asana that it will need to be added to every project you need it to work in. Bots based on guest Asana accounts will also not have access to some API features such as defining new custom fields or modifying their settings.

### Authenticating your bot
We will authenticate our bot using a [Personal Access Token (PAT)](/docs/personal-access-token). Log in to the Asana account that will be used for the bot and navigate to the developer console. You can get to your dev console by either using this URL https://app.asana.com/-/developer_console or from within Asana by clicking your photo icon in the upper right of Asana -> My Profile Settings -> Apps -> Manage Developer Apps.

Next, click “+ New access token” and follow the instructions to get your token. Treat this token like a username and password. Don’t share it with anyone and never publish it to a public repository. I like to save my PAT as an environment variable (here are instructions on [how to do this on Mac](https://medium.com/@himanshuagarwal1395/setting-up-environment-variables-in-macos-sierra-f5978369b255)). For this guide, I’ve saved a PAT as an env variable called `triage_bot_pat`.

### Create an Asana sandbox
Before we start coding, [create a project in Asana](https://asana.com/guide/help/projects/basics#gl-create) to use as a sandbox. While not required, I like to [set the project to private](https://asana.com/guide/help/permissions/project-permissions#gl-private-project) while developing. To get some users in the project, add your main Asana user as well as your bot account. You could also invite a personal email as a guest user.

### Choose an Asana client library 
The Asana API has [SDKs in several popular languages](/docs/official-client-libraries). For most developers, we recommend using one of our client libraries because they help with some of the complexities of using an API such as authentication, pagination, and deprecations. 

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
If you need your bot to react to changes in real time, then you’ll need to use [webhooks](/docs/asana-webhooks). We built a [python webhook inspector](https://github.com/Asana/devrel-examples/tree/master/python/webhooks) to help developers get started using Asana webhooks. 

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
<hr>
<section>

<a id="bot-examples"></a>
## Other bot examples

### Reminder bot

<span class="description">
Even the most conscientious and best-intentioned teammate can get overloaded and occasionally forget a task. For project managers, team leads, or coordinators, it can be draining to check-in on everyone to make sure that everything is going according to schedule. How can you stay on track and minimize the work-about-work?
</span>

Instead of continually reminding teammates to stay focused, use Asana’s API to create a bot for automatic reminders (a bot is a script that performs a task automatically). In this case, a "ping bot" takes action when due dates are approaching (or for any other specified trigger). This can act as a more intelligent version of the reminders that Asana already sends when due dates approach. For example, this persistent friend could comment with reminders further in advance, ask assignees or followers to take some action like setting a custom field, re-assign the work, and/or push out due dates. With a bot taking care of the schedule and reminders, people can spend their time on the work that needs human attention, like ideation and feedback.

### Recruiting bot

At Asana, we use a bot to help automate the process for evaluating engineering candidates. The bot helps ensure that applicant coding tests are graded in a timely manner by the right engineer.

When candidates have submitted their coding test, the bot uses the Asana API to assign the test to a grader based on specific criteria tracked in Asana, such as their preferred programming languages and number of previous evaluations. Graders are given *x* days to grade tests (the bot takes into account when graders are out of office). If tests have not been graded by the due date, graders are pinged by the bot with a comment on the task to either grade the test or re-assign it to someone else. After *y* days, the bot automatically re-assigns the test to the next grader to keep the process moving.

### Bugs bot

Our engineering teams handle triaging bug reports by creating a task in a "Bugs" project. A bot then adds the project manager of the relevant team in Asana as a follower, moves the task into a "needs triage" section, and requests assistance. The project manager can then evaluate the bug and triage it.

Since the evaluation of the severity of the bug is important for understanding how urgent the fix is, Bugs Bot will remain persistent, commenting every few days until the task has been moved out of the triage section and into a section of the relevant priority. This process ensures that we're aware of the impact of bugs and helps us avoid severe bugs slipping through the cracks.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
</section>
