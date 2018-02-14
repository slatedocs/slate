## `/products/<imei>/rtc_online_status`

> A `POST` request to this endpoint sets the online status of an RTC-enabled unit.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/rtc_online_status"
    data = json.dumps({"status": "online"})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "RTC online status set",
            "data": {}
    }
```

This endpoint sets the online status of an RTC-enabled unit. The imei of the unit is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/rtc_online_status`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"status": <status>}`
__response__ | 200

### Status
The body of the `POST` should be a valid status value: 'online' or 'offline'.
