---
title: Sendle API

language_tabs:
  - interact with Sendle API using json

toc_footers:
  - <a href='#'>Get your Developer Key</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

> using Curl

```
  curl 'https://sendle.com/api/quote?pickup_suburb=Wonglepong&pickup_postcode=4275&delivery_suburb=Foul%20Bay&delivery_postcode=5577&kilogram_weight=2.0&cubic_metre_volume=0.01' -H 'Content-Type: application/json'
```

Welcome to the Sendle API! You can use our API to access Sendle Booking endpoints, which ill allow you to book Sendle pickups, manage shipping, and oversee past and present orders any way you like!


Sendle API uses only JSON. You can view code examples in the dark area to the right.

For all examples, we will be using [curl](http://curl.haxx.se/) from command line, but you are encouraged to make requests in whichever method you are most comfortable with.

# Getting Started

> Requests should be made with the following headers:

```
  Content-Type: application/json
  Accept: application/json
```

Before anything else, you will need to have a [Sendle Account](https://www.sendle.com/#signup-form) authorised with an API.

For API access, please contact support@sendle.com.

![Account Settings](images/account_settings.png)

When Access is granted, visit `Account Settings` (top right) on your Sendle Dashboard.

![API Modal](images/api_modal.png)

Once you have been granted API access, visit your API tab to get your `api key`.

<aside class="warning">Be sure to keep your API Key secret!</aside>

## Set Up Payments

> Without Payment Details

```
{"error":"payment_required","error_description":"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method."}  
```

<aside class="notice">To use Sendle API, you will need a valid payment option attached to the Sendle Account.</aside>

![Add Payment Details](images/payment_modal.png)

To use the API, be sure to have a credit card on file.

For payments, Sendle uses [Stripe](https://stripe.com). If you want to use a dummy credit card for sandbox testing, [visit stripes testing docs](https://stripe.com/docs/testing) for credit examples.


# Ping Server

> All API interactions will require your Sendle ID and your API Key (Make sure to replace **sendleAPI** and **42RRTjYz5Z4hZrm8XY3t4Vxt** with your Sendle ID & API key.)

```shell
  curl 'https://sendle.com/api/ping'
  -u sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt
```

Sendle uses your **Sendle ID** together with your own **API Key** to grant access to the server. Together this allows you access through the API so that you may book and follow up with orders, as well as view passed orders you have sent or received.

For this initial example, we'll simply ping the server.

You must include your credentials in the request, or you will be denied. However, if you include your `Sendle ID`, you will be prompted to enter your API key (password).

## OK Response

> Status 200:

```json
  {"ping":"pong"}% 
```

When the api receives a request with a `Sendle ID` and an `API Key` the server responds with a `JSON` string containing the relevant details.

## Without Credentials
> No Sendle ID AND No API Key

```shell
  curl 'https://sendle.com/api/ping'
```

> Response:

```
  HTTP Basic: Access denied.
```

> Response With incorrect Credentials:

```
  {"error":"unauthorised","error_description":"The authorisation details are not valid. Either the Sendle ID or API key are incorrect."}
```

*If* you include your `Sendle ID` without your `API Key`,the server will ask for your `API Key` (as **password** if using curl). If you reply with your key, the server will respond with the original request **but** due to the length of API keys, this is not ideal practice.

# Getting Quotes

The quoting API does not require you to add your Sendle ID and API Key, but be sure to include all the relevant fields.

<aside class="notice">With curl, add <strong>-H 'Content-Type: application/json'</strong> to transmit in <strong>JSON</strong></aside>

<aside class="warning">
Some 
</aside>

## Quote Requirements

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

## Optional Parameters
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

# Creating Orders

## Getting Labels

## Create Order & Get Label

# Check for Status Updates

## Statuses & States

# Cancelling Orders

# Errors

# Kitten

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Isis",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Isis",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">If you're not using an administrator API key, note that some kittens will return 403 Forbidden if they are hidden for admins only.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

# Credits

This example API documentation page was created with [Slate](http://github.com/tripit/slate). 