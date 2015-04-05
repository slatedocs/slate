---
title: Kite API Reference

language_tabs:
  - {shell: "Curl"}
  - {objective_c: "Objective-C"}
  - {java: "Java"}

toc_footers:
  - <a href='#'>iOS SDK</a>
  - <a href='#'>Android SDK</a>

<!--includes:
  - errors-->

search: false
---

# Introduction

> API Endpoint

```html
https://api.kite.ly
```

The Kite API is organized around [REST](http://en.wikipedia.org/wiki/Representational_state_transfer). Our API is designed to have predictable, resource-oriented URLs and to use HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which can be understood by off-the-shelf HTTP clients. [JSON](http://www.json.org/) will be returned in all responses from the API, including errors (though if you're using API bindings, we will convert the response to the appropriate language-specific object). 

To make the Kite API as explorable as possible, accounts have test-mode API keys as well as live-mode API keys. These keys can be active at the same time. Data created with test-mode credentials will never result in real products being fulfilled and delivered to addresses, will never hit the credit card networks and will never cost anyone money.

**The requests in the sidebar actually work**. We'll perform the requests using your test-mode API key, `sk_test_BQJunyJ0GIxfFi7eVUkxXBOn`, which is linked to your account under the email address **deon@dbotha.com**.

# Libraries
Kite is built by developers for developers and we have SDKs spanning a range of languages and platforms. It's recommended that you use our SDKs where available as it will greatly simplify and speed up integration. In most cases you can be up an running sending through product orders within minutes.

Some of our SDKs are also bundled with optional checkout experiences proven to convert well with users.

* [iOS SDK](https://github.com/OceanLabs/iOS-Print-SDK)
* [Android SDK](https://github.com/OceanLabs/Android-Print-SDK)

# Authentication

> Example Request

```shell
curl "https://api.kite.ly/v1.1/address/search/?country_code=USA&search_term=1+Infinite+Loop" \
  -H "Authorization: ApiKey 1216c74e5e03e585b40dfbb1941fe8c3a409a879:"
```

```objective_c
[OLKitePrintSDK setAPIKey:@"1216c74e5e03e585b40dfbb1941fe8c3a409a879" withEnvironment:kOLKitePrintSDKEnvironmentSandbox];
```

```java
KitePrintSDK.initialize("1216c74e5e03e585b40dfbb1941fe8c3a409a879", KitePrintSDK.Environment.TEST, /*Context:*/ this);
```

> One of your test API keys has been filled into all the examples on the page, so you can test out any example right away.

You authenticate with the Kite API by providing your API key in the request. You can manage your API keys in the [credentials](https://www.kite.ly/accounts/credentials) section of the dashboard. You can have multiple API keys active at one time. Your API keys carry many privileges, so be sure to keep them secret!

To authenticate you include the HTTP `Authorization` header in your request. All API requests must be made over [HTTPS](http://en.wikipedia.org/wiki/HTTPS). Calls made over plain HTTP will fail. You must authenticate for all requests.

# Payment Workflows
Your customers can either pay you directly when they place an order for product or we can take payment on your behalf and automatically transfer your revenue into an account of your choosing. 

## Kite takes payment
In this scenario we take payment from customers on your behalf. This will occur entirely within your app or website in a way that's totally branded to you. We then automatically transfer funds we owe you directly into a bank or a PayPal account of your choosing. You can setup the accounts into which you want us to pay you in the [billing](https://www.kite.ly/accounts/billing/) section of the dashboard.

This is arguably the easiest approach to using the Kite platform as it means you don't need to run your own server and it's baked into several of our SDKs. 

## You take payment

> Example Request

```shell
curl "https://api.kite.ly/v1.1/address/search/?country_code=USA&search_term=1+Infinite+Loop" \
  -H "Authorization: ApiKey 1216c74e5e03e585b40dfbb1941fe8c3a409a879:<your_secret_key>"
```

```java
The Android SDK does not support this workflow as it would require you to embed your secret key in the client application
```

```objective_c
The iOS SDK does not support this workflow as it would require you to embed your secret key in the client application
```

> Replace `<your_secret_key>` with the one found in the [credentials](https://www.kite.ly/accounts/credentials) section of the dashboard.

In this scenario you take payment directly from your customer in any manner of your choosing. You'll need your own server infrastructure in order to take care of the payment processing, payment validation and to submit product order requests to the Kite platform. 

You'll need to add a card to be charged for any orders you place with Kite. This can be done in the [billing](https://www.kite.ly/accounts/billing/) section of the dashboard.

Any request you make to Kite that would result in you incurring a charge (i.e. product order requests) will need to include both your API key and your secret key in the HTTP `Authorization` header. Your secret key can be found alongside your API key in the [credentials](https://www.kite.ly/accounts/credentials) section of the dashboard.

<aside class="warning">You should never embed your secret key in a client application, rather requests including your secret key should only be made from your own server.</aside>

# Errors
Kite uses conventional HTTP response codes to indicate success or failure of an API request. In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that resulted from the provided information (e.g. a required parameter was missing, a charge failed, etc.), and codes in the 5xx range indicate an error with Kite's servers.

# Pagination

# Assets
Assets are files that you use in your product & print order requests. They're typically images (jpegs, pngs), PDFs & fonts.

# Addresses
Our address lookup services allows you to perform international address searches. You'll benefit from the most up to date and complete address information available as our databases are typically updated daily.

## The address object

A place where a person or business resides.

> Example JSON

```json
{
  "address_line_1": "Eastcastle House",
  "address_line_2": "27-28 Eastcastle Street",
  "address_line_3": "",
  "address_line_4": "",
  "city": "London",
  "postcode": "W1W 8DH",
  "county_state": "",
  "country_code": "GBR"
}
```

### Attributes

          | |
--------- | -----------
address_line_1<span class="attribute-type">string</span> | The first line of the address
address_line_2<span class="attribute-type">string</span> | The second line of the address
address_line_3<span class="attribute-type">string</span> | The third line of the address
address_line_4<span class="attribute-type">string</span> | The fourth line of the address
city<span class="attribute-type">string</span> | The city of the address
postcode<span class="attribute-type">string</span> | The ZIP/Postal code of the address
county_state<span class="attribute-type">string</span> | The state/county/province of the address
country_code<span class="attribute-type">string</span> | The [three letter country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) of the address


## The partial address object

> Example JSON

```json
{
  "address_id": "GBR|PR|25762481|0|0|0||Retrieve",
  "display_address": "Eastcastle House 27-28, Eastcastle Street, London, W1W... "
}
```

Partial address objects are typically returned when an ambiguous address search results in an list of potential matches. Typically the choice of partial addresses is presented to the user so they can refine the search. The `address_id` attribute of the chosen partial address can then be used to narrow the search down until a full address object is returned.


### Attributes

          | |
--------- | -----------
address_id<span class="attribute-type">string</span> | An identifier that can be used to perform further lookups until a full address object is found
display_address<span class="attribute-type">string</span> | A partial textual representation of the address

## Searching for an address

> Example Request

```shell
curl "https://api.kite.ly/v1.3/address/search/?country_code=GBR&search_term=10+Downing+Street,London" \
  -H "Authorization: ApiKey 1216c74e5e03e585b40dfbb1941fe8c3a409a879:"
```

> Example List Response

```json
{
  "choices": [
    {
      "address_id": "GBR|PR|23747771|0|0|0||Retrieve",
      "display_address": "Prime Minister & First Lord of the Treasury, 10 Downing Street, London, SW1A..."
    },
    {
      "address_id": "GBR|PR|26245117|0|0|0||Retrieve",
      "display_address": "Flat 10, Downing Court, Grenville Street, London, WC1N..."
    },
    {
      "address_id": "GBR|PR|25755770|0|0|0||Retrieve",
      "display_address": "Ove Arup & Partners, Downing House, 10 Maple Street, London, W1T..."
    }
  ]
}
```

> Example Request

```shell
curl "https://api.kite.ly/v1.3/address/search/?country_code=GBR&address_id=GBR|PR|23747771|0|0|0||Retrieve" \
  -H "Authorization: ApiKey 1216c74e5e03e585b40dfbb1941fe8c3a409a879:"
```

> Example Unique Response

```json
{
  "unique": {
    "postcode": "SW1A 2AA",
    "city": "London",
    "address_line_4": "",
    "address_line_3": "",
    "address_line_2": "10 Downing Street",
    "address_line_1": "Prime Minister & First Lord of the Treasury",
    "country_code": "GBR",
    "county_state": ""
  }
}
```


You can perform a search on any part of the address not just the ZIP/Postal code and our smart sorting of results will order by nearest locations first. We also recognise common misspellings.

### HTTP Request

`GET https://api.kite.ly/v1.3/address/search/`

### Arguments

          | |
--------- | -----------
country_code<span class="required-argument">required</span> | [Three letter country code](http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) to which the address search will be restricted
search_term<span class="maybe-argument">optional, either **search_term** or **address_id** is required</span> | A free text value, often encompassing the first line of address or ZIP/Postal code, on which the search is performed
address_id<span class="maybe-argument">optional, either **search_term** or **address_id** is required</span> | A parameter referencing a previously returned address search results list item that can be used to lookup a unique address 

### Returns
Returns either a dictionary with a `unique` property that is a full address object, or (if the search is ambiguous) a dictionary with a `choices` property that is a list of partial address objects. 

In the case of a list response, additional calls to the address search endpoint are required to find a unique match. You can use the `address_id`'s from previous responses to narrow down the search until you eventually find a unique address.

<aside class="notice">Be sure to handle both unique and list responses from the address search endpoint.</aside>
