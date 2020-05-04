## <u>Rtc Mo Message History</u>
Contains a history of RTC messages received from each unit.


### <u>The rtc_mo_message_history object</u>

Field | Description
------:|:------------
__rtc_mo_message_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each rtc_mo_message_history.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__message_bin__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | 
__message_json__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__message_received_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__processing_status__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | <br><font color="DodgerBlue">options: ["processed", "failed"]</font>
__processing_status_info__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
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

> We can retrieve the `rtc_mo_message_history` created by specifying its `rtc_mo_message_history_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/rtc_mo_message_history/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"rtc_mo_message_history_id": 1
		"product_imei": "000000000000000",
		"message_bin": Unknown column type,
		"message_json": "test",
		"message_received_time": "2000-01-01 00:00:00",
		"processing_status": "test",
		"processing_status_info": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `rtc_mo_message_history` by omitting the `rtc_mo_message_history_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/rtc_mo_message_history'
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
endpoint | `/v1/rtc_mo_message_history` or `/v1/rtc_mo_message_history/<rtc_mo_message_history_id>`
method | `GET`
url_params | `rtc_mo_message_history_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    