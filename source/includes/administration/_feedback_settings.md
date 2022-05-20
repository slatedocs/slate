## Feedback Settings

<!-------------------- FIND FEEDBACK SETTINGS -------------------->

### Find feedback settings associated to an organization

`GET /feedback/find?organizationId=:id`

Retrieve the feedback settings associated to an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Retrieve the feedback settings
curl "https://cloudmc_endpoint/api/v1/feedback/find?organizationId=fcda8d5a-0276-4de3-908f-b3bd0aff2491" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "f4be2785-ec67-474c-af3a-38ffecfa4094",
    "organization": {
      "id": "fcda8d5a-0276-4de3-908f-b3bd0aff2491"
    },
    "feedbackEmail": "feedback@company.com",
    "feedbackSlackWebhookUrl": "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
    "googleTagManagerContainerId": "GTM-XXXXXXX",
    "matomoHost": "https://myUrl-cloudmc.matomo.cloud/",
    "matomoWebsiteId": "1",
    "supportEmail": "support@company.com",
    "widgetZesettings": "",
    "zendeskWidgetKey": ""
  }
}
```

<!-------------------- GET FEEDBACK SETTINGS -------------------->
### Retrieve feedback settings

`GET /feedback/:id`

Retrieve the feedback settings associated to a feedback setting id.

```shell
# Retrieve feedback settings
curl "https://cloudmc_endpoint/api/v1/feedback/f4be2785-ec67-474c-af3a-38ffecfa4094" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "f4be2785-ec67-474c-af3a-38ffecfa4094",
    "organization": {
      "id": "fcda8d5a-0276-4de3-908f-b3bd0aff2491"
    },
    "feedbackEmail": "feedback@company.com",
    "feedbackSlackWebhookUrl": "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
    "googleTagManagerContainerId": "GTM-XXXXXXX",
    "matomoHost": "https://myUrl-cloudmc.matomo.cloud/",
    "matomoWebsiteId": "1",
    "supportEmail": "support@company.com",
    "widgetZesettings": "",
    "zendeskWidgetKey": ""
  }
}
```

Retrieve the feedback settings associated to the feedback settings id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured feedback settings' id.
`organization.id`<br/>*UUID* | The organization id that the feedback settings are linked to. It cannot be changed.
`feedbackEmail`<br/>*string* |  Email address used for feedback.
`feedbackSlackWebhookUrl`<br/>*string* | The slack webhook url used for feedback. Please refer to [https://api.slack.com/messaging/webhooks](https://api.slack.com/messaging/webhooks).
`googleTagManagerContainerId`<br/>*string* | The Google Tag Manager Container ID used to deploy analytics and measurement tag configurations. Please refer to [https://developers.google.com/tag-platform/tag-manager/web](https://developers.google.com/tag-platform/tag-manager/web).
`matomoHost`<br/>*string* | The Matomo analytics subdomain, ending in '.matomo.cloud'.
`matomoWebsiteId`<br/>*string* | The website ID which Matomo's Javascript pushes events to.
`supportEmail`<br/>*string* | Email address used for support requests.
`widgetZesettings`<br/>*string* | Content of the zeSettings as a JSON for customization. Please refer to [https://developer.zendesk.com/embeddables/docs/widget/settings](https://developer.zendesk.com/embeddables/docs/widget/settings).
`zendeskWidgetKey`<br/>*string* | The key taken from the Zendesk admin page. Only one of supportEmail and zendeskWidgetKey can be set.

<!-------------------- CREATE FEEDBACK SETTINGS -------------------->
### Create feedback

`POST /feedback`

Create a new feedback settings. The support can either be through email or a Zendesk widget, but not both.

```shell
# Creates a new feedback settings
curl -X POST "https://cloudmc_endpoint/api/v1/feedback" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "id": "f4be2785-ec67-474c-af3a-38ffecfa4094",
  "organization": {
      "id": "fcda8d5a-0276-4de3-908f-b3bd0aff2491"
  },
  "feedbackEmail": "feedback@company.com",
  "feedbackSlackWebhookUrl": "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
  "googleTagManagerContainerId": "GTM-XXXXXXX",
  "matomoHost": "https://myUrl-cloudmc.matomo.cloud/",
  "matomoWebsiteId": "1",
  "supportEmail": "",
  "widgetZesettings": "{ \"webWidget\": { \"color\": { \"theme\": \"#78a300\" } } }",
  "zendeskWidgetKey": "YourZendeskWidgetKey"
}
```

> The above command return JSON structured like this:

```json
{
  "data": {
    "widgetZesettings": "{ \"webWidget\": { \"color\": { \"theme\": \"#78a300\" } } }",
    "supportEmail": "",
    "zendeskWidgetKey": "YourZendeskWidgetKey",
    "organization": {
      "id": "fcda8d5a-0276-4de3-908f-b3bd0aff2491"
    },
    "feedbackSlackWebhookUrl": "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
    "matomoHost": "https://myUrl-cloudmc.matomo.cloud/",
    "id": "f4be2785-ec67-474c-af3a-38ffecfa4094",
    "matomoWebsiteId": "1",
    "feedbackEmail": "feedback@company.com",
    "googleTagManagerContainerId": "GTM-XXXXXXX"
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured feedback settings' id.
`organization.id`<br/>*UUID* | The organization id that the feedback settings are linked to. It cannot be changed.

Optional | &nbsp;
---------- | -----------
`feedbackEmail`<br/>*string* |  Email address used for feedback.
`feedbackSlackWebhookUrl`<br/>*string* | The slack webhook url used for feedback. Please refer to [https://api.slack.com/messaging/webhooks](https://api.slack.com/messaging/webhooks).
`googleTagManagerContainerId`<br/>*string* | The Google Tag Manager Container ID used to deploy analytics and measurement tag configurations. Please refer to [https://developers.google.com/tag-platform/tag-manager/web](https://developers.google.com/tag-platform/tag-manager/web).
`matomoHost`<br/>*string* | The Matomo analytics subdomain, ending in '.matomo.cloud'. If specified, both the host and website ID are required.
`matomoWebsiteId`<br/>*string* | The website ID which Matomo's Javascript pushes events to. If specified, both the host and website ID are required.
`supportEmail`<br/>*string* | Email address used for support requests.
`widgetZesettings`<br/>*string* | Content of the zeSettings as a JSON for customization. Please refer to [https://developer.zendesk.com/embeddables/docs/widget/settings](https://developer.zendesk.com/embeddables/docs/widget/settings).
`zendeskWidgetKey`<br/>*string* | The key taken from the Zendesk admin page. Only one of supportEmail and zendeskWidgetKey can be set.

<!-------------------- UPDATE FEEDBACK SETTINGS -------------------->
### Update feedback settings

`PUT /feedback/:id`

Updates the feedback settings of an organization. The support can either be through email or a Zendesk widget, but not both.

```shell
# Updates an existing feedback settings for an organization
curl -X PUT "https://cloudmc_endpoint/api/v1/feedback/f4be2785-ec67-474c-af3a-38ffecfa4094 \
   -H "MC-Api-Key: your_api_key"
   -H "Content-Type: application/json" \
   -d "request-body"
```

> Request body example:

```json
{
  "id": "f4be2785-ec67-474c-af3a-38ffecfa4094",
  "organization": {
      "id": "fcda8d5a-0276-4de3-908f-b3bd0aff2491"
  },
  "feedbackEmail": "feedback@company.com",
  "feedbackSlackWebhookUrl": "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
  "googleTagManagerContainerId": "GTM-XXXXXXX",
  "matomoHost": "https://myUrl-cloudmc.matomo.cloud/",
  "matomoWebsiteId": "1",
  "supportEmail": "support@company.com",
  "widgetZesettings": "",
  "zendeskWidgetKey": ""
}
```

> The above command return JSON structured like this:

```json
{
  "data": {
    "id": "f4be2785-ec67-474c-af3a-38ffecfa4094",
    "organization": {
      "id": "fcda8d5a-0276-4de3-908f-b3bd0aff2491"
    },
    "feedbackEmail": "feedback@company.com",
    "feedbackSlackWebhookUrl": "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX",
    "googleTagManagerContainerId": "GTM-XXXXXXX",
    "matomoHost": "https://myUrl-cloudmc.matomo.cloud/",
    "matomoWebsiteId": "1",
    "supportEmail": "support@company.com",
    "widgetZesettings": "",
    "zendeskWidgetKey": ""
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured feedback settings' id.
`organization.id`<br/>*UUID* | The organization id that the feedback settings are linked to. It cannot be changed.

Optional | &nbsp;
---------- | -----------
`feedbackEmail`<br/>*string* |  Email address used for feedback.
`feedbackSlackWebhookUrl`<br/>*string* | The slack webhook url used for feedback. Please refer to [https://api.slack.com/messaging/webhooks](https://api.slack.com/messaging/webhooks).
`googleTagManagerContainerId`<br/>*string* | The Google Tag Manager Container ID used to deploy analytics and measurement tag configurations. Please refer to [https://developers.google.com/tag-platform/tag-manager/web](https://developers.google.com/tag-platform/tag-manager/web).
`matomoHost`<br/>*string* | The Matomo analytics subdomain, ending in '.matomo.cloud'. If specified, both the host and website ID are required.
`matomoWebsiteId`<br/>*string* | The website ID which Matomo's Javascript pushes events to. If specified, both the host and website ID are required.
`supportEmail`<br/>*string* | Email address used for support requests.
`widgetZesettings`<br/>*string* | Content of the zeSettings as a JSON for customization. Please refer to [https://developer.zendesk.com/embeddables/docs/widget/settings](https://developer.zendesk.com/embeddables/docs/widget/settings).
`zendeskWidgetKey`<br/>*string* | The key taken from the Zendesk admin page. Only one of supportEmail and zendeskWidgetKey can be set.

<!-------------------- DELETE FEEDBACK SETTINGS -------------------->
### Delete feedback settings

`DELETE /feedback/:id`

Delete an existing feedback settings.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v1/feedback/f4be2785-ec67-474c-af3a-38ffecfa4094" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "85df8dfb-b904-42dc-bb76-4824e6b50c83",
  "taskStatus": "SUCCESS"
}
```

<!-------------------- CHECKING IF FEEDBACK SETTINGS EXISTS -------------------->

### Check if feedback settings is configured for an organization

`GET /feedback/exists?organizationId=:id`

Checks if feedback settings is configured for an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Check if feedback settings is configured
curl "https://cloudmc_endpoint/api/v1/feedback/exists?organizationId=fcda8d5a-0276-4de3-908f-b3bd0aff2491" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{}
```

<!-------------------- CHECKING IF SUPPORT SETTINGS EXISTS -------------------->

### Check if a support email is configured for an organization

`GET /support/exists?organizationId=:id`

Check if a support email is configured for an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Check if support email is configured
curl "https://cloudmc_endpoint/api/v1/support/exists?organizationId=fcda8d5a-0276-4de3-908f-b3bd0aff2491" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{}
```
