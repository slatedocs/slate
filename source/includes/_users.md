# User
This description is not yet complete it should be filled in!


## The user object

Field | Description
------:|:------------
__username__ <br><font color="DarkGray">_string_</font> <font color="Crimson">__(primary key)__</font> | A description for this column hasn't been written yet it should be filled in!
__entity_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__hub_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__shop_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__user_product_visibility__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__user_permissions__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__token__ <br><font color="DarkGray">_string_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__token_expiry__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------


## HTTP Requests
> An example POST request. Note that username, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/users"
    data = json.dumps({
        "k1": "v1",
        "k2": "v2"
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
        "k1": "v1",
        "k2": "v2"
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
        "k1": "v1",
        "k2": "v2"
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
        "k1": "v1",
        "k2": "v2"
    }
```

> We can edit the newly created user with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/users'
    data = json.dumps({
        "k1": "v1",
        "k2": "v2"
    })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
        "k1": "v1",
        "k2": "v2"
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
    