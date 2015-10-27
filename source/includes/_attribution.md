# Install Attribution

## Install events

```php
<?php

const ATTRIBUTION_ENDPOINT = "https://live.chartboost.com/api/v1/install.json";

const ATTRIBUTION_PLATFORM_TOKEN = "api_token";
const ATTRIBUTION_PLATFORM_SECRET = "api_secret";

$app_id = "54ecc0535beacdc1e1eff778";
$app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";

$gaid = "8df6c9bf-d647-4400-bc13-7ff317f046f3";
$claim = 1;
$attributed_to = "Chartboost";

$data = json_encode(array(
  "app_id" => $app_id,
  "gaid" => $gaid,
  "claim" => $claim,
  "attributed_to" => $attributed_to
));

$descriptor = "action:attribution\n{ATTRIBUTION_PLATFORM_SECRET}\n$app_signature\n$data";
$signature = hash("sha256", $descriptor);

$headers = array(
  "Content-Type" => "application/json",
  "X-Chartboost-Token" => ATTRIBUTION_PLATFORM_TOKEN,
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

ATTRIBUTION_PLATFORM_TOKEN = 'api_token'
ATTRIBUTION_PLATFORM_SECRET = 'api_secret'

app_id = '54ecc0535beacdc1e1eff778'
app_signature = '601be68e3bb4e7eb953024eb4f2ac03376e2c2fb'

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
descriptor = descriptor_template.format(ATTRIBUTION_PLATFORM_SECRET, app_signature, data)
signature = hashlib.sha256(descriptor).hexdigest()

headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-Token': ATTRIBUTION_PLATFORM_TOKEN,
  'X-Chartboost-Signature': signature
}

requests.post(ATTRIBUTION_ENDPOINT, data=data, headers=headers)
```

```javascript
var https = require('https');
var crypto = require('crypto');

var app_id = "55ef46745b14530c09698f94";
var app_signature = "dd5ccf325df48c2cd88ad53bca6614f0ecc3a13e";
var ifa = "FCA3FE48-AC39-4885-B94A-0970ED8813D8";
var ATTRIBUTION_PLATFORM_SECRET = "api_secret";
var ATTRIBUTION_PLATFORM_TOKEN = "api_token";
var ATTRIBUTION_ENDPOINT = "https://live.chartboost.com/api/v1/install.json";
var claim = 1;
var attributed_to = "Chartboost";

var data = JSON.stringify({
	"app_id": app_id,
	"ifa": ifa,
	"claim": claim,
	"attributed_to": attributed_to
});
var descriptor = "action:attribution\n" + ATTRIBUTION_PLATFORM_SECRET + "\n" + app_signature + "\n" + data;
var signature = crypto.createHash('sha256').update(descriptor).digest('hex');

var post_options = {
      host: "live.chartboost.com",
      port: '443',
      path: '/api/v1/install.json',
      method: 'POST',
      headers: {
          'Content-Type': 'application/json',
          'Content-Length': data.length,
          'X-Chartboost-Token': ATTRIBUTION_PLATFORM_TOKEN,
          'X-Chartboost-Signature': signature
      }
  };

var post_req = https.request(post_options, function(res) {
      res.setEncoding('utf8');
      res.on('data', function (chunk) {
        console.log('Response: ' + chunk);
      });
  });

post_req.write(data);
post_req.end();
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

This endpoint will receive both attributed app installs as well as app opens/sessions from an install attribution platform. Installs will be processed, stored, and used in reporting.

### HTTP Request

`POST https://live.chartboost.com/api/v1/install.json`

<aside class="notice">
This endpoint's response will always be an HTTP 200 status code. Check the "status" key on the JSON response for the real status code.
</aside>

### Authentication

(This service is only available for install attribution platforms. If you are representing an install attribution platform, please <a href="mailto:support.integrations@chartboost.com">contact Chartboost Support</a> for a platform-specific API token and platform-specific secret to authenticate with this service.)

To authenticate with this endpoint, you must generate a signature on each request. A string with the following template must be made, and the signature is created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a variable that is meant to be filled in.

Computed signature: `"action:attribution\n{{platform-specific secret}}\n{{Chartboost app signature}}\n{{json body}}"`

(The Chartboost app signature is an identifier unique to each individual app in the Chartboost dashboard. Chartboost developers can find their game's app signature on the Chartboost dashboard's **App Settings** page:)

<img src="https://s3.amazonaws.com/chartboost/help_assets/partners-app-sig.jpg" />

The resulting digest from the hash function should be sent in the `X-Chartboost-Signature` header in the request.

For an example of the signature hashing, refer to the code example.

### Headers

Each request must contain the following headers:

Header                 | Value
----                   | -----
Content-Type           | `application/json`
X-Chartboost-Token     | `{{issued token}}`
X-Chartboost-Signature | `{{computed signature}}`


### Request Parameters

Each request must use these parameters:

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
app_id        | true     | string | Chartboost app ID (found in the Chartboost dashboard)
claim         | true     | int    | 1 if Chartboost can claim the install, 0 otherwise
gaid          | true*    | string | Google advertising identifier
ifa           | true    | string | Apple identifier for advertising
uuid          | true*    | string | `UUID` (if iOS), `android_id` (if Android)
organic       | false    | int    | 1 if organic install, 0 if attributed to a network
attributed_to | false    | string | Name of network that received the attribution
timestamp     | false    | int    | UNIX timestamp in seconds

<aside class="notice">
* Both Android ID and Google Advertising ID are required unless the device only has Android ID available.
</aside>
