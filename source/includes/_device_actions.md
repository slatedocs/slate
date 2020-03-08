# DEVICE ACTIONS

Actions represent the capabilities of a Device. Each type of device supports
a unique list of actions. This Action Object defines the requisite inputs for
requesting each action type.


## Action Object


```json
{
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
    }
}
```

Parameter | Type | Description
--------- | ---- | -----------
title | string | A title of the Action
description | string | A description of the Action
inputs | object | An input object with: a title for the input, a description of its validation parameters, and its primitive type (one of null, boolean, object, array, number, integer or string)

## Issuing an Action Request to a Device

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/devices/${DEVICE_ID}/actions/${ACTION_NAME}"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = "https://api.getweaver.io/v1/devices/#{DEVICE_ID}/actions/#{ACTION_NAME}"

payload = {
}

RestClient.post(url, payload, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "cb41f7cf-b49d-4e8b-856c-5e12d1b8ca48",
    "status": "pending",
    "device_id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "created_at": "2020-02-10T01:33:19.955Z",
    "updated_at": "2020-02-10T01:33:19.955Z",
    "data": {
        "lock": {}
    }
}
```

This endpoint requests an Action from a specific device. You will receive an [Action
Request](#action-requests) object as a response. The Action Request can be used to track the progress
of the request. Please read the [Understanding Action Requests](#understanding-action-requests)
section for a more thorough explanation of the Action Request lifecycle.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/actions/<ACTION_NAME>`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device to retrieve
ACTION_NAME | The Name of the Action requested

### Query Parameters

Please refer to the Inputs field in the Device Actions list to see the requirements of each input
