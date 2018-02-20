## <u>Rtc Message History</u>
Contains a history of RTC messages sent to each unit.


### <u>The rtc_message_history object</u>

Field | Description
------:|:------------
__rtc_message_history_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each rtc_message_history.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__message_reference__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__message__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__message_sent_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson">(not-null)</font> | 
__delivery_status__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | <br><font color="DodgerBlue">options: ["failed", "delivered"]</font>
__delivery_status_time__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__delivery_status_info__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__message_json__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
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

> `GET` requests are not allowed at this endpoint

> `PUT` requests are not allowed at this endpoint

> `DELETE` requests are not allowed at this endpoint



### POST
`POST` requests are not allowed at this endpoint

 ### GET
`GET` requests are not allowed at this endpoint

### PUT
`PUT` requests are not allowed at this endpoint

### DELETE
`DELETE` requests are not allowed at this endpoint



    