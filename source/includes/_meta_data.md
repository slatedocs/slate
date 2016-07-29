# Meta Data

All records in the SMARTSolar Database have "meta-data" associated with them.
This data includes:

* \<table_name\>_id
* created_at
* modified_at
* created_by

These fields are always set by the system and should __not__ be set by the user. They can be queried as usual using the
normal query syntax.

> A request like this:

```python
    url = 'http://smartapi.bboxx.co.uk/v1/product_types'
    data = {
        "name": "Test Product Type",
        "erp_code": "XX0005",
    }
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, data=data, headers=headers)
```

> Would therefore give a response like this:

```python
>>> {
        u'product_type_id': 19
        u'name': u'Test Product Type',
        u'erp_code': u'XX0005',
        u'created_at': u'2016-07-28T08:43:09.501636',
        u'created_by': u'u.celery@bboxx.co.uk',
        u'modified_at': None,
    }
```

> Note that <font color="Crimson">`product_type_id`</font> and all of the rest of the meta-data have been set correctly

### \<table_name\>_id

Every record has an integer identifier. This is the __`primary key`__ for that record and is therefore __`unique`__.
The identifier for any given table is `<table_name>_id` for example:

Table | Primary Key
------|------------
amomaly | anomaly_id
software_version_type | software_version_type_id

The id is assigned by the system automatically during any `POST` request and should __not__ be specified by the user.

There is one exception to this. The `Product` table uses `imei` (a 15 char string) as the `primary key`. It does not have a `product_id` field.

### created_at

Every record has a `created_at` column which is a millisecond-precision timestamp in ISO8601 format (YYYY-MM-DD HH:MM:SS.mmmm).
`created_at` specifies the time at which the record is inserted into the database and is set by the system. If `created_at` is specified by the user it is ignored.

All times are UTC with no timezone information.

### created_by

Every record has a `created_by` column which is the username of the user responsible for creating the record. `created_by` is set by the system, if `created_at` is specified by the user it is ignored and replaced with the username associated which the token provided in the headers.

### modified_at

Every record has a `modified_at` column which is a  millisecond-precision timestamp in ISO8601 format (YYYY-MM-DD HH:MM:SS.mmmm).

`modified_at` specifies the __last__ time that an column in that record was altered and is set by the system. If `modified_at` is specified by the user it is ignored.
