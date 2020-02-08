# Gateways

## Gateway Object

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Gateway
organization_id | integer | The ID of your organization
location | string | The address of the location of the Gateway
mac_address | string | The mac address of the Gateway
ip_address | string | The ip address of the Gateway
status | string | The connectivity status of the Gateway
created_at | datetime | Datetime when the Gateway was created
updated_at | datetime | Datetime when the Gateway was last updated
devices | array | The associated devices of the Gateway

## Get All Gateways

```shell
curl -X GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways \
  -H "Authorization: Token {API_KEY}"
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token {API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": "0000000-0000-0000-0000-00000000000",
    "organization_id": 1,
    "location": "123 Main St, San Francisco CA",
    "mac_address": "00:00:00:00:00:00",
    "ip_address": "192.0.1.234",
    "status": "online",
    "created_at": "2020-01-01T12:34:56.789Z",
    "updated_at": "2020-01-01T12:34:56.789Z"
  }
]
```

This endpoint retrieves all gateways.

### HTTP Request

`GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways`

## Get a Specific Gateway and its Associated Devices

```shell
curl -X GET \
  -H "Authorization: Token {API_KEY}" \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token {API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "0000000-0000-0000-0000-00000000000",
  "organization_id": 1,
  "location": "123 Main St, San Francisco CA",
  "mac_address": "00:00:00:00:00:00",
  "ip_address": "192.0.1.234",
  "status": "online",
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z",
  "devices": [
        {
            "id": "1111111-1111-1111-1111-11111111111",
            "device_type_id": 1,
            "gateway_id": "0000000-0000-0000-0000-00000000000",
            "manufacturer": "Kwikset",
            "name": "SMARTCODE_DEADBOLT_10",
            "ieee": "11:11:11:11:11:11:11:11",
            "created_at": "2020-01-01T12:34:56.789Z",
            "updated_at": "2020-01-01T12:34:56.789Z"
        }
    ]
}
```

This endpoint retrieves a specific gateway and its associated devices.

### HTTP Request

`GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the gateway to retrieve

## Pair New Device to Gateway

```shell
curl -X POST \
  -H "Authorization: Token {API_KEY}" \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>/add_new_devices
```

```ruby
require 'rest-client'

headers = {
  'Authorization': 'Token {API_KEY}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>/add_new_devices'

RestClient.post(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
  "id": "0000000-0000-0000-0000-00000000000",
  "organization_id": 1,
  "location": "123 Main St, San Francisco CA",
  "mac_address": "00:00:00:00:00:00",
  "ip_address": "192.0.1.234",
  "status": "online",
  "created_at": "2020-01-01T12:34:56.789Z",
  "updated_at": "2020-01-01T12:34:56.789Z"
}
```

To connect a device to a gateway, you need to put the gateway into pairing mode and manually add the end devices.

When the end devices join your Weaver Gateway's network, the Gateway will automatically register them to the Weaver API.

Once you issue the request, the Gateway will transition into a `pairing` status.

<aside class="warning">You cannot add devices using just the REST API. Please refer to the end device's user manual to find the manual pairing instructions.</aside>

### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>/add_new_devices`

### URL Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the gateway to retrieve
