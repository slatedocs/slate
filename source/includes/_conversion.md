# Conversion

## Convert

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
    "wallet": [
      {
        "currency": "load",
        "balance": 480,
        "address": "0x9ivrb24b5obp25pnu12ldvjd897b",
      },
      {
        "currency": "xon",
        "balance": 80,
        "address": "0x9ivrb24b5obp25pnu12ldvjd897b",
      },
      {
        "currency": "xonio",
        "balance": 10,
        "address": "0x9ivrb24b5obp25pnu12ldvjd897b",
      }
    ]
  }
}
```

This endpoint converts load to xon credits.

### HTTP Request

`POST http://example.com/api/convert/`

### Body Parameters

Parameter       | Data Type  | Description
----------------|------------|--------------
user_id         | Integer    | The id of the user to be charged
from            | String     | The origin currency code
to              | String     | The destination currency code
amount          | BigDecimal | The amount to be converted

<aside class="success">
200 - Success
</aside>
<aside class="warning">
400 - Not enough airtime credits
</aside>
<aside class="warning">
401 - Unauthorized
</aside>