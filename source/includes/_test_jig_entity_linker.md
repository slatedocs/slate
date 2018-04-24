## <u>Test Jig Entity Linker</u>
Indicates which entities have access to a test jig.


### <u>The test_jig_entity_linker object</u>

Field | Description
------:|:------------
__test_jig_entity_linker_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each linker object.
__entity_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(unique)</font> | Identifies the entity associated with the test jig

<hr>
<br>

> An example POST request. Note that `test_jig_entity_linker_id`, `created_at`, `modified_at`, `created_by` and `modified_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "https://smartapi.bboxx.co.uk/v1/test_jig_entity_linker"
    data = json.dumps({
        "entity_id": 2
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
        "created_at": "2018-04-24T10:21:46.619244",
        "created_by": "ci.system@bboxx.co.uk",
        "entity_id": 2,
        "modified_at": null,
        "modified_by": null,
        "test_jig_entity_linker_id": 6
    }
```

    > We can retrieve the `test_jig_entity_linker` created by specifying its `test_jig_entity_linker_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_entity_linker/6'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "created_at": "2018-04-24T10:21:46.619244",
        "created_by": "ci.system@bboxx.co.uk",
        "entity_id": 2,
        "modified_at": null,
        "modified_by": null,
        "test_jig_entity_linker_id": 6
}
```

> We can retrieve all `test_jig_entity_linkers` by omitting the `test_jig_entity_linker_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_entity_linker'
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

> We can edit the newly created `test_jig_entity_linker` with a `PUT` request:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_entity_linker/6'
    data = json.dumps({
        "entity_id": 55
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "created_at": "2018-04-24T10:21:46.619244",
        "created_by": "ci.system@bboxx.co.uk",
        "entity_id": 55,
        "modified_at": "2018-04-24T10:29:31.555402",
        "modified_by": "ci.system@bboxx.co.uk",
        "test_jig_entity_linker_id": 6
    }
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `test_jig_entity_linker`

```python
    url = 'https://smartapi.bboxx.co.uk/v1/test_jig_entity_linker/6'
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
endpoint | `/v1/test_jig_entity_linker`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `test_jig_entity_linker` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/test_jig_entity_linker` or `/v1/test_jig_entity_linker/<test_jig_entity_linker_id>`
method | `GET`
url_params | `test_jig_entity_linker_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/test_jig_entity_linker/<test_jig_entity_linker_id>`
method | `PUT`
url_params | `test_jig_entity_linker_id` of the `test_jig_entity_linker` you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/test_jig_entity_linker/<test_jig_entity_linker_id>`
method | `DELETE`
url_params | `test_jig_entity_linker_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    