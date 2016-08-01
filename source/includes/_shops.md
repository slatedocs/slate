# Shop
This description is not yet complete it should be filled in!


## The shop object

Field | Description
------:|:------------
__shop_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A description for this column hasn't been written yet it should be filled in!
__name__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(not-null,unique)</font> | A description for this column hasn't been written yet it should be filled in!
__guid__ <br><font color="DarkGray">_string_</font> <font color="Crimson">(unique)</font> | A description for this column hasn't been written yet it should be filled in!
__hub_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | A description for this column hasn't been written yet it should be filled in!
__latitude__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__longitude__ <br><font color="DarkGray">_unknown-type_</font> <font color="Crimson"></font> | A description for this column hasn't been written yet it should be filled in!
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified


Relationship | Description
-------------:|:------------
__products__ | The associated products


## HTTP Requests
> An example POST request. Note that shop_id, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/shops"
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

> We can retrieve the `shop` created by specifying its `shop_id` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/shops/1'
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

> and we can retrieve all shops by omitted the shop_id:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/shops'
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

> We can edit the newly created shop with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/shops'
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

> If a user has `SYSTEM` permissions they can delete the shop

```python
    url = 'http://smartapi.bboxx.co.uk/v1/shops/1'
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
endpoint | `/v1/shops`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `shop` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/shops` or `/v1/shops/<shop_id>`
method | `GET`
url_params | `shop_id` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/shops/<shop_id>`
method | `PUT`
url_params | `shop_id` of the shop you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/shops/<shop_id>`
method | `DELETE`
url_params | shop_id <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    