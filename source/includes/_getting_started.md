# Getting Started

> Requests should be made with the following headers:

```shell
  Content-Type: application/json
  Accept: application/json
```

Before anything else, you will need to have a [Sendle Account](https://www.sendle.com/#signup-form) authorised with an API.

<aside class="success"><strong>For API access, please contact <a href="mailto:support@sendle.com?subject=Sendle%20API%20Access">support@sendle.com</a></strong></aside>

![Account Settings](images/account_settings.png)

With Access granted, visit `Account Settings`  in the drop down next to your Sendle ID_(top right)_ on your Sendle Dashboard.

![API Modal](images/api_modal.png)

Once you have been granted API access, visit your API tab to get your `api key`.

<aside class="warning">Consider your API Key as a password. Be sure to keep your API Key private!</aside>

## Set Up Payments

> Response Without Payment Details

```json
  {"error":"payment_required","error_description":"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method."}  
```

To use the Sendle API, during the beta period you need to be on a manually invoiced account. Sendle Support will
organise this for you.

