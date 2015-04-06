# Introduction

> API Endpoint

```html
https://api.kite.ly
```

The Kite API is organized around [REST](http://en.wikipedia.org/wiki/Representational_state_transfer). Our API is designed to have predictable, resource-oriented URLs and to use HTTP response codes to indicate API errors. We use built-in HTTP features, like HTTP authentication and HTTP verbs, which can be understood by off-the-shelf HTTP clients. [JSON](http://www.json.org/) will be returned in all responses from the API, including errors (though if you're using API bindings, we will convert the response to the appropriate language-specific object). 

To make the Kite API as explorable as possible, accounts have test-mode API keys as well as live-mode API keys. These keys can be active at the same time. Data created with test-mode credentials will never result in real products being created and shipped to addresses, will never hit the credit card networks and will never cost anyone money.

{% if is_logged_in %}
**The requests in the sidebar actually work**. We'll perform the requests using your test-mode API key, `{{ test_api_key }}`, which is linked to your account under the email address **{{ user_email }}**.
{% endif %}

# Libraries
Kite is built by developers for developers and we have SDKs spanning a range of languages and platforms. It's recommended that you use our SDKs where available as it will greatly simplify and speed up integration. In most cases you can be up an running sending through product orders within minutes.

Some of our SDKs are also bundled with optional checkout experiences proven to convert well with users.

* [iOS SDK](https://github.com/OceanLabs/iOS-Print-SDK)
* [Android SDK](https://github.com/OceanLabs/Android-Print-SDK)

# Authentication

> Example Request

```shell
curl "https://api.kite.ly/v1.3/address/search/?country_code=USA&search_term=1+Infinite+Loop" \
  -H "Authorization: ApiKey {{ test_api_key }}:"
```

```objective_c
[OLKitePrintSDK setAPIKey:@"{{ test_api_key }}" withEnvironment:kOLKitePrintSDKEnvironmentSandbox];
```

```java
KitePrintSDK.initialize("{{ test_api_key }}", KitePrintSDK.Environment.TEST, /*Context:*/ this);
```

{% if is_logged_in %}

> One of your test API keys has been filled into all the examples on the page, so you can test out any example right away.

{% else %}

> A sample test API key has been provided so you can test out all the examples straight away. You should replace `{{ test_api_key }}` with one of your own found in the [credentials](https://www.kite.ly/accounts/credentials) section of the dashboard.

{% endif %}

You authenticate with the Kite API by providing your API key in the request. You can manage your API keys in the [credentials](https://www.kite.ly/accounts/credentials) section of the dashboard. You can have multiple API keys active at one time. Your API keys carry many privileges, so be sure to keep them secret!

To authenticate you include the HTTP `Authorization` header in your request. All API requests must be made over [HTTPS](http://en.wikipedia.org/wiki/HTTPS). Calls made over plain HTTP will fail. You must authenticate for all requests.

In some scenarios it's also desirable to include your secret key in the `Authorization` header. If you're building a mobile application this is not normally needed, but if you're placing orders from your own server it usually makes sense. See [payment workflows](#payment-workflows) for more details.

# Payment Workflows
Your customers can either pay you directly when they place an order for product or we can take payment on your behalf and automatically transfer your revenue into an account of your choosing. 

## Kite takes payment
In this scenario we take payment from customers on your behalf. This will occur entirely within your app or website in a way that's totally branded to you, your customers don't even need to know we were involved. We then automatically transfer funds we owe you directly into a bank or a PayPal account of your choosing. You can setup the accounts into which you want us to pay you in the [billing](https://www.kite.ly/accounts/billing/) section of the dashboard.

This is arguably the easiest approach to using the Kite platform as it means you don't need to run your own server and it's baked into several of our SDKs. 

## You take payment

> Example Request

```shell
curl "https://api.kite.ly/v1.3/address/search/?country_code=USA&search_term=1+Infinite+Loop" \
  -H "Authorization: ApiKey {{ test_api_key }}:<your_secret_key>"
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

The presence of your secret key in charge incurring requests (i.e. product order requests) removes the need for the `proof_of_payment` argument to be provided as the card associated with your account can be charged directly.

<aside class="warning">You should never embed your secret key in a client application, rather requests including your secret key should only be made from your own server.</aside>

# Errors

> Example Error Response

```json
{
  "error": {
  	"code": "01",
    "message": "JSON schema error: 'jobs' is a required property"
  }
}
```

Kite uses conventional HTTP response codes to indicate success or failure of an API request. In general, codes in the 2xx range indicate success, codes in the 4xx range indicate an error that resulted from the provided information (e.g. a required parameter was missing, etc.), and codes in the 5xx range indicate an error with Kite's servers.

Where possible an error response will include an `error` object that provides further details in the form of a `code` and `message`.

### Error code summary
          | |
--------- | -----------
00 | Failed to parse JSON from the body of the request. Please ensure you're sending data through as valid JSON and please check it can be decoded as UTF-8
01 | The request data does not match the required JSON schema
04 | Product does not exist
05 | You must provide assets to fulfil an order
06 | 'assets' should be an array for the product provided
07 | 'assets' should be an object for the product provided
08 | 'assets' must be an array or object
09 | Shipping address is required for this product
12 | Cannot set email in both 'user_data' and 'customer_email'
13 | Customer email address is invalid
16 | Promo code provided does not exist
20 | Payment confirmation already used on a successful order
21 | Payment confirmation already used on a failed order
22 | Unknown payment method provided
23 | Error looking up payment
24 | No proof of payment and no secret key provided
27 | Confirmed payment does not cover order cost
30 | Unexpected fulfilment error
31 | Asset provided does not exist
32 | One or more photos provided were corrupt or unavailable

# Pagination

> Example Request

```shell
curl "https://api.kite.ly/v1.3/order/?offset=30&limit=5" \
  -H "Authorization: ApiKey {{ test_api_key }}:{{ test_secret_key }}"
```

> Example Paginated Response

```shell 
{
  "meta": {
    "limit": 5,
	"next": null,
	"offset": 30,
	"previous": null,
	"total_count": 33
  },
  "objects": [
    {...},
	{...},
	{...}
  ]
}
```


Several Kite API endpoints return paginated responses, for example the list orders endpoint. All paginated responses share the same common structure.

### Arguments

          | |
--------- | -----------
limit<span class="optional-argument">optional</span> | By default, you get returned a paginated set of objects (20 per page is the default), by specifying the `limit` argument you can control the number of objects returned
offset<span class="optional-argument">optional</span> | The offset into the result set of objects returned


# Assets
Assets are files, typically images (jpegs, pngs), PDFs & fonts that you use in your product & print order requests. There are two classes of assets: *remote* and *managed*.

**Remote assets** are those that you already host yourself. You can start submitting orders straight away with these as long as they have URLs that are accessible to the Kite servers.

**Managed assets** are those which we host on Amazon S3 on your behalf. Managed assets allow you to use our infrastructure to host your user's assets (and your own) without the need to pay for your own hosting.

## The asset object

> Example JSON

```json
{
  "asset_id": 1638,
  "client_asset": false,
  "description": "A very grumpy cat",
  "filename": "1.jpg",
  "mime_type": "image/jpeg",
  "stock_asset": false,
  "time_registered": "2014-03-14T14:37:51",
  "url": "http://psps.s3.amazonaws.com/sdk_static/1.jpg"
}
```

### Attributes
          | |
--------- | -----------
asset_id<span class="attribute-type">integer</span> | The unique identifier of the asset
client_asset<span class="attribute-type">boolean</span> | Client assets are dynamic assets typically uploaded by your users & customers. They are periodically purged (a short while after the customer has received their order) and are not displayed in your dashboard
description<span class="attribute-type">string</span> | An optional description of the asset
filename<span class="attribute-type">string</span> | The asset's filename
mime_type<span class="attribute-type">string</span> | The files mimetype, such as 'image/jpeg'. Optional and unused for remote assets
stock_asset<span class="attribute-type">string</span> | Indicates whether this is one of the default Kite assets provided on signup
time_registered<span class="attribute-type">string</span> | The time the asset registration request was received
url<span class="attribute-type">string</span> | The URL from which the asset can be fetched for display

## Uploading an asset

> Managed Asset Registration Request

```shell
curl "https://api.kite.ly/v1.3/asset/sign/?mime_types=image/jpeg&client_asset=true" \
  -H "Authorization: ApiKey {{ test_api_key }}:"
```

> Example Response

```shell
{
  "signed_requests": [
    "https://s3-eu-west-1.amazonaws.com/...&Signature=0ls3p7BD3RGcAvsB0UNS3D"
  ],
  "asset_ids": [
    560227
  ],
  "urls": [
    "https://s3-eu-west-1.amazonaws.com/.../560227.jpeg"
  ]
}
```

> S3 Asset Upload Request

```shell
curl --upload-file "<path/to/local/image.jpg>" \
    -H "Content-Type:image/jpeg" \
    -H "x-amz-acl:private" \
    "<signed_request_url>"
```

> Replace `<path/to/local/image.jpg>` with the path to a local image to be uploaded and `<signed_request_url>` with a url found in the `signed_requests` property in the response from the previous Managed Asset Registration Request


Registering and uploading a managed asset is a two step process. First you make a request to the Kite servers to get a signed Amazon S3 URL to which you can upload the asset. Second you upload the file representing the asset to Amazon S3 using that signed URL.

### HTTP Request

`GET https://api.kite.ly/v1.3/asset/sign/`

### Arguments

          | |
--------- | -----------
mime_types<span class="required-argument">required</span> | A comma separated list of one or more [mime types](http://en.wikipedia.org/wiki/Internet_media_type) for the assets that you want to upload. The number of mime types you specify indicates the number of assets you are expected to upload to S3. Current supported mime types are: `image/jpeg`, `image/png`, `application/pdf`
client_asset<span class="optional-argument">optional</span> | A boolean indicating if this is a client/customer/user asset. This should always be `true` if the assets with specified mime types are being uploaded from a client application. Client assets are are periodically purged (a short while after a customer has received their order) and are not displayed in your dashboard

### Returns
Returns an object with `signed_requests`, `asset_ids` & `urls` list properties. Each list has a length equal to the number of `mime_type`'s specified in the request.  The equivalent index in each list corresponds directly to the asset referred to by the mime type at the same index in the request's `mime_type` query parameter.

### Response Properties
          | |
--------- | -----------
signed_requests<span class="attribute-type">list</span> | A list of signed Amazon S3 URLs that can be used to upload the assets
asset_ids<span class="attribute-type">list</span> | A list of [asset object](#the-asset-object) id's that can be used in product & print order requests
urls<span class="attribute-type">list</span> | A list of Amazon S3 URLs where the uploaded assets will reside. These are not publically accessible but can be used in various requests

# Products

With a single API request to Kite you can have personalised products created, packaged and shipped anywhere in the world. Our product range is second to none, and we're adding new ones all the time.

Packaging will carry your branding, not ours -- your customers never need to know we were involved!

We have a global product fulfilment and distribution network to get orders into your customers hands faster.

## Available products

### products & template_ids

          | |
--------- | -----------
Magnets<span class="attribute-type">magnets</span> | Our magnets are printed on a unique MagneCote substrate, providing photo quality imagery with a thin magnetic backing
Square Prints<span class="attribute-type">squares</span> | Amazing quality square prints printed on 350 GSM card completed with a matte finish
Mini Square Prints<span class="attribute-type">squares_mini</span> | Like our Square Prints, just smaller! Amazing quality printed on 350 GSM card completed with a matte finish
Retro Prints<span class="attribute-type">polaroids</span> | Polaroid style prints printed on 350 GSM card completed with a matte finish
Mini Retro Prints<span class="attribute-type">polaroids_mini</span> | Like our Retro Prints, just smaller! Mini Polaroid style prints printed on 350 GSM card completed with a matte finish
Classic Photo Prints<span class="attribute-type">photos_4x6</span> | Our classic photo 6x4 prints printed on 350 GSM card completed with a matte finish
Square Stickers<span class="attribute-type">stickers_square</span> | Fun personalised square stickers. Just peel them off and stick them on
Circle Stickers<span class="attribute-type">stickers_circle</span> | Fun personalised circle stickers. Just peel them off and stick them on
Greetings Cards<span class="attribute-type">greeting_cards</span> | Our greetings cards are printed on thick premium card stock and once folded, form a 14.8 cm square
Frames<span class="attribute-type">frames_50cm frames_50cm_2x2 frames_50cm_3x3 frames_50cm_4x4</span> | The perfect way to show off your most loved photos. They come in various configurations allowing between one and sixteen images to printed and enclosed within a wooden frame
A1 Poster<span class="attribute-type">a1_poster<br />a1_poster_35<br />a1_poster_54<br />a1_poster_70</span> | Our large format poster prints are printed on 190 GSM sheets with a satin finish. Various templates are available from single images to photo collages. They are delivered worldwide in sturdy cardboard tubes
A2 Poster<span class="attribute-type">a2_poster<br />a2_poster_24<br />a2_poster_35<br />a2_poster_54</span> | Our large format poster prints are printed on 190 GSM sheets with a satin finish. Various templates are available from single images to photo collages. They are delivered worldwide in sturdy cardboard tubes
A3 Poster<span class="attribute-type">a3_poster</span> | Our large format poster prints are printed on 190 GSM sheets with a satin finish. They are delivered worldwide in sturdy cardboard tubes
Postcards<span class="attribute-type">postcard</span> | Our postcards are printed on high quality card stock with a gloss finish and dispatched worldwide. Fully customise our templates or create your own to make them unique to you
iPhone 6 Case<span class="attribute-type">i6_case</span> | iPhone 6 snap case constructed to the highest quality design, material & coating
iPhone 6 Tough Case<span class="attribute-type">i6_tough_case</span> | iPhone 6 tough case constructed to the highest quality design, material & coating.  Durable two layered case that offer the best solution for protecting your phone
iPhone 5/5S Case<span class="attribute-type">i5_case</span> | iPhone 5 snap case constructed to the highest quality design, material & coating
iPhone 5/5S Tough Case<span class="attribute-type">i5_tough_case</span> | iPhone 5 tough case constructed to the highest quality design, material & coating.  Durable two layered case that offer the best solution for protecting your phone
iPhone 5C Case<span class="attribute-type">i5c_case</span> | iPhone 5c snap case constructed to the highest quality design, material & coating
iPhone 5C Tough Case<span class="attribute-type">i5c_tough_case</span> | iPhone 5c tough case constructed to the highest quality design, material & coating.  Durable two layered case that offer the best solution for protecting your phone
iPhone 4/4S Case<span class="attribute-type">i4_case</span> | iPhone 4 snap case constructed to the highest quality design, material & coating
iPhone 4/4S Tough Case<span class="attribute-type">i4_tough_case</span> | iPhone 4 tough case constructed to the highest quality design, material & coating.  Durable two layered case that offer the best solution for protecting your phone


## The job object

> Example JSON

```json
{
  "template_id": "magnets",
  "assets": [
    "http://psps.s3.amazonaws.com/sdk_static/1.jpg", 
    "http://psps.s3.amazonaws.com/sdk_static/2.jpg",
    "http://psps.s3.amazonaws.com/sdk_static/3.jpg",
    "http://psps.s3.amazonaws.com/sdk_static/4.jpg"
  ]
}
```

A job encapsulates the details to create a single personalised product. For example the job represented by the JSON to the right would result in a set of [magnets](#available-products) being created where each magnet has one of four images printed on the front.

### Attributes

          | |
--------- | -----------
template_id<span class="attribute-type">string</span> | The identifier for the product you want created. A full list of template identifiers for products is found [above](#available-products)
assets<span class="attribute-type">list</span> | A list of image URLs accessible to the Kite servers or a list of [asset object](#the-asset-object) identifiers that you have received by [uploading an asset](#uploading-an-asset) to Kite. These assets will be used in the creation of the personalised product indicated by `template_id`

## The order object

> Example JSON

```json
{
  "proof_of_payment": "PAY-4M676136DK539691RKURJ7QY",
  "shipping_address": {
    "recipient_name": "Deon Botha",
    "address_line_1": "Eastcastle House",
	"address_line_2": "27-28 Eastcastle Street",
	"city": "London",
	"county_state": "Greater London",
	"postcode": "W1W 8DH",
	"country_code": "GBR"
  },
  "customer_email": "deon@kite.ly",
  "customer_phone": "+44 (0)784297 1234",
  "user_data": {
  	"foo": "bar",
  	"pi": 3.14
  },
  "jobs": [{
    "assets": ["http://psps.s3.amazonaws.com/sdk_static/1.jpg"],
	"template_id": "i6_case"
  }, {
    "assets": ["http://psps.s3.amazonaws.com/sdk_static/2.jpg"],
	"template_id": "a1_poster"
  }]
}
```
An order encapsulates all the details required to create & deliver one or more personalised products (described by [job objects](#the-job-object)) to an address. For example the order represented by the JSON on the right would result in an *iPhone 6 Case* and an *A1 Poster* being created and shipped to the specified address.

### Attributes

          | |
--------- | -----------
proof_of_payment<span class="attribute-type">string</span> | The proof of payment is a either a PayPal REST payment id for a payment/transaction made to the Kite PayPal account or a Stripe token created using Kite's Stripe publishable key. This field will be absent if you opted for [taking payment yourself](#you-take-payment)
shipping_address<span class="attribute-type">[address object](#the-address-object)</span> | The address to which the order will be delivered
customer_email<span class="attribute-type">string</span> | The customer's email address. Automated order status update emails (you can brand these) can optionally be sent to this address i.e. order confirmation email, order dispatched email, etc. You can configure these in the Kite dashboard
customer_phone<span class="attribute-type">string</span> | The customer's phone number. Certain postage companies require this to be provided e.g. FedEx
user_data<span class="attribute-type">dictionary</span> | A dictionary containing any application or user specific meta data that you attached to the order. This is all you...
jobs<span class="attribute-type">list</span> | A list of one or more [job objects](#the-job-object) to be created and delivered to `shipping_address`

## Ordering a product

> Example Order Request

```shell
curl "https://api.kite.ly/v1.3/print/" \
  -H "Authorization: ApiKey {{ test_api_key }}:{{ test_secret_key }}" \
  --data '{
    "shipping_address": {
      "recipient_name": "Deon Botha",
      "address_line_1": "Eastcastle House",
	  "address_line_2": "27-28 Eastcastle Street",
	  "city": "London",
	  "county_state": "Greater London",
	  "postcode": "W1W 8DH",
	  "country_code": "GBR"
    },
    "customer_email": "deon@kite.ly",
    "customer_phone": "+44 (0)784297 1234",
    "jobs": [{
      "assets": ["http://psps.s3.amazonaws.com/sdk_static/1.jpg"],
	  "template_id": "i6_case"
    }, {
      "assets": ["http://psps.s3.amazonaws.com/sdk_static/2.jpg"],
	  "template_id": "a1_poster"
    }]
  }'
```

> Example Response

```json
{
  "print_order_id": "PS96-996634811"
}
```

With a single API request to Kite you can have personalised products created, packaged and shipped anywhere in the world. Packaging will carry your branding, not ours – your customers never need to know we were involved! 

For example the request on the right would result in an iPhone 6 Case and an A1 Poster being created and shipped to the specified address.

### HTTP Request

`POST https://api.kite.ly/v1.3/print/`

### Arguments

          | |
--------- | -----------
proof_of_payment<span class="optional-argument">optional, either **proof_of_payment** or a secret key in [Authorization header](#authentication) is required</span> | The proof of payment is a either a PayPal REST payment id for a payment/transaction made to the Kite PayPal account or a Stripe token created using Kite’s Stripe publishable key. This field is optional if you opted for [taking payment yourself](#you-take-payment)
shipping_address<span class="required-argument">required</span> | An [address object](#the-address-object) indicating the address to which the order will be delivered
customer_email<span class="optional-argument">optional</span> | The customer's email address. Automated order status update emails (you can brand these) can optionally be sent to this address i.e. order confirmation email, order dispatched email, etc. You can configure these in the Kite dashboard
customer_phone<span class="required-argument">required</span> | The customer's phone number. Certain postage companies require this to be provided e.g. FedEx
user_data<span class="optional-argument">optional</span> | A dictionary containing any application or user specific meta data that you might want associated with the order
jobs<span class="required-argument">required</span> | A list of one or more [job objects](#the-job-object) to be created and delivered to `shipping_address`

### Returns

Returns the an dictionary containing the order id

# Addresses
Our address lookup services allows you to perform international address searches. You'll benefit from the most up to date and complete address information available as our databases are typically updated daily.

## The address object

A place where a person or business resides.

> Example JSON

```json
{
  "recipient_name": "Deon Botha",
  "address_line_1": "Eastcastle House",
  "address_line_2": "27-28 Eastcastle Street",
  "address_line_3": "",
  "address_line_4": "",
  "city": "London",
  "county_state": "",
  "postcode": "W1W 8DH",
  "country_code": "GBR"
}
```

### Attributes

          | |
--------- | -----------
recipient_name<span class="attribute-type">string</span> | The name of the person intended to receive the order
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

> Example Address Search Request

```shell
curl "https://api.kite.ly/v1.3/address/search/?country_code=GBR&search_term=10+Downing+Street,London" \
  -H "Authorization: ApiKey {{ test_api_key }}:"
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

> Example Address Search Request

```shell
curl "https://api.kite.ly/v1.3/address/search/?country_code=GBR&address_id=GBR|PR|23747771|0|0|0||Retrieve" \
  -H "Authorization: ApiKey {{ test_api_key }}:"
```

> Example Unique Response

```json
{
  "unique": {
    "address_line_1": "Prime Minister & First Lord of the Treasury",
    "address_line_2": "10 Downing Street",
    "address_line_3": "",
    "address_line_4": "",
    "city": "London",
    "county_state": "",
    "postcode": "SW1A 2AA",
    "country_code": "GBR"
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
Returns either a dictionary with a `unique` property that is a [full address object](#the-address-object), or (if the search is ambiguous) a dictionary with a `choices` property that is a list of [partial address objects](#the-partial-address-object). 

In the case of a list response, additional calls to the address search endpoint are required to find a unique match. You can use the `address_id`'s from previous responses to narrow down the search until you eventually find a unique address.

<aside class="notice">Be sure to handle both unique and list responses from the address search endpoint.</aside>
