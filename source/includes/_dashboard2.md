# `/dashboard2`
> A plain `GET` request returns a json structure as follows:

```python
url = "http://smartapi.bboxx.co.uk/v1/dashboard2"
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

r = requests.get(url=url, headers=header)

r.json()
>>> {
    "data": [
        {
            "product_imei": "000000000000000",
            "serial_number": "BB17SMART-150127-0608",
            "imsi": "204040000000000",
            "hardware_type": "BB17SMART_v2",
            "entities": [{
                "entity_id": 1, 
                "name": "A Test Entity",
                "bboxx_company_flag": True,
                "financier": None,
                "tariff": "A Test Tariff"
                "created_at": "2015-02-11 12:24:29.993914",
                "created_by": "test.user@bboxx.co.uk",
                "modified_at": "2015-04-13 10:42:29",
            }],
            "hub_id": 2,
            "shop_id": None,
            "location_date": "2016-08-02T19:38:56",
            "alerts": [None],
            "software_lock": None,
            "pending_software_created_at": None,
            "state": "activated",
            "state_date": "2015-08-18T14:05:08",
            "recent_connection": "2016-08-02T19:38:56",
            "latitude": "-0.400234",
            "longitude": "34.599241",
            "error_radius": 69583,
            "capacity_limit": "7",
            "current_enable_flag": True,
            "desired_enable_flag": True,
            "current_tamper_flag": False,
            "desired_tamper_flag": False,
            "notes": [None],
            "software": "2.16"
            "pending_software": None,
            "created_at": "2015-04-16T02:09:55",
            "created_by": "test.user@bboxx.co.uk",
        }, 
        {
            "product_imei": "222222222222222",
            "serial_number": "BB17SMART-150127-0608",
            "imsi": "204042222222222",
            "hardware_type": "BB17SMART_v2",
            "entities": [{
                "entity_id": 1, 
                "name": "A Test Entity",
                "bboxx_company_flag": True,
                "financier": None,
                "tariff": "A Test Tariff"
                "created_at": "2015-02-11 12:24:29.993914",
                "created_by": "test.user@bboxx.co.uk",
                "modified_at": "2015-04-13 10:42:29",
            }],
            "hub_id": 2,
            "shop_id": None,
            "location_date": "2016-08-02T19:38:56",
            "alerts": [None],
            "software_lock": None,
            "pending_software_created_at": None,
            "state": "activated",
            "state_date": "2015-08-18T14:05:08",
            "recent_connection": "2016-08-02T19:38:56",
            "latitude": "-0.400234",
            "longitude": "34.599241",
            "error_radius": 69583,
            "capacity_limit": "7",
            "current_enable_flag": True,
            "desired_enable_flag": True,
            "current_tamper_flag": False,
            "desired_tamper_flag": False,
            "notes": [None],
            "software": "2.16"
            "pending_software": None,
            "created_at": "2015-04-16T02:09:55",
            "created_by": "test.user@bboxx.co.uk",
        }, 
    ]
    "num_results": 2
    "num_results_filtered": 2
}
```

> `/dashboard2` supports standard Flask-Restless filtering, for example:

```python

```

This endpoint is used to return a collection of useful data about a product (or products) in a format that is readable. 
The endpoint supports Flask-Restless standard query filtering - for more details see _Query Format and Filtering_

    | value 
---:|:------
__endpoint__ | `/dashboard2`
__method__ | `GET`
__params__ | _See Query Format and Filtering_
__payload__ | N/A
__response__ | 200
