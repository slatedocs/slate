## Notifications
Manage notifications.

<!-------------------- LIST NOTIFICATIONS -------------------->

### List notifications

`GET /content/notifications`

```shell
# Retrieve notification categories
curl "https://cloudmc_endpoint/v2/rest/content/notifications?language=:language&organization_id=:organiationId" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "publishedAt": "2020-10-29T19:27:34.299Z",
            "authorId": "15419d47-0ec4-47d5-8622-4fbb1948844f",
            "version": 1,
            "createdAt": "2020-10-29T15:04:36.134Z",
            "authorLastName": "Root",
            "authorFirstName": "Root",
            "translations": [
                {
                    "language": "en",
                    "id": "99f815c6-2aba-4462-9419-63daa67712e2",
                    "text": "system-notification",
                    "type": "title",
                    "version": 1
                },
                {
                    "language": "fr",
                    "id": "812f3b76-bc6b-4816-ace8-3e69c6e1efcd",
                    "text": "en français",
                    "type": "title",
                    "version": 1
                },
                {
                    "language": "en",
                    "id": "94c4bedb-df83-49f0-beb3-8e672e28c316",
                    "text": "system",
                    "type": "body",
                    "version": 1
                },
                {
                    "language": "fr",
                    "id": "98c1f48c-1f2b-4dc6-a43c-3f239a2473a7",
                    "text": "system",
                    "type": "body",
                    "version": 1
                }
            ],
            "deprecatedAt": "2020-11-03T20:57:00.000Z",
            "sticky": true,
            "id": "b7c6d7ca-6fef-406b-a911-bba873a99773",
            "category": {
                "organizationId": "1384d793-dae5-441c-8cc2-e78168c94018",
                "createdAt": "2020-10-29T15:01:44.000Z",
                "translations": [
                    {
                        "language": "en",
                        "id": "4840af1e-1d74-4b4f-bdda-6e04f4569142",
                        "text": "system-category",
                        "type": "title",
                        "version": 1
                    },
                    {
                        "language": "fr",
                        "id": "0bc8f49c-8f65-4319-be57-ad70cdfe144d",
                        "text": "en français",
                        "type": "title",
                        "version": 1
                    }
                ],
                "icon": "fa fa-envelope",
                "id": "2569f2cc-f1d7-4664-8439-173fedfab1c3",
                "version": 1,
                "updatedAt": "2020-10-29T19:28:22.000Z"
            },
            "splash": false,
            "updatedAt": "2020-10-29T19:27:34.462Z",
            "status": "published"
        }
    ]
}
```
List the notifications configured for the organization.

Optional Query Parameters | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The id of the organization we wish to display notifications for. If not provided, the current user's organization id will be used.
`language`<br/>*UUID* | Language of the notification.Expected values are "en" (English), "fr" (French) or "es" (Spanish).

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the notification.
`authorId`<br/>*UUID* | The author's id.
`authorFirstName`<br/>*string* | The author's first name.
`authorLastName`<br/>*string* | The author's last name.
`splash`<br/>*boolean* | When set to true, the notification will be displayed in the home screen until it reaches its deprecated date. Only one of splash and sticky can be set to true.
`sticky`<br/>*boolean* | When set to true, the notification will be displayed upon logging in. Only one of splash and sticky can be set to true.
`status`<br/>*string* | The status of the notification within it's lifecycle (draft, published, deprecated).
`createdAt`<br/>*string* | The date on which the notification was created.
`updatedAt`<br/>*string* | The date on which the notification was updated.
`publishedAt`<br/>*string* | The date on which the notification was published.
`depricatedAt`<br/>*string* | The date on which the notification will be deprecated.
`version`<br/>*integer* | The notification's version.
`category`<br/>*Array[[Notification Category](#administration-notification-categories)]* | The notification category that the notification belongs to.<br/>*includes*: `id`, `organizationId`, `createdAt`, `updatedAt`, `translations`, `icon`, `version`
`translations`<br/>*Array[Object]* | The translations of the notification category's content.
`translations.language`<br/>*string* | The language of the translation.
`translations.text`<br/>*string* | The content of the notification.
`translations.type`<br/>*string* | The content that we are translating. For a notification, this can only be "title" or "body".
`translations.id`<br/>*UUID* | The translation's id.
`translations.version`<br/>*integer* | The translation's version.


<!-------------------- GET NOTIFICATION -------------------->

### Retrieve notification

`GET /content/notifications/:id`

```shell
# Retrieve notification category
curl "https://cloudmc_endpoint/v2/rest/content/notifications/:id?language=:language" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns JSON structured like this:

```json
{
    "data": {
        "publishedAt": "2020-10-29T19:27:34.299Z",
        "authorId": "15419d47-0ec4-47d5-8622-4fbb1948844f",
        "version": 1,
        "createdAt": "2020-10-29T15:04:36.134Z",
        "authorLastName": "Root",
        "authorFirstName": "Root",
        "translations": [
            {
                "language": "en",
                "id": "99f815c6-2aba-4462-9419-63daa67712e2",
                "text": "system-notification",
                "type": "title",
                "version": 1
            },
            {
                "language": "fr",
                "id": "812f3b76-bc6b-4816-ace8-3e69c6e1efcd",
                "text": "en français",
                "type": "title",
                "version": 1
            },
            {
                "language": "en",
                "id": "94c4bedb-df83-49f0-beb3-8e672e28c316",
                "text": "system",
                "type": "body",
                "version": 1
            },
            {
                "language": "fr",
                "id": "98c1f48c-1f2b-4dc6-a43c-3f239a2473a7",
                "text": "system",
                "type": "body",
                "version": 1
            }
        ],
        "deprecatedAt": "2020-11-03T20:57:00.000Z",
        "sticky": true,
        "id": "b7c6d7ca-6fef-406b-a911-bba873a99773",
        "category": {
            "organizationId": "1384d793-dae5-441c-8cc2-e78168c94018",
            "createdAt": "2020-10-29T15:01:44.000Z",
            "translations": [
                {
                    "language": "en",
                    "id": "4840af1e-1d74-4b4f-bdda-6e04f4569142",
                    "text": "system-category",
                    "type": "title",
                    "version": 1
                },
                {
                    "language": "fr",
                    "id": "0bc8f49c-8f65-4319-be57-ad70cdfe144d",
                    "text": "en français",
                    "type": "title",
                    "version": 1
                }
            ],
            "icon": "fa fa-envelope",
            "id": "2569f2cc-f1d7-4664-8439-173fedfab1c3",
            "version": 1,
            "updatedAt": "2020-10-29T19:28:22.000Z"
        },
        "splash": false,
        "updatedAt": "2020-10-29T19:27:34.462Z",
        "status": "published"
    }
}
```
Get a specific notification.

Optional Query Parameters | &nbsp;
---------- | -----------
`language`<br/>*UUID* | Language of the notification. Expected values are "en" (English), "fr" (French) or "es" (Spanish).


Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the notification.
`authorId`<br/>*UUID* | The author's id.
`authorFirstName`<br/>*string* | The author's first name.
`authorLastName`<br/>*string* | The author's last name.
`splash`<br/>*boolean* | When set to true, the notification will be displayed in the home screen until it reaches its deprecated date. Only one of splash and sticky can be set to true.
`sticky`<br/>*boolean* | When set to true, the notification will be displayed upon logging in. Only one of splash and sticky can be set to true.
`status`<br/>*string* | The status of the notification.
`createdAt`<br/>*string* | The date on which the notification was created.
`updatedAt`<br/>*string* | The date on which the notification was updated.
`publishedAt`<br/>*string* | The date on which the notification was published.
`depricatedAt`<br/>*string* | The date on which the notification will be deprecated.
`version`<br/>*integer* | The notification's version.
`category`<br/>*Array[[Notification Category](#administration-notification-categories)]* | The notification category that the notification belongs to.<br/>*includes*: `id`, `organizationId`, `createdAt`, `updatedAt`, `translations`, `icon`, `version`
`translations`<br/>*Array[Object]* | The translations of the notification category's title.
`translations.language`<br/>*string* | The language of the translation.
`translations.text`<br/>*string* | The content of the notification.
`translations.type`<br/>*string* | The content that we are translating. For a notification, this can only be "title" or "body".
`translations.id`<br/>*UUID* | The translation's id.
`translations.version`<br/>*integer* | The translation's version.

<!-------------------- CREATE NOTIFICATION -------------------->

### Create notification

`POST /content/notifications/`

```shell
# Create notification
curl -X POST "https://cloudmc_endpoint/v2/rest/content/notifications/" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request-body"
```
> Request body example:

```json
{
    "translations": [
        {
            "language": "en",
            "text": "system-notification-create-no-author",
            "type": "title"
        },
        {
            "language": "fr",
            "text": "en français",
            "type": "title"
        },
        {
            "language": "en",
            "text": "system notification create",
            "type": "body"
        },
        {
            "language": "fr",
            "text": "en français",
            "type": "body"
        }
    ],
    "category": {
        "id": "2569f2cc-f1d7-4664-8439-173fedfab1c3"
    }
}
```
Create a notification.

Required | &nbsp;
---------- | -----------
`category`<br/>*[Notification Category](#administration-notification-categories)]* | The notification category that the notification belongs to.<br/>*includes*: `id`
`translations`<br/>*Array[Object]* | The translations of the notification category's content.
`translations.language`<br/>*string* | The language of the translation.
`translations.text`<br/>*string* | The content of the notification.
`translations.type`<br/>*string* | The content that we are translating. For a notification, this can only be "title" or "body".

Optional | &nbsp;
---------- | -----------
`publishedAt`<br/>*string* | The date on which the notification has been/will be published.
`deprecatedAt`<br/>*string* | The date on which the notification has been/will be deprecated.
`splash`<br/>*boolean* | When set to true, the notification will be displayed in the home screen until it reaches its deprecated date. Only one of splash and sticky can be set to true.
`sticky`<br/>*boolean* | When set to true, the notification will be displayed upon logging in. Only one of splash and sticky can be set to true.

<!-------------------- UPDATE NOTIFICATION -------------------->

### Update notification

`PUT /content/notifications/:id`

```shell
# Update notification
curl -X PUT "https://cloudmc_endpoint/v2/rest/content/notifications/:id" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request-body"
```
> Request body example:

```json
{
    "id":"e5412e1d-64ac-40b2-a1a1-05780584fc71",
    "translations": [
        {
            "language": "en",
            "text": "system-notification-create-no-autho",
            "type": "title"
        },
        {
            "language": "fr",
            "text": "en français",
            "type": "title"
        },
        {
            "language": "en",
            "text": "system notification create",
            "type": "body"
        },
        {
            "language": "fr",
            "text": "en français",
            "type": "body"
        }
    ],
    "category": {
        "id": "dc921a2a-16c2-4bc3-8ed6-bcb571bae241"
    }
}
```
Update a notification.

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the notification.
`category`<br/>*[Notification Category](#administration-notification-categories)]* | The notification category that the notification belongs to.<br/>*includes*: `id`
`translations`<br/>*Array[Object]* | The translations of the notification category's content.
`translations.language`<br/>*string* | The language of the translation.
`translations.text`<br/>*string* | The content of the notification.
`translations.type`<br/>*string* | The content that we are translating. For a notification, this can only be "title" or "body".

Optional | &nbsp;
---------- | -----------
`publishedAt`<br/>*string* | The date on which the notification has been/will be published.
`deprecatedAt`<br/>*string* | The date on which the notification has been/will be deprecated.
`splash`<br/>*boolean* | When set to true, the notification will be displayed in the home screen until it reaches its deprecated date. Only one of splash and sticky can be set to true.
`sticky`<br/>*boolean* | When set to true, the notification will be displayed upon logging in. Only one of splash and sticky can be set to true.
`translations.id`<br/>*UUID* | When specified, the existing translation will be modified. If not provided, a new translation will replace the existing one.


<!-------------------- DELETE NOTIFICATION -------------------->


### Delete notification

`DELETE /content/notifications/:id`

```shell
# Delete a notification category
curl "https://cloudmc_endpoint/v2/content/notifications/:id" \
   -X DELETE -H "MC-Api-Key: your_api_key"

```

Delete a notification.