# Redemption Endpoints

## Create Redemption

This endpoint redeems a reward.

```shell
$ curl -i -X POST -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/redemptions?apikey=your_key_here' 
    --data '{
              "userId": 0,
              "rewardId": "string",
              "name": "string",
              "description": "string",
              "kudosPoints": 0,
              "currencyCode": "USD",
              "amountInCents": 0,
              "transactionId": "unique_transaction_id",
              "orderId": "unique_order_id",
              "notes": "string"
            }'
```
```javascript
var request = require('request');

var options = {
  uri: 'https://api-client.kudosnow.com/v1/redemptions',
  method: 'POST',
  headers: {
    "apikey": "your_key_here"
  },
  json: {
          "userId": 0,
          "rewardId": "string",
          "name": "string",
          "description": "string",
          "kudosPoints": 0,
          "currencyCode": "USD",
          "amountInCents": 0,
          "transactionId": "unique_transaction_id",
          "orderId": "unique_order_id",
          "notes": "string"
};

request(options, function (error, response, body) {
  ...
});
```

### HTTP Request 
`POST /redemptions` 

**<span id="redeemreward-parameters">Parameters</span>**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| redemption | body | Redemption Body | Yes | [CreateRedemption](#schemacreateredemption)|

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |

