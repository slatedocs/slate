## Cancel Redemption

<a id="opIdcancelRedemption"></a>

This endpoint looks up a user by email address or employee number; both are not required.

```shell
$ curl -i -X DELETE -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/redemptions/{id}?apikey=your_key_here&userId=0'
Or
$ curl -i -X DELETE -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/redemptions/{id}?userId=0'
```
```javascript
var request = require('request');

var options = {
  uri: 'https://api-client.kudosnow.com/v1/redemptions/{id}?userId=0',
  method: 'DELETE',
  headers: {
    "apikey": "your_key_here"
  }
};

Or

var options = {
  uri: 'https://api-client.kudosnow.com/v1/redemptions/{id}?userId=0',
  method: 'DELETE',
  headers: {
    "apikey": "your_key_here"
  }
};

request(options, function (error, response, body) {
  ...
});
```

### HTTP Request

`DELETE /redemptions/{id}`

Cancel a redemption

<h3 id="cancelredemption-parameters">Parameters</h3>

|Name|Located In|Type|Required|Description|
|---|---|---|---|---|
|id|path|integer|true|Redemption ID|
|userId|query|integer|true|User ID|

> Example responses

> 200 Response

```json
{
  "data": {
    "id": 0,
    "cancellationDate": "2019-10-28",
    "createdBy": 0,
    "rewardId": "string",
    "name": "string",
    "description": "string",
    "kudosPoints": 0,
    "currencyCode": "string",
    "amountInCents": 0,
    "transactionId": "string",
    "userId": "string",
    "orderId": "string",
    "notes": "string",
    "createdAt": "2019-10-28",
    "updatedAt": "2019-10-28"
  }
}
```

<h3 id="cancelredemption-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="cancelredemption-responseschema">Response Schema</h3>

Status Code **200**

| Attribute | Description | Required | Type |
|---|---|---|---|
|data|Redemption object|true|[Redemption](#schemaredemption)|