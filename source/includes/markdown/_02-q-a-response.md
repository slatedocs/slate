### Q&A Response

Asana's API enables customization and automation of your organization’s workflow through scripts built to specialize your use of Asana. Using Asana to track your work and leveraging Asana’s API to automate your processes is a powerful combination which can make your team much more efficient. Here's one example of how we do it at Asana.

### Tracking timely responses to support questions

Asana’s developer relations team manages technical support for our API through a number of channels: support tickets, questions about our API and integrations forwarded on from our colleagues, the [Asana Community's Developer category](https://community.asana.com/c/developersAPI "Asana Developer Community"), Stack Overflow, pull requests and bug reports from open-source GitHub projects like our [client libraries](/developers/documentation/getting-started/client-libraries "Official Asana client libraries"), and more. Staying on top of all of these channels can be daunting, but we want our users to reach us however works best for them. At the same time, we want to isolate the noisiness of incoming requests for our colleagues at Asana who are involved with only one channel.

Additionally, the management of the question and answer process, triaging the incoming requests, troubleshooting with our engineers, and measuring our response performance are all internal processes. Even if we have a workflow in place to support our developer relations team, we want the experience for other teams to be easy and lightweight. We want to ensure our coworkers do the right things by default without hindering the consistency of our work and our ability to track progress.

Our solution: automation and reporting through our API to provide consistent management of the whole process.

To do this, we wrote an integration with the following goals in mind:

* Maintain clarity amongst our teams by tracking work in Asana.
* Have only one place we have to look to stay in the loop.
* Ensure that no questions get missed, i.e. a [reminder bot](/developers/documentation/examples-tutorials/reminder-bot "Reminder Bot").
* Let our API users know that they've been heard in a timely fashion.
* Track our performance in remaining responsive.
* Automate some of the bookkeeping required to maintain a consistent workflow.
* Separate the specifics of how we track our performance from our colleagues’ workflows.

The script we built does the following for us:

1. Integrate with external sources to put incoming questions into Asana, one project per channel.
2. Add question tasks from each incoming project into a [single combined project.](/guide/help/tasks/fields#gl-multi-home "Multi-Home")
3. Acknowledge a question has been received and begin tracking response times.
4. Upon first response, complete a task to signal relevant followers that we've reached out.

### Maintain focus

We use [webhooks](/developers/api-reference/webhooks "Webhooks documentation") to get notified in near-real time when new tasks are created in any of several Asana projects, one per incoming channel. Some of these projects are automatically synced with outside sources, others are available for our coworkers to create tasks in. Keeping tasks in their source channel helps keep us organized for where to go to respond. These projects are what our colleagues follow in order to remain focused on their own channels. 

Our script responds to these webhook notifications from each project by adding these tasks into a single "Developer Questions" project. Our developer relations team can then see all outstanding questions about our API in a single place. This is a key part of hitting our service level agreement (SLA) goals: not having to cycle through many projects and channels to see how we're progressing.

### Ensure timely responses

Once a question gets added to our Developer Questions project, our integration creates a subtask on it. This signals to our colleagues that we have received the question and will begin to triage and investigate. The subtask is completed when we first respond to our users to inform them that we're investigating. Completion of the question task itself signals that we've achieved a resolution for the person who reached out to us.

### Track progress

Our script can generate a simple report to see which questions are still open, how long they’ve been open, and how much time we have left to answer before we miss our service level agreement limits. A simple webpage that the integration creates enables a high level view of what's still in progress and how timely we've been in the past.

### Keep the process moving, automatically

Our integration also helps automate some of the routine steps to ensure questions get answered. After a task gets triaged for priority, our integration sets an appropriate due date. It can also set an assignee and followers based on current workload and by matching certain keywords in the task description. If the task approaches its due date and it has not received a response, the script comments on the task to alert us that the question is about to reach our SLA limit. This helps us keep the right people in the loop with minimal overhead and maximum clarity of what needs to be done by when.

By managing this routine and specialized workflow with automation through Asana’s API, our team is more efficient, more effective, and less likely to make a mistake. We know how responsive we've been and can see how we're doing at any time. We're better able to minimize the number of questions which slip through the cracks. The result is better support for outside developers and increased focus on core work, not work about work. 

Over time, we've continuously tweaked how our integration behaves to evolve our process, empowering us to adjust and iterate our approach. This is one of the key opportunities that Asana's API provides: ownership and control over how work gets done. Incremental improvements provide the chance to try out new workflows and settle on one that works well for everyone, leading to a more consistent and customized experience of using Asana.

To get started, check out our [quick start](/developers/documentation/getting-started/quick-start "Quick Start") page for an overview of Asana's API. For support or to generate ideas of how your team can work more effectively with Asana, head to the [Asana Community](https://community.asana.com/c/developersAPI "Asana Developers Community") to chat with Asana team members and users!
