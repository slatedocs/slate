# GATEWAYS

Seam Gateways are the resource representing the hardware hub that's provided by Seam. Each gateway belongs to a group.

The hardware resides on your local area network (LAN) and creates a link to the outside world via a secure connection to the Seam API. Its job is to take simple commands and translate them to lower-level mesh protocol commands that end devices can understand.

Before you can start sending requests to your Gateway and its devices, you must first install it and pair with a group in your workspace. ***You will not be able to issue request to your Gateway until you have paired it with a group***.

<aside class="notice">
You Make sure to replace <code>YOUR_API_KEY</code> with your actual API key.
</aside>


## Installing Your Gateway

![Gateway Installation Instructions](https://www-prod-animation-assets.s3.amazonaws.com/gateway-install.svg)

Installing your Gateway is easy:

1. Plug in the power cord to provide the Gateway power.
2. Connect the ethernet backhaul to your home router or internet access point.




## Pairing the Gateway with Your Account
```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  -H "Content-Type: application/json" \
  -d '{"registration_token": "calm-haiku-42", "name": "my first gateway"}' \
  "https://api.getseam.com/v1/groups/${GROUP_ID}/register_gateway"
```

```ruby
require 'rest-client'

token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}",
  "Content-Type": "application/json"
}

payload = {
    "registration_token": "calm-haiku-42",
    "name": "my first gateway"
}

url = "https://api.getseam.com/v1/groups/#{GROUP_ID}/register_gateway"

RestClient.post(url, payload, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "486044af-5b15-436e-a356-d5f28c28f22a",
    "devices": [],
    "name": "my first gateway",
    "status": "online"
}
```

![Workspace Group Gateway End Devices Architecture](https://ik.imagekit.io/vgfzjbrn7/tr:w-350/registration-token.jpg)

Pairing a Gateway with one of your groups is easy.

1. Look for your gateway's `registration_token` located on the actual device.
2. Pick a group that you want to pair the Gateway with and issue the request in the example on the right to pair the request.
3. If successful, the API will return your paired Gateway.

Don't worry if you pair the Gateway to the wrong group or aren't sure which group to pair it with at the moment. You can always detach the gateway later on and move it to a different group.


## Pair Using the Seam Dashboard (UI)
Alternatively, you can also attach the gateway to a group in your workspace by using our dashboard.

1. go to the Gateways on the left menu
2. Click on the "+ Add Gateway" Button.
3. Enter the Gateways `registration_token`
4. Give your gateway a name

![Workspace Group Gateway End Devices Architecture](https://ik.imagekit.io/vgfzjbrn7/dashboard-device-hobbyist-pairing.jpg )








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
  "https://api.getseam.com/v1/gateways"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = 'https://api.getseam.com/v1/gateways'

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

This endpoint retrieves all of your organization's Seam Gateways.

### HTTP Request

`GET /v1/gateways`

## Get a Specific Gateway Object

```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  "https://api.getseam.com/v1/gateways/${GATEWAY_ID}"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = "https://api.getseam.com/v1/gateways/#{GATEWAY_ID}"

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
