## `/v1/current_enable_status`

> A GET request to this endpoint will return the enable status of all units except the terminated ones ,so that the ERP can sync the unit status

```python
url = "https://smartapi.bboxx.co.uk/v1/current_enable_status?page=5&results_per_page=3"


headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=A_VALID_TOKEN'}

response = requests.get(url=url, headers=headers)

print(response.json())
    >>> {
    "data": [
        {
            "current_enable_state": "enabled",
            "current_state_type": 5,
            "date": "2015-06-04T10:59:30",
            "dcm_enabled_flag": False,
            "entity": "BBOXX Capital Kenya",
            "entity_id": 4,
            "hardware_type": "BB17SMART_v1",
            "prev_enable_state": "disabled",
            "product_imei": "test-77006985814",
            "product_type_id": 1,
            "serial_number": "BB17SMART-2014_MAY21-test",
            "total_accessory_energy": None,
            "user": "test@bboxx.co.uk",
        },
        {
            "current_enable_state": "enabled",
            "current_state_type": 5,
            "date": "2015-06-04T10:59:31",
            "dcm_enabled_flag": False,
            "entity": "BBOXX Capital Kenya",
            "entity_id": 4,
            "hardware_type": "BB17SMART_v2",
            "prev_enable_state": "disabled",
            "product_imei": "test-49004970581",
            "product_type_id": 2,
            "serial_number": "BB17SMART-140710-test",
            "total_accessory_energy": None,
            "user": "test@bboxx.co.uk",
        },
        {
            "current_enable_state": "enabled",
            "current_state_type": 5,
            "date": "2015-06-04T10:59:48",
            "dcm_enabled_flag": False,
            "entity": "BBOXX Capital Kenya",
            "entity_id": 4,
            "hardware_type": "BB17SMART_v2",
            "prev_enable_state": "disabled",
            "product_imei": "test-50004183746",
            "product_type_id": 2,
            "serial_number": "BB17SMART-150127-test",
            "total_accessory_energy": None,
            "user": "test@bboxx.co.uk",
        },
    ],
    "message": "enable_histories retrieved",
    "status": "success",
}

```

This endpoint will return the enable status of all units except the terminated ones,so that the `ERP` can sync the unit status

The ERP is concerned about units getting `out of sync` with SMARTSolar so once
    every two hours they try to sync all unit statuses. Initially this endpoint only
    returned the enable_state but it's functionality has expanded over time.

    | value
---:|:------
__endpoint__ | `/v1/current_enable_status`
__method__ | `GET`
__url_params__ | `page` , `results_per_page`
__response__ | 200
__permissions__ | <font color="Crimson">__`FACTORY`__</font>
