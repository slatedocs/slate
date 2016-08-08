## <u>Sms History</u>
This description is not yet complete it should be filled in!


### <u>The sms_history object</u>

Field | Description
------:|:------------
__sms_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each sms_history.
__attempted_retries__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null)</font> | 
__<a href="/#product#">enable_history_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__message_reference__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__message__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__<a href="/#product_i#">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__sent_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__sms_timeout__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__status__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__trigger__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------

 There are no relatioships for this table.

### <u>HTTP Requests</u>
> An example POST request. Note that sms_history_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/sms_histories"
    data = json.dumps({
		"attempted_retries": 1,
		"enable_history_id": 1,
		"message_reference": "test",
		"message": "test",
		"product_imei": "000000000000000",
		"sent_time": "2000-01-01 00:00:00",
		"sms_timeout": "2000-01-01 00:00:00",
		"status": "test",
		"trigger": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"sms_history_id": 1
		"attempted_retries": 1,
		"enable_history_id": 1,
		"message_reference": "test",
		"message": "test",
		"product_imei": "000000000000000",
		"sent_time": "2000-01-01 00:00:00",
		"sms_timeout": "2000-01-01 00:00:00",
		"status": "test",
		"trigger": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `sms_history` created by specifying its `sms_history_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sms_histories/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"sms_history_id": 1
		"attempted_retries": 1,
		"enable_history_id": 1,
		"message_reference": "test",
		"message": "test",
		"product_imei": "000000000000000",
		"sent_time": "2000-01-01 00:00:00",
		"sms_timeout": "2000-01-01 00:00:00",
		"status": "test",
		"trigger": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all sms_histories by omitted the sms_history_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sms_histories'
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

> We can edit the newly created sms_history with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sms_histories'
    data = json.dumps({
		"attempted_retries": 2,
		"enable_history_id": 2,
		"message_reference": "changed",
		"message": "changed",
		"product_imei": "999999999999999",
		"sent_time": "2016-07-01 12:34:45",
		"sms_timeout": "2016-07-01 12:34:45",
		"status": "changed",
		"trigger": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"sms_history_id": 1
		"attempted_retries": 2,
		"enable_history_id": 2,
		"message_reference": "changed",
		"message": "changed",
		"product_imei": "999999999999999",
		"sent_time": "2016-07-01 12:34:45",
		"sms_timeout": "2016-07-01 12:34:45",
		"status": "changed",
		"trigger": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the sms_history

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sms_histories/1'
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
endpoint | `/v1/sms_histories`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `sms_history` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/sms_histories` or `/v1/sms_histories/<sms_history_id>`
method | `GET`
url_params | `sms_history_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/sms_histories/<sms_history_id>`
method | `PUT`
url_params | `sms_history_id` of the sms_history you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/sms_histories/<sms_history_id>`
method | `DELETE`
url_params | sms_history_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    