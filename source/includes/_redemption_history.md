## Redemptions History

<a id="opIdredemptionHistory"></a>

This end points fetches redemption history for a user or the complete organization.

```shell
$ curl -i -X GET -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/redemptions?apikey=your_key_here&userId=1&page=1&perPage=15'
```
```javascript
var request = require('request');

var options = {
  uri: 'https://api-client.kudosnow.com/v1/redemptions?userId=1&page=1&perPage=15',
  method: 'GET',
  headers: {
    "apikey": "your_key_here"
  }
};

request(options, function (error, response, body) {
  ...
});
```

### HTTP Request 
`GET /redemptions` 

**Parameters**

|Name|Located in|Description|Required|Type|
|---|---|---|---|--|
|userId|query|User Id|false|integer|
|page|query|Page number|false|integer|
|perPage|query|Count of items per page (15 by default)|false|integer|

<h3 id="redemptionhistory-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="redemptionhistory-responseschema">Response Schema</h3>

Status Code **200**

| Attribute | Description | Required | Type |
|---|---|---|---|
|» data|Response object|false|[RedemptionsHistory](#schemaredemptionshistory)|
|»» page|Page number|true|integer|
|»» totalCount|Total count of redemptions|true|integer|
|»» data|Redemptions list|true|[[Redemption](#schemaredemption)]|
|»»» id|Redemption id|true|integer|
|»»» cancellationDate|Date this redemption was cancelled|false|string(date)|
|»»» createdBy|Date this redemption was created|true|integer|
|»»» rewardId|Reward's id|true|string|
|»»» name|Reward's name|true|string|
|»»» description|Reward's description|true|string|
|»»» kudosPoints|User's points deducted due to this redemption|true|integer|
|»»» currencyCode|Currency code of the amount|true|string|
|»»» amountInCents|Amount in cents|true|integer|
|»»» transactionId|Transaction id|true|string|
|»»» userId|User's id|true|string|
|»»» orderId|Order id|true|string|
|»»» notes|Notes|false|string|
|»»» createdAt|Date this redemption was created|true|string(date)|
|»»» updatedAt|Date this redemption was last updated|true|string(date)|
