## <u>Customer Product History</u>
This description is not yet complete it should be filled in!


### <u>The customer_product_history object</u>

Field | Description
------:|:------------
__customer_product_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each customer_product_history.
__<a href="/#product#">customer_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#product_i#">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__date_added__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__date_removed__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__removal_reason__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------

 There are no relatioships for this table.

### <u>HTTP Requests</u>
> An example POST request. Note that customer_product_history_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/customer_product_histories"
    data = json.dumps({
		"customer_id": 1,
		"product_imei": "000000000000000",
		"date_added": "2000-01-01 00:00:00",
		"date_removed": "2000-01-01 00:00:00",
		"removal_reason": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"customer_product_history_id": 1
		"customer_id": 1,
		"product_imei": "000000000000000",
		"date_added": "2000-01-01 00:00:00",
		"date_removed": "2000-01-01 00:00:00",
		"removal_reason": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `customer_product_history` created by specifying its `customer_product_history_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customer_product_histories/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"customer_product_history_id": 1
		"customer_id": 1,
		"product_imei": "000000000000000",
		"date_added": "2000-01-01 00:00:00",
		"date_removed": "2000-01-01 00:00:00",
		"removal_reason": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all customer_product_histories by omitted the customer_product_history_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customer_product_histories'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

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

> We can edit the newly created customer_product_history with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customer_product_histories'
    data = json.dumps({
		"customer_id": 2,
		"product_imei": "999999999999999",
		"date_added": "2016-07-01 12:34:45",
		"date_removed": "2016-07-01 12:34:45",
		"removal_reason": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"customer_product_history_id": 1
		"customer_id": 2,
		"product_imei": "999999999999999",
		"date_added": "2016-07-01 12:34:45",
		"date_removed": "2016-07-01 12:34:45",
		"removal_reason": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the customer_product_history

```python
    url = 'http://smartapi.bboxx.co.uk/v1/customer_product_histories/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.


### POST
     | value
 ----:|:---
endpoint | `/v1/customer_product_histories`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `customer_product_history` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/customer_product_histories` or `/v1/customer_product_histories/<customer_product_history_id>`
method | `GET`
url_params | `customer_product_history_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/customer_product_histories/<customer_product_history_id>`
method | `PUT`
url_params | `customer_product_history_id` of the customer_product_history you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/customer_product_histories/<customer_product_history_id>`
method | `DELETE`
url_params | customer_product_history_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    