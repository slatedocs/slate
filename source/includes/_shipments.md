# Shipments

## Shipment object

> Example object

```json
{
  "id": "a7681e95-68d2-450e-bf32-73562c4d74c6",
  "carrier": "UPS",
  "tracking_number": "1Z034864P299368312",
  "tracking_url": "https://track.easypost.com/djE6dHJrXzg1MjQ1MTQ0YWEzNzQzMjBhNTc2NjgwMzdiMmIzMjVi",
  "tracking_status": "pre_transit",
  "tracking_status_at": "2017-08-08T14:26:44.000Z",
  "eta": "2017-08-08T14:26:44.000Z",
  "sku": {
    "id": "868137000122"
  },
  "created_at": "2017-08-08T14:25:20.559Z",
  "updated_at": "2017-08-08T14:26:47.249Z"
}
```

| Attribute  | Type     | Description |
| ---------- | -------- | ------------|
| id                  | string | Unique identifier for the object |
| carrier             | string | |
| service             | string | |
| tracking_number     | string | |
| tracking_url        | string | |
| tracking_status     | string | |
| tracking_status_at  | timestamp | Time at which the tracking status was updated |
| eta | timestamp     | Time at which the shipment is expected to be delivered |
| sku                 | hash | |
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
