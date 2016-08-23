## <u>Software Version Type</u>
This description is not yet complete it should be filled in!


### <u>The software_version_type object</u>

Field | Description
------:|:------------
__software_version_type_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each software_version_type.
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | 
__description__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__link__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__checksum__ <br><font color="DarkGray">_varchar(8)_</font> <font color="Crimson"></font> | 
__release_date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


<br>

Relationship | Description
-------------:|:------------
__product_type_software_version_type_linker__ | The associated product_type_software_version_type_linker
__product_software_linker__ | The associated product_software_linker
__latest_software__ | The associated latest_software


<hr>
<br>

> An example POST request. Note that `software_version_type_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/software_version_types"
    data = json.dumps({
		"name": "test",
		"description": "test",
		"link": "test",
		"checksum": Unknown column type,
		"release_date": "2000-01-01 00:00:00",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"software_version_type_id": 1
		"name": "test",
		"description": "test",
		"link": "test",
		"checksum": Unknown column type,
		"release_date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `software_version_type` created by specifying its `software_version_type_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/software_version_types/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"software_version_type_id": 1
		"name": "test",
		"description": "test",
		"link": "test",
		"checksum": Unknown column type,
		"release_date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `software_version_types` by omitting the `software_version_type_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/software_version_types'
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

> We can edit the newly created `software_version_type` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/software_version_types'
    data = json.dumps({
		"name": "changed",
		"description": "changed",
		"link": "changed",
		"checksum": Unknown column type,
		"release_date": "2016-07-01 12:34:45",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"software_version_type_id": 1
		"name": "changed",
		"description": "changed",
		"link": "changed",
		"checksum": Unknown column type,
		"release_date": "2016-07-01 12:34:45",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `software_version_type`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/software_version_types/1'
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
endpoint | `/v1/software_version_types`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `software_version_type` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/software_version_types` or `/v1/software_version_types/<software_version_type_id>`
method | `GET`
url_params | `software_version_type_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/software_version_types/<software_version_type_id>`
method | `PUT`
url_params | `software_version_type_id` of the software_version_type you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/software_version_types/<software_version_type_id>`
method | `DELETE`
url_params | `software_version_type_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    