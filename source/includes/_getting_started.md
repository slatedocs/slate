# Getting Started

> Requests should be made with the following headers:

```shell
  Content-Type: application/json
  Accept: application/json

```

> cURL authorization looks like:

```shell
 -U "sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt"
```

Before anything else, you will need to have a [Sendle Account](https://www.sendle.com/#signup-form)

From the Sendle Dashboard visit the `Settings` tab from the sidebar.

![API Settings](images/api_settings.png)

[Visit your API tab](https://www.sendle.com/dashboard/api_settings) to get your `sendle ID` and your `api key`.

<strong><a href='https://sendle-sandbox.herokuapp.com/dashboard/api_settings' target='__blank'>Be sure to use Sendle's sandbox environment for testing first!</a></strong>

Requests to the API require the use of HTTP Basic Authentication using
your account's Sendle ID as the user name and your API key as the
password.

<aside class="warning">Consider your API Key as a password. Be sure to keep your API Key private!</aside>

## Sandbox Server

Sendle provides access to a sandbox server at <a href="https://sandbox.sendle.com">https://sandbox.sendle.com.</a> You will need to create a new account for the sandbox server – just like you did for Sendle and set up a <a href="https://stripe.com/docs/testing#cards"><strong>sandbox credit card</strong></a>.

Any orders created on the sandbox server will be created in the test mode, they will not result in actual consignments that can be used to send a parcel. Using a valid credit card in Sandbox will not work, so please review Stripe's test credit card numbers <em>(below).</em>

<aside class="notice">Stripe allows the use of <a href="https://stripe.com/docs/testing#cards"><strong>test credit card numbers</strong></a> which you can enter into the sandbox server to simulate credit card payments.</aside>

## Set Up Payments

> Response Without Payment Details

```json
  {
    "error":"payment_required",
    "error_description":"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method."
  }
```

To use the Sendle API, during the beta period you need to attach a credit card to your Sendle account for invoicing.

## Set Up Account

> Response Without Dangerous Goods Terms Accepted

```json
  {
    "error":"precondition_failed",
    "error_description":"The account associated with this API key has not accepted the dangerous goods terms. Please visit your Account Settings in https://www.sendle.com/dashboard/ to view and accept these terms."
  }
```

To create orders with the Sendle API you must accept the dangerous goods
terms in your `Account Settings`, under the `Pickup` tab.
