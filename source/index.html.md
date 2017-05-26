---
title: API Reference

language_tabs:
  - shell
  - php

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the DNA API! You can use our API to access DNA API endpoints, which can get information on various elements customers, devices, and billing in our database.

We have language bindings in Shell and PHP we also have <a href='https://www.getpostman.com/collections/af70b4327c9f4ded36f5'>Postman</a> for you to test the methods without writing code! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


This example API documentation page was created with [Slate](https://github.com/tripit/slate). 

# Authentication

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "http://staging.api.nexogy.com/api/oauth/token?grant_type=password&client_id=<value>&client_secret=<value>&username=<value>&password=<value>&scope=<value>"
  -H "Accept: application/json"
```

```php

```

> Make sure to replace the required `<value>` with the information provided.

> The above command returns a JSON structured like this:

```json
[
  {  
     "token_type":"Bearer",
     "expires_in":1200,
     "access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2",
     "refresh_token":"kvwLi6kTeq7DGbfsKLVvz/6zaCioe8Vk50x1QdlHJDFp4thYzPj5v"
  }
]
```

<aside class="warning">It is very important that in order for this documentation to work, you must have requested access to the API and recieved the following information: </aside>

Key | Value | Description
--------- | ------- | -----------
grant_type | password | This value is constant.
client_id | ????? | Once you've been approved to use our API you'll receive this value.
client_secret | ?????| Once you've been approved to use our API you'll receive this value.
username | ????? | Once you've been approved to use our API you'll receive this value.
password | ????? | Once you've been approved to use our API you'll receive this value.
scope | ????? | Once you've been approved to use our API you'll receive this value.

Once you have the values described above you can make the API calls using your <code>access_token</code> and the <code>token_type</code> .
To help with your development use Postman and add the following [Collection](http://example.com/developers).

DNA API expects for the <code>token_type</code> and <code>access_token</code> to be included in all API requests to the server in a header that looks like the following:

`Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2`

<aside class="notice">
You must replace <code>`values`</code> with your provided values. and add the <code>token_type</code> and <code>access_token</code> as values for the <code>Authorization</code>headers for all your API calls.
Additionally use the <code>Accept:application/json</code> Headers for every API call.
</aside>

# Client

## Create a Client

> To Create a new client, use this code:

```shell
curl "http://staging.api.nexogy.com/api/residential/client?start_billing_date=<value>&
customer_id=<value>&has_subreseller_id=<value>&subreseller_id=<value>&email=<value>&first_name=<values>&last_name=<value>&zipcode=<value>&same_billing_address=<value>&billing_address=<value>&billing_zipcode=<value>"
  -H "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2"
  -H "Accept:application/json"
```

```php
// Set api url
$apiUrl = 'https://staging.api.nexogy.com/api/residential/client';
// Start cURL
$c = curl_init();
curl_setopt($c, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt($c, CURLOPT_RETURNTRANSFER, true);

// Populate array with parameters
$data['email'] = 'example@mail.com';
$data['first_name'] = 'John';
$data['last_name'] = 'Doe';
$data['zipcode'] = '12345';
$data['address'] = 'Client address';
$data['sameBillingAddress'] = 1;
$data['has_subreseller_id'] = 1;
$data['subreseller_id'] = '123';

// Set up headers
$request_headers = array();
$request_headers[] = 'Authorization: Bearer '. $access_token;
$request_headers[] = 'Accept: application/json';
curl_setopt($c, CURLOPT_HTTPHEADER, $request_headers);

// Setup the remainder of the cURL request
curl_setopt($c, CURLOPT_URL, $apiUrl);
curl_setopt($c, CURLOPT_POST, true);
curl_setopt($c, CURLOPT_POSTFIELDS, http_build_query($data));

// Execute the API call and return the response
$result = curl_exec($c);
curl_close($c);

```

> The above command returns JSON structured like this:

```json
[
  {
    "result":"OK",
    "client":
      {
        "id":6519,
        "ns_domain":"ironmaiden.com",
      }
  }
]
```

This endpoint creates a Client on DNA. You will get back a <code>id</code> and a <code>ns_domain</code> these will be required for other operations. 

### HTTP Request

`POST https://staging.api.nexogy.com/api/residential/client?start_billing_date=<value>&
customer_id=<value>&has_subreseller_id=<value>&subreseller_id=<value>&email=<value>&first_name=<values>&last_name=<value>&zipcode=<value>&same_billing_address=<value>&billing_address=<value>&billing_zipcode=<value>`

### Query Parameters

<aside class="warning">This request has no default parameters or values. Ignoring this will result in an error.</aside>

Parameter | Example | Description
--------- | ------- | -----------
start_billing_date | 2017-05-18 | Date in  YYYY-MM-DD Format for Billing purposes
customer_id | 1234 | Customer id you use on your side.
has_subreseller_id | true | This is an id used to group your cleint's IDs under a subreseller account if you have resellers that handle your clients this is how we would identify them for consolidation purposes.
subreseller_id | 1234 | Send this parameter only if you use a subreseller structure.
email | email@email.com | Email used for any information required for the client, for example to send received V-mail.
first_name | Steve | First name for the client.
last_name | Harris | Last name for the client.
zipcode | 33134 | The client's zipcode.
address | 126 Mendoza avenue aparment 7A | The client's address.
same_billing_address | true | Accepts true or false and determines if the address parameter will be used for billing, when false <code>billing_address</code> and <code>billing_zipcode</code> are required.
billing_address | 2121 ponce de leon | The billing address.
billing_zipcode | 33308 | The billing zipcode.

<aside class="success">
Remember — store your <code>&lt;id&gt;</code> and <code>&lt;ns_domain&gt;</code> for future operations!
</aside>

## Activate a Client

```shell
curl "https://staging.api.nexogy.com/api/residential/client/<id>/activate"
  -H "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2"
  -H "Accept:application/json"
```

```php
// Set api url
$apiUrl = 'https://staging.api.nexogy.com/api/residential/client/id/activate';
// Start cURL
$c = curl_init();
curl_setopt($c, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt($c, CURLOPT_RETURNTRANSFER, true);

// Set up headers
$request_headers = array();
$request_headers[] = 'Authorization: Bearer '. $access_token;
$request_headers[] = 'Accept: application/json';
curl_setopt($c, CURLOPT_HTTPHEADER, $request_headers);

// Setup the remainder of the cURL request
curl_setopt($c, CURLOPT_URL, $apiUrl);
curl_setopt($c, CURLOPT_POST, true);

// Execute the API call and return the response
$result = curl_exec($c);
curl_close($c);
```

> The above command returns JSON structured like this:

```json
{
 "result": "OK",
 "timestamp": 1494597810
}
```

This endpoint activates a specific client.

<aside class="warning">You will need the <code>&lt;id&gt;</code> for this operation</aside>

### HTTP Request

`POST http://staging.api.nexogy.com/api/residential/client/<id>/activate`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the client to activate,the one we sent you when the client was created

## Suspend a Client

```shell
curl "https://staging.api.nexogy.com/api/residential/client/<id>/suspend"
  -H "Authorization:Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjY1N2"
  -H "Accept:application/json"
```

```php
// Set api url
$apiUrl = 'https://staging.api.nexogy.com/api/residential/client/id/suspend';
// Start cURL
$c = curl_init();
curl_setopt($c, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt($c, CURLOPT_RETURNTRANSFER, true);

// Set up headers
$request_headers = array();
$request_headers[] = 'Authorization: Bearer '. $access_token;
$request_headers[] = 'Accept: application/json';
curl_setopt($c, CURLOPT_HTTPHEADER, $request_headers);

// Setup the remainder of the cURL request
curl_setopt($c, CURLOPT_URL, $apiUrl);
curl_setopt($c, CURLOPT_POST, true);

// Execute the API call and return the response
$result = curl_exec($c);
curl_close($c);
```

> The above command returns JSON structured like this:

```json
{
 "result": "OK",
 "timestamp": 1494597810
}
```

This endpoint suspends a Client.

<aside class="warning">You will need the <code>&lt;id&gt;</code> for this operation</aside>

### HTTP Request

`POST http://staging.api.nexogy.com/api/residential/client/<id>/suspend`

### URL Parameters

Parameter | Description
--------- | -----------
id | The ID of the client to suspend, the one we sent you when the client was created