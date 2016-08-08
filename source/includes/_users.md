## <u>User</u>
This description is not yet complete it should be filled in!


### <u>The user object</u>

Field | Description
------:|:------------
__username__ <br><font color="DarkGray">_string_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each user.
__<a href="/#product#">entity_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | 
__hub_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__shop_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | 
__user_product_visibility__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__user_permissions__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__token__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | 
__token_expiry__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------

 There are no relatioships for this table.

### <u>HTTP Requests</u>
> An example POST request. Note that username, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/users"
    data = json.dumps({
		"entity_id": 1,
		"hub_id": 1,
		"shop_id": 1,
		"user_product_visibility": "test",
		"user_permissions": "test",
		"token": "test",
		"token_expiry": "2000-01-01 00:00:00",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"username": "000000000000000"
		"entity_id": 1,
		"hub_id": 1,
		"shop_id": 1,
		"user_product_visibility": "test",
		"user_permissions": "test",
		"token": "test",
		"token_expiry": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve the `user` created by specifying its `username` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/users/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"username": "000000000000000"
		"entity_id": 1,
		"hub_id": 1,
		"shop_id": 1,
		"user_product_visibility": "test",
		"user_permissions": "test",
		"token": "test",
		"token_expiry": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> and we can retrieve all users by omitted the username:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/users'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

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

> We can edit the newly created user with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/users'
    data = json.dumps({
		"entity_id": 2,
		"hub_id": 2,
		"shop_id": 2,
		"user_product_visibility": "changed",
		"user_permissions": "changed",
		"token": "changed",
		"token_expiry": "2016-07-01 12:34:45",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"username": "000000000000000"
		"entity_id": 2,
		"hub_id": 2,
		"shop_id": 2,
		"user_product_visibility": "changed",
		"user_permissions": "changed",
		"token": "changed",
		"token_expiry": "2016-07-01 12:34:45",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the user

```python
    url = 'http://smartapi.bboxx.co.uk/v1/users/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.


### POST
     | value
 ----:|:---
endpoint | `/v1/users`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `user` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/users` or `/v1/users/<username>`
method | `GET`
url_params | `username` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/users/<username>`
method | `PUT`
url_params | `username` of the user you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/users/<username>`
method | `DELETE`
url_params | username <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    