# Collections

Collections are payments sent to you from mobile subscribers. See ['how collections work']](http://support.beyonic.com/how-collections-work/) for more information.

When the user sends in a payment, it will create a collection object that you can access via the Collections API using the methods shown below.

The collections api endpoint is https://app.beyonic.com/api/collections

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

## Searching for a collection

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

$collection = Beyonic_Collection::getAll(
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

You can search for a specific payment by passing two parameters to the list() method. Both parameters are required.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +25677271289 | The phone number that sent the payment you are searching for
remote_transaction_id | Yes | String | SS12312 | The transaction id that the subscriber received from the telecom company when they made that payment.

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

$collection = Beyonic_Collection::getAll(
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

You can add two more parameters to instruct Beyonic to also search unmatched collections, and if any of the unmatched collections match your input, they will be assigned to your organization. 

Note that these parameters are **in addition** to the ones used when searching for a collection. These two additional parameters are included below:

Parameter | Required | Type | Example | Notes
----------| -------- | ---- | ------- | -----
claim | Yes | Boolean or String | True | Instruct system to search unmatched transctions and claim them for your organization.
amount | Yes | String, Integer or Decimal | 3000 | Do not include thousands separators. This must be included if the "claim" parameter is used. The currency is inferred from the phone number

**Response**

Note that the response will be a list of collections, not a single collection.