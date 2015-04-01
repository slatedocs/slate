# Install Attribution

## Install events

```php
<?php

const ATTRIBUTION_ENDPOINT = "https://live.chartboost.com/api/v1/install.json";

const CHARTBOOST_TOKEN = "api_token";
const CHARTBOOST_SECRET = "api_secret";

$app_id = "54ecc0535beacdc1e1eff778";
$app_signture = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";

$gaid = "8df6c9bf-d647-4400-bc13-7ff317f046f3";
$claim = 1;
$attributed_to = "Chartboost";

$data = json_encode(array(
  "app_id" => $app_id,
  "gaid" => $gaid,
  "claim" => $claim,
  "attributed_to" => $attributed_to
));

$descriptor = "action:attribution\n{CHARTBOOST_SECRET}\n$app_signature\n$data";
$signature = hash("sha256", $descriptor);

$headers = array(
  "Content-Type" => "application/json",
  "X-Chartboost-Token" => CHARTBOOST_TOKEN,
  "X-Chartboost-Signature" => $signature
);


Requests::post(ATTRIBUTION_ENDPOINT, $headers, $data);
?>
```

```python
import json
import hashlib
import requests


ATTRIBUTION_ENDPOINT = 'https://live.chartboost.com/api/v1/install.json'

CHARTBOOST_TOKEN = 'api_token'
CHARTBOOST_SECRET = 'api_secret'

app_id = '54ecc0535beacdc1e1eff778'
app_signture = '601be68e3bb4e7eb953024eb4f2ac03376e2c2fb'

gaid = '8df6c9bf-d647-4400-bc13-7ff317f046f3'
claim = 1
attributed_to = 'Chartboost'

data = json.dumps({
  'app_id': app_id,
  'gaid': gaid,
  'claim': claim,
  'attributed_to': attributed_to
})

descriptor_template = 'action:attribution\n{}\n{}\n{}'
descriptor = descriptor_template.format(CHARTBOOST_SECRET, app_signature, data)
signature = hashlib.sha256(descriptor).hexdigest()

headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-Token': CHARTBOOST_TOKEN,
  'X-Chartboost-Signature': signature
}

requests.post(ATTRIBUTION_ENDPOINT, data=data, headers=headers)
```

```shell
curl 'https://live.chartboost.com/api/v1/install.json' \
  -H 'Content-Type: application/json' \
  -H 'X-Chartboost-Token: token' \
  -H 'X-Chartboost-Signature: def073680e717083c7e92570a5fea4c2a1d8cc18759038ee93ba349e9137ca5b' \
  -d '{"app_id": "54ecc0535beacdc1e1eff778", "gaid": "8df6c9bf-d647-4400-bc13-7ff317f046f3", "claim": 1, "attributed_to": "Chartboost"}'
```

> Sample Response

```json
{
  "status": 200,
  "message": "Attribution request received"
}
```

This endpoint will receive app installs from an attribution network. Installs will be processed, stored, and used in reporting.

### HTTP Request

`POST https://live.chartboost.com/api/v1/install.json`

### Authentication

You will need an API token and secret to authenticate with this service. This service is currently only available for attribution networks. Please email [support](mailto:support@chartboost.com) if you are an attribution network seeking access to this service.

To authenticate with this endpoint, you must generate a signature on each request. A string with the following template must be made, and the signature is created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a variable that is meant to be filled in.

`"action:attribution\n{{issued secret}}\n{{app signature}}\n{{json body}}"`

The resulting digest from the hash function should be sent in the `X-Chartboost-Signature` header in the request.

For an example of the signature hashing, refer to the code example.

### Headers

Each request must contain the following headers.

Header                 | Value
----                   | -----
Content-Type           | `application/json`
X-Chartboost-Token     | `{{issued token}}`
X-Chartboost-Signature | `{{computed signature}}`


### Request Parameters

Each request must use these parameters.

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
app_id        | true     | string | Chartboost App ID
claim         | true     | int    | 1 if Chartboost can claim the install, 0 otherwise
gaid          | true*    | string | Google advertising identifier
ifa           | true*    | string | Apple advertising identifier
uuid          | true*    | string | `UDID` (if iOS), `android_id` (if Android)
organic       | false    | int    | 1 if organic install, 0 if attributed to a network
attributed_to | false    | string | Network name that received the attribution
timestamp     | false    | int    | UNIX timestamp in seconds

<aside class="notice">
* At least one device identifier is required per request.
</aside>

<aside class="notice">
The HTTP status code of the response from this endpoint will always be 200. Check the "status" key on the JSON response for the real status code.
</aside>