# Commands

Door locks are currently the only device type supported by the Weaver API. At the moment, the API supports 4 basic commands:

* Lock door (lock)
* Unlock door (unlock)
* Set a Code
* Clear all Codes

When you initiate an command, the endpoint will create a command object and return its reference. You can then receive updates on the status of the command either via WebSockets or a predefined HTTP Webhook.

## Command Object

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Command
status | string | The status of the Command
gateway_id | uuid | The ID of the associated Gateway
device_id | uuid | The ID of the Device that performed the Command
device_ieee | uuid | The IEEE Standard Device Number of the Device that performed the Command
action | string | The action name for the Command
properties | object | The properties of the Command
created_at | datetime | Datetime when the Command was created
updated_at | datetime | Datetime when the Command was last updated

## Lock a Door

```shell
curl -X POST \
  -u ${API_KEY}: \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/lock
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/lock'

RestClient.post(url, {}, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "2222222-2222-2222-2222-22222222222",
  "status": "pending",
  "gateway_id": "0000000-0000-0000-0000-00000000000",
  "device_id": "1111111-1111-1111-1111-11111111111",
  "device_ieee": "00:00:00:00:00:00",
  "action": "lock",
  "properties": {},
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z"
}
```

This endpoint issues a "lock" action to a door lock.

### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/lock`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

## Unlock a Door

```shell
curl -X POST \
  -u ${API_KEY}: \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/unlock
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/unlock'

RestClient.post(url, {}, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "2222222-2222-2222-2222-22222222222",
  "status": "pending",
  "gateway_id": "0000000-0000-0000-0000-00000000000",
  "device_id": "1111111-1111-1111-1111-11111111111",
  "device_ieee": "00:00:00:00:00:00",
  "action": "unlock",
  "properties": {},
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z"
}
```

This endpoint issues a "unlock" action to a door lock.

### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/unlock`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

## Set a Pin Code

```shell
curl -X POST \
  -u ${API_KEY}: \
  -H "Content-Type: application/json" \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/set_code
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${API_KEY}'
}

payload = {
  'code': '1111'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/set_code'

RestClient.post(url, payload, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "2222222-2222-2222-2222-22222222222",
  "status": "pending",
  "gateway_id": "0000000-0000-0000-0000-00000000000",
  "device_id": "1111111-1111-1111-1111-11111111111",
  "device_ieee": "00:00:00:00:00:00",
  "action": "set_code",
  "properties": {
    "code": "1111"
  },
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z"
}
```

This endpoint issues a "set_code" action to a door lock.



### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/set_code`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding

#### Query Parameters

Parameter | Type | Required | Description
--------- | ---- | -------- | -----------
code | String | Required | 4 to 8 digit number code, leading '0' is okay
user_id | integer | Optional | ID of Code slot to be programmed in, between 1 - 10

## Clear All Pin Codes

```shell
curl -X POST \
  -u ${API_KEY}: \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/clear_all_codes
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token ${API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/clear_all_codes'

RestClient.post(url, {}, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "2222222-2222-2222-2222-22222222222",
  "status": "pending",
  "gateway_id": "0000000-0000-0000-0000-00000000000",
  "device_id": "1111111-1111-1111-1111-11111111111",
  "device_ieee": "00:00:00:00:00:00",
  "action": "clear_all_codes",
  "properties": {},
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z"
}
```

This endpoint issues a "clear_all_codes" action to a door lock.

### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/devices/${DEVICE_ID}/clear_all_codes`

### URL Parameters

Parameter | Description
--------- | -----------
DEVICE_ID | The ID of the device you're commanding
