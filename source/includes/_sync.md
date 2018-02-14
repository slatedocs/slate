## `/products/<imei>/sync`

> A `POST` request to this endpoint instructs an RTC-enabled unit to reply with up to date status and telemetry data.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/sync"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "sync request successfully sent",
            "data": {}
    }
```

This endpoint instructs an RTC-enabled unit to reply with up to date status and telemetry data. The imei of the unit is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/sync`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200

