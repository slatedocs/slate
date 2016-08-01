# Product
This description is not yet complete it should be filled in!


## The product object

Field | Description
------:|:------------
__product_imei__ <br><font color="DarkGray">_string_</font> <font color="Crimson">__(primary key)__</font> | A description for this column hasn't been written yet it should be filled in!
__analysis_timestamp__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__capacity_limit__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__current_enable_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__desired_enable_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__current_tamper_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__desired_tamper_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__device_key__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson">(unique)</font> | A description for this column hasn't been written yet it should be filled in!
__hub_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__imsi__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | A description for this column hasn't been written yet it should be filled in!
__latest_connection_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__latest_connection_location_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__latest_state_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__product_type_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__serial_number__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | A description for this column hasn't been written yet it should be filled in!
__shop_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__software_lock__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
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


## HTTP Requests
> An example POST request. Note that product_imei, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products"
    data = json.dumps({
        "k1": "v1",
        "k2": "v2"
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
        "k1": "v1",
        "k2": "v2"
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
        "k1": "v1",
        "k2": "v2"
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
        "k1": "v1",
        "k2": "v2"
    }
```

> We can edit the newly created product with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/products'
    data = json.dumps({
        "k1": "v1",
        "k2": "v2"
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "k1": "v1",
        "k2": "v2"
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
    