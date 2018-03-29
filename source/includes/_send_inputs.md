## `/repairs/<repair_id>/send_inputs`

> A `PUT` request to this endpoint is used to submit user input for the current repair workflow state

```python
    url = "https://smartapi.bboxx.co.uk/v1/repairs/000000000000/send_inputs"
    data = json.dumps({
        [
            "voltage": 4.8,
            "serial": "MC0211-999002-1"
        ]
        })
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Repair updated",
            "data": {},
    }
```

This endpoint submits user input for the current repair workflow state. 

    | value 
---:|:------
__endpoint__ | `/repairs/<repair_id>/send_inputs`
__method__ | `PUT`
__url_params__ | None
__payload__ | JSON-formatted dictionary with the details of the user's input (see [IRT Input Specifications](#irt-input-specifications))
__response__ | 200

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response