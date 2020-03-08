# GATEWAYS

Weaver Gateways are the resource representing the hardware hub that's provided by Weaver.

The hardware resides on your local area network (LAN) and creates a link to the outside world via a secure connection to the Weaver API. Its job is to take simple commands and translate them to lower-level mesh protocol commands that end devices can understand.

You can query the API for a list of all your gateways, as well as an individual gateway to see its attributes and associated end devices.


## Gateway Object

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Gateway
devices | array | The associated devices of the Gateway
name | string | The name of the Gateway
status | string | The connectivity status of the Gateway

## Get All Gateways

```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/gateways"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("YOUR_API_KEY:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = 'https://api.getweaver.io/v1/gateways'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
[
    {
        "id": "486044af-5b15-436e-a356-d5f28c28f22a",
        "devices": [
           {
               "id": "70354027-dcfa-48aa-acb1-9b79fd56b485",
               "name": "Kwikset914 5c:a1:0",
               "manufacturer": "Kwikset",
               "model": "914"
           }
        ],
        "name": "650 Valencia",
        "status": "online"
    },
    {
        "id": "1996c71c-09e6-454a-9d0b-efc214231907",
        "devices": [],
        "name": "538 Folsom - Unit 20",
        "status": "offline"
    }
]
```

This endpoint retrieves all of your organization's Weaver Gateways.

### HTTP Request

`GET /v1/gateways`

## Get a Specific Gateway Object

```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/gateways/${GATEWAY_ID}"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("YOUR_API_KEY:")
headers = {
  'Authorization': 'Token #{USER_AUTH_TOKEN}'
}

url = "https://api.getweaver.io/v1/gateways/#{GATEWAY_ID}"

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "486044af-5b15-436e-a356-d5f28c28f22a",
    "devices": [
       {
           "id": "70354027-dcfa-48aa-acb1-9b79fd56b485",
           "name": "Kwikset914 5c:a1:0",
           "manufacturer": "Kwikset",
           "model": "914"
       }
    ],
    "name": "650 Valencia",
    "status": "online"
}
```

This endpoint retrieves a specific gateway and its associated devices.

### HTTP Request

`GET /v1/gateways/<GATEWAY_ID>`

### URL Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the gateway to retrieve
