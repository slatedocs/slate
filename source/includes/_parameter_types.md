# Parameter Types
Parameter Types descibe the different kinds of parameter than can be set on a BBOXX Unit

## The Parameter Types object

Field | Description
------:|:------------
__parameter_type_id__ <br><font color="DarkGray">Integer</font> <font color="Crimson">__(primary key)__</font> | unique identifier for each parameter_type
__name__ <br><font color="DarkGray">Text</font> <font color="Crimson">(unique, not-null)</font> | human readable name for each parameter type
__data_type__ <br><font color="DarkGray">Text</font> <font color="Crimson">(not-null)</font> | describes the data-type of the parameter, options are bool, string, int, float, datetime
__created_at__  <br><font color="DarkGray">DateTime</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">Text</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">DateTime</font>| timestamp that the record was last modified

Relationship | Description
-------------:|:------------
__parameters__ | The parameters with the given parameter_type_id

## HTTP Requests
> An example POST request. Note that parameter_type_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more  information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/parameter_types"
    data = json.dumps({
        "name": "doc_param",
        "data_type": "bool"
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
            "<stuff>": "value"
        }
```

> We can retrieve the `parameter_type` created by specifying its `parameter_type_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/product_types/5'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
            u'product_type_id': 5,
            u'name': u'Hub',
            u'erp_code': None,
            u'created_by': u'd.mclean@bboxx.co.uk',
            u'created_at': u'2016-02-09T15:16:32.776776',
            u'modified_at': None,
        }
```

> and we can retrieve all parameter_types by omitted the id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/product_types'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

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

> We can edit the newly created parameter_type with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/product_types'
    data = json.dumps({
        "name": "A new name"
        })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
            u'product_type_id': 5,
            u'name': u'a new name',
            u'erp_code': None,
            u'created_by': u'd.mclean@bboxx.co.uk',
            u'created_at': u'2016-02-09T15:16:32.776776',
            u'modified_at': u'2016-07-28T11:26:42.829390'
    }
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the parameter_type

```python
    url = 'http://smartapi.bboxx.co.uk/v1/product_types/5'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.


### POST
     | value
 ----|---
endpoint | `/v1/parameter_types`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `parameter_type` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----|---
endpoint | `/v1/parameter_types` or `/v1/parameter_types/<parameter_type_id>`
method | `GET`
url_params | `parameter_type_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----|---
endpoint | `/v1/parameter_types/<parameter_type_id>`
method | `PUT`
url_params | `parameter_type_id` of the parameter you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----|---
endpoint | `/v1/parameter_types/<parameter_type_id>`
method | `DELETE`
url_params | parameter_type_id (int)
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

