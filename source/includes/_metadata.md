# Metadata

> Example showing how to create a new payment with Metadata:

```shell
curl https://app.beyonic.com/api/payments -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d phonenumber=+256778122118 \
-d currency=UGX \
-d amount=30 \
-d description="Per diem payment" \
-d callback_url="https://my.website/payments/callback" \
-d metadata.id=1234 \
-d metadata.name=Lucy \
-d payment_type=money
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::Payment.create(
    phonenumber: "+256778122118",
    amount: "100.2",
    currency: "UGX",
    description: "Per diem payment",
    payment_type: "money",
    callback_url: "https://my.website/payments/callback",
    metadata: {"id": "1234", "name": "Lucy"}
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_Payment::create(array(
  "phonenumber" => "+256778122118",
  "amount" => "100.2",
  "currency" => "UGX",
  "description" => "Per diem payment",
  "payment_type" => "money",
  "callback_url" => "https://my.website/payments/callback",
  "metadata" => array("id"=>"1234", "name"=>"Lucy")
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

beyonic.Payment.create(phonenumber='+256778122118',
                       amount='1200',
                       currency='UGX',
                       description='Per diem',
                       callback_url='https://my.website/payments/callback',
                       metadata={'id': '1234', 'name': 'Lucy'}
                       )
```

Beyonic supports Metadata on the contact, payment and collection request APIs. 

Metadata allows you to add custom key-value attributes when creating objects. You can use metadata to track any 
information you want to track by attaching it to a contact, payment or collection request object.

For example, you can include a unique ID to identify a payment, or add more information about a Contact. 
This data will be returned when you retrieve the record later, and can be used to identify the record.

Metadata has the following constraints:

* Metadata attributes must be key-value pairs.
* Both the keys and values must be strings.
* For each record, you can have up to 10 custom attributes.

Metadata is added to the object a set of key-value pairs, where the key is in the format metadata.key_name, 
for example: metadata.id or metadata.name or metadata.date, and so on.

See the examples for more information.

### API methods that support metadata.

Not all API methods support metadata. Currently, the following API methods and their corresponding objects support metadata.

1. The payment API
2. The contacts API
3. The collection requests API

## Custom Fields

Custom Fields are similar to Metadata - they allow you to add custom data to some objects. Custom fields can be added to contacts,
payments or collection requests.

There are a couple of differences between custom fields and other metadata:

1. Custom fields are available through the web interface as well as the API. Metadata can be viewed through the web interface, but can only be created via the API.
2. Metadata keys and values can be created and edited through the API, while custom fields 'labels' can only be created through the web interface by your organization administrator. However, once custom fields have been created through the web interface, they can be updated or edited through the API as well.
3. Metadata consists of string-based keys and string-based values. Custom field keys are strings (starting with "s_"), but the values may be of different types, including strings, numbers, boolean values or enum values (restricted to a predefined set of values)

### Adding or updating custom field data

All internal custom field labels or keys start with "s_". To see the available custom fields, and their actual key names, you can read or list the related object records, as detailed in the respective APIs.

For example, to see custom fields that have been added to your payment object, list your payments. You can identify the custom fields by their keys, which all start with "s_".

Once you know the custom field key, you can update it's value just like any other metadata value.

### API methods that support custom fields.

Not all API methods support custom fields. Currently, the following API methods and their corresponding objects support custom fields.

1. The payment API
2. The contacts API
3. The collection requests API
