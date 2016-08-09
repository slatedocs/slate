## <u>Tamper Enable History</u>
This description is not yet complete it should be filled in!


### <u>The tamper_enable_history object</u>

Field | Description
------:|:------------
__tamper_enable_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each tamper_enable_history.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__prev_tamper_enable_state__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | <br><font color="DodgerBlue">options: [pending_enabled, pending_disabled, init, enabled, disabled]</font>
__current_tamper_enable_state__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | <br><font color="DodgerBlue">options: [pending_enabled, pending_disabled, init, enabled, disabled]</font>
__user__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------

 There are no relatioships for this table.

### <u>HTTP Requests</u>
> An example POST request. Note that tamper_enable_history_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/tamper_enable_history"
    data = json.dumps({
		"product_imei": "000000000000000",
		"prev_tamper_enable_state": "test",
		"current_tamper_enable_state": "test",
		"user": "test",
		"date": "2000-01-01 00:00:00",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"tamper_enable_history_id": 1
		"product_imei": "000000000000000",
		"prev_tamper_enable_state": "test",
		"current_tamper_enable_state": "test",
		"user": "test",
		"date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `tamper_enable_history` created by specifying its `tamper_enable_history_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_history/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"tamper_enable_history_id": 1
		"product_imei": "000000000000000",
		"prev_tamper_enable_state": "test",
		"current_tamper_enable_state": "test",
		"user": "test",
		"date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all tamper_enable_history by omitted the tamper_enable_history_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_history'
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

> We can edit the newly created tamper_enable_history with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_history'
    data = json.dumps({
		"product_imei": "999999999999999",
		"prev_tamper_enable_state": "changed",
		"current_tamper_enable_state": "changed",
		"user": "changed",
		"date": "2016-07-01 12:34:45",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"tamper_enable_history_id": 1
		"product_imei": "999999999999999",
		"prev_tamper_enable_state": "changed",
		"current_tamper_enable_state": "changed",
		"user": "changed",
		"date": "2016-07-01 12:34:45",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the tamper_enable_history

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_history/1'
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
endpoint | `/v1/tamper_enable_history`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `tamper_enable_history` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/tamper_enable_history` or `/v1/tamper_enable_history/<tamper_enable_history_id>`
method | `GET`
url_params | `tamper_enable_history_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/tamper_enable_history/<tamper_enable_history_id>`
method | `PUT`
url_params | `tamper_enable_history_id` of the tamper_enable_history you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/tamper_enable_history/<tamper_enable_history_id>`
method | `DELETE`
url_params | tamper_enable_history_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    