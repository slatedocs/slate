## <u>Subscriber</u>
A table containing subscribers to our API service


### <u>The subscriber object</u>

Field | Description
------:|:------------
__subscriber_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each subscriber.
__url__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__<a href="/#channel-n">channel_name</a>__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#entity">entity_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__key__ <br><font color="DarkGray">_varchar(24)_</font> <font color="Crimson">(not-null)</font> | 
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

> We can retrieve the `subscriber` created by specifying its `subscriber_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/subscribers/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"subscriber_id": 1
		"url": "test",
		"channel_name": "test",
		"entity_id": 1,
		"key": "awjs875jg7thskr9485984rf",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `subscribers` by omitting the `subscriber_id`:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/subscribers'
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
endpoint | `/v1/subscribers` or `/v1/subscribers/<subscriber_id>`
method | `GET`
url_params | `subscriber_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    