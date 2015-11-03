# Collection Requests

## Introduction

Collection Requests are a way to notify us that you are expecting a a specific subscriber to send money to you.

Creating a collection request prior to receiving an expected collection greatly improves the user experience for your subscribers by automatically matching transactions to your organization, even if the subscriber misses out some information or gets some of the information wrong, for example if they forget to include a reference code. Payments matching the amount, number and currency in the collection requests will be correctly assigned to you.

Note: Currently, collection requests **do not** initiate any interaction with the subscriber. In the future, they will be used to "pull" payments from subscribers by sending payment instructions to the subscriber on supported networks.

The collection requests api endpoint is https://app.beyonic.com/api/collectionrequests

## The collection request object

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
organization | long integer | The ID of the organization that owns this collection request (This is usually your organization ID)
amount | decimal | The collection request amount
currency | string | The 3 letter ISO currency code for the collection request
phonenumber | string | The phone number that the collection request is intended for, in international format, starting with a +
reason | string or null | Internal description or reason for this collection request
metadata | hash | Any custom metadata that was added to the collection request when it was created
created | string | The date that the collection request was created, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
author | long integer | The ID of the user who created the collection request
modified | string | The date that the collection request was last modified, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
updated_by | string | The ID of the user who last updated the collection request
collection | long integer or null | The ID of the collection that fulfilled the collection request, if any
success_message | string or null | The confirmation message delivered to the customer upon successful completion of this payment request
instructions | string or null | Any custom instructions that were delivered to the customer
send_instructions | boolean | Whether or not Beyonic will attempt to send instructions to the user
                  
                  
## Creating a new collection request

> Sample Request:

```shell
curl https://app.beyonic.com/api/collectionrequests -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d phonenumber=+256772781923 \
-d currency=UGX \
-d amount=3000 \
-d metadata.my_id='123ASDAsd123'
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::CollectionRequest.create(
    phonenumber: "+256773712831",
    amount: "100.2",
    currency: "UGX",
    'metadata.my_id': "123ASDAsd123"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_CollectionRequest::create(array(
  "phonenumber" => "+256773712831",
  "amount" => "100.2",
  "currency" => "UGX",
  "metadata.my_id" => "123ASDAsd123"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

kwargs = {'metadata.my_id': '123ASDAsd123'}

beyonic.CollectionRequest.create(phonenumber='+256773712831',
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
    "phone_number": "+256772781923",
    "created": "2014-11-22T20:57:04.017Z",
    "author": 15,
    "modified": "2014-11-22T20:57:04.018Z",
    "updated_by": null,
}
```

To create a new collection request, make a POST to the endpoint above, with the attributes below.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +256773712831 | Must be in international format
first_name | No | String | Luke | Optional subscriber first name - if omitted, the first name will be set to 'Anonymous'
last_name | No | String | Woods | Optional subscriber last name - if omitted, the last name will be set to 'Contact'
amount | Yes | String, Integer or Decimal | 3000 | Do not include thousands separators
currency | Yes | String | UGX | 3 letter ISO currency code. No currency conversion is done, so the currency must be valid for the selected phonenumber. You must have funded Beyonic an account in this currency. If your account for this currency has zero balance, your payment will fail.
reason | No | String | Transaction Fees | Internal description or reason for this collection request
metadata | No | JSON String | "{'my_id': '123ASDAsd123'}" | Custom attributes to store with this object. See the Metadata section for more information.
success_message | No | String (Max 140 characters) | "Thank you for your payment!" | *New in V2.* This message will be sent via SMS to the subscriber when they make a payment for this collection request. '-Powered by Beyonic' shall be appended to this message. If you leave this message out, a default message shall be sent by Beyonic. You can include {amount} and {customer} placeholders - these will be replaced with the amount and customer name or number details before the message is sent.
send_instructions | No | Boolean | False | *New in V2.* Defaults to True. Indicates whether we should send payment instructions to the subscriber via SMS. This value may be ignored on some networks that have alternative ways of notifying the subscriber of pending payment requests.
instructions | No | String (Max 140 characters) | "Use #1234 as the reference" | *New in V2.* Allows overriding of the default instructions sent to the subscriber. This value may be ignored on some networks that have alternative ways of notifying the subscriber of pending payment requests.

## Retrieving a single collection request

> Sample Request:

```shell
curl https://app.beyonic.com/api/collectionrequests/230 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::CollectionRequest.get(23)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_CollectionRequest::get(23);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.CollectionTRequest.get(23)

```

> Sample Response (JSON):

```json
{
    "id": 230, 
    "organization": 1, 
    "amount": "30", 
    "currency": "UGX",
    "phone_number": "+256772781923",
    "created": "2014-11-22T20:57:04.017Z",
    "author": 15,
    "modified": "2014-11-22T20:57:04.018Z",
    "updated_by": null,
}
```

To retrieve a single collection request, provide the collection request id and a collection request object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 23 | The id of the collection you want to retrieve

## Listing all collection requests

> Sample Request:

```shell
curl https://app.beyonic.com/api/collectionrequests -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::CollectionRequest.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_CollectionRequest::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.CollectionRequest.list()

```

> Sample Response (JSON)

```json
{
    "count": 3,
    "next": "http://localhost:8000/api/collectionrequests?offset=10",
    "previous": null,
    "results": [
        {
            "id": 99,
            "organization": "Beyonic",
            "amount": "3000.0000",
            "currency": "UGX",
            "phonenumber": "+256772781923",
            "metadata": null,
            "created": "2015-08-10T16:10:01Z",
            "author": 42,
            "modified": "2015-08-10T16:10:01Z",
            "updated_by": 42
        },
        {
            "id": 100,
            "organization": "Beyonic",
            "amount": "3000.0000",
            "currency": "UGX",
            "phonenumber": "+256772781923",
            "metadata": null,
            "created": "2015-08-10T16:10:01Z",
            "author": 42,
            "modified": "2015-08-10T16:10:01Z",
            "updated_by": 42
        },
        {
            "id": 101,
            "organization": "Beyonic",
            "amount": "3000.0000",
            "currency": "UGX",
            "phonenumber": "+256772781923",
            "metadata": null,
            "created": "2015-08-10T16:10:01Z",
            "author": 42,
            "modified": "2015-08-10T16:10:01Z",
            "updated_by": 42
        }
    ]
}
```

To retrieve a list of all collections, make a GET request to the collections endpoint. This will return a list of collection objects.

## Filtering collection requests

> Sample Request:

```shell
curl https://app.beyonic.com/api/collectionrequests?remote_transaction_id=12345&amount=500 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::CollectionRequest.list(
  remote_transaction_id: '12345',
  amount: 500
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_CollectionRequest::getAll(
  "remote_transaction_id" => "12345",
  "amount" => 500
);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.CollectionRequest.list(remote_transaction_id='12345', amount=500)

```

You can search or filter collection requests on the following fields. Simply add them to your request as shown in the examples. You can combine multiple filters. Note that filters return exact matches only. (The phonenumber field is treated differently - see below).

* amount - the transaction amount
* currency - the currency code
* collection - the ID of the collection that fulfilled or matched this collection request 
* phonenumber - the phonenumber that the collection request was intended for. Note that the phonenumber will be matched in international format, starting with a '+' sign. If the '+' sign isn't included in your request, it will be appended before attempting to match your request.
* remote_transaction_id - the transation id or transaction reference of the collection on the mobile network operator's side