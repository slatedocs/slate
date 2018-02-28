## `/products/<imei>/force_connection`

> A `POST` request to this endpoint tells a unit to connect. For an RTC-enabled unit we will send a `sync`, for others we will `send_wakeup`.

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/force_connection"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Force connection request sent",
            "data": {}
    }
```

This endpoint tells a unit to connect. For an RTC-enabled unit we will send a `sync`, for others we will `send_wakeup`. The imei of the unit is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/force_connection`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200

