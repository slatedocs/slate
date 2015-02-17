## Collections

Collections are payments sent to you from mobile subscribers. See ['how collections work']](http://support.beyonic.com/how-collections-work/) for more information.

When the user sends in a payment, it will create a collection object that you can access via the Collections API using the methods shown below.

The collections api endpoint is https://app.beyonic.com/api/collections

### Retrieving a single collection

> Retrieve Individual Collections:

```shell
curl https://app.beyonic.com/api/collections/230 -H "Authorization: Token my-authorization-token"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'

collection = Beyonic::Collection.get(23)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");

$collection = Beyonic_Collection::get(23);
?>
```

```python
import beyonic
beyonic.api_version = 'v1'

...
# Please check back soon for python examples.
```

To retrieve a single collection object, provide the collection id and a collection object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 23 | The id of the collection you want to retrieve

### Listing all collections

> List Collections:

```shell
curl https://app.beyonic.com/api/collections -H "Authorization: Token my-authorization-token"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'

collection = Beyonic::Collection.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");

$collection = Beyonic_Collection::getAll();
?>
```

```python
import beyonic
beyonic.api_version = 'v1'

...
# Please check back soon for python examples.
```

> Response Object List

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

To retrieve a list of all collections, make a GET request to the collections endpoint. This will return a list of collection objects.

### Searching for a collection

> Search For Collections:

```shell
curl https://app.beyonic.com/api/collections?phonenumber=+256772712893&remote_transaction_id=SS12312 -H "Authorization: Token my-authorization-token"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'my-api-key'

collection = Beyonic::Collection.list(
  phonenumber: "+256772712893",
  remote_transaction_id: "SS12312"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiVersion("v1");

$collection = Beyonic_Collection::getAll(
  "phonenumber" => "+256772712893",
  "remote_transaction_id" => "SS12312"
));
?>
```

```python
import beyonic
beyonic.api_version = 'v1'

...
# Please check back soon for python examples.
```

> Response Object From Search

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

You can search for a specific payment by passing two parameters to the list() method. Both parameters are required

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +25677271289 | The phone number that sent the payment you are searching for
remote_transaction_id | Yes | String | SS12312 | The transaction id that the subscriber received from the telecom company when they made that payment

**Response**

Note that the response will be a list of collections, not a single collection.