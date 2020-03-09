# DOOR LOCKS

```json
{
    "id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "manufacturer": "Kwikset",
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


Door locks are currently the only device type supported by the Weaver API.

At the moment, the API supports 4 basic commands:

* Lock a door
* Unlock the door
* Set a code for a user
* Clear a code for a user

As you can see on the right side, a door lock device object will indicate its supported commands given a manufacturer/model type.


## Lock a Door

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/devices/${DEVICE_ID}/actions/lock"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = "https://api.getweaver.io/v1/devices/#{DEVICE_ID}/actions/lock"

RestClient.post(url, {}, headers: headers)
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

This endpoint issues a "lock" action to a door lock.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/actions/lock`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

## Unlock a Door

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/devices/${DEVICE_ID}/actions/unlock"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = 'https://api.getweaver.io/v1/devices/#{DEVICE_ID}/actions/unlock'

RestClient.post(url, {}, headers: headers)
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
        "unlock": {}
    }
}
```

This endpoint issues a "unlock" action to a door lock.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/actions/unlock`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

## Set a Pin Code

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  -H "Content-Type: application/json" \
  -d '{"data": {"code": "8888", "slot_id": 8}}' \
  "https://api.getweaver.io/v1/devices/${DEVICE_ID}/actions/set_code"
```

```ruby
require 'rest-client'

token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

payload = {
  'data': {
    'code': '8888',
    'slot_id': 8
  }
}

url = 'https://api.getweaver.io/v1/devices/#{DEVICE_ID}/actions/set_code'

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
        "set_code": {
            "code": "8888",
            "slot_id": 8
        }
    }
}
```

This endpoint issues a "set_code" action to a door lock.

The Weaver API allows you to set a different code for up to 10 different users. To do set the a code for a specific user, set the `slot_id` parameter to a value between 1 to 10. If you do not provide this value, the `slot_id` will default to `1`.



### HTTP Request

`POST /v1/devices/<DEVICE_ID>/actions/set_code`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
code | String | Code to be programmed
slot_id | integer | ID of the Code slot to be programmed in

<aside class="notice">
Please refer to the Device's Action object for details on each input's
validation requirements.
</aside>


## Clear a Pin Code

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  -H "Content-Type: application/json" \
  -d '{data: {"slot_id": 8}}' \
  "https://api.getweaver.io/v1/devices/${DEVICE_ID}/actions/clear_code"
```

```ruby
require 'rest-client'

token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

payload = {
  'data': {
    'slot_id': 8
  }
}

url = 'https://api.getweaver.io/v1/devices/#{DEVICE_ID}/actions/clear_code'

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
        "clear_code": {
            "slot_id": 8
        }
    }
}
```

This endpoint issues a "clear_code" action to a door lock.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/actions/clear_code`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

### Query Parameters

Parameter | Type | Description
--------- | ---- | -----------
slot_id | integer | ID of Code slot to be programmed in

<aside class="notice">
Please refer to the Device's Action object for details on each input's
validation requirements.
</aside>
