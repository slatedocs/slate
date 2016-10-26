## <u>Entity</u>
This description is not yet complete it should be filled in!


### <u>The entity object</u>

Field | Description
------:|:------------
__entity_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each entity.
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | 
__bboxx_company_flag__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__tariff__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__financier__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
__hubs__ | The associated hubs
__customer_entity_linker__ | The associated customer_entity_linker
__product_entity_linker__ | The associated product_entity_linker


<hr>
<br>

> An example POST request. Note that `entity_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/entities"
    data = json.dumps({
		"name": "test",
		"bboxx_company_flag": True,
		"tariff": "test",
		"financier": True,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"entity_id": 1
		"name": "test",
		"bboxx_company_flag": True,
		"tariff": "test",
		"financier": True,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

    > We can retrieve the `entity` created by specifying its `entity_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/entities/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"entity_id": 1
		"name": "test",
		"bboxx_company_flag": True,
		"tariff": "test",
		"financier": True,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `entities` by omitting the `entity_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/entities'
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

> We can edit the newly created `entity` with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/entities/1'
    data = json.dumps({
		"name": "changed",
		"bboxx_company_flag": False,
		"tariff": "changed",
		"financier": False,
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"entity_id": 1
		"name": "changed",
		"bboxx_company_flag": False,
		"tariff": "changed",
		"financier": False,
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `entity`

```python
    url = 'http://smartapi.bboxx.co.uk/v1/entities/1'
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
endpoint | `/v1/entities`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `entity` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/entities` or `/v1/entities/<entity_id>`
method | `GET`
url_params | `entity_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/entities/<entity_id>`
method | `PUT`
url_params | `entity_id` of the entity you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/entities/<entity_id>`
method | `DELETE`
url_params | `entity_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    