## <u>Analysis History</u>
Records which analyses have been run on which units and at what time.


### <u>The analysis_history object</u>

Field | Description
------:|:------------
__analysis_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each analysis_history.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#alert-type">alert_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__timestamp__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__status__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | <br><font color="DodgerBlue">options: ["success", "failure"]</font>
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
<font color="DarkGray">N/A</font> | <font color="DarkGray">_There are no relationships for this table._</font>

<hr>
<br>

> An example POST request. Note that `analysis_history_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/analysis_history"
    data = json.dumps({
		"product_imei": "000000000000000",
		"alert_type_id": 1,
		"timestamp": "2000-01-01 00:00:00",
		"status": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"analysis_history_id": 1
		"product_imei": "000000000000000",
		"alert_type_id": 1,
		"timestamp": "2000-01-01 00:00:00",
		"status": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

    > We can retrieve the `analysis_history` created by specifying its `analysis_history_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/analysis_history/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"analysis_history_id": 1
		"product_imei": "000000000000000",
		"alert_type_id": 1,
		"timestamp": "2000-01-01 00:00:00",
		"status": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `analysis_history` by omitting the `analysis_history_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/analysis_history'
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

> We can edit the newly created `analysis_history` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/analysis_history/1'
    data = json.dumps({
		"product_imei": "999999999999999",
		"alert_type_id": 2,
		"timestamp": "2016-07-01 12:34:45",
		"status": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"analysis_history_id": 1
		"product_imei": "999999999999999",
		"alert_type_id": 2,
		"timestamp": "2016-07-01 12:34:45",
		"status": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `analysis_history`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/analysis_history/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

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
endpoint | `/v1/analysis_history`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `analysis_history` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/analysis_history` or `/v1/analysis_history/<analysis_history_id>`
method | `GET`
url_params | `analysis_history_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/analysis_history/<analysis_history_id>`
method | `PUT`
url_params | `analysis_history_id` of the analysis_history you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/analysis_history/<analysis_history_id>`
method | `DELETE`
url_params | `analysis_history_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    