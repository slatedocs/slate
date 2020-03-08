# GATEWAY ACTIONS

Gateway Actions represent the capabilities of a Gateway.


## Pair New Device to Gateway

```shell
curl -X POST \
  -u "${YOUR_API_KEY}:" \
  "https://api.getweaver.io/v1/gateways/${GATEWAY_ID}/actions/pair_devices"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = 'https://api.getweaver.io/v1/gateways/${GATEWAY_ID}/actions/pair_devices'

RestClient.post(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
{
    "id": "1996c71c-09e6-454a-9d0b-efc214231907",
    "devices": [],
    "name": "538 Folsom - Unit 20",
    "status": "pairing"
}
```

To connect a device to a gateway, you need to put the gateway into pairing mode and manually add the end devices.

When the end devices join your Weaver Gateway's network, the Gateway will automatically register them to the Weaver API.

Once you issue the request, the Gateway will transition into a `pairing` status.

<aside class="">You cannot add devices using just the REST API. Please refer to the end device's user manual to find the manual pairing instructions.</aside>

### HTTP Request

`POST /v1/gateways/<GATEWAY_ID>/actions/pair_devices`

### URL Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the gateway to make the request to
