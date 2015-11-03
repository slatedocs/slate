# Payments

## Introduction

To send payments to a mobile subscriber, you create a new payment object. You can also retrieve individual payments or list all payments.

* End Point: https://app.beyonic.com/api/payments

## Creating a new payment

> Sample Request:

```shell
curl https://app.beyonic.com/api/payments -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d phonenumber=+256772781923 \
-d currency=UGX \
-d amount=30 \
-d description="Per diem payment" \
-d callback_url="https://my.website/payments/callback" \
-d payment_type=money
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::Payment.create(
    phonenumber: "+256773712831",
    amount: "100.2",
    currency: "UGX",
    description: "Per diem payment",
    payment_type: "money",
    callback_url: "https://my.website/payments/callback",
    'metadata.id'=> 1234,
    'metadata.name'=> 'Lucy'
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_Payment::create(array(
  "phonenumber" => "+256773712831",
  "amount" => "100.2",
  "currency" => "UGX",
  "description" => "Per diem payment",
  "payment_type" => "money",
  "callback_url" => "https://my.website/payments/callback",
  "metadata.id" => "1234", 
  "name.name" => "Lucy"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

kwargs = {'metadata.id': 1234, 'metadata.name': 'Lucy'}

beyonic.Payment.create(phonenumber='+256773712831',
                       amount='1200', 
                       currency='UGX',
                       description='Per diem',
                       callback_url='https://my.website/payments/callback',
                       **kwargs
                       )
```

> Sample Response (JSON):

```json
{
    "id": 3620, 
    "organization": 1, 
    "amount": "30", 
    "currency": "UGX",
    "payment_type": "money",
    "metadata": {"id": 1234, "name": "Lucy"}, 
    "description": "Per diem payment", 
    "phone_nos": ["+256772781923"], 
    "state": "new", 
    "last_error": null,
    "rejected_reason": null,
    "rejected_by": null,
    "rejected_time": null,
    "cancelled_reason": null,
    "cancelled_by": null,
    "cancelled_time": null, 
    "created": "2014-11-22T20:57:04.017Z",
    "author": 15,
    "modified": "2014-11-22T20:57:04.018Z",
    "updated_by": null,
    "start_date": "2014-11-22T20:57:04.018Z"
}
```

To create a new payment, make a POST to the end point above, with the attributes below. 

**Note**: 

* A contact is created for each new phone number you send payments to. This gives you the benefits of the pre-verification checks that are done prior to payment processing. 
* If the contact isn't registered for mobile money, then the payment will not be sent.
* **Important**: One of the pre-verification checks does a name match check to make sure that the contact name is right. This check can cause your payments to fail if the names that you are sending are not the same as the names in the telecom database. If you want to by-pass this check, go into your settings in your account and uncheck the checkbox that says "Name match affects payment".


Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +256773712831 | Must be in international format
amount | Yes | String, Integer or Decimal | 3000 | Do not include thousands separators
currency | Yes | String | UGX | 3 letter ISO currency code. No currency conversion is done, so the currency must be valid for the selected phonenumber. You must have funded Beyonic an account in this currency. If your account for this currency has zero balance, your payment will fail.
description | Yes | String | Per diem payment | This description will be sent to the recipient along with the payment, so it should be limited to about 140 characters.
payment_type | No | String | money | Options: money (default), airtime - use "airtime" to send an airtime payment instead of a mobile money payment
callback_url | No | String | https://my.website/payments/callback | See "Callback URLs" below for more info.
metadata | No | JSON-formatted string or dictionary | "{'id':'1234','name':'Lucy'}" | Metadata allows you to add custom attributes to your payments. E.g. You can include a unique ID to identify each payment. Attributes must be key-value pairs. Both the keys and values must be strings. You can add up to 10 attributes. This data will be returned when you retrieve a payment.
first_name | No | String | John | If this payment is to a new contact, you can include their first name. This name will only be used if the phone number is new.
last_name | No | String | Doe | If this payment is to a new contact, you can include their last name. This name will only be used if the phone number is new.

**Callback URLs**

Callback URLs are used to send notifications of changes in payment status. Not all payments will be completed immediately, especially if it is a payment to a new number that hasn’t been verified, or if your account has approval rules that require other users to approve payments before they are processed.

* Non-HTTPS URLs will be rejected.
* Data will be posted to the URL, and a 200 response is expected.
* In version 1, a non 200 response may result in deletion of the URL, and no further notifications will be sent.
* In version 1, the URL you submit isn’t specific to the payment you have created. Once submitted, it will receive notifications for all future payments made via your organization, whether they are made via the API or via the web-interface.
* Therefore, you are encouraged to use the same URL for all payments. Since URLs are stored at a per-organization level, using different URLs may result in duplicate notifications being sent to the different URLs.
* In version 1, previously submitted urls can be deleted via the web browser, or the Webhooks API methods described elsewhere in this reference.

**Responses**

* If successful, a JSON representation of the new payment object will be returned. The state field will be "new"
* The payment object can be identified using it’s id field, or the metadata that you supplied.
* On subsequent notification callbacks to your callback URL, the same payment object (with the same id field) will be returned. Check the state field for the latest payment status.
* The state field values can be:
    * new – for new payments
    * processed – for successfully completed payments
    * processed_with_errors – for payments that didn’t complete successfully. The last_error field with have more information.
    * rejected – for payments that were rejected during the approval process. The following fields will have more information: rejected_reason, rejected_by and rejected_time
    * cancelled – for payments that were cancelled. The following fields will have more information: cancelled_reason, cancelled_by and cancelled_time

## Retrieving a single payment

> Sample Request:

```shell
curl https://app.beyonic.com/api/payments/2314 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::Payment.get(2314)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$payment = Beyonic_Payment::get(2314);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = beyonic.Payment.get(2314)

```

> Sample Response (JSON):

```json
{
    "id": 2314, 
    "organization": 1, 
    "amount": "30", 
    "currency": "UGX",
    "payment_type": "money",
    "metadata": {"id": 1234, "name": "Lucy"}, 
    "description": "Per diem payment", 
    "phone_nos": ["+256772781923"], 
    "state": "new", 
    "last_error": null,
    "rejected_reason": null,
    "rejected_by": null,
    "rejected_time": null,
    "cancelled_reason": null,
    "cancelled_by": null,
    "cancelled_time": null, 
    "created": "2014-11-22T20:57:04.017Z",
    "author": 15,
    "modified": "2014-11-22T20:57:04.018Z",
    "updated_by": null,
    "start_date": "2014-11-22T20:57:04.018Z"
}
```

To retrieve a single payment object, provide the payment id and a payment object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 2314 | The id of the payment you want to retrieve

## Listing all payments

> Sample Request:

```shell
curl https://app.beyonic.com/api/payments -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payments = Beyonic::Payment.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$payments = Beyonic_Payment::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payments = beyonic.Payment.list()

```

> Sample Response (JSON)


```json
{
    "count": 2,
    "next": "http://app.beyonic.com/api/payments?offset=10",
    "previous": null,
    "results": [
        {
            "id": 1,
            "organization": "Beyonic",
            "amount": "0.0000",
            "currency": "UGX",
            "payment_type": "money",
            "metadata": null,
            "description": "Test",
            "phone_nos": [
                "+256784522613"
            ],
            "state": "approved",
            "last_error": null,
            "rejected_reason": null,
            "rejected_by": null,
            "rejected_time": null,
            "cancelled_reason": null,
            "cancelled_by": null,
            "cancelled_time": null,
            "created": "2013-08-20T17:21:39Z",
            "author": 1,
            "modified": "2013-08-20T17:21:39Z",
            "updated_by": null,
            "start_date": "2013-08-20T00:00:00Z"
        },
        {
            "id": 2,
            "organization": "Beyonic",
            "amount": "200.0000",
            "currency": "UGX",
            "payment_type": "money",
            "metadata": null,
            "description": "Test2",
            "phone_nos": [
                "+256784522611"
            ],
            "state": "scheduled",
            "last_error": null,
            "rejected_reason": null,
            "rejected_by": null,
            "rejected_time": null,
            "cancelled_reason": null,
            "cancelled_by": null,
            "cancelled_time": null,
            "created": "2013-08-22T01:53:35Z",
            "author": 1,
            "modified": "2013-08-22T01:53:36Z",
            "updated_by": 1,
            "start_date": "2013-08-21T00:00:00Z"
        },
```

To return a list of all payments, make a GET request to the payments endpoint. This will return a list of payment objects.

## Filtering payments

> Sample Request:

```shell
curl https://app.beyonic.com/api/payments?amount=500 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payments = Beyonic::Payment.list(
  amount: 500
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$payments = Beyonic_Payment::getAll(
  "amount" => 500
);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payments = beyonic.Payment.list(amount=500)

```

You can search or filter payments on the following fields. Simply add them to your request as shown in the examples. You can combine multiple filters. Note that filters return exact matches only.

* amount - the payment amount
* currency - the payment currency code
* payment_type - the payment type