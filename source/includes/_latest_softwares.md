# Latest Software
This description has not been written yet. It should be filled in!


## The latest_software object

Field | Description
------:|:------------
__latest_software_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A description for this column hasn't been written yet it should be filled in!
__product_type_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__software_version_type_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__date_added__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | A description for this column hasn't been written yet it should be filled in!
__date_removed__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------


## HTTP Requests
> An example POST request. Note that latest_software_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/latest_softwares"
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

> We can retrieve the `latest_software` created by specifying its `latest_software_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/latest_softwares/1'
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

> and we can retrieve all latest_softwares by omitted the latest_software_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/latest_softwares'
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

> We can edit the newly created latest_software with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/latest_softwares'
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

> If a user has `SYSTEM` permissions they can delete the latest_software

```python
    url = 'http://smartapi.bboxx.co.uk/v1/latest_softwares/1'
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
endpoint | `/v1/latest_softwares`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `latest_software` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/latest_softwares` or `/v1/latest_softwares/<latest_software_id>`
method | `GET`
url_params | `latest_software_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/latest_softwares/<latest_software_id>`
method | `PUT`
url_params | `latest_software_id` of the latest_software you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/latest_softwares/<latest_software_id>`
method | `DELETE`
url_params | latest_software_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    