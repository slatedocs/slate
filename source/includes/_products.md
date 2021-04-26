## <u>Product</u>
Lists all the products in the SMARTSolar Backend.


### <u>The product object</u>

Field | Description
------:|:------------
__product_imei__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">__(primary key)__</font> | 
__analysis_timestamp__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__current_enable_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__desired_enable_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__disable_date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__device_key__ <br><font color="DarkGray">_varchar(24)_</font> <font color="Crimson">(unique)</font> | 
__<a href="/#hub">hub_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__imsi__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,unique)</font> | 
__iccid__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson">(unique)</font> | 
__latest_connection_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__latest_connection_location_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__<a href="/#latest-state">latest_state_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__<a href="/#latest-enable-history">latest_enable_history_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__<a href="/#product-type">product_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__serial_number__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | 
__<a href="/#shop">shop_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__<a href="/#software-l">software_lock</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__rtc_network_name__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | <br><font color="DodgerBlue">options: ["Test-SIM-Provider", "Aeris", "Eseye", "Wireless-Logic"]</font>
__ip_address__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson"></font> | 
__latest_rtc_connection_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__latest_rtc_mo_status_report_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__latest_rtc_mt_status_update_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__rtc_enabled_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__dcm_enabled_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | boolean value that shows whether a device is DCM enabled or not 
__assembler__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__gps_lat__ <br><font color="DarkGray">_float_</font> <font color="Crimson"></font> | 
__gps_lon__ <br><font color="DarkGray">_float_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
__connections__ | The associated connections
__notes__ | The associated notes
__part_product_linker__ | The associated part_product_linker
__product_product_group_linker__ | The associated product_product_group_linker
__product_entity_linker__ | The associated product_entity_linker
__product_software_linker__ | The associated product_software_linker
__enable_history_rel__ | The associated enable_history_rel
__repairs__ | The associated repairs
__sms_history__ | The associated sms_history
__states__ | The associated states
__product_parameter__ | The associated product_parameter
__analysis_histories__ | The associated analysis_histories
__rtc_message_history__ | The associated rtc_message_history
__rtc_connection_history__ | The associated rtc_connection_history
__migration_history__ | The associated migration_history
__payment_command__ | The associated payment_command
__balance__ | The associated balance
__final_balance__ | The associated final_balance


<hr>
<br>

> `POST` requests are not allowed at this endpoint

> We can retrieve the `product` created by specifying its `product_imei` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/products/111010101010101'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"product_imei": "111010101010101",
		"analysis_timestamp": "2000-01-01 00:00:00",
		"current_enable_flag": True,
		"desired_enable_flag": True,
		"disable_date": "2000-01-01 00:00:00",
		"device_key": "awjs875jg7thskr9485984rf",
		"hub_id": 1,
		"imsi": "000000000000000",
		"iccid": Unknown column type,
		"latest_connection_id": 1,
		"latest_connection_location_id": 1,
		"latest_state_id": 1,
		"latest_enable_history_id": 1,
		"product_type_id": 1,
		"serial_number": "test",
		"shop_id": 1,
		"software_lock": 1,
		"rtc_network_name": "test",
		"ip_address": "000000000000000",
		"latest_rtc_connection_history_id": 1,
		"latest_rtc_mo_status_report_time": "2000-01-01 00:00:00",
		"latest_rtc_mt_status_update_time": "2000-01-01 00:00:00",
		"rtc_enabled_flag": True,
		"dcm_enabled_flag": False,
		"assembler": "test",
		"gps_lat": 1.0,
		"gps_lon": 1.0,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `products` by omitting the `product_imei`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/products'
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

> We can edit the newly created `product` with a `PUT` request:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/products/111010101010101'
    data = json.dumps({
		"analysis_timestamp": "2016-07-01 12:34:45",
		"current_enable_flag": False,
		"desired_enable_flag": False,
		"disable_date": "2016-07-01 12:34:45",
		"device_key": "awjs875jg7thskr9485984rf",
		"hub_id": 2,
		"imsi": "999999999999999",
		"iccid": Unknown column type,
		"latest_connection_id": 2,
		"latest_connection_location_id": 2,
		"latest_state_id": 2,
		"latest_enable_history_id": 2,
		"product_type_id": 2,
		"serial_number": "changed",
		"shop_id": 2,
		"software_lock": 2,
		"rtc_network_name": "changed",
		"ip_address": "999999999999999",
		"latest_rtc_connection_history_id": 2,
		"latest_rtc_mo_status_report_time": "2016-07-01 12:34:45",
		"latest_rtc_mt_status_update_time": "2016-07-01 12:34:45",
		"rtc_enabled_flag": False,
		"dcm_enabled_flag": False,
		"assembler": "changed",
		"gps_lat": 2.0,
		"gps_lon": 2.0,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"product_imei": "111010101010101",
		"analysis_timestamp": "2016-07-01 12:34:45",
		"current_enable_flag": False,
		"desired_enable_flag": False,
		"disable_date": "2016-07-01 12:34:45",
		"device_key": "awjs875jg7thskr9485984rf",
		"hub_id": 2,
		"imsi": "999999999999999",
		"iccid": Unknown column type,
		"latest_connection_id": 2,
		"latest_connection_location_id": 2,
		"latest_state_id": 2,
		"latest_enable_history_id": 2,
		"product_type_id": 2,
		"serial_number": "changed",
		"shop_id": 2,
		"software_lock": 2,
		"rtc_network_name": "changed",
		"ip_address": "999999999999999",
		"latest_rtc_connection_history_id": 2,
		"latest_rtc_mo_status_report_time": "2016-07-01 12:34:45",
		"latest_rtc_mt_status_update_time": "2016-07-01 12:34:45",
		"rtc_enabled_flag": False,
		"dcm_enabled_flag": False,
		"assembler": "changed",
		"gps_lat": 2.0,
		"gps_lon": 2.0,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `product`

```python
    url = 'https://smartapi.bboxx.co.uk/v1/products/111010101010101'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.



### POST
`POST` requests are not allowed at this endpoint

### GET
     | value
 ----:|:---
endpoint | `/v1/products` or `/v1/products/<product_imei>`
method | `GET`
url_params | `product_imei` <font color="DarkGray">_(varchar(15))_</font>
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
url_params | `product_imei` <font color="DarkGray">_(varchar(15))_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
