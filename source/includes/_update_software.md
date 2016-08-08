## `/products/<imei>/update_software`

> A `PUT` request to this endpoint with set the unit to upgrade to the specified software when it next connects to the system. 

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/update_software"
    data = json.dumps({"software": <software_id> or <software_name>})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "#866771029490827 updated to software_version <version_name>", 
        "data": None
    }
```

This endpoint is used to update the software a unit. The imei of the unit to be enbaled is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/update_software`
__method__ | `PUT`
__url_params__ | `product_imei` _(int)_
__payload__ | {"software": <id> or <name>}
__response__ | 200
__permissions__ | <font color="Crimson">__`SYSTEM`__</font>

The endpoint accepts both `software_version_type_id` or `name`. A complete list of the available software versions types can retreived from the `/software_version_type_id` endpoint. 

A unit can have its software "locked" to a certain version. If the software is locked then it cannot be updated. See `Software and Locking` for more information.

