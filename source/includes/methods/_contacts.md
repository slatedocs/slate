# Contacts

## Introduction

Contacts represent people whom you can send payments to, or receive payments from. The contacts api method allows you to add, retrieve, list and update contacts in your Beyonic account. Contacts are also added automatically whenever you send a payment to a new phone number.

The contacts api endpoint is https://app.beyonic.com/api/contacts

## The contact object

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
organization | long integer | The ID of the organization that the contact belongs to. (This is usually your organization ID)
first_name | string | The contact's first name
last_name | string | The contact's last name
email | string | The contact's email address
phone_number | string | The contact's phone number, in international format, starting with a +
type | string | The contact's type, as set in the system. One of: employee, beneficiary, vendor, other OR a custom string
status | string | The contact's status. One of: active or inactive
metadata | hash | Any custom metadata that was added to the contact object at creation time
created | string | The date that the contact was created, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
author | long integer | The ID of the user who created the contact
modified | string | The date that the contact was last modified, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
updated_by | string | The ID of the user who last updated the contact


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

## Filtering contacts

> Sample Request:

```shell
curl https://app.beyonic.com/api/contacts?first_name=luke -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = Beyonic::Contact.list(
  first_name: "luke"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contact = Beyonic_Contact::getAll(array(
  "first_name" => "luke"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = beyonic.Contact.list(first_name='luke')

```

You can search or filter contacts on the following fields. Simply add them to your request as shown in the examples. You can combine multiple filters. Note that filters return exact matches only. (The phone_number field is treated differently - see below).

* first_name - the contact's first name
* last_name - the contact's last name
* email - the contact's email 
* phone_number - the contact's phone number. Note that the phonenumber will be matched in international format, starting with a '+' sign. If the '+' sign isn't included in your request, it will be appended before attempting to match your request.

