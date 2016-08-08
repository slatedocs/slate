##`/products/<imei>/lock_software`

> A `PUT` request to this endpoint will lock the software on the unit to the specified software.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/lock_software"
    data = json.dumps({"software": <software_id> or <software_name>})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "#866771029490827 updated and locked to software_version <version_name>", 
        "data": {
            "software_lock_id": <id>,
            "software_lock_name": <name>,
    }
```

> A `PUT` request with blank payload will remove the software lock.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/lock_software"
    data = json.dumps({"software": None})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "#866771029490827 software_lock is now removed", 
        "data": {
            "software_lock_id": None,
            "software_lock_name": None,
        }
    }
```

This endpoint is used to update the software a unit. The imei of the unit to be enbaled is specified in the url.
A lock is removed by making a `PUT` request to this endpoint with a blank payload.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/lock_software`
__method__ | `PUT`
__url_params__ | `product_imei` _(int)_
__payload__ | {"software": <id> or <name>}
__response__ | 200
__permissions__ | <font color="Crimson">__`SYSTEM`__</font>

The endpoint accepts both `software_version_type_id` or `name`. A complete list of the available software versions types can retreived from the `/software_version_type_id` endpoint. 

A unit can have its software "locked" to a certain version. If the software is locked then it cannot be updated. See `Software and Locking` for more information.
