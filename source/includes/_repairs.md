## <u>Repair</u>
This description is not yet complete it should be filled in!


### <u>The repair object</u>

Field | Description
------:|:------------
__repair_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each repair.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__customer_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__purchase_date__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
__arrival_date__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson">(not-null)</font> | 
__refurbishment_date__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
__package__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__process__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__measured_battery_capacity__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------
__alerts__ | The associated alerts
__repair_symptom_type_linker__ | The associated repair_symptom_type_linker


### <u>HTTP Requests</u>
> An example POST request. Note that repair_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/repairs"
    data = json.dumps({
		"product_imei": "000000000000000",
		"customer_id": "test",
		"purchase_date": Unknown column type,
		"arrival_date": Unknown column type,
		"refurbishment_date": Unknown column type,
		"package": "test",
		"process": "test",
		"measured_battery_capacity": Unknown column type,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"repair_id": 1
		"product_imei": "000000000000000",
		"customer_id": "test",
		"purchase_date": Unknown column type,
		"arrival_date": Unknown column type,
		"refurbishment_date": Unknown column type,
		"package": "test",
		"process": "test",
		"measured_battery_capacity": Unknown column type,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `repair` created by specifying its `repair_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/repairs/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"repair_id": 1
		"product_imei": "000000000000000",
		"customer_id": "test",
		"purchase_date": Unknown column type,
		"arrival_date": Unknown column type,
		"refurbishment_date": Unknown column type,
		"package": "test",
		"process": "test",
		"measured_battery_capacity": Unknown column type,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all repairs by omitted the repair_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/repairs'
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

> We can edit the newly created repair with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/repairs'
    data = json.dumps({
		"product_imei": "999999999999999",
		"customer_id": "changed",
		"purchase_date": Unknown column type,
		"arrival_date": Unknown column type,
		"refurbishment_date": Unknown column type,
		"package": "changed",
		"process": "changed",
		"measured_battery_capacity": Unknown column type,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"repair_id": 1
		"product_imei": "999999999999999",
		"customer_id": "changed",
		"purchase_date": Unknown column type,
		"arrival_date": Unknown column type,
		"refurbishment_date": Unknown column type,
		"package": "changed",
		"process": "changed",
		"measured_battery_capacity": Unknown column type,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the repair

```python
    url = 'http://smartapi.bboxx.co.uk/v1/repairs/1'
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
endpoint | `/v1/repairs`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `repair` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/repairs` or `/v1/repairs/<repair_id>`
method | `GET`
url_params | `repair_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/repairs/<repair_id>`
method | `PUT`
url_params | `repair_id` of the repair you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/repairs/<repair_id>`
method | `DELETE`
url_params | repair_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    