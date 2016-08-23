## <u>Alert Type</u>
This description is not yet complete it should be filled in!


### <u>The alert_type object</u>

Field | Description
------:|:------------
__alert_type_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each alert_type.
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__version__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null)</font> | 
__category__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__purpose__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__message__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__status__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__severity__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


<br>

Relationship | Description
-------------:|:------------
__alerts__ | The associated alerts
__alert_type_anomaly_type_linker__ | The associated alert_type_anomaly_type_linker
__alert_type_product_type_linker__ | The associated alert_type_product_type_linker


<hr>
<br>

> An example POST request. Note that `alert_type_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/alert_types"
    data = json.dumps({
		"name": "test",
		"version": 1,
		"category": "test",
		"purpose": "test",
		"message": "test",
		"status": "test",
		"severity": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"alert_type_id": 1
		"name": "test",
		"version": 1,
		"category": "test",
		"purpose": "test",
		"message": "test",
		"status": "test",
		"severity": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `alert_type` created by specifying its `alert_type_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alert_types/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"alert_type_id": 1
		"name": "test",
		"version": 1,
		"category": "test",
		"purpose": "test",
		"message": "test",
		"status": "test",
		"severity": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `alert_types` by omitting the `alert_type_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alert_types'
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

> We can edit the newly created `alert_type` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alert_types'
    data = json.dumps({
		"name": "changed",
		"version": 2,
		"category": "changed",
		"purpose": "changed",
		"message": "changed",
		"status": "changed",
		"severity": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"alert_type_id": 1
		"name": "changed",
		"version": 2,
		"category": "changed",
		"purpose": "changed",
		"message": "changed",
		"status": "changed",
		"severity": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `alert_type`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/alert_types/1'
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
endpoint | `/v1/alert_types`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `alert_type` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/alert_types` or `/v1/alert_types/<alert_type_id>`
method | `GET`
url_params | `alert_type_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/alert_types/<alert_type_id>`
method | `PUT`
url_params | `alert_type_id` of the alert_type you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/alert_types/<alert_type_id>`
method | `DELETE`
url_params | `alert_type_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    