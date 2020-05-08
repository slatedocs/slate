---
title: OY! Bayar Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript
  - java
  - swift

toc_footers:
  - <a href='https://business.oyindonesia.com/oybayar'>Sign Up for Trial</a>

search: true
---

# Introduction

OY! Bayar service enables business owners like you to receive payments from customers, either **from your Application** or independently **by sending your Payment URL to your customers**.

With quick and easy integration, your business can start accepting payments on Day 1 after registration.

OY! Bayar supports multiple payment methods, including *Direct Debit*, *Credit Cards*, and *Bank Virtual Accounts*.

# Quick Integration

> To open OY! Bayar webview, use following code from your platform:

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

1. Register for a unique payment URL here: [https://business.oyindonesia.com/oybayar](https://www.oyindonesia.com/oybayar)
2. You will receive an email containing a unique payment URL for *trial version* of the checkout page. From here, you can immediately start the integration.

<aside class="warning">
Limitation of OY! Bayar (Trial Version)
</aside>

Payment URL for the *trial version* will have several limitations, including:

* Amount of payment is locked to Rp 10.000
* It contains BIG watermark mentioning unverified account (note: you are not supposed to use this for production)
* You don't get API Callback for payment result. However, you will notice that money will be sent to your bank account in real time

You can upgrade to OY! business partner to remove above limitations, by sending reply to the email that you receive. Our team will response your email quickly.

### How Does It Work?
![Integration flow](images/img_integration.png)

1. **Put the logic of opening webview** on your app button, so that whenever buyer clicks on "Payment" button, it will open OY! Bayar checkout webview
2. You implement your own **Product details page**
3. You implement your **Order System to create transactionId** for buyers to checkout their order
4. Your App/Web **opens OY! Bayar** Checkout page with additional parameters required
5. Buyer pays using any of *Direct Debit*, *Credit Cards*, or *Bank Virtual Accounts*.
6. You **receive money on your receiving account** and OY! will **send Payment status Callback** to your end point (note: Only available for non-trial account)

# OY! Bayar Webview

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

> Sample curl command:

```shell
curl -X GET http://pay.oyindonesia.com/username -H 'content-type: application/json' -d '{"txid": "partner000001", "amount": 10000, "description": "Mohon dikirim segera", "show_contact": "true", "show_account": "true", "send_notif": "true", "enable_payment_cc": "false", "enable_payment_va": "false", "enable_payment_debit": "true}'
```

Open this URL as webview to open OY! Bayar Checkout page, optionally with additional parameters.

### Open Webview

`GET http://pay.oyindonesia.com/username`

<aside class="success">
Remember — Make sure to replace `username` with your account username, given on the email.
</aside>

### Query Parameters

Note: Make sure at most only two of the payment method are false

Parameter | Default | Description
--------- | ------- | -----------
txid | not set | If set to specific ID, OY! will echo back the transactionID label via the Payment Result Callback (parameter name `txid`)
amount | not set | If set to certain amount, will lock the amount of payment that Buyer can pay. Otherwise, Buyer needs to input the amount
description | not set | If set, description text will be shown the main page of OY! Bayar webview. Otherwise, it will show blank description
show_contact | true | If set to true, OY! Bayar webview will show Contact Form asking details of the Buyer
show_account | true | If set to true, OY! Bayar webview will show your bank account number
send_notif | true | Whether OY! should send payment notification to the Buyer via SMS/Push Notif
enable_payment_cc | true | Whether OY! should enable payment using Credit Card
enable_payment_va | true | Whether OY! should enable payment using Bank Virtual Accounts
enable_payment_debit | true | Whether OY! should enable payment using Direct Debit

## Payment Result Callback

> The above command returns JSON structured similar like this:

```json
{
  "txid": "partner000001",
  "oy_txid": "1234567",
  "nominal": 10000,
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
Check here for example: [example](/?json#payment-result-callback)

Parameter | Type | Description
--------- | ---- | -----------
txid | String | (Optional) TransactionID which partner set on the initial OY! Bayar URL
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


# OY! Bayar Webview V2

## Request With Parameters V2

```javascript
// note: at most only two of the payment method are false
let params = 'username=' + username;
params += (partner_tx_id !== null) ? '&partner_tx_id=' + partner_tx_id : '';
params += (amount !== null) ? '&amount=' + amount : '';
params += (sender_name !== null) ? '&sender_name=' + sender_name : '';
params += (sender_phone !== null) ? '&sender_phone=' + sender_phone : '';
params += (sender_note !== null) ? '&sender_note=' + sender_note : '';
params += (description !== null) ? '&description=' + encodeURIComponent(description) : '';
params += (is_open !== null) ? '&is_open=' + is_open : '';
params += (step !== null) ? '&step=' + step : '';
params += (enable_payment_cc !== null) ? '&enable_payment_cc=' + enable_payment_cc : '';
params += (enable_payment_va !== null) ? '&enable_payment_va=' + enable_payment_va : '';
params += (enable_payment_debit !== null) ? '&enable_payment_debit=' + enable_payment_debit : '';

window.open("https://pay.oyindonesia.com/v2?" + params, "_blank"); 
```

> Sample curl command:

```shell
curl -X GET http://pay.oyindonesia.com/v2 -H 'content-type: application/json' -d '{ "partner_tx_id": "partner00001", "amount": "10000", "sender_name": "John Doe", "sender_phone": "%2B62812341234", "sender_note": "Catatan", "description": "Pembayaran Makanan", "is_open": "true", "step": "input-amount", "enable_payment_cc": "true", "enable_payment_va": "true", "enable_payment_debit": "true"}'
```

Open this URL as webview to open OY! Bayar Checkout page, optionally with additional parameters.

### Open Webview V2

`GET http://pay.oyindonesia.com/v2?username={username}`

<aside class="success">
Remember — Make sure to replace `{username}` with your account username, given on the email.
</aside>

### Query Parameters V2

Note: Make sure at most only two of the payment method are false

Parameter | Type | Default Value | Description | Limitation
--------- | ------- | ----------- | -------- | -------- |
username | String | - | The username used by partner for registration with OY! | -
partner_tx_id | String | Auto generated | A unique transaction ID provided by partner | A partner_tx_id that has been succesfully paid cannot be used anymore under the same username
amount | Integer | - | The amount of a transaction to be paid | The amount that can be processed is between IDR 15,000 and IDR 25,000,000
sender_name | String | - | Name of the payer for a transaction | -
sender_phone | Numeric | - | Phone number of the payer for a transaction | -
sender_note | String | - | Additional notes from the payer for a transaction | -
description | String | - | Description of the payment checkout link | -
is_open | String | TRUE | Enable open/closed amount transaction method | If is_open = TRUE and the amount parameter is defined, then a payer can pay any amount (greater than IDR 15,000) up to the defined amount. And in the case that is_open=false, then the amount and partner_tx_id parameters must be defined. Once a partner_tx_id has ever been defined with is_open=false, the amount and the is_open parameters cannot be updated unless the transaction is completed for that particular partner_tx_id.
step | String | - | Accessing specific page of the payment checkout URL. Possible values for this parameter: input-amount, input-personal-info, select-payment-method | If step = input-personal-info then the amount parameter must be defined. And if step = select-payment-method then the amount and sender_name parameters must be defined.


## Payment Result Callback V2

> The above command returns JSON structured similar like this:

```json
{
  "partner_tx_id": "partner000001",
  "tx_ref_number": "1234567",
  "amount": 10000,
  "sender_name": "Joko Widodo",
  "sender_phone": "+6281111111",
  "sender_note": "Mohon dikirim segera",
  "status": "success",
  "settlement_type": "success",
  "sender_bank": "008",
  "payment_method": "DC",
  "va_number" : ""
}
```

Non-trial Account can register specific end point URL (web hook) to receive callback whenever payment occurs.

<aside class="warning">You need to register an end point URL to receive this callback. Note that Trial Account would not get access to this feature</aside>

### Callback Parameters V2

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
status | String | The status of a transaction (e.g. Success/Failed/Processing)
sender_bank | String | The bank code used by a payer to do payment
payment_method | String | The payment method used in a transaction such as CC (Credit Card), DC (Debit Card) or VA (Virtual Account)
va_number | String | VA number to be used on payment if using Virtual Account

## Response Codes V2

Possible status codes on the Payment Result Callback:

Payment Status | Type | Settlement Type | Description
---- | ---- | ---- | ----
success | String | Realtime | Payment has been successfully charged and disbursed to partner's bank account
success | String | Non-realtime | Payment has been successfully charged and partner's balance is updated in OY's business portal
failed | String | Realtime/Non-realtime | Payment failed to be charged. Payer may retry the payment request.
processing | String | Realtime/Non-realtime | A payment attempt has been initiated

