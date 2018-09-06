# Settings

## Get Settings

```shell
curl "http://example.com/api/settings/"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 1,
    "notification": {
      "sms": true,
      "false": false
    }
  }
}
```

This endpoint retrieves user settings.

### HTTP Request

`GET http://example.com/api/settings/`

### URL Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user logged in

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Notification

```shell
curl "http://example.com/api/settings/notification"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 1,
    "sms": false,
    "push": true
  }
}
```

This endpoint changes notification settings.

### HTTP Request

`POST http://example.com/api/settings/notification`

### Body Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user logged in
sms             | Boolean   | The sms settings desired
push            | Boolean   | The push settings desired

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>