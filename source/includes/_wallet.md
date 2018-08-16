# Wallet

## Get Wallet

```shell
curl "http://example.com/api/wallet/<ID>"
  -H "Authorization: Bearer <TOKEN>"
```

> The above command returns JSON structured like this:

```json
{
  "status_code": 200,
  "message": "Success",
  "body": {
    "id": 1,
    "address": "0x9ivrb24b5obp25pnu12ldvjd897b",
    "wallet": {
      "load": 480,
      "xon": 520,
      "xonio": 1
    }
  }
}
```

This endpoint retrieves the wallet of user.

### HTTP Request

`GET http://example.com/api/wallet/1`

### Body Parameters

Parameter       | Data Type | Description
----------------|-----------|--------------
user_id         | Integer   | The id of the user to be charged

<aside class="success">
200 - Success
</aside>
<aside class="warning">
401 - Unauthorized
</aside>