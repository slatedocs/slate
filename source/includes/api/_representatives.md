# Representatives

##View Representative

View a single Representative.

### HTTP Request

`GET representative/<REPID>`

##View All Representatives

View all Representatives.

### HTTP Request

`GET representative/`

##Create Representative

Create an Representative.

### HTTP Request

`POST representative/`

### Query Parameters

Parameter | Description
--------- | -------
company | The Representative's Company
contact* | The contact name for the Representative
address | The Representative's Address
phone |  The Representative's contact phone number
email | The Representative's email address
account | Bank Account number
routing | Bank Account routing number

<aside class="notice">* = Required.</aside>

##Update Representative

Update an Representative.

### HTTP Request

`PUT representative/<REPID>`

### Query Parameters

Parameter | Description
--------- | -------
company | The Representative's Company
contact | The contact name for the Representative
address | The Representative's Address
phone |  The Representative's contact phone number
email | The Representative's email address
account | Bank Account number
routing | Bank Account routing number

##Delete Representative

Permanently deletes an Representative.

### HTTP Request

`DELETE representative/<REPID>`