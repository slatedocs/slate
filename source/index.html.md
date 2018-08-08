---
title: TransferWise API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>

search: true
---

# Common Topics
TODO - this is TransferWise API, which has xxx parts .  

## Authentication

## Errors
### HTTP Response Codes
> Validation Error

```json
{
    "errors": [
        {
            "code": "error.route.not.supported",
            "message": "This route is not supported",
            "arguments": [
                "CNY-EUR"
            ]
        }
    ]
}
```

> Authentication Error


```json
{
    "error": "unauthorized",
    "error_description": "Full authentication is required to access this resource"
}
```

> System Error

```json
{
  "timestamp": "2017-02-02T13:07:39.644+0000",
  "status": 500,
  "error": "Internal Server Error",
  "exception": "java.lang.NullPointerException",
  "message": "No message available",
  "path": "/v1/quotes/106031/account-requirements"
}
```


HTTP response codes indicate the success or failure of an API request. 
 ```2xx codes``` indicates success.  ```4xx codes``` indicate client side error, for example invalid data was submitted or some field is missing.
 ```5xx codes``` indicate server side error, meaning problem is in TransferWise side.

**Code** | **Description** 
------------ | ------------- 
**200** | OK. Successful request.
**400** | Bad request. Request message data did not pass validation.  
**401** | Unauthorised. Not authorised to access requested data.  
**403** | Forbidden. Access to requested data is forbidden. 
**404** | Not Found. Requested resource does not exist.
**408** | Timeout. Operation timed out. 
**422** | Unprocessable entity. Request message data did not pass validation.
**500** | TransferWise server error.


## Helpful
### Versioning

At present v1 is the current and only version of TransferWise API.

### TEST and LIVE environments
<br/>API TEST – Sandbox is located at https://api.sandbox.transferwise.tech
<br/>API LIVE – Production environment is located at https://api.transferwise.com
<br/>Please test your integration in API Sandbox environment before going LIVE.


### Report a Bug / Send Us Feedback
Once you run into an issue in LIVE environment please don't hesitate to escalate this immediately to [api@transferwise.com](mailto:api@transferwise.com). We will do our best to get back to you as soon as possible.
If the matter is top urgent and it happened during a weekend then please contact our awesome customer support via this [support page](https://transferwise.com/contact).

Once you run into an issue in TEST environment then please take a look at the FAQ section below. 
If this does not solve nor explain the issue you are having then please report this to [api@transferwise.com](mailto:api@transferwise.com).

### FAQ
<br/><b>Which currency routes are supported?</b>
<br/>The list of currency routes supported by TransferWise is constantly growing. Check [Supported Currencies](https://transferwise.com/help/article/1569835/basic-information/supported-currencies) for up-to-date list.
<br/>
<br/><b>Which currency routes are supported for sending money to email recipients?</b>
<br/>Sending money to email recipients is available for almost all currency routes. Currencies which are excluded are listed [here](https://transferwise.com/help/article/1740912/creating-a-transfer/transfers-to-an-email-address-transferwise-users).
<br/>
<br/><b>Can I send any supported currency to any country? </b>
<br/>TransferWise currently supports sending national currencies to target countries. For example you can send JPY to Japan but we don't yet support sending JPY to United States. 
The exceptions for this are major currencies like USD, EUR and GBP -  see more about our [global USD transfers](https://transferwise.com/help/article/2049199/us-dollar-transfers/transfers-from-usd-swift).
<br/>
<br/><b>Can I change my phone number registered for two factor authentication?</b>
<br/>Yes you can. Changing the phone number does not invalidate your API tokens. 
<br/>
<br/><b>Why are transfer statuses in your website different than in API?</b>
<br/>We are exposing more details about transfer lifecycle via our API, so hopefully this will not be a big issue. We have transformed our API transfer statuses to more human readable texts in our website. For example "Completed" in our website corresponds to "outgoing_payment_sent" in API. See TODO !!! #docTextSection:vj2LttYwGieNLFj7a article about all possible statuses in payment lifecycle.
<br/>
<br/><b>Do you provide SDKs for Java, Ruby, Python, PHP, etc?</b>
<br/>Not at the moment. We hope to have that in the future!
<br/>
<br/><b>Did not find what you are looking for?</b>
<br/>There is  more info at [TransferWise Support Centre](https://transferwise.com/help). 
And you can ping us directly at  [api@transferwise.com](mailto:api@transferwise.com).


### Useful Articles

If you have questions on TransferWise product during API itegration, please check TransferWise [Support Center](https://transferwise.com/help/). Below we gathered most common product questions that arrise during inegration, more available at [Support Center](https://transferwise.com/help/)
<br/>[Signing up and making your first transfer](https://transferwise.com/help/article/1779442/basic-information/video-guide-make-a-transfer)
<br/>[How do I use TransferWise for business payments?](https://transferwise.com/help/article/1662889/business/how-do-i-use-transferwise-for-business-payments)
<br/>[Verify your business](https://transferwise.com/help/article/1662919/verification/verify-your-business)
<br/>[Business payment tips](https://transferwise.com/help/article/2348295/business/business-payment-tips)
<br/>[Will my transfer be instant?](https://transferwise.com/help/article/2140394/basic-information/will-my-transfer-be-instant)
<br/>[How safe is TransferWise?](https://transferwise.com/help/article/1570099/security/how-safe-is-transferwise)
<br/>[Currency converter](https://transferwise.com/currency-converter/)
<br/>[TransferWise bank details](https://transferwise.com/help/article/1870699/good-to-know/transferwise-bank-details)
<br/>[SEPA countries and IBANs](https://transferwise.com/help/article/1716080/euro-transfers/sepa-countries-and-ibans)
<br/>[EUR transfers](https://transferwise.com/help/article/1663573/euro-transfers/eur-transfers)
<br/>[GBP transfers](https://transferwise.com/help/article/1663571/british-pound-transfers/gbp-transfers)
<br/>[USD transfers](https://transferwise.com/help/article/1667423/us-dollar-transfers/usd-transfers)



# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).
This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

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

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
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
    "name": "Max",
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

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete


# Other Stuff 

## Changelog

### Released Changes

**Date** | **Description** 
------------ | ------------- 
16/05/2018 | GET /v1/borderless-accounts/{borderlessAccountId}/statement.json <p> New borderless account statement endpoint launched. This includes a lot of extra information useful for reconciliation purposes. 
16/04/2018 | Transfer status simulation endpoints in sandbox added. <p><li>GET /v1/simulation/transfers/{transferId}/processing<li>GET /v1/simulation/transfers/{transferId}/funds_converted<li>GET /v1/simulation/transfers/{transferId}/outgoing_payment_sent<li>GET /v1/simulation/transfers/{transferId}/bounced_back<li>GET /v1/simulation/transfers/{transferId}/funds_refunded
25/10/2017 | POST /v1/accounts has now dateOfBirth field. This field is optional  but sending this will eliminate false positives during compliance checks.
11/10/2017 | GET /v1/transfers/{transferId} has now additional fields: sourceValue, sourceCurrency, targetValue, targetCurrency. 
10/10/2017 | GET /v1/transfers supports additional query parameters: profile, createdDateStart, createdDateEnd and status. 


## Webhooks

Deliverying you notifications about transfer status changes.
We dont have these yet.  Working on it ...


Request feature !!!
Give feedback on the API !





