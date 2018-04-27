## `/repairs/<repair_id>/history`

> A `GET` request to this endpoint is used to retrieve the repair workflow history state

```python
    url = "https://smartapi.bboxx.co.uk/v1/repairs/000000000000/history"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Repair state found",
            "data": [
                {'ident': 'ss_state_check', 'name': 'SMART SOLAR State Check'},
                {'ident': 'usb_diag_test', 'name': 'USB Diagnostic Test'},
                {'ident': 'explain_skip_btb', 'name': 'Skip the Battery Test'},
                {'ident': 'charge_2', 'name': 'Charge'},
                {'ident': 'clean', 'name': 'Clean'},
                {'ident': 'visual_inspection', 'name': 'Visual Inspection'},
                {'ident': 'select_damaged_casing', 'name': 'Select Damaged Casing'}
            ],
    }
```

This endpoint retrieves the repair workflow history state. 

    | value 
---:|:------
__endpoint__ | `/repairs/<repair_id>/history`
__method__ | `GET`
__url_params__ | `repair_id` _(int)_
__payload__ | None
__response__ | 200

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response