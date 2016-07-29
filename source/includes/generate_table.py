

def make_page(**kwargs):
    text = """## {table_name_title}
{table_description}


### The {table_name_singular} object

Field | Description
------|------------
{field_table}

Relationship | Description
-------------|------------
{relationship_table}

### HTTP Requests
> An example POST request. Note that {pk_name}, created_at, modified_at and created_by are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "http://smartapi.bboxx.co.uk/v1/{table_name_plural}"
    data = json.dumps({post_data})
    headers = {headers}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {post_response_data}
```

> We can retrieve the `{table_name_singular}` created by specifying its `{pk_name}` in the request url:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/{table_name_plural}/{post_record_id}'
    headers = {headers}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {get_single_response}
```

> and we can retrieve all {table_name_plural} by omitted the {pk_name}:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/{table_name_plural}'
    headers = {headers}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {get_many_response}
```

> We can edit the newly created {table_name_singular} with a `PUT` request:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/{table_name_plural}'
    data = json.dumps({put_data})
    headers = {headers}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {put_response}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the {table_name_singular}

```python
    url = 'http://smartapi.bboxx.co.uk/v1/{table_name_plural}/{post_record_id}'
    headers = {headers}

    r = requests.delete(url=url, headers=headers)

    r
    >>> <Response 204>

    r.text
    >>>
```
> Note that the response from a 204 request is empty. This means that `r.json()` cannot be called and will throw a JSONDecodeError. In fact the response is `u''` - an empty unicode string.


#### POST
     | value
 ----|---
endpoint | `/v1/{table_name_plural}`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `{table_name_singular}` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

#### GET
     | value
 ----|---
endpoint | `/v1/{table_name_plural}` or `/v1/{table_name_plural}/<{pk_name}>`
method | `GET`
url_params | `{pk_name}` (int)
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

#### PUT
     | value
 ----|---
endpoint | `/v1/{table_name_plural}/<{pk_name}>`
method | `PUT`
url_params | `{pk_name}` of the {table_name_singular} you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

#### DELETE
     | value
 ----|---
endpoint | `/v1/{table_name_plural}/<{pk_name}>`
method | `DELETE`
url_params | {pk_name} <font color="DarkGray">(pk_type)</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`
    """.format(
        table_name_title=table_name_title,
        table_description=table_description,
        table_name_singular=table_name_singular,
        field_table=field_table,
        relationship_table=relationship_table,
        pk_name=pk_name,
        table_name_plural=table_name_plural,
        post_data=post_data,
        headers=headers,
        post_response_data=post_response_data,
        post_record_id=post_record_id,
        get_single_response=get_single_response,
        get_many_response=get_many_response,
        put_data=put_data,
        put_response=put_response,
    )
    import os

    print os.path.dirname(os.path.realpath(__file__))
    with open("_test_table.md", "w") as fid:
        fid.write(text)

if __name__ == '__main__':

    table_name_title = "table_name_title"
    table_description = "table_description"
    table_name_singular = "table_name_singular"

    field_table = """a | b
    b | b
    c |c"""

    relationship_table = """rel1 | rel1
    rel2 | rel2
    rel3 | rel3
    """

    pk_name = "pk_name"

    table_name_plural = "table_name_plural"

    post_data = """{
            k: v,
            k: v,
            k: v,
        }"""

    headers = "{'Content-Type': 'application/json', 'Authorization': 'Token token=' + <valid_token>}"

    post_response_data = """{
            k: v,
            k: v,
            k: v,
        }"""

    post_record_id = "post_record_id"

    get_single_response = """{
            k: v,
            k: v,
            k: v,
        }"""
    get_many_response = """{
            k: v,
            k: v,
            k: v,
        }"""
    put_data = """{
            k: v,
            k: v,
            k: v,
        }"""
    put_response = """{
            k: v,
            k: v,
            k: v,
        }"""

    variables = {
            "table_name_title": table_name_title,
            "table_description": table_description,
            "table_name_singular": table_name_singular,
            "table_name_plural": table_name_plural,
            "field_table": field_table,
            "relationship_table": relationship_table,
            "pk_name": pk_name,
            "post_data": post_data,
            "headers": headers,
            "post_response_data": post_response_data,
            "post_record_id": post_record_id,
            "get_single_response": get_single_response,
            "get_many_response": get_many_response,
            "put_data": put_data,
            "put_response": put_response,
    }


    make_page(**variables)


# #__{pk_name}__ <br><font color="DarkGray">{pk_type}</font> <font color="Crimson">__(primary key)__</font> | {pk_description}
# #{field_name} <br><font color="DarkGray">{field_type}</font> <font color="Crimson">__({constraint})__</font> | {field_description}

