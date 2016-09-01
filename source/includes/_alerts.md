## <u>Alert</u>
This description is not yet complete it should be filled in!


### <u>The alert object</u>

Field | Description
------:|:------------
__alert_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each alert.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#alert-type">alert_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__start_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__dismissed_at__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__dismissed_by__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__dismissal_reason__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__<a href="/#repair">repair_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__extra_info__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__customer_called_date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record


<br>

Relationship | Description
-------------:|:------------
<font color="DarkGray">N/A</font> | <font color="DarkGray">_There are no relatioships for this table._</font>

<hr>
<br>

> An example POST request. Note that `alert_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/alerts"
    data = json.dumps({
		"modified_by": "test",
		"product_imei": "000000000000000",
		"alert_type_id": 1,
		"start_time": "2000-01-01 00:00:00",
		"dismissed_at": "2000-01-01 00:00:00",
		"dismissed_by": "test",
		"dismissal_reason": "test",
		"repair_id": 1,
		"extra_info": "test",
		"customer_called_date": "2000-01-01 00:00:00",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"alert_id": 1
		"modified_by": "test",
		"product_imei": "000000000000000",
		"alert_type_id": 1,
		"start_time": "2000-01-01 00:00:00",
		"dismissed_at": "2000-01-01 00:00:00",
		"dismissed_by": "test",
		"dismissal_reason": "test",
		"repair_id": 1,
		"extra_info": "test",
		"customer_called_date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

    > We can retrieve the `alert` created by specifying its `alert_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alerts/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"alert_id": 1
		"modified_by": "test",
		"product_imei": "000000000000000",
		"alert_type_id": 1,
		"start_time": "2000-01-01 00:00:00",
		"dismissed_at": "2000-01-01 00:00:00",
		"dismissed_by": "test",
		"dismissal_reason": "test",
		"repair_id": 1,
		"extra_info": "test",
		"customer_called_date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `alerts` by omitting the `alert_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alerts'
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

> We can edit the newly created `alert` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alerts'
    data = json.dumps({
		"modified_by": "changed",
		"product_imei": "999999999999999",
		"alert_type_id": 2,
		"start_time": "2016-07-01 12:34:45",
		"dismissed_at": "2016-07-01 12:34:45",
		"dismissed_by": "changed",
		"dismissal_reason": "changed",
		"repair_id": 2,
		"extra_info": "changed",
		"customer_called_date": "2016-07-01 12:34:45",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"alert_id": 1
		"modified_by": "changed",
		"product_imei": "999999999999999",
		"alert_type_id": 2,
		"start_time": "2016-07-01 12:34:45",
		"dismissed_at": "2016-07-01 12:34:45",
		"dismissed_by": "changed",
		"dismissal_reason": "changed",
		"repair_id": 2,
		"extra_info": "changed",
		"customer_called_date": "2016-07-01 12:34:45",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `alert`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alerts/1'
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
endpoint | `/v1/alerts`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `alert` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/alerts` or `/v1/alerts/<alert_id>`
method | `GET`
url_params | `alert_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/alerts/<alert_id>`
method | `PUT`
url_params | `alert_id` of the alert you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/alerts/<alert_id>`
method | `DELETE`
url_params | `alert_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    