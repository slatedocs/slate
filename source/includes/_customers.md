## <u>Customer</u>
This description is not yet complete it should be filled in!


### <u>The customer object</u>

Field | Description
------:|:------------
__customer_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each customer.
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__external_customer_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__external_customer_code__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record


<br>

Relationship | Description
-------------:|:------------
__customer_product_history__ | The associated customer_product_history
__customer_entity_linker__ | The associated customer_entity_linker


<hr>
<br>

> `POST` requests are not allowed at this endpoint

> We can retrieve the `customer` created by specifying its `customer_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customers/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"customer_id": 1
		"name": "test",
		"external_customer_id": 1,
		"external_customer_code": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `customers` by omitting the `customer_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customers'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        u'total_pages': 1,
        u'objects': [
            {<record>},
            {<record>},
            {<record>},
            {<record>},
            {<record>},
        ],
        u'num_results': 10,
        u'page': 1
    }
```

> We can edit the newly created `customer` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customers/1'
    data = json.dumps({
		"name": "changed",
		"external_customer_id": 2,
		"external_customer_code": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"customer_id": 1
		"name": "changed",
		"external_customer_id": 2,
		"external_customer_code": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `customer`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customers/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.



### POST
`POST` requests are not allowed at this endpoint

### GET
     | value
 ----:|:---
endpoint | `/v1/customers` or `/v1/customers/<customer_id>`
method | `GET`
url_params | `customer_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/customers/<customer_id>`
method | `PUT`
url_params | `customer_id` of the customer you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/customers/<customer_id>`
method | `DELETE`
url_params | `customer_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    