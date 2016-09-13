## <u>Anomaly</u>
This description is not yet complete it should be filled in!


### <u>The anomaly object</u>

Field | Description
------:|:------------
__anomaly_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each anomaly.
__<a href="/#anomaly-type">anomaly_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__start_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__end_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
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

> An example POST request. Note that `anomaly_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/anomalies"
    data = json.dumps({
		"modified_by": "test",
		"anomaly_type_id": 1,
		"product_imei": "000000000000000",
		"start_time": "2000-01-01 00:00:00",
		"end_time": "2000-01-01 00:00:00",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"anomaly_id": 1
		"modified_by": "test",
		"anomaly_type_id": 1,
		"product_imei": "000000000000000",
		"start_time": "2000-01-01 00:00:00",
		"end_time": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

    > We can retrieve the `anomaly` created by specifying its `anomaly_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomalies/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"anomaly_id": 1
		"modified_by": "test",
		"anomaly_type_id": 1,
		"product_imei": "000000000000000",
		"start_time": "2000-01-01 00:00:00",
		"end_time": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `anomalies` by omitting the `anomaly_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomalies'
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

> We can edit the newly created `anomaly` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomalies/1'
    data = json.dumps({
		"modified_by": "changed",
		"anomaly_type_id": 2,
		"product_imei": "999999999999999",
		"start_time": "2016-07-01 12:34:45",
		"end_time": "2016-07-01 12:34:45",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"anomaly_id": 1
		"modified_by": "changed",
		"anomaly_type_id": 2,
		"product_imei": "999999999999999",
		"start_time": "2016-07-01 12:34:45",
		"end_time": "2016-07-01 12:34:45",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `anomaly`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomalies/1'
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
endpoint | `/v1/anomalies`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `anomaly` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/anomalies` or `/v1/anomalies/<anomaly_id>`
method | `GET`
url_params | `anomaly_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/anomalies/<anomaly_id>`
method | `PUT`
url_params | `anomaly_id` of the anomaly you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/anomalies/<anomaly_id>`
method | `DELETE`
url_params | `anomaly_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    