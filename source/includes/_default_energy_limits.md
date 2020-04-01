## <u>Default Energy Limit</u>
Default energy_limits for each type of battery in each lifecycle state.


### <u>The default_energy_limit object</u>

Field | Description
------:|:------------
__default_energy_limit_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each default_energy_limit.
__<a href="/#battery-type">battery_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#state-type">state_type_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#entity">entity_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__energy_limit__ <br><font color="DarkGray">_float_</font> <font color="Crimson">(not-null)</font> | 
__max_energy_limit__ <br><font color="DarkGray">_float_</font> <font color="Crimson">(not-null)</font> | 
__min_energy_limit__ <br><font color="DarkGray">_float_</font> <font color="Crimson">(not-null)</font> | 
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



    