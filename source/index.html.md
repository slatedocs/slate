---
title: Payment Checkout Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript
  - java
  - swift

toc_footers:
  - <a href='https://business.oyindonesia.com/register'>Sign Up for Trial</a>

search: true
---

# Introduction

Payment Checkout service enables business owners like you to receive payments from customers, either **from your Application** or independently **by sending your Payment URL to your customers**.

With quick and easy integration, your business can start accepting payments on Day 1 after registration.

Payment Checkout supports multiple payment methods, including *Direct Debit*, *Credit Cards*, and *Bank Virtual Accounts*.

# Quick Integration

> To open Payment Checkout, use following code from your platform:

```javascript
window.open("https://pay.oyindonesia.com/username", "_blank");
```

```java
Intent intent = new Intent(context, YourWebviewActivity.class);
intent.putExtra("url", "https://pay.oyindonesia.com/username")
startActivity(intent)
```

```swift
let controller = OyWebViewController()
controller.url = "https://pay.oyindonesia.com/username"
let navigationController = UINavigationController(rootViewController: controller)
present(navigationController, animated: true, completion: nil)
```

> Make sure to replace `username` with your account username, given on the email.

### Get Payment URL for your business
![Signup for Trial](images/img_signup.png)

1. Register for a unique payment URL here: [https://business.oyindonesia.com/register](https://business.oyindonesia.com/register)
2. You will receive an email containing a unique payment URL for *trial version* of the checkout page. From here, you can immediately start the integration.

<aside class="warning">
Limitation of Payment Checkout (Trial Version)
</aside>

Payment URL for the *trial version* will have several limitations, including:

* Amount of payment is locked to Rp 15.000
* It contains BIG watermark mentioning unverified account (note: you are not supposed to use this for production)
* You don't get API Callback for payment result. However, you will notice that money will be sent to your bank account in real time

You can upgrade to OY! business partner to remove above limitations, by sending reply to the email that you receive. Our team will response your email quickly.

### How Does It Work?
![Integration flow](images/img_integration.png)

1. **Put the logic of opening webview** on your app button, so that whenever buyer clicks on "Payment" button, it will open Payment Checkout
2. You implement your own **Product details page**
3. You implement your **Order System to create transactionId** for buyers to checkout their order
4. Your App/Web **opens Payment Checkout** page with additional parameters required
5. Buyer pays using any of *Direct Debit*, *Credit Cards*, or *Bank Virtual Accounts*.
6. You **receive money on your receiving account** and OY! will **send Payment status Callback** to your end point (note: Only available for non-trial account)

# Payment Checkout V1 (To be Deprecated)

## Request With Parameters

```javascript
// note: at most only two of the payment method are false
let params = 'open=true';
params += (txid !== null) ? '&txid='+txid : '';
params += (amount !== null) ? '&amount='+amount : '';
params += (description !== null) ? '&description='+encodeURIComponent(description) : '';
params += (show_contact !== null) ? '&show_contact='+show_contact : '';
params += (show_account !== null) ? '&show_account='+show_account : '';
params += (send_notif !== null) ? '&send_notif='+send_notif : '';
params += (enable_payment_cc !== null) ? '&enable_payment_cc'+enable_payment_cc : '';
params += (enable_payment_va !== null) ? '&enable_payment_va'+enable_payment_va : '';
params += (enable_payment_debit !== null) ? '&enable_payment_debit'+enable_payment_debit : '';

window.open("https://pay.oyindonesia.com/username?" + params, "_blank");
```

Once you complete the registration and activation for payment checkout, you can immediately access our payment checkout link at [https://pay.oyindonesia.com/yourusername](https://pay.oyindonesia.com/yourusername)

<aside class="success">
Remember — Make sure to replace `username` with your account username, given on the email.
</aside>

### Query Parameters

Note: Make sure at most only two of the payment method are false

Parameter | Default | Description
--------- | ------- | -----------
txid | not set | If set to specific ID, OY! will echo back the transactionID label via the Payment Result Callback (parameter name `txid`)
amount | not set | If set to certain amount, will lock the amount of payment that Buyer can pay. Otherwise, Buyer needs to input the amount
description | not set | If set, description text will be shown the main page of Payment Checkout. Otherwise, it will show blank description
show_contact | true | If set to true, Payment Checkout will show Contact Form asking details of the Buyer
show_account | true | If set to true, Payment Checkout will show your bank account number
send_notif | true | Whether OY! should send payment notification to the Buyer via SMS/Push Notif
enable_payment_cc | true | Whether OY! should enable payment using Credit Card
enable_payment_va | true | Whether OY! should enable payment using Bank Virtual Accounts
enable_payment_debit | true | Whether OY! should enable payment using Direct Debit

### Sample payment checkout URL with all parameters defined:

`https://pay.oyindonesia.com/yourusername?txid=partner000001&amount=15000&description=Mohon%20dikirim%20segera&show_contact=true&show_account=true&send_notif=true&enable_payment_cc=false&enable_payment_va=false&enable_payment_debit=true`


## Payment Result Callback

> The above command returns JSON structured similar like this:

```json
{
  "txid": "partner000001",
  "oy_txid": "1234567",
  "nominal": 15000,
  "name": "Joko Widodo",
  "phone_number": "+6281111111",
  "note": "Mohon dikirim segera",
  "result": "success",
  "sender_bank": "008",
  "payment_method": "Instant Pay"
}
```

Non-trial Account can register specific end point URL (web hook) to receive callback whenever payment occurs.

<aside class="warning">You need to register an end point URL to receive this callback. Note that Trial Account would not get access to this feature</aside>

### Callback Parameters

The data on the callback will be sent using JSON format via POST data to your web hook.


Parameter | Type | Description
--------- | ---- | -----------
txid | String | (Optional) TransactionID which partner set on the initial Payment Checkout URL
oy_txid | String | Internal TransactionID from OY! system
nominal | BigDecimal | Amount of payment by the Buyer
name | String | Name of Buyer
phone_number | String | Phone Number of Buyer
note | String | (Optional) This is note from the Buyer
result | String | Payment Status of Buyer. Can be either "success" or "failed" or "processing"
sender_bank | String | Bank code used by buyer to do payment
payment_method | String | Define what payment method to be used in transaction (`Instant Pay`/`Manual Pay`/`Manual Bank Transfer`)*
va_number | String | VA number to be used on payment if using Manual Pay

*Instant Pay = direct-debit or cc; Manual Pay = virtual account; Manual Bank Transfer = pay using manual transfer

## Response Codes

Possible status codes on the Payment Result Callback:

Payment Status | Type | Meaning
-------------- | ---- | -------
success | String | Payment by Buyer is successful and has been sent to your bank account
failed | String | Payment by Buyer is failed


# Payment Checkout V2 

## Request With Parameters

Once you complete the registration and activation for payment checkout, you can immediately access our payment checkout link at [https://pay.oyindonesia.com/v2?username=yourusername](https://pay.oyindonesia.com/v2?username=yourusername)

<aside class="success">
Make sure at most only two of the payment method are false and always use HTTPS instead of HTTP to ensure the payment checkout link functioning properly.
</aside>

```javascript
// note: at most only two of the payment method can be false
let params = 'username=' + username;
params += (partner_tx_id !== null) ? '&partner_tx_id=' + partner_tx_id : '';
params += (amount !== null) ? '&amount=' + amount : '';
params += (sender_name !== null) ? '&sender_name=' + sender_name : '';
params += (sender_phone !== null) ? '&sender_phone=' + sender_phone : '';
params += (sender_note !== null) ? '&sender_note=' + sender_note : '';
params += (description !== null) ? '&description=' + encodeURIComponent(description) : '';
params += (is_open !== null) ? '&is_open=' + is_open : '';
params += (step !== null) ? '&step=' + step : '';

window.open("https://pay.oyindonesia.com/v2?" + params, "_blank");
```

### Query Parameters


Parameter | Type | Default Value | Description | Limitation
--------- | ------- | ----------- | -------- | -------- |
username | String | - | The username used by partner for registration with OY! | -
partner_tx_id | String | Auto generated | A unique transaction ID provided by partner | A partner_tx_id that has been succesfully paid cannot be used anymore under the same username
amount | Integer | - | The amount of a transaction to be paid | The amount that can be processed is between IDR 15,000 and IDR 25,000,000
sender_name | String | - | Name of the payer for a transaction | Only accepts alphabets (A-Z) and space as input (cannot be empty)
sender_phone | Numeric | - | Phone number of the payer for a transaction | -
sender_note | String | - | Additional notes from the payer for a transaction | Only accepts alphabets (A-Z), numeric (0-9) and space as input
description | String | - | Description of the payment checkout link | Only accepts alphabets (A-Z), numeric (0-9) and space as input
is_open | String | TRUE | Enable open/closed amount transaction method | If is_open = TRUE and the amount parameter is defined, then a payer can pay any amount (greater than IDR 15,000) up to the defined amount. And in the case that is_open=false, then the amount and partner_tx_id parameters must be defined. Once a partner_tx_id has ever been defined with is_open=false, the amount and the is_open parameters cannot be updated unless the transaction is completed for that particular partner_tx_id.
step | String | - | Accessing specific page of the payment checkout URL. Possible values for this parameter: input-amount, input-personal-info, select-payment-method | If step = input-personal-info then the amount parameter must be defined. And if step = select-payment-method then the amount and sender_name parameters must be defined.
enable_payment_va | Boolean | - | Enable VA payment method for the payment checkout link | There should be at least one payment method enabled
enable_payment_debit | Boolean | - | Enable debit card payment method for the payment checkout link | There should be at least one payment method enabled
enable_payment_cc | Boolean | - | Enable credit card payment method for the payment checkout link | There should be at least one payment method enabled

### Sample payment checkout URL with all parameters defined:

`https://pay.oyindonesia.com/v2?username=yourusername&partner_tx_id=testSample&amount=50000&sender_name=testsender&description=payment%20checkout%20testing&is_open=false&step=select-payment-method&enable_payment_cc=false&enable_payment_debit=false`

The above URL will produce a payment checkout link with a closed amount of IDR 50,000 with VA payment method only available and payer will be redirected to the payment method page upon accessing the URL.

## Callback Results

In order to receive a callback result, please register specific end point URL (web hook) to receive callback whenever payment occurs.

> The above command returns JSON structured similar like this:

```json
{
  "partner_tx_id": "partner000001",
  "tx_ref_number": "1234567",
  "amount": 15000,
  "sender_name": "Joko Widodo",
  "sender_phone": "+6281111111",
  "sender_note": "Mohon dikirim segera",
  "status": "success",
  "settlement_type": "realtime",
  "sender_bank": "008",
  "payment_method": "DC",
  "va_number" : ""
}
```

<aside class="warning">You need to register an end point Callback URL to receive this callback.</aside>

## Callback Parameters

The data on the callback will be sent using JSON format via POST data to your web hook.
Check here for example: [example](/?json#payment-result-callback-v2)

Parameter | Type | Description
--------- | ---- | -----------
partner_tx_id | String | A unique transaction ID provided by partner
tx_ref_number | String | OY's internal unique transaction ID
amount | BigDecimal | The amount of a transaction that is paid
sender_name | String | Name of a payer for a transaction
sender_phone | String | Phone number of a payer for a transaction
sender_note | String | Additional notes from a payer for a transaction
status | String | The status of a transaction (e.g. success/failed/processing)
sender_bank | String | The bank code used by a payer to do payment
payment_method | String | The payment method used in a transaction such as CC (Credit Card), DC (Debit Card) or VA (Virtual Account)
va_number | String | VA number to be used on payment if using Virtual Account
settlement_type | String | Indicate if a transaction will be settled in realtime/non-realtime
created | DateTime | The timestamp which indicates the creation time of a payment checkout link
updated | DateTime | The timestamp which indicates the latest updated time of a payment checkout link due to status update

## Callback Response Codes

Payment Status | Type | Payment Method | Description
---- | ---- | ---- | ----
waiting_payment | String | Bank Transfer | Payer triggers a payment status check for an unpaid VA
expired_va | String | Bank Transfer | An unpaid VA has expired and payer can retry a payment
charge_in_progress | String | Card | OTP for card payment method has been succesfully entered and processed
charge_sucess | String | Bank Transfer/Card | A payment has been successfully received by OY
charge_failed | String | Card | OTP for card payment method has been succesfully entered but payment is rejected
disburse_in_progress | String | Bank Transfer/Card | For "Realtime" settlement option, disbursement is currently in progress to partner's registered bank account
complete | String | Bank Transfer/Card | For "Realtime" settlement option, disbursement has been succesfully executed and received by partner

## API Callback

An endpoint to retrieve and/or re-send the latest callback status of a transaction. Please contact us to submit a request of an API Key and IP whitelisting.

### HTTPS Request

GET `https://partner.oyindonesia.com/api/payment-checkout/status`


> To retrieve a callback result for a particular transaction, use following code from your platform:

```shell
curl -X GET 'https://partner.oyindonesia.com/api/payment-checkout/status?partner_tx_id=OY123456&send_callback=false' -H 'x-oy-username:yourusername' -H ' x-api-key:yourapikey'
```

> The above command returns JSON structured similar like this:

```json
{
  "partner_tx_id": "partner000001",
  "tx_ref_number": "1234567",
  "amount": 15000,
  "sender_name": "Joko Widodo",
  "sender_phone": "+6281111111",
  "sender_note": "Mohon dikirim segera",
  "status": "success",
  "settlement_type": "realtime",
  "sender_bank": "008",
  "payment_method": "DC",
  "va_number" : ""
}
```

### Request Headers

Parameters | Type | Description
---- | ---- | ----
x-api-key | String | API Key for establishing connection to this particular endpoint
x-oy-username | String | The registered partner username which access is enabled for payment checkout product

### Request Parameters

Parameters | Type | Description
---- | ---- | ----
partner_tx_id | String | A unique transaction ID which callback status to be checked
send_callback | Boolean | A flag to indiciate if the latest callback of a transaction need to be re-sent or not

### Response Parameters
Parameter | Type | Description
---- | ---- | ----
partner_tx_id | String | A unique transaction ID provided by partner
tx_ref_number | String | OY's internal unique transaction ID
amount | BigDecimal | The amount of a transaction that is paid
sender_name | String | Name of a payer for a transaction
sender_phone | String | Phone number of a payer for a transaction
sender_note | String | Additional notes from a payer for a transaction
status | String | The status of a transaction
sender_bank | String | The bank code used by a payer to do payment
payment_method | String | The payment method used in a transaction such as CC (Credit Card), DC (Debit Card) or VA (Virtual Account)
va_number | String | VA number to be used on payment if using Virtual Account
settlement_type | String | Indicate if a transaction will be settled in realtime/non-realtime
created | String | The timestamp which indicates the creation time of a payment checkout link
updated | String | The timestamp which indicates the latest updated time of a payment checkout link due to status update

## API Create URL

An endpoint to create payment checkout URL which return parameters by encapsulation.

> Sample Curl

```shell
curl -X POST \
  https://partner.oyindonesia.com/api/payment-checkout/create \
  -H 'cache-control: no-cache' -H 'content-type: application/json' \
  -H 'x-api-key: apikeymu' -H 'x-oy-username: yourusername' \
  -d '{"username":"testaccount","partner_tx_id":"ABC123456527","sender_name":"Roberto F",
        "sender_note":"bill payment","sender_phone": "082114845847","checkout_url":"string",
        "amount":75000,"is_open":false,"step":"select-payment-method","enable_payment_cc":false,
        "enable_payment_va":true,"enable_payment_debit":false,"description":"payment for March 2020"
    }'
```

### HTTPS Request

POST `https://partner.oyindonesia.com/api/payment-checkout/create`

> Json Response

```json
{
        "username":"testaccount",
        "partner_tx_id":"ABC123456527",
        "sender_name":"Roberto F",
        "sender_note":"bill payment",
        "sender_phone": "082114845847",
        "checkout_url":"string",
        "amount":75000,
        "is_open":false,
        "step":"select-payment-method" ,
        "enable_payment_cc":false,
        "enable_payment_va":true,
        "enable_payment_debit":false,
        "description":"payment for March 2020"
}
```

### Request Headers

Parameters | Type | Description
---- | ---- | ----
x-api-key | String | API Key for establishing connection to this particular endpoint
x-oy-username | String | The registered partner username which access is enabled for payment checkout product

### Request Parameters

*Note: all parameters defined via API are mandatory to be declared in the request*

Parameters | Type | Description | Limitation
---- | ---- | ------ | -------
username | String | The username used by partner for registration with OY! | -
partner_tx_id | String | A unique transaction ID provided by partner. | A partner_tx_id that has been succesfully paid cannot be used anymore under the same username and only accepts alphanumerics.
amount | Integer | The amount of a transaction to be paid. | The amount that can be processed is between IDR 15,000 and IDR 25,000,000.
sender_name | String | Name of the payer for a transaction. | Only accepts alphabets (A-Z) and space as input and cannot be empty.
sender_phone | Numeric | Phone number of the payer for a transaction. | Do not use special character (e.g. "+") and cannot be empty.
sender_note | String | Additional notes from the payer for a transaction. | Only accepts alphabets (A-Z), numeric (0-9) and space as input.
description | String | Description of the payment checkout link. | Only accepts alphabets (A-Z), numeric (0-9) and space as input.
is_open	| Boolean | Enable open/closed amount transaction method. | If is_open = TRUE and the amount parameter is defined, then a payer can pay any amount (greater than IDR 15,000) up to the defined amount. And in the case that is_open=false, then the amount and partner_tx_id parameters must be defined. Once a partner_tx_id has ever been defined with is_open=false, the amount and the is_open parameters cannot be updated unless the transaction is completed for that particular partner_tx_id.
step | String | Accessing specific page of the payment checkout URL. Possible values for this parameter are either (input-amount, input-personal-info, select-payment-method). | If step = input-personal-info then the amount parameter must be defined. And if step = select-payment-method then the amount and sender_name parameters must be defined.
enable_payment_va | Boolean | Enable VA payment method for the payment checkout link. | There should be at least one payment method enabled.
enable_payment_debit | Boolean | Enable debit card payment method for the payment checkout link. | There should be at least one payment method enabled.
enable_payment_cc | Boolean | Enable credit card payment method for the payment checkout link. | There should be at least one payment method enabled.

### Response Parameters
Parameter | Type | Description
---- | ---- | ----
success | Boolean | The username used by partner for registration with OY!
url | String | A unique transaction ID provided by partner
