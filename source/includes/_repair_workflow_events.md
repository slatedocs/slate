## <u>Repair Workflow Event</u>
Audit trail of workflow events associated with product repairs


### <u>The repair_workflow_event object</u>

Field | Description
------:|:------------
__repair_workflow_event_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each repair_workflow_event.
__<a href="/#repair">repair_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__current_state_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__event_id__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__payload__ <br><font color="DarkGray">_json_</font> <font color="Crimson"></font> | 
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



    