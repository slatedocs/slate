##`/products/<imei>/expire_software_updates`

> A `PUT` request to this endpoint expires all pending software updates.

```python
    url = http://smartapi.bboxx.co.uk/v1/products/000000000000/expire_software_updates
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Product 013950003928166 had 1 software update(s) expired", 
        "data": None,
    }
```

> If there are no pending updates to expire, the response would instead be:

```python
    >>> {
        "status": "success", 
        "message": "Product 013950003928166 had no pending updates to expire", 
        "data": None,
    }
```

This endpoint is used to remove a pending software update. 

    | value 
---:|:------
__endpoint__ | `/products/<imei>/expire_software_updates`
__method__ | `PUT`
__url_params__ | `product_imei` _(int)_
__payload__ | None
__response__ | 200
__permissions__ | <font color="Crimson">__`SYSTEM`__</font>


Please see the `Software` section of the docs for a comprehensive explanation of the way that the software on the unit is handled.