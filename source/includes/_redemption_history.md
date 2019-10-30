## Redemptions History

<a id="opIdredemptionHistory"></a>

This end points fetches the redemption history scoped by a user or by the organization.

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
|userId|query|User ID|false|integer|
|page|query|Page number|false|integer|
|perPage|query|Number of redemptions per page. Defaults to 15|false|integer|

<h3 id="redemptionhistory-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|successful operation|Inline|

<h3 id="redemptionhistory-responseschema">Response Schema</h3>

Status Code **200**

| Attribute | Description | Required | Type |
|---|---|---|---|
|» data|Response object|false|[RedemptionsHistory](#schemaredemptionshistory)|
