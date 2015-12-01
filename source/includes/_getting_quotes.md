# Getting Quotes

The quoting API does not require you to include your Sendle ID and API Key, but be sure to include all the relevant fields.

<aside class="notice">With curl, the add-on <code>-H 'Content-Type: application/json'</code> adds <code>JSON</code> formatting for the request. If you use a method besides <strong>curl</strong>, be sure to include <strong>json</strong> formatting in the request header.</aside>


### Parcel Quote Requirements

> [GET /api/quote]

```shell
  curl 'https://www.sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01' -H 'Content-Type: application/json'
```

> 200 Response

```json
  [
    {
      "quote":{
        "gross":{
          "amount":13.75,
          "currency":"AUD"
        },
        "net":{
          "amount":12.5,
          "currency":"AUD"
        },
        "tax":{
          "amount":1.25,
          "currency":"AUD"
        }
      },
      "plan_name":"Premium"
    },
    {
      "quote":{
        "gross":{
          "amount":14.75,
          "currency":"AUD"
        },
        "net":{
          "amount":13.41,
          "currency":"AUD"
        },
        "tax":{
          "amount":1.34,
          "currency":"AUD"
        }
      },
      "plan_name":"Standard"
    }
  ]
```

> Empty Request

```shell
curl 'https://www.sendle.com/api/quote'
```
> Response 

```json
  {
    "messages":{
      "pickup_suburb":["can't be blank"],
      "pickup_postcode":["can't be blank"],
      "delivery_suburb":["can't be blank"],
      "delivery_postcode":["can't be blank"],
      "kilogram_weight":["is not a number"]
    },
    "error":"unprocessable_entity",
    "error_description":"The data you supplied is invalid. Error messages are in the messages section. Please fix those fields and try again."
  }
```



| Field | Attributes |
|------:|:-----------|
| **pickup_suburb** | Suburb must be real and match pickup postcode.
| **pickup_postcode** | Four digit post code for the pickup address.
| **delivery_suburb** | Suburb must be real and match delivery postcode.
| **delivery_postcode** | Four digit post code for the delivery address.
| **kilogram_weight** | Must be a decimal value above zero and below weight limits.  Max weight is 25 kilos.
| **cubic_metre_volume** | This value must be decimal above zero and less than one.  To determine this measurement multiply *length* x *width* x *depth* of the parcel **in metres**.
| **plan_name** | If specified, the API will respond with a quote for the given plan. If left out, the API will give quotes for all available plans.  Current available plans are **Standard** and **Premium**.

> Request with `plan_name`

```shell
  curl 'https://www.sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01&plan_name=Premium'
  -H 'Content-Type: application/json'
```

> 200 Response

```json
  [
    {
      "quote":{
        "gross":{
          "amount":13.75,
          "currency":"AUD"
        },
        "net":{
          "amount":12.5,
          "currency":"AUD"
        },
        "tax":{
          "amount":1.25,
          "currency":"AUD"
        }
      },
      "plan_name":"Premium"
    }
  ]
```

<aside class='warning'>To find out more about <strong>error messages</strong>, be sure to read up on the <a href="#errors">errors</a> to help you get to better results.</aside>

