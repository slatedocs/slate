## <u>Connection</u>
This description is not yet complete it should be filled in!


### <u>The connection object</u>

Field | Description
------:|:------------
__connection_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each connection.
__<a href="/#product_i#">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(foreign-key)</font> | 
__location_failed_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__mcc__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__mnc__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_1_lac__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_1_cid__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_1_signal__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_2_lac__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_2_cid__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_2_signal__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_3_lac__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_3_cid__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_3_signal__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_4_lac__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_4_cid__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_4_signal__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_5_lac__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_5_cid__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_5_signal__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_6_lac__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_6_cid__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__cell_6_signal__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__latitude__ <br><font color="DarkGray">_varchar(12)_</font> <font color="Crimson"></font> | 
__longitude__ <br><font color="DarkGray">_varchar(12)_</font> <font color="Crimson"></font> | 
__error_radius__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__address__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__country_code__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------

 There are no relatioships for this table.

### <u>HTTP Requests</u>
> An example POST request. Note that connection_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/connections"
    data = json.dumps({
		"product_imei": "000000000000000",
		"location_failed_flag": True,
		"date": "2000-01-01 00:00:00",
		"mcc": 1,
		"mnc": 1,
		"cell_1_lac": 1,
		"cell_1_cid": 1,
		"cell_1_signal": 1,
		"cell_2_lac": 1,
		"cell_2_cid": 1,
		"cell_2_signal": 1,
		"cell_3_lac": 1,
		"cell_3_cid": 1,
		"cell_3_signal": 1,
		"cell_4_lac": 1,
		"cell_4_cid": 1,
		"cell_4_signal": 1,
		"cell_5_lac": 1,
		"cell_5_cid": 1,
		"cell_5_signal": 1,
		"cell_6_lac": 1,
		"cell_6_cid": 1,
		"cell_6_signal": 1,
		"latitude": -1.111111111,
		"longitude": -1.111111111,
		"error_radius": 1,
		"address": "test",
		"country_code": 1,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"connection_id": 1
		"product_imei": "000000000000000",
		"location_failed_flag": True,
		"date": "2000-01-01 00:00:00",
		"mcc": 1,
		"mnc": 1,
		"cell_1_lac": 1,
		"cell_1_cid": 1,
		"cell_1_signal": 1,
		"cell_2_lac": 1,
		"cell_2_cid": 1,
		"cell_2_signal": 1,
		"cell_3_lac": 1,
		"cell_3_cid": 1,
		"cell_3_signal": 1,
		"cell_4_lac": 1,
		"cell_4_cid": 1,
		"cell_4_signal": 1,
		"cell_5_lac": 1,
		"cell_5_cid": 1,
		"cell_5_signal": 1,
		"cell_6_lac": 1,
		"cell_6_cid": 1,
		"cell_6_signal": 1,
		"latitude": -1.111111111,
		"longitude": -1.111111111,
		"error_radius": 1,
		"address": "test",
		"country_code": 1,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `connection` created by specifying its `connection_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/connections/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"connection_id": 1
		"product_imei": "000000000000000",
		"location_failed_flag": True,
		"date": "2000-01-01 00:00:00",
		"mcc": 1,
		"mnc": 1,
		"cell_1_lac": 1,
		"cell_1_cid": 1,
		"cell_1_signal": 1,
		"cell_2_lac": 1,
		"cell_2_cid": 1,
		"cell_2_signal": 1,
		"cell_3_lac": 1,
		"cell_3_cid": 1,
		"cell_3_signal": 1,
		"cell_4_lac": 1,
		"cell_4_cid": 1,
		"cell_4_signal": 1,
		"cell_5_lac": 1,
		"cell_5_cid": 1,
		"cell_5_signal": 1,
		"cell_6_lac": 1,
		"cell_6_cid": 1,
		"cell_6_signal": 1,
		"latitude": -1.111111111,
		"longitude": -1.111111111,
		"error_radius": 1,
		"address": "test",
		"country_code": 1,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all connections by omitted the connection_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/connections'
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

> We can edit the newly created connection with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/connections'
    data = json.dumps({
		"product_imei": "999999999999999",
		"location_failed_flag": False,
		"date": "2016-07-01 12:34:45",
		"mcc": 2,
		"mnc": 2,
		"cell_1_lac": 2,
		"cell_1_cid": 2,
		"cell_1_signal": 2,
		"cell_2_lac": 2,
		"cell_2_cid": 2,
		"cell_2_signal": 2,
		"cell_3_lac": 2,
		"cell_3_cid": 2,
		"cell_3_signal": 2,
		"cell_4_lac": 2,
		"cell_4_cid": 2,
		"cell_4_signal": 2,
		"cell_5_lac": 2,
		"cell_5_cid": 2,
		"cell_5_signal": 2,
		"cell_6_lac": 2,
		"cell_6_cid": 2,
		"cell_6_signal": 2,
		"latitude": -9.999999999,
		"longitude": -9.999999999,
		"error_radius": 2,
		"address": "changed",
		"country_code": 2,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"connection_id": 1
		"product_imei": "999999999999999",
		"location_failed_flag": False,
		"date": "2016-07-01 12:34:45",
		"mcc": 2,
		"mnc": 2,
		"cell_1_lac": 2,
		"cell_1_cid": 2,
		"cell_1_signal": 2,
		"cell_2_lac": 2,
		"cell_2_cid": 2,
		"cell_2_signal": 2,
		"cell_3_lac": 2,
		"cell_3_cid": 2,
		"cell_3_signal": 2,
		"cell_4_lac": 2,
		"cell_4_cid": 2,
		"cell_4_signal": 2,
		"cell_5_lac": 2,
		"cell_5_cid": 2,
		"cell_5_signal": 2,
		"cell_6_lac": 2,
		"cell_6_cid": 2,
		"cell_6_signal": 2,
		"latitude": -9.999999999,
		"longitude": -9.999999999,
		"error_radius": 2,
		"address": "changed",
		"country_code": 2,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the connection

```python
    url = 'http://smartapi.bboxx.co.uk/v1/connections/1'
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
endpoint | `/v1/connections`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `connection` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/connections` or `/v1/connections/<connection_id>`
method | `GET`
url_params | `connection_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/connections/<connection_id>`
method | `PUT`
url_params | `connection_id` of the connection you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/connections/<connection_id>`
method | `DELETE`
url_params | connection_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    