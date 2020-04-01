## <u>Payment Command</u>
PaymentCommands received and then forwarded sent to the unit.


### <u>The payment_command object</u>

Field | Description
------:|:------------
__payment_command_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each payment_command.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__value__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null)</font> | 
__category__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | <br><font color="DodgerBlue">options: ["payment", "bad-payment", "zero-command", "force-reset"]</font>
__void__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__status__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__transaction_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
__final_balance__ | The associated final_balance


<hr>
<br>

> `POST` requests are not allowed at this endpoint

> We can retrieve the `payment_command` created by specifying its `payment_command_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/payment_commands/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"payment_command_id": 1
		"product_imei": "000000000000000",
		"value": 1,
		"category": "test",
		"void": True,
		"status": "test",
		"transaction_id": "test",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `payment_commands` by omitting the `payment_command_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/payment_commands'
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
endpoint | `/v1/payment_commands` or `/v1/payment_commands/<payment_command_id>`
method | `GET`
url_params | `payment_command_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    