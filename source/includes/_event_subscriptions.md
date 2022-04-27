# Event Subscriptions

## Viewing all your event subscriptions

```shell
curl https://api.handshq.com/v1/event_subscriptions \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
```

> 200

```json
  {
    "data": [
      {
        "id": "123",
        "type": "event_subscription",
        "attributes": {
          "event_type": "training_status_changed"
        },
        "relationships": {
          "subscriber": {
            "data": {
              "id":"321",
              "type":"subscriber"
            }
          }
        },
        "links": {
          "related": "https://external.url.hello"
        }
      }
    ],
    "meta": {
      "pagination": {
        "requested_page": 1,
        "total_pages": 1
      }
    }
  }

```

This endpoint will return a list of your event subscriptions.

### Request

`GET https://api.handshq.com/v1/event_subscriptions`


### Response

Successful requests will return a json payload of that division's event subscriptions as a collection and a `200` status code. The `subscriber` relationship refers to the division that the event subscription belongs to.
Results in `data` are [paginated](#pagination)

## Creating an event subscription

```shell
curl https://api.handshq.com/v1/event_subscriptions \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request POST \
  -d '[json_payload]'
```

> Example Event Subscription creation payload.

```json
  {
    "event_subscription": {
      "external_url": "https://some.external_location.com/webhooks",
      "event_type": "version_pdf_created"
    }
  }

```

This endpoint allows you to be notified of certain events. Where resources are account wide (such as roles), all divisions within that account with an event subscription will be notified of the event. Where resources are division specific (such as personnel), divisions with event subscriptions will be notified of events relating to their own resources only. The only exception to this is the primary division on an account, as they will be notified of events relating to all personnel within the account.

Events currently supported are:

### RAMS
- `version_pdf_created` - this is fired after we have generated and stored a project version PDF, which is now ready to be downloaded. Please note that the event is scoped to look for subscriptions which were created by the same division that the project belongs to.

### Training Register
<p> The below events are available to customers with Training Register </p>

- `role_created` - this is fired after a role is created (via the HandsHQ app or via the API).
- `role_updated` - this is fired after a role is updated (via the HandsHQ app or via the API).
- `role_deleted` - this is fired after a role is deleted (via the HandsHQ app or via the API).
- `personnel_created` - this is fired after a personnel is created (via the HandsHQ app or via the API).
- `personnel_updated` - this is fired after a personnel is updated (via the HandsHQ app or via the API).
- `personnel_deleted` - this is fired after a personnel is deleted (via the HandsHQ app or via the API).
- `personnel_archived` - this is fired after a personnel is archived (via the HandsHQ app or via the API).
- `personnel_unarchived` - this is fired after a personnel is unarchived (via the HandsHQ app or via the API).
- `training_status_changed` - this is fired after the training status of a personnel changes. Training statuses change as a result of changes to that personnel's roles, courses and training etc.

### Request

`POST https://api.handshq.com/v1/event_subscriptions`

### Allowed Event Subscription Parameters

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
external_url | String | Yes | A valid URL which we will send a `POST` request to when the event occurs, this must be using `https`.
event_type | String | Yes | The name of the event you wish to be notified about, e.g `version_pdf_created`


### Response

Successful requests will return a json payload of the event subscription that was created and a `201` status code.

> 201

```json
  {
    "id": "123",
    "type": "event_subscription",
    "attributes": {
      "event_type": "version_pdf_created"
    },
    "relationships": {
      "subscriber": {
        "data": {
          "id":"321",
          "type":"subscriber"
        }
      }
    },
    "links": {
      "related": "https://external.url.hello"
    }
  }
```
> A convenience header of `location` will also be present in the response containing a url (e.g. `https://api.handshq.com/v1/event_subscriptions/123`) where you are able to send a DELETE request to if you wish to remove the subscription that was just created.

## Removing an event subscription

```shell
curl https://api.handshq.com/v1/event_subscriptions/[id] \
  -H "Accept: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request DELETE
```

If you no longer wish for an event subscription to be active, then this endpoint can delete an already created one.

### Request

`DELETE https://api.handshq.com/v1/event_subscriptions/[id]`

### Allowed Event Subscription Parameters

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
id | String | Yes | The id of the event subscription you wish to destroy


### Response

Successful requests will return a `204` status code, and thusly no accompanying body.
