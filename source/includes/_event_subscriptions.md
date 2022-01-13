# Event Subscriptions

## Creating an event subscription

```shell
curl https://api.handshq.com/v1/event_subscriptions \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: bearer [api_token]" \
  --request POST \
  -d "[json_payload]"
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

This endpoint allows you to be notified of certain events. Those currently supported are:

- `version_pdf_created` - this is fired after we have generated and stored a project version PDF, which is now ready to be downloaded.

<aside class="notice">
  Please note that the `version_pdf_created` event is scoped to look for subscriptions which were created by the same division that the project belongs to.
</aside>

### Request

`POST https://api.handshq.com/v1/event_subscriptions`

### Allowed Event Subscription Parameters

Parameter | Format | Required | Description
--------- | ------ | -------- | -----------
external_url | String | Yes | A valid URL which we will send a `POST` request to when the event occurs, this must be using `https`.
event_type | String | Yes | The name of the event you wish to be notified about, allowed values: [`version_pdf_created`]


### Response

Successful requests will return a json payload of the event subscription that was created and a `201` status code.

> 201

```json
{
  "data": {
    "id": "123",
    "type": "event_subscription",
    "relationships": {
      "subscriber": {
        "data": {
          "id": "321",
          "type": "subscriber"
        }
      }
    },
    "links": {
        "related": "https://some.external_location.com/webhooks"
    }
  }
}
```

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

# Event Notifications

Each Event Subscription will send a `POST` request to the location set out within it's own `external_url` that has been provided once the event occurs.

These will be in a `JSON` format and still in-keeping with the `JSON:API` specification.

The body of an event subscription will vary depending on the type of event being subscribed to.

## Version PDF Created

```json
{
  "data": {
    "id": "2",
    "type": "version_pdf",
    "attributes": {
      "created_at": "2021-11-05T11:30:32.742+00:00",
      "file_size": 32540
    },
    "relationships": {
      "version": {
        "data": {
          "id": "50",
          "type": "version"
        }
      }
    },
    "links": {
      "content": "https://exampleRemoteStorage.com/123.pdf"
    }
  },
  "included": [
    {
      "id": "50",
      "type": "version",
      "attributes": {
        "is_fully_signed": false,
        "pdf_filename": "my-lovely-project.pdf",
        "display_number": 0,
        "created_at": "2021-11-05T11:29:33.222+00:00"
      },
      "relationships": {
        "history": {
          "data": {
            "id": "50",
            "type": "history"
          }
        },
        "version_pdf": {
          "data": {
            "id": "2",
            "type": "version_pdf"
          }
        }
      }
    },
    {
      "id": "50",
      "type": "history",
      "attributes": {
        "reason": "Jane D. created the project",
        "createdAt": "2021-11-05T11:29:32.955+00:00",
        "displayNumber": 0,
        "eventType": "generic"
      },
      "relationships": {
        "project": {
          "data": {
            "id": "19",
            "type": "project"
          }
        },
        "message": {
          "data": null
        }
      }
    },
    {
      "id": "19",
      "type": "project",
      "attributes": {
        "name": "My lovely project",
        "reference": "ref1",
        "start_date": null,
        "end_date": null,
        "archived_at": null,
        "state": "not_submitted"
      },
      "relationships": {
        "fields": {
          "data": [
            {
              "id": "261",
              "type": "field"
            },
            {
              "id": "265",
              "type": "field"
            },
          ]
        },
        "latest_reviewed_version": {
          "data": null
        },
        "user": {
          "data": {
            "id": "5",
            "type": "user"
          }
        }
      },
      "links": {
        "app_url": "https://localhost:3000/projects/19"
      }
    }
  ]
}
```
### Data:

  - The attributes of PDF record
    - Link to the URL of where the PDF is hosted

### Included Resources:

  - The `Project` that it was derived from.
    - Link to the project within HandsHQ


  - The `History` describing what caused the creation of a new `Version`
    - Included description of the latest change


  - The `Version` of a `Project` which had been generated into a PDF
    - Included numbering of the version


  - The author (`User`) of the project.

<aside class='notice'>
  <strong>Please Note</strong>:
  <li>The URL of the PDF (as described in "links" => "content") is only valid for 48 hours.</li>
  <li>This event may fire on occassion for the same version, in cases where a PDF is being regenerated (e.g. in the case of digital signatures)</li>
</aside>
