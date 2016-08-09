## <u>Product</u>
This description is not yet complete it should be filled in!


### <u>The product object</u>

Field | Description
------:|:------------
__product_imei__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">__(primary key)__</font> | 
__analysis_timestamp__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__capacity_limit__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__current_enable_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__desired_enable_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__current_tamper_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__desired_tamper_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__device_key__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson">(unique)</font> | 
__<a href="/#hub">hub_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__imsi__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,unique)</font> | 
__latest_connection_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__latest_connection_location_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__latest_state_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__<a href="/#product_type">product_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__serial_number__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | 
__<a href="/#shop">shop_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__<a href="/#software_l">software_lock</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------
__alerts__ | The associated alerts
__anomalies__ | The associated anomalies
__connections__ | The associated connections
__customer_product_history__ | The associated customer_product_history
__notes__ | The associated notes
__part_product_linker__ | The associated part_product_linker
__product_entity_linker__ | The associated product_entity_linker
__product_software_linker__ | The associated product_software_linker
__enable_history_rel__ | The associated enable_history_rel
__repairs__ | The associated repairs
__sms_history__ | The associated sms_history
__states__ | The associated states
__tamper_enable_history__ | The associated tamper_enable_history


### <u>HTTP Requests</u>
> An example POST request. Note that product_imei, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products"
    data = json.dumps({
		"analysis_timestamp": "2000-01-01 00:00:00",
		"capacity_limit": "test",
		"current_enable_flag": True,
		"desired_enable_flag": True,
		"current_tamper_flag": True,
		"desired_tamper_flag": True,
		"device_key": Unknown column type,
		"hub_id": 1,
		"imsi": "000000000000000",
		"latest_connection_id": 1,
		"latest_connection_location_id": 1,
		"latest_state_id": 1,
		"product_type_id": 1,
		"serial_number": "test",
		"shop_id": 1,
		"software_lock": 1,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"product_imei": 1
		"analysis_timestamp": "2000-01-01 00:00:00",
		"capacity_limit": "test",
		"current_enable_flag": True,
		"desired_enable_flag": True,
		"current_tamper_flag": True,
		"desired_tamper_flag": True,
		"device_key": Unknown column type,
		"hub_id": 1,
		"imsi": "000000000000000",
		"latest_connection_id": 1,
		"latest_connection_location_id": 1,
		"latest_state_id": 1,
		"product_type_id": 1,
		"serial_number": "test",
		"shop_id": 1,
		"software_lock": 1,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `product` created by specifying its `product_imei` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/products/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"product_imei": 1
		"analysis_timestamp": "2000-01-01 00:00:00",
		"capacity_limit": "test",
		"current_enable_flag": True,
		"desired_enable_flag": True,
		"current_tamper_flag": True,
		"desired_tamper_flag": True,
		"device_key": Unknown column type,
		"hub_id": 1,
		"imsi": "000000000000000",
		"latest_connection_id": 1,
		"latest_connection_location_id": 1,
		"latest_state_id": 1,
		"product_type_id": 1,
		"serial_number": "test",
		"shop_id": 1,
		"software_lock": 1,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all products by omitted the product_imei:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/products'
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

> We can edit the newly created product with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/products'
    data = json.dumps({
		"analysis_timestamp": "2016-07-01 12:34:45",
		"capacity_limit": "changed",
		"current_enable_flag": False,
		"desired_enable_flag": False,
		"current_tamper_flag": False,
		"desired_tamper_flag": False,
		"device_key": Unknown column type,
		"hub_id": 2,
		"imsi": "999999999999999",
		"latest_connection_id": 2,
		"latest_connection_location_id": 2,
		"latest_state_id": 2,
		"product_type_id": 2,
		"serial_number": "changed",
		"shop_id": 2,
		"software_lock": 2,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"product_imei": 1
		"analysis_timestamp": "2016-07-01 12:34:45",
		"capacity_limit": "changed",
		"current_enable_flag": False,
		"desired_enable_flag": False,
		"current_tamper_flag": False,
		"desired_tamper_flag": False,
		"device_key": Unknown column type,
		"hub_id": 2,
		"imsi": "999999999999999",
		"latest_connection_id": 2,
		"latest_connection_location_id": 2,
		"latest_state_id": 2,
		"product_type_id": 2,
		"serial_number": "changed",
		"shop_id": 2,
		"software_lock": 2,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the product

```python
    url = 'http://smartapi.bboxx.co.uk/v1/products/1'
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
endpoint | `/v1/products`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `product` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/products` or `/v1/products/<product_imei>`
method | `GET`
url_params | `product_imei` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/products/<product_imei>`
method | `PUT`
url_params | `product_imei` of the product you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/products/<product_imei>`
method | `DELETE`
url_params | product_imei <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    