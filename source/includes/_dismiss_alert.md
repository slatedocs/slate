## `/alerts/<alert_id>/dismiss`

> A `PUT` request to this endpoint dismisses an alert.

```python
    url = 'https://smartapi.bboxx.co.uk/v1/alerts/<alert_id>/dismiss'
    data = json.dumps({
        "dismissal_reason":"reason for dismissal", 
        "extra_info": "extra information about dismissal", 
        "repair_id":<repair_id>})
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, data=data headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Alert #{alert_id} has been dismissed", 
        "data": None
    }
```

This endpoint is used to dismiss an alert.

    | value 
---:|:------
__endpoint__ | `/alerts/<alert_id>/dismiss`
__method__ | `PUT`
__url_params__ | `alert_id` _(int)_
__payload__ | `{`<br>`"dismissal_reason":"reason for dismissal",` (optional)<br>&nbsp;` "extra_info": "extra information about dismissal,"` (optional)<br>&nbsp;` "repair_id":<repair_id>` (optional)<br>`}`
__response__ | 200

