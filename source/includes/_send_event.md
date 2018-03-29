## `/repairs/<repair_id>/send_events`

> A `PUT` request to this endpoint is used to submit a user event notification for the current repair workflow state

```python
    url = "https://smartapi.bboxx.co.uk/v1/repairs/000000000000/send_events"
    data = json.dumps({
        [
            "event": "battery.charged"
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
__endpoint__ | `/repairs/<repair_id>/send_events`
__method__ | `PUT`
__url_params__ | None
__payload__ | JSON-formatted dictionary with a single key identifying the user's event notification (see [IRT Event Specifications](#irt-event-specifications))
__response__ | 200

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response