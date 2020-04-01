## <u>Home2 Stock Preparation Tracking</u>
Stores results from home2 stock preparation page.


### <u>The home2_stock_preparation_tracking object</u>

Field | Description
------:|:------------
__home2_stock_preparation_tracking_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each home2_stock_preparation_tracking.
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__serial_number__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null)</font> | 
__activated__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__software_updated__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__temperature_check__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__battery_charged__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__recent_data__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__online_disable__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
__contact_support__ <br><font color="DarkGray">_boolean_</font> <font color="Crimson">(not-null)</font> | 
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



    