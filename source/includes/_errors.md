# Errors

<aside class="success">This guide is in no way complete. If you happen upon errors that are not listed here, please let us know so we can help make the guide and the Sendle API better!</aside>

## Error Codes

The Sendle API uses the following error codes:

Error Code | Meaning
---------- | -------
200 | OK -- A successful response (for reference - not an error)
400 | Bad Request -- The data provided by the client (typically in the body) is invalid or incorrectly structured.
401 | Unauthorized -- The authorisation details are invalid. Either the Sendle ID, the API key (or both) are incorrect and should be fixed.
402 | Payment Required -- The client does not yet have a payment-method set up on their account, and cannot create orders.
404 | Not Found -- The requested resource/URI was not found.
422 | Unprocessable Entity -- The server was unable to complete the request due to the data itself. For example, validations within the data may fail, or an upstream request may not be able to be fulfilled with the data. This is different to `400 Bad Request` as `422 Unprocessable Entity` suggests that the request sent by the client was structurally valid, and the request was attempted.
500 | Internal Server Error -- An error occurred within the system itself. This may be a coding error that caused the system to fail. The development team will have been notified of this failure.
503 | Service Unavailable -- An error occurred within the system due to an upstream error or failure. For example, a courier API may be unavailable or failing to respond.  The development team will have been notified of this failure.

## 400 Bad request

```shell
  curl -i https://sendle.com/api/orders
  -X POST
  -u sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt
  -H "Content-Type: application/json" 
  -d ']'
```
> 400 Response Header information:

```
  HTTP/1.1 400 Bad Request
  Server: Cowboy
  Date: Mon, 19 Oct 2015 04:37:32 GMT
  Connection: keep-alive
  Content-Type: text/html; charset=utf-8
  X-Request-Id: ca3d8539-acfa-4f9a-b3d7-416f32f31393
  X-Runtime: 0.032672
  Vary: Accept-Encoding
  Strict-Transport-Security: max-age=31536000
  Content-Length: 0
  Via: 1.1 vegur
```

*Invalid API request formatting*

When an invalid request is sent to the API, there is no visbile response. This will include mostly formatting errors.

<aside class='success'>If using curl, adding a <code>-i</code> to a request shows header information.</aside>

## 401 Unauthorised

> 401 Response after request without/incorrect Sendle ID or API Key

```json
  {
    "error":"unauthorised",
    "error_description":"The authorisation details are not valid. Either the Sendle ID or API key are incorrect."
  }
```

*Invalid sendle_id or api_key*

If you have entered your Sendle ID or API Key incorrectly, you may want to double check your [account details](#getting-started).


## 402 Payment Required

> 402 Response after POST valid order

```json
  {
    "error":"payment_required",
    "error_description":"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method."
  }
```

*Payment details not found*

Without a [credit card on file](#set-up-payments), booking orders will respond with a `402` error.

**Non-booking queries will contine to work without payment and will not receive an error.**

<aside class='notice'>Access to <strong><code>sendle.com/api/ping</code></strong> will respond with a <code>402</code> error to test your ability to make a request, mirroring the booking endpoint.</aside>

## 404 Not Found
> 404 Response when entring incorrect Order ID

```json
  {
    "error":"not_found",
    "error_description":"The resource you requested was not found. Please check the URI and try again."
  }
```

*Incorrect URI*

If an Order ID or label url is incorrectly entered, a `404` error will be returned. Double-check the ID or url before continuing.

## 422 Unprocessable Entity
> Request with unallowable errors:

```shell
  curl https://sendle.com/api/orders
  -u sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt
  -H "Content-Type: application/json"
  -X POST
  -d '
    {
      "pickup_date": "2012-12-25",
      "description": "Showing 400 Error",
      "confirmed_not_dangerous": false,
      "kilogram_weight": 1,
      "cubic_metre_volume": 1.1,
      "customer_reference": "Four hundred twenty two",
      "sender": {
        "contact": {
          "name": "Sendle API",
          "sendle_id": "sendleAPI",
          "phone": "1300 345 678"
        },
        "address": {
          "address_line1": "123 Test Ave",
          "suburb": "Acton",
          "state_name": "ACT",
          "postcode": "2601",
          "country": "Australia"
        }, 
        "instructions": "Just a test."
      }, 
      "receiver": {
        "contact": {
          "name": "Jim",
          "email": "emailaddress.com"
        }, 
        "address": {
          "address_line1": "80 Wentworth Park Road",
          "suburb": "Glebe",
          "state_name": "NSW",
          "postcode": "2037",
          "country": "Australia"
        },
        "instructions": "Please leave inside the door."
      }
    }'
```
> 422 Response

```json
  {
    "messages":{
      "pickup_date":[
        "must be a business day and at least one business day in the future."
      ],
      "confirmed_not_dangerous":[
        "must be accepted"
      ],
      "cubic_metre_volume":[
        "must be less than or equal to 0.5"
      ],
      "sender":[
        {
          "contact":[
            {
              "phone":[
                "must be a valid phone number. 13, 1300, and 1800 numbers are not allowed."
              ]
            }
          ]
        }
      ],
      "receiver":[
        {
          "contact":[
            {
              "email":[
                "must be a valid email address"
              ]
            }
          ]
        }
      ]
    },
    "error":"unprocessable_entity",
    "error_description":"The data you supplied is invalid. Error messages are in the messages section. Please fix those fields and try again."
```

*Data could not be processed, but API format is correct*

`422` errors occur most commonly as users become more familiar with the API interface. These errors occur when the server receives your request, it is properly formatted, but the POST information can not be processed as is.

Be sure to check the error messages as the server response will explain why the request could not be processed and often give suggestions.


## 500 Internal Server Error

```
  500 Internal Server Error
  If you are the administrator of this website, then please read this web application's log file and/or the web server's log file to find out what went wrong.
```

*Invalid Endpoint*

As an example, sending a request to `https://sendle-staging.herokuapp.com/api/` will yield a `500` error because the `/api/` is not a valid **-or-** there is a server-side problem. If the later, Sendle will address the problem as soon as possible.
