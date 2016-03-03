# Errors

<aside class="success">This guide is in no way complete. If you happen upon errors that are not listed here, please <a href="mailto:support@sendle.com?subject=Sendle%20API%20Errors">let us know</a> so we can make this guide and the Sendle API better!</aside>


## Error Codes

The Sendle API uses the following error codes:

Error Code | Meaning
----------:|:-------
[400](#400-bad-request) | **Bad Request** -- The data provided by the client (typically in the body) is invalid or incorrectly structured.
[401](#401-unauthorised) | **Unauthorized** -- The authorisation details are invalid. Either the Sendle ID, the API key (or both) are incorrect and should be fixed.
[402](#402-payment-required) | **Payment Required** -- The client does not yet have a payment-method set up on their account, and cannot create orders.
[404](#404-not-found) | **Not Found** -- The requested resource/URI was not found.
[422](#422-unprocessable-entity) | **Unprocessable Entity** -- The server was unable to complete the request due to the data itself. For example, validations within the data may fail, or an upstream request may not be able to be fulfilled with the data. This is different to `400 Bad Request` as `422 Unprocessable Entity` suggests that the request sent by the client was structurally valid, and the request was attempted.
[500] **Internal Error** -- an unhandled error has occured with the
Sendle API. Contact support@sendle.com if the problem persists.
[503](#503-not-available) **Not Available** -- The server is currently
unavailable, due to maintenance or upgrades.

## 400 Bad request

```shell
  curl -i "https://www.sendle.com/api/orders"
  -X POST
  -u "sendleID:APIKey"
  -H "Content-Type: application/json"
  -d ']'
```
> 400 Response Header information:

```
  HTTP/1.1 400 Bad Request
  Content-Type: text/html; charset=utf-8
  Content-Length: 0
```

*Invalid request format*

When an invalid request is sent to the API, there is no visible response. This will include mostly formatting errors.

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

**Non-booking queries will continue to work without payment and will not receive an error.**

<aside class='notice'>Access to <strong><code>www.sendle.com/api/ping</code></strong> will respond with a <code>402</code> error to test your ability to make a request, mirroring the booking endpoint.</aside>


## 404 Not Found
> 404 Response when entering incorrect Order ID

```json
  {
    "error":"not_found",
    "error_description":"The resource you requested was not found. Please check the URI and try again."
  }
```

*Incorrect URI*

If an Order ID or label url is incorrectly entered, a `404` error will be returned. Double-check the ID or url before continuing.

## 412 Precondition Failed

> 412 Response after POST valid order

```json
  {
    "error":"precondition_failed",
    "error_description":"The account associated with this API key has not accepted the dangerous goods terms. Please visit your Account Settings in https://www.sendle.com/dashboard/ to view and accept these terms."
  }
```

*Dangerous goods terms have not been accepted*

Without accepting [dangerous goods terms](#set-up-account), booking orders will respond with a `412` error.

**Non-booking queries will continue to work without accepting dangerous goods terms and will not receive an error.**



## 422 Unprocessable Entity
> Request with unallowable errors:

```shell
  curl "https://www.sendle.com/api/orders"
  -u "sendleID:APIKey"
  -H "Content-Type: application/json"
  -X POST
  -d '{
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
*Data format was correct but contained unprocessable information*

`422` errors occur most commonly as users become more familiar with the API interface. These errors occur when the server receives your request, it is properly formatted, but the information can not be processed as is.

Be sure to check the error messages as the server response will explain why the request could not be processed and often give suggestions.

## 503 Not Available

From time to time we might require a short outage to carry out
maintenance or upgrades. In most cases the API will return a HTTP 503
error response.
