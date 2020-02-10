# GATEWAYS

Weaver Gateways are the resource representing the hardware hub that's provided by Weaver.

The hardware resides on your local area network (LAN) and creates a link to the outside world via a secure connection to the Weaver API. Its job is to take simple commands and translate them to lower-level mesh protocol commands that end devices can understand.

You can query the API for a list of all your gateways, as well as an individual gateway to see its attributes and associated end devices.


## Gateway Object

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Gateway
location | string | The address of the location of the Gateway
ip_address | string | The ip address of the Gateway
status | string | The connectivity status of the Gateway
devices | array | The associated devices of the Gateway

## Get All Gateways

```shell
curl -X GET \
  -u ${API_KEY}: \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{API_KEY}:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
[
    {
        "id": "486044af-5b15-436e-a356-d5f28c28f22a",
        "location": "650 Valencia St, San Francisco CA",
        "status": "online",
        "ip_address": "198.27.188.234"
    },
    {
        "id": "1996c71c-09e6-454a-9d0b-efc214231907",
        "location": "538 Folsom St, San Francisco CA",
        "status": "offline",
        "ip_address": "112.27.158.932"
    }
]
```

This endpoint retrieves all of your organization's Weaver Gateways.

### HTTP Request

`GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways`

## Get a Specific Gateway Object

```shell
curl -X GET \
  -u ${API_KEY}: \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>


```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{API_KEY}:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "486044af-5b15-436e-a356-d5f28c28f22a",
    "location": "1495 Valencia St, San Francisco CA",
    "status": "online",
    "ip_address": "198.27.188.234",
    "devices": [
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
    ]
}
```

This endpoint retrieves a specific gateway and its associated devices. Note that each listed device will also list its supported commands. Please refer to the command section to see how to issue commands to a device

### HTTP Request

`GET http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the gateway to retrieve

## Pair New Device to Gateway

```shell
curl -X POST \
  -u {API_KEY}: \
  http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>/pair_devices
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{API_KEY}:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = 'http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>/pair_devices'

RestClient.post(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "1996c71c-09e6-454a-9d0b-efc214231907",
    "location": "538 Folsom St, San Francisco CA",
    "status": "online",
    "ip_address": "112.27.158.932"
}
```

To connect a device to a gateway, you need to put the gateway into pairing mode and manually add the end devices.

When the end devices join your Weaver Gateway's network, the Gateway will automatically register them to the Weaver API.

Once you issue the request, the Gateway will transition into a `pairing` status.

<aside class="warning">You cannot add devices using just the REST API. Please refer to the end device's user manual to find the manual pairing instructions.</aside>

### HTTP Request

`POST http://ec2-54-89-135-191.compute-1.amazonaws.com:8080/v1/gateways/<GATEWAY_ID>/pair_devices`

### URL Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the gateway to retrieve
