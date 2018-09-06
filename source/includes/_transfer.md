# Transfer

## Send XON

```shell
curl "http://example.com/api/transfer/xon"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 1,
    "date": "@D:2015-12-10T12:34:56",
    "timestamp": 19267343928,
    "wallet": {
      "load": 480,
      "xon": 520,
      "xonio": 1
    }
  }
}
```

This endpoint transfers xon credits to another user.

### HTTP Request

`POST http://example.com/api/transfer/xon`

### Body Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user to be charged
xon_credit      | Integer   | The amount of xon to be transfered
mobile_number   | String    | The mobile number of the recipient
wallet_address  | String    | The wallet address of the recipient

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>

## Send XONIO

```shell
curl "http://example.com/api/transfer/xonio"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 1,
    "date": "@D:2015-12-10T12:34:56",
    "timestamp": 19267343928,
    "wallet": {
      "load": 480,
      "xon": 520,
      "xonio": 1
    }
  }
}
```

This endpoint transfers xonio credits to another user.

### HTTP Request

`POST http://example.com/api/transfer/xonio`

### Body Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user to be charged
xonio_credit    | Integer   | The amount of xonio to be transfered
mobile_number   | String    | The mobile number of the recipient
wallet_address  | String    | The wallet address of the recipient

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>