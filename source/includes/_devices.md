# DEVICES

End devices are any end device such as a sensor, a door locks, a light, a thermostats...etc. Most of these devices are battery-powered and therefore low-powered. As a result, they usually speak a mesh network protocol that Weaver abstracts away for you through clean API endpoints.


## Device Object


```json
{
    "id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "manufacturer": "Kwikset",
    "model": "914",
    "name": "Kwikset914 5c:a1:0",
    "actions": {
        "lock": {
            "method_name": "handle_lock",
            "title": "Lock",
            "description": "Locks the Door Lock",
            "inputs": null
        },
        "unlock": {
            "method_name": "handle_unlock",
            "title": "Unlock",
            "description": "Unlocks the Door Lock",
            "inputs": null
        },
        "set_code": {
            "method_name": "handle_set_code",
            "title": "Set Code",
            "description": "Set User Code for the Door Lock",
            "inputs": {
                "code": {
                    "title": "Code",
                    "description": "Pin Code, all numbers, can start
                        with 0, must be between 4 and 8 digits in
                        length",
                    "type": "string"
                },
                "slot_id": {
                    "title": "Slot ID",
                    "description": "2 through 11",
                    "type": "integer"
                }
            }
        },
        "clear_code": {
            "method_name": "handle_clear_code",
            "title": "Clear Code",
            "description": "Clear a User Code for the Door Lock",
            "inputs": {
                "slot_id": {
                    "title": "Slot ID",
                    "description": "2 through 11",
                    "type": "integer"
                }
            }
        }
    }
}
```

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Device
manufacturer | string | The manufacturer of the Device
model | string | The model of the Device
name | string | The name of the Device
actions | object | The list of supported actions by this device

## Get a Specific Device Object

```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/devices/${DEVICE_ID}"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = "https://api.getweaver.io/v1/devices/#{DEVICE_ID}"

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "manufacturer": "Kwikset",
    "model": "914",
    "name": "Kwikset914 5c:a1:0",
    "actions": {
        "lock": {
            "title": "Lock",
            "description": "Locks the Door Lock",
            "inputs": null
        },
        "unlock": {
            "title": "Unlock",
            "description": "Unlocks the Door Lock",
            "inputs": null
        },
        "set_code": {
            "title": "Set Code",
            "description": "Set User Code for the Door Lock",
            "inputs": {
                "code": {
                    "title": "Code",
                    "description": "Pin Code, all numbers, can start
                        with 0, must be between 4 and 8 digits in
                        length",
                    "type": "string"
                },
                "slot_id": {
                    "title": "Slot ID",
                    "description": "2 through 11",
                    "type": "integer"
                }
            }
        },
        "clear_code": {
            "title": "Clear Code",
            "description": "Clear a User Code for the Door Lock",
            "inputs": {
                "slot_id": {
                    "title": "Slot ID",
                    "description": "2 through 11",
                    "type": "integer"
                }
            }
        }
    }
}
```

This endpoint retrieves a specific device. Note that the listed device will also list its supported actions. Please refer to the Action Requests section to see how to make an action request to a device

### HTTP Request

`GET /v1/devices/<DEVICE_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device to retrieve
