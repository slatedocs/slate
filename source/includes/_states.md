## <u>State</u>
This description is not yet complete it should be filled in!


### <u>The state object</u>

Field | Description
------:|:------------
__state_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each state.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#prev_state_t">prev_state_type</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#current_state_t">current_state_type</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------

 There are no relatioships for this table.

### <u>HTTP Requests</u>
> An example POST request. Note that state_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/states"
    data = json.dumps({
		"product_imei": "000000000000000",
		"prev_state_type": 1,
		"current_state_type": 1,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"state_id": 1
		"product_imei": "000000000000000",
		"prev_state_type": 1,
		"current_state_type": 1,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `state` created by specifying its `state_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/states/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"state_id": 1
		"product_imei": "000000000000000",
		"prev_state_type": 1,
		"current_state_type": 1,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all states by omitted the state_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/states'
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

> We can edit the newly created state with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/states'
    data = json.dumps({
		"product_imei": "999999999999999",
		"prev_state_type": 2,
		"current_state_type": 2,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"state_id": 1
		"product_imei": "999999999999999",
		"prev_state_type": 2,
		"current_state_type": 2,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the state

```python
    url = 'http://smartapi.bboxx.co.uk/v1/states/1'
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
endpoint | `/v1/states`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `state` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/states` or `/v1/states/<state_id>`
method | `GET`
url_params | `state_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/states/<state_id>`
method | `PUT`
url_params | `state_id` of the state you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/states/<state_id>`
method | `DELETE`
url_params | state_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    