# Getting Quotes

The quoting API does not require you to add your Sendle ID and API Key, but be sure to include all the relevant fields.

<aside class="notice">With curl, add <strong>-H 'Content-Type: application/json'</strong> to transmit in <strong>JSON</strong></aside>


### Quote Requirements

> [GET /api/quote]

```shell
  curl 'https://sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01' -H 'Content-Type: application/json'
```

> 200 Response

```
  [{"quote":{"gross":{"amount":13.75,"currency":"AUD"},"net":{"amount":12.5,"currency":"AUD"},"tax":{"amount":1.25,"currency":"AUD"}},"plan_name":"Premium"},{"quote":{"gross":{"amount":14.75,"currency":"AUD"},"net":{"amount":13.41,"currency":"AUD"},"tax":{"amount":1.34,"currency":"AUD"}},"plan_name":"Standard"}]
```

> Empty Request

```
curl 'https://sendle.com/api/quote'
```
> Response 

```
  {"messages":{"pickup_suburb":["can't be blank"],"pickup_postcode":["can't be blank"],"delivery_suburb":["can't be blank"],"delivery_postcode":["can't be blank"],"kilogram_weight":["is not a number"]},"error":"unprocessable_entity","error_description":"The data you supplied is invalid. Error messages are in the messages section. Please fix those fields and try again."}
```


Paramerters required:

- `pickup_suburb`
  - Suburb must be valid and match pickup postcode.
- `pickup_postcode`
  - Four digit post code for the pickup address.
- `delivery_suburb`
  - Suburb must be valid and match delivery postcode.
- `delivery_postcode`
  - Four digit post code for the delivery address.
- `kilogram_weight`
  - Must be a decimal value above zero.
- `cubic_metre_volume`
  - To determine this measurement multiply length x width x depth of the parcel **in metres**
  - This value must be decimal above zero and less than 1.

### Optional Parameters
> Request with `plan_name`

```
  curl 'https://sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01&plan_name=Premium' -H 'Content-Type: application/json'
```

> 200 Response

```
  [{"quote":{"gross":{"amount":13.75,"currency":"AUD"},"net":{"amount":12.5,"currency":"AUD"},"tax":{"amount":1.25,"currency":"AUD"}},"plan_name":"Premium"}]
```

- `plan_name`
  - If specified, the API will respond with a quote for the given plan. If left out, the API will give quotes for all available plans.
  - Currently available plans are **Standard** and **Premium**