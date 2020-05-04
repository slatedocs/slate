## <u>Repair Workflow Selector</u>
Rules determining the workflow to use when a repair is created


### <u>The repair_workflow_selector object</u>

Field | Description
------:|:------------
__repair_workflow_selector_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each repair_workflow_selector.
__<a href="/#product-type">product_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | ProductType identifier
__workflow_name__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | The name workflow of the workflow to be used. Null indicates that a repair workflow cannot be created by a user matching this rule
__selector_type__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | The rule type.<br><font color="DodgerBlue">options: ["USER", "ENTITY"]</font>
__selector_value__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | The value to be matched. Email address for a 'USER' rule; GEIC code for an 'ENTITY' rule
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

> An example POST request. Note that `repair_workflow_selector_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "https://smartapi.bboxx.co.uk/v1/repair_workflow_selectors"
    data = json.dumps({
		"product_type_id": 1,
		"workflow_name": "test",
		"selector_type": "test",
		"selector_value": "test",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"repair_workflow_selector_id": 1
		"product_type_id": 1,
		"workflow_name": "test",
		"selector_type": "test",
		"selector_value": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `repair_workflow_selector` created by specifying its `repair_workflow_selector_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/repair_workflow_selectors/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"repair_workflow_selector_id": 1
		"product_type_id": 1,
		"workflow_name": "test",
		"selector_type": "test",
		"selector_value": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `repair_workflow_selectors` by omitting the `repair_workflow_selector_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/repair_workflow_selectors'
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

> We can edit the newly created `repair_workflow_selector` with a `PUT` request:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/repair_workflow_selectors/1'
    data = json.dumps({
		"product_type_id": 2,
		"workflow_name": "changed",
		"selector_type": "changed",
		"selector_value": "changed",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"repair_workflow_selector_id": 1
		"product_type_id": 2,
		"workflow_name": "changed",
		"selector_type": "changed",
		"selector_value": "changed",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `repair_workflow_selector`

```python
    url = 'https://smartapi.bboxx.co.uk/v1/repair_workflow_selectors/1'
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
endpoint | `/v1/repair_workflow_selectors`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `repair_workflow_selector` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/repair_workflow_selectors` or `/v1/repair_workflow_selectors/<repair_workflow_selector_id>`
method | `GET`
url_params | `repair_workflow_selector_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/repair_workflow_selectors/<repair_workflow_selector_id>`
method | `PUT`
url_params | `repair_workflow_selector_id` of the repair_workflow_selector you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/repair_workflow_selectors/<repair_workflow_selector_id>`
method | `DELETE`
url_params | `repair_workflow_selector_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    