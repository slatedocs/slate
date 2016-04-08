# Webhooks

A webhook allows you to be dynamically notified when something happens in Front without having to constantly poll the API.

To create a webhook, you need to:

* Make sure that the Webhook integration is active (go to Settings > Integrations > Webhooks)
![Activate webhooks](webhook-activation.png)
* Create a new rule with the conditions you want (go to Settings > Rules > New rule)
![Create a new webhook rule](webhook-rule.png)

Once the rule is created, whenever the conditions are met, Front will send a **POST** HTTP request to the webhook URL you specified.

For security reason and since the webhook URL is open to the public, you should not trust any incoming requests that it receives.
The request body will contain the [preview data](#reference/events) corresponding to the event. You will then be able to request either the entire event data or each resources separately.
