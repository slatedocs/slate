## `/products/<imei>/enable`

> A `PUT` request to this endpoint enables the unit.

```python
    url = "http://smartapi.bboxx.co.uk/v1/products/000000000000/enable"
    headers = {'Content-Type': 'application/json', 'Authorization': 'Token token=' + A_VALID_TOKEN}

    r = requests.put(url=url, headers=headers)

    print r.json()
    >>> {
        "status": "success", 
        "message": "Product enabled", 
        "data": None
    }
```

This endpoint is used to enable (switch-on) a unit. The imei of the unit to be enabled is specified in the url.

    | value 
---:|:------
__endpoint__ | `/products/<imei>/enable`
__method__ | `PUT`
__url_params__ | `product_imei` _(int)_
__payload__ | None
__response__ | 200

Note that if a unit is already enabled the API will return "success" anyway. 

### Pending Status and Enable History

A unit's status will only change once it makes an RC-GET connection the SMARTSolar API and retrieves it's new status before then its actual status is unchanged. To reflect this the unit is placed in a "pending" state. The pending state therefore means that the unit has been enabled (or disabled) but has not yet connected to the system to update its status.

For example:

* A unit is OFF (disabled). 
* A technician chooses to enable the unit, the unit then moves to "pending enabled" and is still off. 
* The unit remains in "pending enabled" until a connection is made.
* A connection is made - the unit receives its new status and is moved to enabled, it is now ON

### The `enable_history` table

The changes above are tracked in the `enable_history` table. Each time an unit has a change of state this is recorded in the 
`enable_history` table, along with the user who caused the change. 

### WakeUp
> Current WAKEUP ENABLED software:

```python
WAKEUP_ENABLED_SOFTWARE = [
    "2.15",
    "2.16",
    "3.2",
    "3.3",
    "3.4",
    "3.5",
    "3.6",
    "3.6a",
    "hub-stc-1",
    "hub-stc-2",
    "hub-stc-3",
    "hub-stc-4",
    "hub-stc-5",
    "hub-stc-6",
]
```

Waiting for a unit to make an RC-GET connection can take a long time - up to 4hrs! To avoid such slow response times when enabling or disabling a unit, the unit is automatically sent a `WAKEUP` SMS message. This message, if received correctly, causes the unit to "wakeup" and make an RC-GET connection immediately. This usually results in a response time of ~ 2mins for enable and disable operations. The `WAKEUP` will only be sent to units with compatible software (see right). Each sent SMS will be stored in the `sms_history` table where you can check the status of the SMS and confirm it's delivery (or lack-of!). For more details of SMS and WAKEUP see "SMS and WAKEUP".

