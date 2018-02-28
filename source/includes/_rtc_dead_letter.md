## <u>RTCDeadLetter</u>
Lists RTC mobile-orginated (MO) messages that could not be processed by SMART Solar.


### <u>The rtc_dead_letter object</u>

Field | Description
------:|:------------
__rtc_dead_letter_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each rtc_dead_letter entry.
__queue_name__ <br><font color="DarkGray">_text_</font> <font color="Crimson">(not-null)</font> | The name of the queue where the message originated: 'RTC-MO' or 'RTC-MT.Reply'
__payload__ <br><font color="DarkGray">_text_</font> <font color="Crimson">(not-null)</font> | The message payload as a JSON string
__status__ <br><font color="DarkGray">_text_</font> | The status of the message: 'replayed', 'discarded', <null> (unprocessed)
__status_time__ <br><font color="DarkGray">_datetime_</font> | Time of the last status change
__replay_status__  <br><font color="DarkGray">_text_</font> | If the message has been replayed, this will contain the status of the replay attempt: 'success' or 'failure'. Otherwise <null>
__replay_status_text__  <br><font color="DarkGray">_text_</font> | More detail on the replay status
__replay_status_time__  <br><font color="DarkGray">_datetime_</font> | Time the replay_status was updated
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

    > We can retrieve a `rtc_dead_letter` by specifying its `rtc_dead_letter_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/rtc_dead_letter/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"rtc_dead_letter": 1,
        "queue_name": "RTC-MO",
        "payload": "{\"ident\": \"Aeris/10.112.89.62\", \"message\": \"ggSfghpaebuvaUNvbm5lY3RlZP8=\", \"correlation_id\": \"d478ea0eeadc47e8aead97502235ccac\", \"timestamp\": \"2018-02-06T14:29:14.349698\", \"ident_type\": \"IP\"}",
        "status": "replayed",
        "status_time": "2000-01-01 00:00:00",
        "replay_status": "success",
        "replay_status_text": None,
        "replay_status_time": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00",
		"created_by": "test.user@bboxx.co.uk",
		"modified_at": None
	}
```

> We can retrieve all `rtc_dead_letter` entries by omitting the `rtc_dead_letter_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/rtc_dead_letter'
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
endpoint | `/v1/rtc_dead_letter` or `/v1/rtc_dead_letter/<rtc_dead_letter_id>`
method | `GET`
url_params | `rtc_dead_letter` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint
    