# Shipments

## Shipment object

> Example object

```json
{
  "id": "20a21109-0e00-403b-84cc-62e095c94bca",
  "label": "1 six-pack of [skin+hair]",
  "carrier": "UPS",
  "tracking_number": "9400136897846107013399",
  "tracking_url": "https://track.easypost.com/djE6dHJrX2Y0YTdkMGI1NmJlNDQ1MzdhMjMzN2M2ODlmMGM2OTdm",
  "tracking_status": "delivered",
  "tracking_status_at": "2017-05-03T22:38:23.432Z",
  "eta": "2017-05-03T12:00:00.000Z",
  "created_at": "2017-05-03T22:37:50.357Z",
  "updated_at": "2017-05-03T22:38:23.432Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id                  | string | Unique identifier for the object |
| label               | string | |
| carrier             | string | |
| tracking_number     | string | |
| tracking_url        | string | |
| tracking_status     | string | |
| tracking_status_at  | timestamp | Time at which the tracking status was updated |
| eta | timestamp     | Time at which the shipment is expected to be delivered |
| created_at          | timestamp | Time at which the object was created |
| updated_at          | timestamp | Time at which the object was updated |


## Webhook

```shell
curl https://user:password@api.dirtylemon.com/v1/shipments/webhook \
  -X POST \
  -H 'Content-Type: application/json' \
  -d '{ id: "...", description: "...", result: {} }'
```

> Example response

```http
HTTP/1.1 204 NO CONTENT
```

This endpoint allows an external service to update a shipment's tracking informations.

### Authentication

Requests are authenticated with HTTP basic authentication.

### HTTP Request

`POST https://user:password@api.dirtylemon.com/v1/shipments/webhook`

### Body params

Expected payload from [EasyPost's webhook reference](https://www.easypost.com/webhooks-guide).

### Returns

Nothing.
