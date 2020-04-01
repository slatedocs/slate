## <u>Factory Log</u>
Product logs from factory and repair centres. (Used to be stored in influx)


### <u>The factory_log object</u>

Field | Description
------:|:------------
__factory_log_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each factory_log.
__app_name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__product_imei__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson"></font> | 
__<a href="/#repair">repair_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__timestamp__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__tags__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
__fields__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
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

> An example POST request. Note that `factory_log_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "https://smartapi.bboxx.co.uk/v1/factory_logs"
    data = json.dumps({
		"app_name": "test",
		"product_imei": "000000000000000",
		"repair_id": 1,
		"timestamp": "2000-01-01 00:00:00",
		"tags": Unknown column type,
		"fields": Unknown column type,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"factory_log_id": 1
		"app_name": "test",
		"product_imei": "000000000000000",
		"repair_id": 1,
		"timestamp": "2000-01-01 00:00:00",
		"tags": Unknown column type,
		"fields": Unknown column type,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `factory_log` created by specifying its `factory_log_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/factory_logs/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"factory_log_id": 1
		"app_name": "test",
		"product_imei": "000000000000000",
		"repair_id": 1,
		"timestamp": "2000-01-01 00:00:00",
		"tags": Unknown column type,
		"fields": Unknown column type,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `factory_logs` by omitting the `factory_log_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/factory_logs'
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

> `PUT` requests are not allowed at this endpoint

> `DELETE` requests are not allowed at this endpoint



### POST
     | value
 ----:|:---
endpoint | `/v1/factory_logs`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `factory_log` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/factory_logs` or `/v1/factory_logs/<factory_log_id>`
method | `GET`
url_params | `factory_log_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    