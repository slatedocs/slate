## <u>Battery Failure</u>
This table lists all battery failures that have occurred from analysis


### <u>The battery_failure object</u>

Field | Description
------:|:------------
__battery_failure_id__ <br><font color="DarkGray">_int_</font> <font color="Crimson">__(primary key)__</font> | A unique integer identifier for each battery_failure.
__<a href="/#repair">repair_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#part">part_id</a>__ <br><font color="DarkGray">_int_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__<a href="/#product">product_imei</a>__ <br><font color="DarkGray">_varchar(15)_</font> <font color="Crimson">(not-null,foreign-key)</font> | 
__battery_failure_date__ <br><font color="DarkGray">_datetime_</font> <font color="Crimson"></font> | 
__created_at__  <br><font color="DarkGray">_datetime_</font> | timestamp that the record was created at
__created_by__  <br><font color="DarkGray">_text_</font>| username of the user who created the record
__modified_at__ <br><font color="DarkGray">_datetime_</font>| timestamp that the record was last modified
__modified_by__ <br><font color="DarkGray">_text_</font>| user that last modified the record

<br>

Relationship | Description
-------------:|:------------
__failure_types__ | The associated failure_types


<hr>
<br>

> An example POST request. Note that `battery_failure_id`, `created_at`, `modified_at` and `created_by` are all handled internally by the system and need not be explicitly specified. See Meta Data for more information.

```python
    url = "https://smartapi.bboxx.co.uk/v1/battery_failures"
    data = json.dumps({
		"repair_id": 1,
		"part_id": 1,
		"product_imei": "000000000000000",
		"battery_failure_date": "2000-01-01 00:00:00",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.post(url=url, data=data, headers=headers)

    r
    >>> <Response 201>

    r.json()

    >>> {
		"battery_failure_id": 1
		"repair_id": 1,
		"part_id": 1,
		"product_imei": "000000000000000",
		"battery_failure_date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

    > We can retrieve the `battery_failure` created by specifying its `battery_failure_id` in the request url:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/battery_failures/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.get(url=url, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"battery_failure_id": 1
		"repair_id": 1,
		"part_id": 1,
		"product_imei": "000000000000000",
		"battery_failure_date": "2000-01-01 00:00:00",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": None
	}
```

> We can retrieve all `battery_failures` by omitting the `battery_failure_id`:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/battery_failures'
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

> We can edit the newly created `battery_failure` with a `PUT` request:

```python
    url = 'https://smartapi.bboxx.co.uk/v1/battery_failures/1'
    data = json.dumps({
		"repair_id": 2,
		"part_id": 2,
		"product_imei": "999999999999999",
		"battery_failure_date": "2016-07-01 12:34:45",
		})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

    r = requests.put(url=url, data=data, headers=headers)

    r
    >>> <Response 200>

    r.json()
    >>> {
		"battery_failure_id": 1
		"repair_id": 2,
		"part_id": 2,
		"product_imei": "999999999999999",
		"battery_failure_date": "2016-07-01 12:34:45",
		"created_at": "2000-01-01 00:00:00"
		"created_by": "test.user@bboxx.co.uk"
		"modified_at": 2016-07-07 12:34:45
	}
```
> Note that the `modified_at` field has been updated accordingly.

> If a user has `SYSTEM` permissions they can delete the `battery_failure`

```python
    url = 'https://smartapi.bboxx.co.uk/v1/battery_failures/1'
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

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
endpoint | `/v1/battery_failures`
method | `POST`
url_params | <font color="DarkGray">N/A</font>
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary with the details of the `battery_failure` that you wish to create
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `201`

### GET
     | value
 ----:|:---
endpoint | `/v1/battery_failures` or `/v1/battery_failures/<battery_failure_id>`
method | `GET`
url_params | `battery_failure_id` <font color="DarkGray">_(int)_</font>
query params | *> See Query Format and Filtering*
body | <font color="DarkGray">N/A</font>
permissions | <font color="Jade">__`OVERVIEW`__</font>
response | `200`

### PUT
     | value
 ----:|:---
endpoint | `/v1/battery_failures/<battery_failure_id>`
method | `PUT`
url_params | `battery_failure_id` of the battery_failure you wish to edit
query params | <font color="DarkGray">N/A</font>
body | JSON-formatted dictionary of the columns that you wish to alter
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `200`

### DELETE
     | value
 ----:|:---
endpoint | `/v1/battery_failures/<battery_failure_id>`
method | `DELETE`
url_params | `battery_failure_id` <font color="DarkGray">_(int)_</font>
query params | <font color="DarkGray">N/A</font>
body | <font color="DarkGray">N/A</font>
permissions | <font color="Crimson">__`SYSTEM`__</font>
response | `204`

    