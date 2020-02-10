# DEVICES

End devices are any end device such as a sensor, a door locks, a light, a thermostats...etc. Most of these devices are battery-powered and therefore low-powered. As a result, they usually speak a mesh network protocol that Weaver abstracts away for you through clean API endpoints.


## Device Object


```json
{
    "id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "manufacturer": "Kwikset",
    "name": "SMARTCODE_DEADBOLT_10",
    "supported_commands": [
        "unlock",
        "lock",
        "clear_all_codes",
        "set_code"
    ]
}
```

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Device
gateway_id | string | The ID of the associated Gateway
manufacturer | string | The manufacturer of the Device
name | string | The name of the Device
supported_commands | object | The list of supported commands by this device
created_at | datetime | Datetime when the Device was created
updated_at | datetime | Datetime when the Device was last updated
