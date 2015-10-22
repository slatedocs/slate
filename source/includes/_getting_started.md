# Getting Started

> Requests should be made with the following headers:

```shell
  Content-Type: application/json
  Accept: application/json
```

Before anything else, you will need to have a [Sendle Account](https://www.sendle.com/#signup-form) authorised with an API.

**For API access, please contact [support@sendle.com](mailto:support@sendle.com?subject=Sendle%20API%20Access).**

![Account Settings](images/account_settings.png)

With Access granted, visit `Account Settings`  in the drop down next to your Sendle ID_(top right)_ on your Sendle Dashboard.

![API Modal](images/api_modal.png)

Once you have been granted API access, visit your API tab to get your `api key`.

<aside class="warning">Consider your API Key as a password. Be sure to keep your API Key private!</aside>

## Set Up Payments

> Without Payment Details

```json
  {"error":"payment_required","error_description":"The account associated with this API key has no method of payment. Please go to your Account Settings in your Sendle Dashboard and add a payment method."}  
```

<aside class="success">To use Sendle API, you will need a valid payment option attached to the Sendle Account for any request that would create a booking.</aside>

![Add Payment Details](images/payment_modal.png)

To use the API, be sure to have a credit card on file.

For payments, Sendle uses [Stripe](https://stripe.com). If you want to use a dummy credit card for sandbox testing, [visit stripes testing docs](https://stripe.com/docs/testing) for examples.
