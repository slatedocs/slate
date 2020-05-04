## <u>Rtc Dead Letter</u>
RTC messages that failed to be delivered.


### <u>The rtc_dead_letter object</u>

Field | Description
------:|:------------
__rtc_dead_letter_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each rtc_dead_letter.
__queue_name__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson">(not-null)</font> | 
__payload__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__status__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | <br><font color="DodgerBlue">options: ["discarded", "replayed"]</font>
__status_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__replay_status__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | <br><font color="DodgerBlue">options: ["failure", "success"]</font>
__replay_status_text__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__replay_status_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
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

> We can retrieve the `rtc_dead_letter` created by specifying its `rtc_dead_letter_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/rtc_dead_letters/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"rtc_dead_letter_id": 1
		"queue_name": Unknown column type,
		"payload": "test",
		"status": "test",
		"status_time": "2000-01-01 00:00:00",
		"replay_status": "test",
		"replay_status_text": "test",
		"replay_status_time": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `rtc_dead_letters` by omitting the `rtc_dead_letter_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/rtc_dead_letters'
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
endpoint | `/v1/rtc_dead_letters` or `/v1/rtc_dead_letters/<rtc_dead_letter_id>`
method | `GET`
url_params | `rtc_dead_letter_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    