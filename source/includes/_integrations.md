# Integrations

## GitHub

Scout annotates several areas of the UI with additional data from the app's associated Git repository when the GitHub integration is enabled.

### Traces

When the GitHub integration is enabled, Scout displays the actual code from backtraces collected from [transaction traces](#transaction-traces). The code is annotated with the `git blame` data (the author and commit date), making it easier to track down developers most familar with bottlenecks.

![stream show git](stream_slow_git_annotated.png)

### Deploys

When the GitHub integration is enabled, Scout annotates [deploys](#deploy-tracing) with the associated Git branch or tag along. When hovering over a deploy, a `diff` summary is displayed. This displays the changes between the selected deploy and the previous deploy.

![deploy tracking](deploy_tracking.png)

<h3 id="github-configuration">Configuration</h3>


The GitHub integration is an __app-specific__ integration, authenticated via OAuth. After authenticating, choose the Git repository name and branch name used for your application.

![git settings](git_settings_annotated.png)

### Missing some repositories?

When configuring the GitHub integration, you may notice that only personal repositories are shown and repositories owned by organizations are missing. Your organization is likely leveraging trusted applications. See [GitHub's docs on organization-approved applications](https://github.com/blog/1941-organization-approved-applications) for instructions approving Scout. Once Scout is listed as an approved application, the org's repositories will be available within Scout.

## Rollbar

When the Rollbar integration is enabled, Scout displays errors from the app's associated Rollbar project alongside performance data within the Scout UI.

![rollbar errors](rollbar_errors_screenshot.png)

When the error count is in <span style="color:#fff;background:#f0592a;padding: 2px">orange</span>, a new error has appeared in the current timeframe. When the error count is in <span style="background:#ccc;padding:2px">gray</span>, older errors are continuing in this timeframe.

<h3 id="rollbar-configuration">Configuration</h3>

The Rollbar configuration is an __app-specific__ integration, configured by providing a read-only Rollbar __Project Access Token__ (not an Account Access Token) in the app settings within Scout.

![rollbar access token](rollbar_access_token.png) 

![rollbar settings](rollbar_settings.png)

## Slack

To integrate Slack with Scout's Alert Notification system, you can utilize the Webhook feature on the *Application > Notification Channels* page. In order for Scout and Slack to be able to work together, you need to use a third-party service called [Zapier](https://zapier.com/). Zapier is a service which allows you to connect different web services together to make custom work-flows. As well as Slack, a similar method to the one described below can be used to integrate with many different services. You can read more on our GitHub pages about how to integrate with [PagerDuty](https://github.com/scoutapp/roadmap/issues/15), [VictorOps](https://github.com/scoutapp/roadmap/issues/3) and [xMatters](https://github.com/scoutapp/roadmap/issues/75).

### Zapier Configuration

First of all you will need to create an account with [Zapier](https://zapier.com/), and once you have done this, you can go ahead and create a *Zap*, by clicking on the Make a Zap! button on the top right-hand side of the screen, as shown in the image below.

![Creating a new Zap](zapier_alerts/create_new_zap.png)

You need to create a *Trigger* (for Scout) and an *Action* (for Slack) in order to make the two systems able to communicate. First of all, create the trigger by selecting *Webhooks by Zapier* as the App you want to work with.

![Create a Scout trigger](zapier_alerts/create_scout_trigger.png)

Next you will need to select the type of trigger that you want, select *Catch Hook*. Next you will be given a URL, which is the Webhook that we will use to link to in Scout. Copy this URL and then open up Scout.

![Copy the Webhook URL](zapier_alerts/copy_webhook_url.png)

### Scout Configuration

In Scout, navigate to *Application > Notification Channels* and create a new Webhook, like the picture below, copying in the Zapier URL.

![Create a Notification Channel](zapier_alerts/create_notification_channel.png)

Next you will need to add or edit a Notification Group to include this new channel.

![Create/Edit Notification Group](zapier_alerts/create_notification_group.png)

### Create an Alert

At this point if you try to carry on creating the Zap in Zapier, it will try to pull a sample Alert from Scout using the Webhook that we set up. The reason it does this is that it requires sample data from Scout in order to understand the format of the trigger, and what fields are available from the Scout. However, at this point there are not going to be any Alerts it can use because this Webhook has only just been set up. So here you have two options:

* Create a quick Alert in Scout to generate this sample data.
* Click *Skip This Step* and then *Continue Without Samples*.

We **strongly recommend** the first option, because later on when you are specifying the message that you are going to send to Slack, if you do not have sample data, you will not be able to use data that came from Scout. 

![Pick a sample Alert](zapier_alerts/pick_sample_alert_1.png)

To create a quick Alert, open up Scout, go to *Alert > Alert Conditions* and create a simple condition that will alert, and choose the Slack Notification Group we set up earlier.

![Create Alert Condition](zapier_alerts/create_alert_condition.png)

### Choose the Alert in Zapier

After the Alert has occurred in Scout, go back to Zapier and click the *Ok, I did this* button and it will connect with Scout and look for an Alert with this matching Webhook. Choose this as the sample you want to use and click *Continue*.

![Pick a sample Alert](zapier_alerts/pick_sample_alert_2.png)

### Create a Slack Action

Next you need to add an Action step to the work-flow, this is the part were we integrate Slack. Click *Add a Step* on the left-hand side of the page.

![Add a Step](zapier_alerts/add_step.png)

Next click the *Action/Search* option, and you will be given the option to choose an app to connect.

![Add an Action/Search](zapier_alerts/add_action.png)

Choose Slack, and then a new Action will be created on the left-hand side of the screen.

![Choose an App](zapier_alerts/choose_an_app.png)

There are many different types of Slack Action that you can choose to perform, but let's choose *Send Channel Message*.

![Select a Slack Action](zapier_alerts/select_slack_action.png)

Next you can configure many aspects of the message that will be sent, such as which channel to send the message to and what particular data comes from the Scout Alert (shown in green). It is only possible to pull this data from Scout here if you created an Alert earlier like we advised.

![Configure the Message](zapier_alerts/configure_message.png)

Then you can send a test message to Slack to preview how it will look.

![Test Slack](zapier_alerts/test_slack.png)

Then all that's left to do is to give your Zap a descriptive name and enable it.

![Give your zap a name](zapier_alerts/name_zap.png)

Now everything is set up so that whenever an Alert occurs in Scout which is linked to this Notification Channel, you will see a message in Slack.

![The end result](zapier_alerts/end_result.png)
