## `/products/<imei>/status_update`

> A `POST` request to this endpoint sends the latest parameter values to an RTC-enabled unit.

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/status_update"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "status update successfully sent",
            "data": {}
    }
```

This endpoint sends the latest parameter values to an RTC-enabled unit. The imei of the unit is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/status_update`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200

