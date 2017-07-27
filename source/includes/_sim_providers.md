## <u>SIM Provider</u>
The list of SIM providers


### <u>The sim_provider object</u>

Field | Description
------:|:------------
__sim_provider_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each sim_provider.
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
__sim_part_type_sim_provider_linker__ | The associated sim_part_type_sim_provider_linker
__sim_provider_network_linker__ | The associated sim_provider_network_linker


<hr>
<br>

> An example POST request. Note that `sim_provider_id`, `created_at`, `modified_at`, `created_by` and `modified_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/sim_providers"
    data = json.dumps({
		"name": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"sim_provider_id": 1,
		"name": "test",
		"created_at": "2000-01-01 00:00:00",
		"created_by": "test.user@bboxx.co.uk",
        "modified_at": None,
        "modified_by": None
	}
```

    > We can retrieve the `sim_provider` created by specifying its `sim_provider_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_providers/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "sim_provider_id": 1,
        "name": "test",
        "created_at": "2000-01-01 00:00:00",
        "created_by": "test.user@bboxx.co.uk",
        "modified_at": None,
        "modified_by": None
	}
```

> We can retrieve all `sim_providers` by omitting the `sim_provider_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_providers'
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

> We can edit the newly created `sim_provider` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_providers/1'
    data = json.dumps({
		"name": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"sim_provider_id": 1
		"name": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": "2016-07-07 12:34:45",
        "modified_by": "test.user@bboxx.co.uk"
	}
```
> Note that the `modified_at` and `modified_by` fields have been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `sim_provider`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_providers/1'
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
endpoint | `/v1/sim_providers`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `sim_provider` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/sim_providers` or `/v1/sim_providers/<sim_provider_id>`
method | `GET`
url_params | `sim_provider_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/sim_providers/<sim_provider_id>`
method | `PUT`
url_params | `sim_provider_id` of the sim_provider you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/sim_providers/<sim_provider_id>`
method | `DELETE`
url_params | `sim_provider_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    