# Getting Started

> Requests should be made with the following headers:

```shell
  Content-Type: application/json
  Accept: application/json
```

Before anything else, you will need to have a [Sendle Account](https://www.sendle.com/#signup-form) authorised with an API.

<aside class="success"><strong>For API access, please contact <a href="mailto:support@sendle.com?subject=Sendle%20API%20Access">support@sendle.com</a></strong></aside>

![Account Settings](images/account_settings.png)

With Access granted, visit `Account Settings` by clicking the account's email in the top right corner and selecting `Account Settings` from the drop down.

![API Modal](images/api_modal.png)

Once you have been granted API access, visit your API tab to get your `api key`.

Requests to the API require the use of HTTP Basic Authentication using
your account's Sendle ID as the user name and your API key as the
password.

<aside class="warning">Consider your API Key as a password. Be sure to keep your API Key private!</aside>

## Sandbox Server

Sendle provides access to a sandbox server at https://sandbox.sendle.com. Any orders
created on the sandbox server will be created in the test mode, they will not result in
actual consignments that can be used to send a parcel, nor will actual charges be
created against your card.

Contact <a href="mailto:support@sendle.com">support@sendle.com</a> for access to the
sandbox server.

## Set Up Payments

> Response Without Payment Details

```json
  {"error":"payment_required","error_description":"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method."}  
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

