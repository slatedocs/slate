# Tamper Enable History
This description is not yet complete it should be filled in!


## The tamper_enable_history object

Field | Description
------:|:------------
__tamper_enable_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A description for this column hasn't been written yet it should be filled in!
__product_imei__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__prev_tamper_enable_state__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!<br><font color="DodgerBlue">options: [pending_enabled, pending_disabled, init, enabled, disabled]</font>
__current_tamper_enable_state__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!<br><font color="DodgerBlue">options: [pending_enabled, pending_disabled, init, enabled, disabled]</font>
__user__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------


## HTTP Requests
> An example POST request. Note that tamper_enable_history_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/tamper_enable_histories"
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

> We can retrieve the `tamper_enable_history` created by specifying its `tamper_enable_history_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_histories/1'
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

> and we can retrieve all tamper_enable_histories by omitted the tamper_enable_history_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_histories'
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

> We can edit the newly created tamper_enable_history with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_histories'
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

> If a user has `SYSTEM` permissions they can delete the tamper_enable_history

```python
    url = 'http://smartapi.bboxx.co.uk/v1/tamper_enable_histories/1'
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
endpoint | `/v1/tamper_enable_histories`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `tamper_enable_history` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/tamper_enable_histories` or `/v1/tamper_enable_histories/<tamper_enable_history_id>`
method | `GET`
url_params | `tamper_enable_history_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/tamper_enable_histories/<tamper_enable_history_id>`
method | `PUT`
url_params | `tamper_enable_history_id` of the tamper_enable_history you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/tamper_enable_histories/<tamper_enable_history_id>`
method | `DELETE`
url_params | tamper_enable_history_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    