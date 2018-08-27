# Pay Per Asset

## List Prices of Assets

```shell--request
curl -H "X-SUBAUTH: <auth-token>" -X GET 'http://www.accesstype.com/api/v1/asset/<asset-type>/pricing_plans.json?id=123456&collection_id[]=123&collection_id[]=456>'
```
```shell--response
{
    "pricing_plans": [
        {
            "id": 1071,
            "price_cents": 1400,
            "price_currency": "INR",
            "duration_length": 1,
            "duration_unit": "lifetime"
        },
        {
            "id": 1959,
            "price_cents": 1000,
            "price_currency": "INR",
            "duration_length": 1,
            "duration_unit": "months"
        }
    ]
}
```
This API returns the prices of a story or a collection when sold individually.


|Parameter|Type|Occurrence|Description|
|---	|---	|---	|---	|
|`/<asset-type>/`|string|1|The type of asset that is being purchased. Valid Values for Quintype CMS `story`,`collection`|
|`id`|string|1|The identifier of the story or collection that is being purchased.|
|`collection_id[]`|string|0 or many|The identifier of the collection that the story belongs to. Used when the value of `/<asset-type>/` is `story`.|


## Create Asset Purchase API
```shell--request
curl -H "X-SUBAUTH: <auth-token>" -H "Content-Type: application/json" -X POST http://www.accesstype.com/api/v1/subscribers/email/myid@example.com/subscriptions.json -d '{
  "subscription": {
    "subscription_type": "dynamic_asset",
    "subscription_plan_id": <pricing-plan-id>,
    "payment": {
      "payment_type": "simpl"
    },
    "metadata":  {
      "full-name": "hello",
      "email": "hello@quintype.com"
    },
    "dynamic_assets": [{
        "id": "some_asset_id"
     }]
  },
  "alternate_provider": "email",
  "alternate_identity": "hey@quintype.com",
  "attempt_token": "fo4bMWjP6N5vtVySNtiAUNBQ",
  "name": "Ben"
}
```
```shell--response
```
