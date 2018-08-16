# Conversion

## Airtime Credits

```shell
curl "http://example.com/api/convert/xon"
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

This endpoint converts load to xon credits.

### HTTP Request

`POST http://example.com/api/convert/xon`

### Body Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user to be charged
airtime_credit  | Integer   | The total amount of load to charge

<aside class="success">
200 - Success
</aside>
<aside class="warning">
400 - Not enough airtime credits
</aside>
<aside class="warning">
401 - Unauthorized
</aside>