## Payments

To send payments to a mobile subscriber, you create a new payment object. You can also retrieve individual payments or list all payments.

* End Point: https://app.beyonic.com/api/payments

### Creating a new payment

> Example Request:

```shell
curl https://app.beyonic.com/api/payments -H "Authorization: Token my-authorization-token" \
-d phonenumber=+256772781923 \
-d currency=UGX \
-d amount=30 \
-d description="Per diem payment" \
-d callback_url="https://my.website/payments/callback" \
-d metadata="{'id':'1234','name':'Lucy'}" \
-d payment_type=money
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'

payment = Beyonic::Payment.create(
    phonenumber: "+256773712831",
    amount: "100.2",
    currency: "UGX",
    description: "Per diem payment",
    payment_type: "money",
    callback_url: "https://my.website/payments/callback",
    metadata: "{'id': '1234', 'name': 'Lucy'}"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");

Beyonic_Payment::create(array(
  "phonenumber" => "+256773712831",
  "amount" => "100.2",
  "currency" => "UGX",
  "description" => "Per diem payment",
  "payment_type" => "money",
  "callback_url" => "https://my.website/payments/callback",
  "metadata" => "{'id': '1234', 'name': 'Lucy'}"
));
?>
```

```python
import beyonic
beyonic.api_version = 'v1'

beyonic.Payment.create(phonenumber='+256773712831',
                       amount='1200', 
                       currency='UGX',
                       description='Per diem',
                       callback_url='https://my.website/payments/callback'
                       )
```

> Example JSON Response:

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

To create a new payment, make a POST to the endpoint above, with the attributes below.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +256773712831 | Must be in international format
amount | Yes | String, Integer or Decimal | 3000 | Do not include thousands separators
currency | Yes | String | UGX | 3 letter ISO currency code. No currency conversion is done, so the currency must be valid for the selected phonenumber. You must have funded Beyonic an account in this currency. If your account for this currency has zero balance, your payment will fail.
description | Yes | String | Per diem payment | This description will be sent to the recipient along with the payment, so it should be limited to about 140 characters.
payment_type | No | String | money | Options: money (default), airtime - use "airtime" to send an airtime payment instead of a mobile money payment
callback_url | No | String | https://my.website/payments/callback | See "Callback URLs" below for more info.

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

### Retrieving a single payment

> Retrieve Single Payment:

```shell
curl https://app.beyonic.com/api/payments/2314 -H "Authorization: Token my-authorization-token"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'

payment = Beyonic::Payment.get(2314)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");

$payment = Beyonic_Payment::get(2314);
?>
```

```python
import beyonic
beyonic.api_version = 'v1'

...
# Please check back soon for python examples.
```

To retrieve a single payment object, provide the payment id and a payment object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 2314 | The id of the payment you want to retrieve

### Listing all payments

> List Payments:

```shell
curl https://app.beyonic.com/api/payments -H "Authorization: Token my-authorization-token"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'

payments = Beyonic::Payment.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");

$payments = Beyonic_Payment::getAll();
?>
```

```python
import beyonic
beyonic.api_version = 'v1'

...
# Please check back soon for python examples.
```

> List Payments JSON Response:


```json
[
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
  },
  {
      "id": 3636, 
      "organization": 1, 
      "amount": "50", 
      "currency": "UGX",
      "payment_type": "money",
      "metadata": {"id": 3123, "name": "Lucy"}, 
      "description": "Per diem payment", 
      "phone_nos": ["+256772788923"], 
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
]
```

To return a list of all payments, make a GET request to the payments endpoint. This will return a list of payment objects.