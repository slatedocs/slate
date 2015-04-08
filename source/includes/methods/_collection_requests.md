## Collection Requests

Collection Requests are a way to notify us that you are expecting a a specific subscriber to send money to you.

Creating a collection request prior to receiving an expected collection greatly improves the user experience for your subscribers by automatically matching transactions to your organization, even if the subscriber misses out some information or gets some of the information wrong, for example if they forget to include a reference code. Payments matching the amount, number and currency in the collection requests will be correctly assigned to you.

Note: Currently, collection requests **do not** initiate any interaction with the subscriber. In the future, they will be used to "pull" payments from subscribers by sending payment instructions to the subscriber on supported networks.

The collection requests api endpoint is https://app.beyonic.com/api/collectionrequests

### Creating a new collection request

> Example Request:

```shell
curl https://app.beyonic.com/api/collectionrequests -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d phonenumber=+256772781923 \
-d currency=UGX \
-d amount=3000
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::CollectionRequest.create(
    phonenumber: "+256773712831",
    amount: "100.2",
    currency: "UGX"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_CollectionRequest::create(array(
  "phonenumber" => "+256773712831",
  "amount" => "100.2",
  "currency" => "UGX"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

beyonic.CollectionRequest.create(phonenumber='+256773712831',
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
    "phone_number": "+256772781923",
    "created": "2014-11-22T20:57:04.017Z",
    "author": 15,
    "modified": "2014-11-22T20:57:04.018Z",
    "updated_by": null,
}
```

To create a new collection, make a POST to the endpoint above, with the attributes below.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +256773712831 | Must be in international format
amount | Yes | String, Integer or Decimal | 3000 | Do not include thousands separators
currency | Yes | String | UGX | 3 letter ISO currency code. No currency conversion is done, so the currency must be valid for the selected phonenumber. You must have funded Beyonic an account in this currency. If your account for this currency has zero balance, your payment will fail.

### Retrieving a single collection request

> Retrieve Individual Collections:

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

To retrieve a single collection request, provide the collection request id and a collection request object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 23 | The id of the collection you want to retrieve

### Listing all collection requests

> List Collection Requests:

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

> Response Object List

```json
[
       {
        "id": 134,
        "phonenumber": "+256XXXXXX",
        "amount": 3000.000,
        "currency": "UGX",
        "created": "2014-11-22T20:57:04.017Z",
        "author": 15,
        "modified": "2014-11-22T20:57:04.018Z",
        "updated_by": null,
       }
]
```

To retrieve a list of all collections, make a GET request to the collections endpoint. This will return a list of collection objects.