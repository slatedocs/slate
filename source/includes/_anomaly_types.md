# Anomaly Type
This description is not yet complete it should be filled in!


## The anomaly_type object

Field | Description
------:|:------------
__anomaly_type_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A description for this column hasn't been written yet it should be filled in!
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__version__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__description__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__metrics__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__version_comment__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__min_gap_length__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__min_duration__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__min_data_points__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__gap_anomaly__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__status__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | Describes whether the anomaly type is currently fully used, in a test mode or temporarily suspended.<br><font color="DodgerBlue">options: [test, live, suspended]</font>
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------
__anomalies__ | The associated anomalies
__alert_type_anomaly_type_linker__ | The associated alert_type_anomaly_type_linker
__anomaly_type_product_type_linker__ | The associated anomaly_type_product_type_linker


## HTTP Requests
> An example POST request. Note that anomaly_type_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/anomaly_types"
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

> We can retrieve the `anomaly_type` created by specifying its `anomaly_type_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomaly_types/1'
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

> and we can retrieve all anomaly_types by omitted the anomaly_type_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomaly_types'
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

> We can edit the newly created anomaly_type with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomaly_types'
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

> If a user has `SYSTEM` permissions they can delete the anomaly_type

```python
    url = 'http://smartapi.bboxx.co.uk/v1/anomaly_types/1'
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
endpoint | `/v1/anomaly_types`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `anomaly_type` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/anomaly_types` or `/v1/anomaly_types/<anomaly_type_id>`
method | `GET`
url_params | `anomaly_type_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/anomaly_types/<anomaly_type_id>`
method | `PUT`
url_params | `anomaly_type_id` of the anomaly_type you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/anomaly_types/<anomaly_type_id>`
method | `DELETE`
url_params | anomaly_type_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    