# Webhooks

Netlify support both incoming and outgoing Webhooks.

## Incoming Webhooks

You can add build webhooks to a site from the site settings screen.

Scroll down to the Webhooks setting and click edit to add a new hook.

Pick a title that describes the hook (ie. Google Calendar Hook), then netlify will generate a webhook URL.

When you send a POST request to this URL, netlify will trigger a new build of your site.

## Outgoing Webhooks

From netlify's notification setting you can configure different types of hooks that will get triggered by events on your site.

Just click the edit button on the right side of the event you're interested in
(new deploy, failed deploy or new form submission) and then pick the type of notification you want to configure.

### Webhook

Setting up an outgoing webhook is straightforward. Just enter the URL you want netlify to trigger.

The body of the outgoing webhook request will have a JSON representation of the object relevant to the event.

### Email

By setting up an email notification you'll receive an email with a short description of the event that triggered the notification.

### Slack

You can configure netlify to post messages to a Slack channel when a site is deployed, a deploy fails or a new form submission comes in.

First you'll need to [follow Slack's documentation](https://api.slack.com/incoming-webhooks) on incoming webhooks.

Once you've configured your webhook, just enter the URL Slack gives you. Optionally you can specify a different channel than the default for the inbound webhook.

Now netlify will notify you through Slack whenever the event you picked triggers the hook.
