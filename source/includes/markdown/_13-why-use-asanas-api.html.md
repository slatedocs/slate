<hr class="full-line">
<section class="full-section">

# Why use Asana's API?

## Asana’s API and you

Collaboration across teams and tools works best when everyone stays in sync and processes flow easily and without friction. This is why we have Asana's API: it's a platform to ensure all of your information is up to date and that your teams stay efficient and in the loop.

Asana’s API provides a means for software and scripts to read information from inside Asana, input information from outside Asana, and automatically react when things change. This can include:

* Consistently doing repetitive or tedious tasks.
* Chaining a process together by responding to changes.
* Creating reports on the state of tasks and projects.
* Staying in sync with other software such as Slack or Salesforce used in your organization.
* Pulling information from other locations like email or Evernote into Asana.
* Adding new features on top of Asana.
* Customizing Asana for your team’s processes and workflows.

The role of Asana's platform is to allow Asana to meet your team where you are and how you work. Asana is built to be flexible and powerful, to be intuitive enough for all teams to adopt and maintain clarity on who is doing what by when. Asana’s platform enables you to specialize this flexibility to maximize efficiency. Here are some ideas for what you can build:

### Doing repetitive work

Integrations and bots are great for making sure that repetitive tasks are always taken care of. Running a script with Asana's API can quickly take care of work like moving cards between board columns, setting assignees or due dates based on the state of the task, or asking that all custom fields are set before work can begin on a task. This can save time and overhead when trying to keep your projects clear and correct.

### Reacting to changes

Workflows with Asana often have a "when this task changes, do something" feel. An example is moving tasks between projects based on subtasks: if one team completes a subtask, move the parent task to the next team's project. Integrations can be built to respond in near-real time to changes in Asana to move work forward to the next step.

### Generating reports

Fetching the state of the tasks in a project or for your teammates can unlock the ability to create simple - or complex - metrics around how you are progressing. How many open tasks are there in the project? Who has the most tasks assigned? How often does the due date of each task get shifted back? Our platform enables pulling of data from Asana to make customized metrics to track your work.

### Keeping in sync

Teams frequently use a multitude of software tools to accomplish work, from email to asset management to file storage. These specialized tools are often used with colleagues who don't track their work with Asana; and even if they do, keeping all of your tools in sync makes the transitions between tools straightforward to minimize work about work.

Some of our integration partners, like [Tray.io](https://asana.com/apps/tray-io), [Unito](https://asana.com/apps/unito), and [Zapier](https://asana.com/apps/zapier), offer syncing solutions out of the box with common workplace tools, or you could build your own solution in cases where you need more flexibility, such as when connecting to customized or internally-built software.

### Capturing work

Asana is built for teamwork and knowing who is doing what by when. Having an easy way to capture information in Asana makes it less likely that work will slip through the cracks. For example, when communicating with people who work in other companies who aren't members of your Asana organization, an integration like we built [for Gmail](https://asana.com/gmail) lets you create follow-up tasks with just a few clicks.

Getting information into Asana in a quick and easy way is important for ensuring that you don’t drop the ball. Asana’s platform is a great way to pull information from many channels into Asana with minimum hassle.

### Extending Asana

Asana is built to be a tool that works well for all teams, so we build features into our core product that aren't overly opinionated about how you get work done. At the same time, there is opportunity for teams to use Asana in a specialized way or with specific additional features. When there are features that you'd like Asana to have, our platform is a resource to make them happen. As a matter of fact, some of our more successful integrations like [Instagantt](https://asana.com/apps/instagantt) exist purely to provide additional features to Asana.

### Customizing workflows

Integrations or scripts work great to maintain a custom workflow, saving a team member from having to continually pay attention to the state of tasks in Asana.

Whether it's ensuring that custom fields are filled out, tasks are completed, tasks live in the correct board-view column, or automatically assigning tasks at certain stages in your process, integrations can react to changes in Asana to ensure that everyone is up to date. When processes mature around how you get work done, it's a great time to use Asana's platform to make sure everything stays consistent and clear.

Check out some examples of integrations we've built on Asana below:

* [Triage Bot](#triage-bot "Triage bot")
* [Reminder Bot](#bot-examples "Reminder bot") - don't let a task slip away!
* [Q&A Response Times](#q-a-response "Workflow automation") - measure goals and maintain a consistent process.

### Learn more or submit an app you've built

Read more on how to [get started](#quick-start "Quick start") building on Asana or [submit an app](https://asana.com/apps/submit) to add to our [apps page](https://asana.com/apps).

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

---

## Q&A Response

Asana's API enables customization and automation of your organization’s workflow through scripts built to specialize your use of Asana. Using Asana to track your work and leveraging Asana’s API to automate your processes is a powerful combination which can make your team much more efficient. Here's one example of how we do it at Asana.

### Tracking timely responses to support questions

Asana’s developer relations team manages technical support for our API through a number of channels: support tickets, questions about our API and integrations forwarded on from our colleagues, the [Asana Community's Developer category](https://community.asana.com/c/developersAPI "Asana Developer Community"), Stack Overflow, pull requests and bug reports from open-source GitHub projects like our [client libraries](#official-client-libraries "Official Asana client libraries"), and more. Staying on top of all of these channels can be daunting, but we want our users to reach us however works best for them. At the same time, we want to isolate the noisiness of incoming requests for our colleagues at Asana who are involved with only one channel.

Additionally, the management of the question and answer process, triaging the incoming requests, troubleshooting with our engineers, and measuring our response performance are all internal processes. Even if we have a workflow in place to support our developer relations team, we want the experience for other teams to be easy and lightweight. We want to ensure our coworkers do the right things by default without hindering the consistency of our work and our ability to track progress.

Our solution: automation and reporting through our API to provide consistent management of the whole process.

To do this, we wrote an integration with the following goals in mind:

* Maintain clarity amongst our teams by tracking work in Asana.
* Have only one place we have to look to stay in the loop.
* Ensure that no questions get missed, i.e. a [reminder bot](#bot-examples "Reminder Bot").
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

We use [webhooks](#asana-webhooks "Webhooks documentation") to get notified in near-real time when new tasks are created in any of several Asana projects, one per incoming channel. Some of these projects are automatically synced with outside sources, others are available for our coworkers to create tasks in. Keeping tasks in their source channel helps keep us organized for where to go to respond. These projects are what our colleagues follow in order to remain focused on their own channels. 

Our script responds to these webhook notifications from each project by adding these tasks into a single "Developer Questions" project. Our developer relations team can then see all outstanding questions about our API in a single place. This is a key part of hitting our service level agreement (SLA) goals: not having to cycle through many projects and channels to see how we're progressing.

### Ensure timely responses

Once a question gets added to our Developer Questions project, our integration creates a subtask on it. This signals to our colleagues that we have received the question and will begin to triage and investigate. The subtask is completed when we first respond to our users to inform them that we're investigating. Completion of the question task itself signals that we've achieved a resolution for the person who reached out to us.

### Track progress

Our script can generate a simple report to see which questions are still open, how long they’ve been open, and how much time we have left to answer before we miss our service level agreement limits. A simple webpage that the integration creates enables a high level view of what's still in progress and how timely we've been in the past.

### Keep the process moving, automatically

Our integration also helps automate some of the routine steps to ensure questions get answered. After a task gets triaged for priority, our integration sets an appropriate due date. It can also set an assignee and followers based on current workload and by matching certain keywords in the task description. If the task approaches its due date and it has not received a response, the script comments on the task to alert us that the question is about to reach our SLA limit. This helps us keep the right people in the loop with minimal overhead and maximum clarity of what needs to be done by when.

By managing this routine and specialized workflow with automation through Asana’s API, our team is more efficient, more effective, and less likely to make a mistake. We know how responsive we've been and can see how we're doing at any time. We're better able to minimize the number of questions which slip through the cracks. The result is better support for outside developers and increased focus on core work, not work about work. 

Over time, we've continuously tweaked how our integration behaves to evolve our process, empowering us to adjust and iterate our approach. This is one of the key opportunities that Asana's API provides: ownership and control over how work gets done. Incremental improvements provide the chance to try out new workflows and settle on one that works well for everyone, leading to a more consistent and customized experience of using Asana.

To get started, check out our [quick start](#quick-start "Quick Start") page for an overview of Asana's API. For support or to generate ideas of how your team can work more effectively with Asana, head to the [Asana Community](https://community.asana.com/c/developersAPI "Asana Developers Community") to chat with Asana team members and users!

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

---

## Bot examples

### Reminder bot

Even the most conscientious and best-intentioned teammate can get overloaded and occasionally forget a task. For project managers, team leads, or coordinators, it can be draining to check-in on everyone to make sure that everything is going according to schedule. How can you stay on track and minimize the work-about-work?

Instead of continually reminding teammates to stay focused, use Asana’s API to create a bot for automatic reminders (a bot is a script that performs a task automatically). In this case, a "ping bot" takes action when due dates are approaching (or for any other specified trigger). This can act as a more intelligent version of the reminders that Asana already sends when due dates approach. For example, this persistent friend could comment with reminders further in advance, ask assignees or followers to take some action like setting a custom field, re-assign the work, and/or push out due dates. With a bot taking care of the schedule and reminders, people can spend their time on the work that needs human attention, like ideation and feedback.

### Recruiting bot

At Asana, we use a bot to help automate the job application process for engineering candidates. When candidates complete a coding test, the test needs to get graded in a timely manner to keep the interview process on track and to keep the candidate from feeling stranded or forgotten about.

Once candidates have submitted their coding test, a bot uses the Asana API to assign the test to a grader based on specific criteria tracked in Asana, such as their preferred programming languages and number of previous evaluations. Graders are given x days to grade tests (the bot takes into account when graders are out of office). If tests have not been graded by the due date, graders are pinged by the bot with a comment on the task to either grade the test or re-assign it to someone else. After x days, the bot automatically re-assigns the test to the next grader to keep the process moving.

### Bugs bot

Our engineering teams handle triaging bug reports by creating a task in a "Bugs" project. A bot then adds the project manager of the relevant team in Asana as a follower, moves the task into a "needs triage" section, and requests assistance. The project manager can then evaluate the bug and triage it.

Since the evaluation of the severity of the bug is important for understanding how urgent the fix is, Bugs Bot will remain persistent, commenting every few days until the task has been moved out of the triage section and into a section of the relevant priority. This process ensures that we're aware of the impact of bugs and helps us avoid severe bugs slipping through the cracks.

<div>
  <div class="docs-developer-satisfaction-content">
      <h4>Was this section helpful? <a class="positiveFeedback-DevSatisfaction" style="cursor:pointer;">Yes </a><a class="negativeFeedback-DevSatisfaction" style="cursor:pointer;">No</a></h4>
  </div>
</div>

</section>
