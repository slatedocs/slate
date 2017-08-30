## <u>Appliance Symptom</u>
Lists the possible symptoms that a BBOXX appliance could have.


### <u>The appliance_symptom object</u>

Field | Description
------:|:------------
__appliance_symptom_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each appliance_symptom.
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | 
__description__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
__appliance_symptom_appliance_type_linker__ | The associated appliance_symptom_appliance_type_linker
__appliance_repair_appliance_symptom_linker__ | The associated appliance_repair_appliance_symptom_linker


<hr>
<br>

> An example POST request. Note that `appliance_symptom_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/appliance_symptoms"
    data = json.dumps({
		"name": "test",
		"description": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"appliance_symptom_id": 1
		"name": "test",
		"description": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

    > We can retrieve the `appliance_symptom` created by specifying its `appliance_symptom_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/appliance_symptoms/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"appliance_symptom_id": 1
		"name": "test",
		"description": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `appliance_symptoms` by omitting the `appliance_symptom_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/appliance_symptoms'
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

> We can edit the newly created `appliance_symptom` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/appliance_symptoms/1'
    data = json.dumps({
		"name": "changed",
		"description": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"appliance_symptom_id": 1
		"name": "changed",
		"description": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `appliance_symptom`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/appliance_symptoms/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

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
endpoint | `/v1/appliance_symptoms`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `appliance_symptom` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/appliance_symptoms` or `/v1/appliance_symptoms/<appliance_symptom_id>`
method | `GET`
url_params | `appliance_symptom_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/appliance_symptoms/<appliance_symptom_id>`
method | `PUT`
url_params | `appliance_symptom_id` of the appliance_symptom you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/appliance_symptoms/<appliance_symptom_id>`
method | `DELETE`
url_params | `appliance_symptom_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    