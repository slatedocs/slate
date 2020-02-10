# DEVICES

End devices are any end device such as a sensor, a door locks, a light, a thermostats...etc. Most of these devices are battery-powered and therefore low-powered. As a result, they usually speak a mesh network protocol that Weaver abstracts away for you through clean API endpoints.


## Device Object

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Device
gateway_id | string | The ID of the associated Gateway
manufacturer | string | The manufacturer of the Device
name | string | The name of the Device
ieee | string | The IEEE Standard Device Number of the Device
created_at | datetime | Datetime when the Device was created
updated_at | datetime | Datetime when the Device was last updated
