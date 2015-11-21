# Collections

## Introduction

Collections are payments sent to you from mobile subscribers. See ['how collections work']](http://support.beyonic.com/how-collections-work/) for more information.

When the user sends in a payment, it will create a collection object that you can access via the Collections API using the methods shown below.

The collections api endpoint is https://app.beyonic.com/api/collections

## The collection object

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
remote_transaction_id | string | The unique transaction ID from the mobile network operator
organization | long integer | The ID of the organization that the collection was matched to
amount | decimal | The collection amount
currency | string | The 3 letter ISO currency code for the collection
phonenumber | string | The phone number that the collection was initiated from, in international format, starting with a +
payment_date | string | The date that the collection was made, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
reference | string | The description or reference code that was included with the collection
status | string | A string showing the status of the collection. One of: successful, failed, pending or cashed_out
created | string | The date that the collection was created, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
author | long integer | The ID of the user who created the collection
modified | string | The date that the collection was last modified, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
updated_by | string | The ID of the user who last updated the collection
collection_request | long integer or null | The ID of the collection request that this collection was matched to, if any

## Retrieving a single collection

> Sample Request:

```shell
curl https://app.beyonic.com/api/collections/230 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::Collection.get(23)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_Collection::get(23);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.Collection.get(23)

```

> Sample Response (JSON):

```json
{
    "id": 230,
    "remote_transaction_id": "12132",
    "organization": 1,
    "amount": "20.0000",
    "currency": 1,
    "phonenumber": "+2547227272723",
    "payment_date": "2015-12-12T00:00:00Z",
    "reference": null,
    "status": "successful",
    "created": "2015-08-01T16:49:48Z",
    "author": null,
    "modified": "2015-08-01T16:55:38Z",
    "updated_by": null
}
```

To retrieve a single collection object, provide the collection id and a collection object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 23 | The id of the collection you want to retrieve

## Listing all collections

> Sample Request:

```shell
curl https://app.beyonic.com/api/collections -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::Collection.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_Collection::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.Collection.list()

```

> Sample Response (JSON)

```json
{
    "count": 3,
    "next": "https://app.beyonic.com/api/collections?offset=10",
    "previous": null,
    "results": [
        {
            "id": 82,
            "remote_transaction_id": "1485758785",
            "organization": 1,
            "amount": "2000.0000",
            "currency": 2,
            "phonenumber": "+256782466772",
            "payment_date": "2015-07-14T09:57:44Z",
            "reference": "beyonic",
            "status": "successful",
            "created": "2015-07-14T15:19:05Z",
            "author": null,
            "modified": "2015-08-20T16:48:51Z",
            "updated_by": null
        },
        {
            "id": 81,
            "remote_transaction_id": "225718814",
            "organization": 1,
            "amount": "2000.0000",
            "currency": 2,
            "phonenumber": "+256752466772",
            "payment_date": "2015-07-14T10:26:32Z",
            "reference": "Payment Ian M",
            "status": "successful",
            "created": "2015-07-14T10:27:08Z",
            "author": null,
            "modified": "2015-07-14T10:27:11Z",
            "updated_by": null
        },
        {
            "id": 77,
            "remote_transaction_id": "215569420",
            "organization": 1,
            "amount": "500.0000",
            "currency": 2,
            "phonenumber": "+256756145947",
            "payment_date": "2015-06-25T08:16:26Z",
            "reference": "payment 10",
            "status": "successful",
            "created": "2015-06-25T08:17:07Z",
            "author": null,
            "modified": "2015-06-25T08:17:18Z",
            "updated_by": null
        },
	]
}
```

To retrieve a list of all collections, make a GET request to the collections endpoint. This will return a list of collection objects.

## Filtering collections

> Sample Request:

```shell
curl https://app.beyonic.com/api/collections?phonenumber=+256772712893&remote_transaction_id=SS12312 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::Collection.list(
  phonenumber: "+256772712893",
  remote_transaction_id: "SS12312"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_Collection::getAll(array(
  "phonenumber" => "+256772712893",
  "remote_transaction_id" => "SS12312"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.Collection.list(phonenumber='+256772712893',
                                     remote_transaction_id='SS12312')


```

> Sample Response (JSON)

```json
[
       {
        "id": 134,
        "phonenumber": "+256XXXXXX",
        "remote_transaction_id": "ASDCECASF",
        "payment_date": "2014-11-22T20:57:04Z",
        "reference": "Test Payment",
        "amount": 3000.000,
        "currency": "UGX",
        "status": "successful"
       }
]
```

You can search or filter collections on the following fields. Simply add them to your request as shown in the examples. You can combine multiple filters. Note that filters return exact matches only (the phonenumber field is treated differently - see below).

* amount - the transaction amount
* currency - the currency code
* phonenumber - the phonenumber that the collection request was intended for. Note that the phonenumber will be matched in international format, starting with a '+' sign. If the '+' sign isn't included in your request, it will be appended before attempting to match your request. This is only true for phone number searches with collections, to make claiming of transactions easier. Other 
* reference - the reference code that the customer used when sending the collection
* remote_transaction_id - the transation id or transaction reference of the collection on the mobile network operator's side
* collection_request - the ID of the collection request that this collection was matched to


**Response**

Note that the response will be a list of collections, not a single collection.

## Claiming an ummatched collection

> Sample Request:

```shell
curl https://app.beyonic.com/api/collections?phonenumber=+256772712893&remote_transaction_id=SS12312&claim=True&amount=200 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = Beyonic::Collection.list(
  phonenumber: "+256772712893",
  remote_transaction_id: "SS12312",
  claim: true,
  amount: 200
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$collection = Beyonic_Collection::getAll(array(
  "phonenumber" => "+256772712893",
  "remote_transaction_id" => "SS12312",
  "claim" => "True",
  "amount" => "200",
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

collection = beyonic.Collection.list(phonenumber='+256772712893',
                                     remote_transaction_id='SS12312',
                                     claim=True,
                                     amount='200')


```

> Sample Response (JSON)

```json
[
       {
        "id": 134,
        "phonenumber": "+256XXXXXX",
        "remote_transaction_id": "ASDCECASF",
        "payment_date": "2014-11-22T20:57:04Z",
        "reference": "Test Payment",
        "amount": 3000.000,
        "currency": "UGX",
        "status": "successful"
       }
]
```

By default, when you search for a collection, only collections that have been successfully assigned to your organization are searched. 

You can add the "claim" parameter to instruct Beyonic to also search unmatched collections, and if any of the unmatched collections match your input, they will be assigned to your organization. 

Note that when you include the claim parameter, you **must** also include the amount, remote_transaction_id and phonenumber parameters. Failure to do so will result in an error.

Also note that the phonenumber will be matched in international format, starting with a '+' sign. Partial phone number matches will fail when you try to claim a transaction. If the '+' sign isn't included in your request, it will be appended before attempting to match your request.

Parameter | Type | Example | Notes
----------| ---- | ------- | -----
claim | Boolean or String | True | Instruct system to search unmatched transctions and claim them for your organization.

**Response**

Note that the response will be a list of collections, not a single collection.

