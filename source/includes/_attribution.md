# Install Attribution

## Install events

```php
<?php

const ATTRIBUTION_ENDPOINT = "https://live.chartboost.com/api/v1/install.json";

const ATTRIBUTION_PLATFORM_TOKEN = "api_token";
const ATTRIBUTION_PLATFORM_SECRET = "api_secret";

$app_id = "54ecc0535beacdc1e1eff778";
$app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";

$gaid = "8df6c9bf-d647-4400-bc13-7ff317ff0000"; # Google Advertising ID
$android_id = "f533bc6a9d9a2000"; # legacy Android ID
$claim = 1; # or claim=0 if non-attributable
$attributed_to = "Chartboost";

$data = json_encode(array(
  "app_id" => $app_id,
  "gaid" => $gaid,
  "uuid" => $android_id,
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

gaid = '8df6c9bf-d647-4400-bc13-7ff317ff0000' # Google Advertising ID
android_id = 'f533bc6a9d9a2000' # Legacy Android ID
claim = 1  # 1 if attributable or 0 if non-attributable
attributed_to = 'Chartboost'

data = json.dumps({
  'app_id': app_id,
  'gaid': gaid,
  'uuid': android_id,
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

var data, descriptor, signature, options, req;

var app_id = "54ecc0535beacdc1e1eff778"; // test app id 
var app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb"; // test app signature
const ATTRIBUTION_PLATFORM_SECRET = "<your API secret>"; // your party's API secret
const ATTRIBUTION_PLATFORM_TOKEN = "<your API token>"; // your party's API token
const ATTRIBUTION_HOST = "live.chartboost.com";
const ATTRIBUTION_PATH = "/api/v1/install.json";
const ATTRIBUTION_PORT = "443";
const WAITSECONDS = 10; // used by setInterval at bottom of script; will repeat the request every WAITSECONDS seconds

var idfa = "61109b4c0f164fbc82ec5475313af000";  // sample iOS IDFA
var claim = 1; // should be 0 if install is organic / not-attrituable to Chartboost, 1 if attributable
var attributed_to = "Chartboost"; // optional, send another network name if attributed to other network, or Organic if organic
var is_organic = 0; // optional, send 0 if not organic, 1 if organic

function sendInstall(callback) {
    data = JSON.stringify({
        "app_id": app_id,
        "ifa": idfa,
        "claim": claim,
        "attributed_to": attributed_to,
        "organic": is_organic
    });

    // X-Chartboost-Signature is generated on every request using the following hashing algorithm 
    descriptor = "action:attribution\n" + ATTRIBUTION_PLATFORM_SECRET + "\n" + app_signature + "\n" + data;
    signature = crypto.createHash('sha256').update(descriptor).digest('hex');
    console.log(signature);

    options = {
        host: ATTRIBUTION_HOST,
        port: ATTRIBUTION_PORT,
        path: ATTRIBUTION_PATH,
        method: 'POST',
        agent: false,
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': data.length,
            'X-Chartboost-Token': ATTRIBUTION_PLATFORM_TOKEN,
            'X-Chartboost-Signature': signature
        }
    };
    // Build the request using node https module
    req = https.request(options, function(res) {
        res.setEncoding('utf8');
        console.log("statusCode: ", res.statusCode);
        res.on('data', function(chunk) {
            console.log('Response: ' + chunk);
        });
    });
    req.write(data);
    req.end();
    callback();
}

// Send it!
sendInstall( function() {console.log(data);} );
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

This endpoint will receive both attributed app installs as well as app opens/sessions from an install attribution platform. Installs will be processed, stored, and used in reporting.  (This service is only available for install attribution platforms. If you are representing an install attribution platform, please <a href="mailto:support.integrations@chartboost.com">contact our Chartboost Partner Integrations Team</a> for a platform-specific API token and platform-specific secret to authenticate with this service.)


### HTTP Request

`POST https://live.chartboost.com/api/v1/install.json`

<aside class="notice">
This endpoint's response will always be an HTTP 200 status code. Check the "status" key on the JSON response for the real status code.
</aside>

### Authentication

To authenticate with this endpoint, you must generate a unique signature to be included as a header on each request. A string with the following template must be made. The signature is then created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a macro that is meant to be filled in by your server.

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
* Both Android ID and Google Advertising ID are *required* in every request unless the device only has Android ID available, in which case the single Android ID (uuid) parameter may be sent.
</aside>
