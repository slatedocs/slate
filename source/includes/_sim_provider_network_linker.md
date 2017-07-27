## <u>SIM Provider Network Linker</u>
Specifies which networks are available to each SIM provider


### <u>The sim_provider_network_linker object</u>

Field | Description
------:|:------------
sim_provider_network_linker_id <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each sim_provider_network_linker.
__<a href="/#sim-provider">sim_provider_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#network">network_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
<font color="DarkGray">N/A</font> | <font color="DarkGray">_There are no relationships for this table._</font>

<hr>
<br>

> An example POST request. Note that `sim_provider_network_linker_id`, `created_at`, `modified_at`, `created_by` and `modified_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/sim_provider_network_linker"
    data = json.dumps({
		"sim_provider_id": 1,
		"network_id": 63502,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"sim_provider_network_linker_id": 1,
        "sim_provider_id": 1,
        "network_id": 63502,
		"created_at": "2000-01-01 00:00:00",
		"created_by": "test.user@bboxx.co.uk",
        "modified_at": None,
        "modified_by": None
	}
```

    > We can retrieve the `sim_provider_network_linker` created by specifying its `sim_provider_network_linker_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_provider_network_linker/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "sim_provider_network_linker_id": 1,
        "sim_provider_id": 1,
        "network_id": 63502,
        "created_at": "2000-01-01 00:00:00",
        "created_by": "test.user@bboxx.co.uk",
        "modified_at": None,
        "modified_by": None
	}
```

> We can retrieve all `sim_provider_network_linker` by omitting the `sim_provider_network_linker_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_provider_network_linker'
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

> We can edit the newly created `sim_provider_network_linker` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_provider_network_linker/1'
    data = json.dumps({
        "sim_provider_id": 1,
        "network_id": 63503,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "sim_provider_network_linker_id": 1,
        "sim_provider_id": 1,
        "network_id": 63503,
        "created_at": "2000-01-01 00:00:00",
        "created_by": "test.user@bboxx.co.uk",
        "modified_at": "2016-07-07 12:34:45",
        "modified_by": "test.user@bboxx.co.uk"
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `sim_provider_network_linker`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/sim_part_type_sim_provider_linker/1'
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
endpoint | `/v1/sim_provider_network_linker`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `sim_provider_network_linker` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/sim_provider_network_linker` or `/v1/sim_provider_network_linker/<sim_part_type_sim_provider_linker_id>`
method | `GET`
url_params | `sim_provider_network_linker_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/sim_provider_network_linker/<sim_provider_network_linker_id>`
method | `PUT`
url_params | `sim_provider_network_linker` of the sim_provider_network_linker you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/sim_provider_network_linker/<sim_provider_network_linker_id>`
method | `DELETE`
url_params | `sim_provider_network_linker_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    