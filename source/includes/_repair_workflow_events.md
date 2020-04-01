## <u>Repair Workflow Event</u>
Audit trail of workflow events associated with product repairs


### <u>The repair_workflow_event object</u>

Field | Description
------:|:------------
__repair_workflow_event_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each repair_workflow_event.
__<a href="/#repair">repair_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__current_state_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__event_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__payload__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
__next_state_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
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

> `POST` requests are not allowed at this endpoint

> We can retrieve the `repair_workflow_event` created by specifying its `repair_workflow_event_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/repair_workflow_events/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"repair_workflow_event_id": 1
		"repair_id": 1,
		"current_state_id": "test",
		"event_id": "test",
		"payload": Unknown column type,
		"next_state_id": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `repair_workflow_events` by omitting the `repair_workflow_event_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/repair_workflow_events'
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

> `PUT` requests are not allowed at this endpoint

> `DELETE` requests are not allowed at this endpoint



### POST
`POST` requests are not allowed at this endpoint

### GET
     | value
 ----:|:---
endpoint | `/v1/repair_workflow_events` or `/v1/repair_workflow_events/<repair_workflow_event_id>`
method | `GET`
url_params | `repair_workflow_event_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    