# Contacts

Contacts represent people whom you can send payments to, or receive payments from. The contacts api method allows you to add, retrieve, list and update contacts in your Beyonic account. Contacts are also added automatically whenever you send a payment to a new phone number.

The contacts api endpoint is https://app.beyonic.com/api/contacts

## Creating a new contact

> Sample Request:

```shell
curl https://app.beyonic.com/api/contacts -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900" \
-d first_name='John' \
-d last_name='Doe' \
-d phone_number='+256712954253' \
-d email='john.doe@beyonic.com' \
-d metadata.my_id='123ASDAsd123'
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

payment = Beyonic::Contact.create(
    phonenumber: "+256773712831",
    first_name: "John",
    last_name: "Doe",
    email: "john.doe@beyonic.com",
    'metadata.my_id': "123ASDAsd123"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

Beyonic_Contact::create(array(
  "phonenumber" => "+256773712831",
  "first_name" => "John",
  "last_name" => "Doe",
  "email" => "john.doe@beyonic.com",
  "metadata.my_id" => "123ASDAsd123"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

kwargs = {'metadata.my_id': '123ASDAsd123'}

beyonic.Contact.create(phonenumber='+256773712831',
                       first_name='John', 
                       last_name='Doe',
                       email='john.doe@beyonic.com',
                       **kwargs
                       )
```

> Sample Response (JSON):

```json
{
    "id": 26,
    "organization": "Beyonic",
    "first_name": "Suzanne",
    "last_name": "Kwagala",
    "email": "suzanne@beyonic.com",
    "phone_number": "+256784522611",
    "type": "employee",
    "status": "active",
    "metadata": null,
    "created": "2013-09-19T21:26:10Z",
    "author": 1,
    "modified": "2015-04-14T18:21:47Z",
    "updated_by": 42
}
```

To create a new contact, make a POST to the endpoint above, with the attributes below.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
phonenumber | Yes | String | +256773712831 | Must be in international format
first_name | Yes | String | John | The contact's first name
last_name | Yes | String | Doe | The contact's last name
email | No | String | john.doe@beyonic.com | The contact's email address
metadata | No | JSON String | "{'my_id': '123ASDAsd123'}" | Custom attributes to store with this object. See the Metadata section for more information.

## Retrieving a single contact

> Sample Request:

```shell
curl https://app.beyonic.com/api/contacts/23 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = Beyonic::Contact.get(23)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contact = Beyonic_Contact::get(23);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = beyonic.Contact.get(23)

```
> Sample Response (JSON):

```json
{
    "id": 23,
    "organization": "Beyonic",
    "first_name": "Suzanne",
    "last_name": "Kwagala",
    "email": "suzanne@beyonic.com",
    "phone_number": "+256784522611",
    "type": "employee",
    "status": "active",
    "metadata": null,
    "created": "2013-09-19T21:26:10Z",
    "author": 1,
    "modified": "2015-04-14T18:21:47Z",
    "updated_by": 42
}
```

To retrieve a single contact, provide the contact id and a contact object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 23 | The id of the contact you want to retrieve

## Listing all contacts

> Sample Request:

```shell
curl https://app.beyonic.com/api/contacts -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = Beyonic::Contact.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contact = Beyonic_Contact::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = beyonic.Contact.list()

```

> Sample Response (JSON)

```json
{
    "count": 2,
    "next": "https://app.beyonic.com/api/contacts?offset=10",
    "previous": null,
    "results": [
        {
            "id": 1146,
            "organization": "Demo Org",
            "first_name": "Eliana",
            "last_name": "Kalema",
            "email": null,
            "phone_number": "+25677XXXXXX",
            "type": "other",
            "status": "active",
            "metadata": null,
            "created": "2015-02-13T04:22:31Z",
            "author": 7,
            "modified": "2015-02-26T13:00:35Z",
            "updated_by": 1
        },
        {
            "id": 1175,
            "organization": "Demo Org",
            "first_name": "Trina",
            "last_name": "Faith",
            "email": null,
            "phone_number": "+25677XXXXXX",
            "type": "employee",
            "status": "active",
            "metadata": null,
            "created": "2015-02-18T11:52:43Z",
            "author": 137,
            "modified": "2015-02-26T13:00:35Z",
            "updated_by": 1
        },
    ]
}
```

To retrieve a list of all contacts, make a GET request to the contact end point. This will return a list of contacts. 

* **Ordering**: Remember that you can order the list. Look at the ordering section for more information.
* **Pagination**: You can also paginate the list of contacts. Look at the pagination section for more information.

