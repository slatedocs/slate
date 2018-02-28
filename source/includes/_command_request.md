## `/products/<imei>/command_request`

> A `POST` request to this endpoint sends a debug/diagnostic command to an RTC-enabled unit.

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/command_request"
    data = json.dumps({"command": "atc 60 AT+CPOL=?;+COPS=?"})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.post(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "command successfully sent",
            "data": {}
    }
```

This endpoint sends a debug/diagnostic command to an RTC-enabled unit. The imei of the unit is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/command_request`
__method__ | `POST`
__url_params__ | `product_imei` _(str)_
__payload__ | `{"command": <command>}`
__response__ | 200

### Command
The body of the `POST` should be a valid debug/diagnostic command.
