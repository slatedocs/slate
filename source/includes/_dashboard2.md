## `/dashboard2`
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

This endpoint is used to return a collection of useful data about a product (or products) in a format that is helpful. 

    | value 
---:|:------
__endpoint__ | `/dashboard2`
__method__ | `GET`
__params__ | _See Query Format and Filtering_
__payload__ | N/A
__response__ | 200

### Querying and Filtering

> A single product can be queried as follows:

```python
url = "http://smartapi.bboxx.co.uk/v1/dashboard2"
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

params = {
    "q": json.dumps({
        "filters": [
            {"name": "product_imei", "op": "eq", "val": "866771029513065"}
        ]
    })
}
r = requests.get(url=url, params=params, headers=get_headers())
print r
>>> <Response 200>

print r.json()
>>> {
    "num_results": 1,
    "num_results_filtered": 1
    "data": [
        {
            "product_imei": "866771029513065",
            "imsi": "214074203094552",
            "hardware_type": "Hub",
            "serial_number": "HUB-10",
            "capacity_limit": "0.0",
            "current_enable_flag": True,
            "desired_enable_flag": True,
            "current_tamper_flag": True,
            "desired_tamper_flag": True,
            "entities": [{
                "entity_id": 31, 
                "name": "Angaza Design", 
                "bboxx_company_flag": False,
                "financier": None,
                "tariff": "WV-695 - Vodafone Global- ROWT3 1MB"
                "created_at": "2015-09-22T09:01:58.170953",
                "created_by": "d.mclean@bboxx.co.uk",
            }],
            "shop_id": None,
            "hub_id": None,
            "recent_connection": "2016-08-03T14:15:49",
            "location_date": "2016-08-03T14:15:49",
            "latitude": "37.783256",
            "longitude": "-122.404417",
            "error_radius": 1251,
            "alerts": [None],
            "state": "activated",
            "state_date": "2016-07-14T22:03:09",
            "software": "hub-stc-4"
            "software_lock": None,
            "pending_software": None,
            "pending_software_created_at": None,
            "notes": [None],
            "created_at": "2016-06-30T16:17:56",
            "created_by": "r.software@bboxx.co.uk",
            "modified_at": None,
        }
    ],
}
```

The `/dashboard2` endpoint follows the Flask-Restless query format but with a few caveats. 

Querying a single product follows the expected pattern.  
`"filters": [{"name": "entities", "op": "eq", "val": "A Test Entity"}]` 

### Entities

```python
url = "http://smartapi.bboxx.co.uk/v1/dashboard2"
headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}


params = {
    "q": json.dumps({
        "filters": [
            {"name": "entities", "op": "=", "val": "BBOXX Engineering"}
        ]
    })
}
r = requests.get(url=url, params=params, headers=headers)
```

Querying entities deviates from the expected pattern slightly. 

Rather than `"name": "entity"` you must instead specify `"name": "entities"`  

In addition the value must be the name of an entity rather than an `entity_id`.  

For example:  
`"filters": [{"name": "entities", "op": "eq", "val": "A Test Entity"}]`

__<aside class="warning">The name is Case-Sensitive and must be an exact match of the entity name in the database. If you're unsure of the exact name query the <a href=#/entities>`/entities`</a> endpoint to confirm the entity names.</aside>__


