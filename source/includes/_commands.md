# COMMANDS

Commands are how we interact with end devices, such as locking a door or turning off a light.

Commands are a special way of encapsulating a request for a device to perform an action and we discuss them in-depth in the "Understanding Commands" section.


## Command Object

```json
{
    "id": "cb41f7cf-b49d-4e8b-856c-5e12d1b8ca48",
    "status": "pending",
    "device_id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "created_at": "2020-02-10T01:33:19.955Z",
    "updated_at": "2020-02-10T01:33:19.955Z",
    "name": "lock",
    "properties": {}
}
```

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Command
status | string | The status of the Command
device_id | uuid | The ID of the Device that performed the Command
name | string | The name for the Command
properties | object | The properties of the Command
created_at | datetime | Datetime when the Command was created
updated_at | datetime | Datetime when the Command was last updated

## Understanding Commands

Each time we issue a command for a specific end device, the Weaver API creates a `command` object and returns its reference. It also forwards the command to the specific device via the Weaver Gateway.

### The Command Lifecycle

You will notice that the `command` object has a `status` field which indicates the state of the command.

![Command Lifecycle](https://i.imgur.com/4mvpVVq.jpg)

When a `command` object is created, its initial `status` will be `pending`. This is because in the IoT world, **everything is asynchronous**, meaning that commands can take on the order of seconds, minutes, or even days to complete.

When the Gateway has forwarded the command to the device, the status of the command will automatically update to `received`.

Finally, when the command has been successfully completed by the end device, its status will update to `completed`.

### Getting Command Updates
When you initiate an command, the API will create a command object and return its reference. You can then receive updates on the status of the command either via WebSockets or a predefined HTTP Webhook.


# DOOR LOCKS

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


Door locks are currently the only device type supported by the Weaver API.

At the moment, the API supports 4 basic commands:

* Lock and unlock a door
* Set a code for up to 10 different users
* Clear all codes

As you can see on the right side, a door lock device object will indicate its supported commands given a manufacturer/model type.


## Lock a Door

```shell
curl -X POST \
  -u ${YOUR_API_KEY}: \
  https://getweaver.io/v1/devices/${DEVICE_ID}/lock
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("YOUR_API_KEY:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = "https://getweaver.io/v1/devices/#{DEVICE_ID}/lock"

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
    "name": "lock",
    "properties": {}
}
```

This endpoint issues a "lock" action to a door lock.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/lock`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

## Unlock a Door

```shell
curl -X POST \
  -u ${YOUR_API_KEY}: \
  https://getweaver.io/v1/devices/${DEVICE_ID}/unlock
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("YOUR_API_KEY:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = 'https://getweaver.io/v1/devices/#{DEVICE_ID}/unlock'

RestClient.post(url, {}, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "3a7b01af-5f7a-47ec-88b1-ec79640ef6ba",
    "status": "pending",
    "device_id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "created_at": "2020-02-10T01:32:49.942Z",
    "updated_at": "2020-02-10T01:32:49.942Z",
    "name": "unlock",
    "properties": {}
}
```

This endpoint issues a "unlock" action to a door lock.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/unlock`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

## Set a Pin Code

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  -H "Content-Type: application/json" \
  -d '{"code": "88888888", "user_id": 8}' \
  https://getweaver.io/v1/devices/${DEVICE_ID}/set_code
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${YOUR_API_KEY}'
}

payload = {
  'code': '88888888',
  'user_id': 8
}

url = 'https://getweaver.io/v1/devices/#{DEVICE_ID}/set_code'

RestClient.post(url, payload, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "c745b88b-aa14-476e-85fb-05675327c68c",
    "status": "pending",
    "device_id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "created_at": "2020-02-10T01:25:00.441Z",
    "updated_at": "2020-02-10T01:25:00.441Z",
    "name": "set_code",
    "properties": {
        "code": "2222"
    }
}
```

This endpoint issues a "set_code" action to a door lock.

The Weaver API allows you to set a different code for up to 10 different users. To do set the a code for a specific user, set the `user_id` parameter to a value between 1 to 10. If you do not provide this value, the `user_id` will default to `1`.



### HTTP Request

`POST /v1/devices/<DEVICE_ID>/set_code`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

### Query Parameters

Parameter | Type | Required | Default | Description
--------- | ---- | -------- | ------- | -----------
code | String | Required | n/a | 4 to 8 digit number code, leading '0' is okay
user_id | integer | Optional | 1 | ID of Code slot to be programmed in, between 1 - 10


## Clear All Pin Codes

```shell
curl -X POST \
  -u ${YOUR_API_KEY}: \
  https://getweaver.io/v1/devices/${DEVICE_ID}/clear_all_codes
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${YOUR_API_KEY}'
}

url = 'https://getweaver.io/v1/devices/#{DEVICE_ID}/clear_all_codes'

RestClient.post(url, {}, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "2222222-2222-2222-2222-22222222222",
  "status": "pending",
  "device_id": "1111111-1111-1111-1111-11111111111",
  "name": "clear_all_codes",
  "properties": {},
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z"
}
```

This endpoint issues a "clear_all_codes" action to a door lock.

### HTTP Request

`POST /v1/devices/<DEVICE_ID>/clear_all_codes`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding
