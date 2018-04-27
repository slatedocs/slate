## `/repairs/list_current_states`

> A `GET` request to this endpoint is used to retrieve a list of current repairs and their workflow states

```python
    url = "https://smartapi.bboxx.co.uk/v1/repairs/list_current_states"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.get(url=url, headers=headers)

    print r.json()
    >>> {
            "status": "success",
            "message": "Repair states found",
            "data": [
                {
                    'created_by': 'test.user@bboxx.co.uk',
                    'product_imei': '864811031004067',
                    'repair_id': 46141,
                    'repair_state_id': 'select_damaged_casing',
                    'repair_state_name': 'Select Damaged Casing'
                },
                {
                    'created_by': 'test.user@bboxx.co.uk',
                    'product_imei': '864811034773775',
                    'repair_id': 46137,
                    'repair_state_id': 'visual_inspection',
                    'repair_state_name': 'Visual Inspection'
                }            
            ],
    }
```

This endpoint retrieves a list of current repairs and their workflow states. 

    | value 
---:|:------
__endpoint__ | `/repairs/list_current_states`
__method__ | `GET`
__url_params__ | None
__query_params__ | `entity_id`=entity-id (optional - filter the list by entity)
                | `username`=username (optional - filter the list by user)
                | `repair_state`=repair-state-id (optional - filter the list by repair state)
__payload__ | None
__response__ | 200

If there are any formatting errors in requests the API will return error_code `400` and indicate the error in question in the `message` section of the response