## `/products/<imei>/get_repair`

> A `GET` request to this endpoint attempts to retrieve the current repair workflow for the given unit. 

```python
    url = "https://smartapi.bboxx.co.uk/v1/products/000000000000/get_repair"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Repair found",
            "data": {'repair_id': 1}
    }
```

This endpoint attempts to retrieve the current repair workflow for the given unit. If the unit is in IN_REPAIR state, but not currently associated with a repair workflow, a new workflow will be created and its identifier returned.

If the unit is not currently in IN_REPAIR state, an error response (status code 400) will be returned.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/get_repair`
__method__ | `GET`
__url_params__ | `product_imei` _(str)_
__payload__ | None
__response__ | 200

The format of the data returned by this endpoint is a dictionary with key `status`, `data`, and (optionally) `message`.

The `data` key contains a dictionary with key `repair_id`. The value associated with this key is the identifier of the repair workflow.

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response