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
