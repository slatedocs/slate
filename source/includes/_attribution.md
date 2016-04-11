# Install Attribution

## Install events

```php
<?php

const CB_ATTRIBUTION_ENDPOINT = "https://live.chartboost.com/api/v1/install.json";
const CB_API_TOKEN = "{{your_api_token}}"; 
const CB_API_SECRET = "{{your_api_secret}}";

$app_id = "54ecc0535beacdc1e1eff778";  # replace this with your app id
$app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";  # replace this with your app signature

$gaid = "8df6c9bf-d647-4400-bc13-7ff317ff0003";  # example Google Advertising ID
$android_id = "f533bc6a9d9a2000";  # example legacy Android ID
$ifa = "8df6c9bf-d647-4400-bc13-7ff317ff0004";  # example iOS Identifier for Advertising
$claim = 1;  # indicates install is attributable, set claim = 0 if install is non-attributable / organic
$attributed_to = "Chartboost";  # optional, send another network name if attributed to other network, or Organic if organic
$is_organic = 0;  # optional, send 0 if not organic, 1 if organic

$data = json_encode(array(
  "app_id" => $app_id,
  "gaid" => $gaid,
  "uuid" => $android_id,
  "claim" => $claim,
  "attributed_to" => $attributed_to,
  "is_organic" => $is_organic
));

$descriptor = "action:attribution\n$CB_API_SECRET\n$app_signature\n$data";
$signature = hash("sha256", $descriptor);

$headers = array(
  "Content-Type" => "application/json",
  "X-Chartboost-Token" => CB_API_TOKEN,
  "X-Chartboost-Signature" => $signature
);


Requests::post(CB_ATTRIBUTION_ENDPOINT, $headers, $data);
?>
```

```python
import json
import hashlib
import requests


CB_ATTRIBUTION_ENDPOINT = 'https://live.chartboost.com/api/v1/install.json'
CB_API_TOKEN = '{{your_api_token}}'
CB_API_SECRET = '{{your_api_secret}}'

app_id = '54ecc0535beacdc1e1eff778'  # replace this with your app id
app_signature = '601be68e3bb4e7eb953024eb4f2ac03376e2c2fb'  # replace this with your app signature
gaid = '8df6c9bf-d647-4400-bc13-7ff317ff0003'  # example Google Advertising ID
android_id = 'f533bc6a9d9a2000'  # example Legacy Android ID
ifa = '8df6c9bf-d647-4400-bc13-7ff317ff0004'  # example iOS Identifier for Advertising
claim = 1  # indicates install is attributable, set claim=0 if install is non-attributable / organic
attributed_to = 'Chartboost'  # optional, send another network name if attributed to other network, or Organic if organic
is_organic = 0  # optional, send 0 if not organic, 1 if organic

data = json.dumps({
  'app_id': app_id,
  'gaid': gaid,
  'uuid': android_id,
  'claim': claim,
  'attributed_to': attributed_to,
  'is_organic': is_organic
})

descriptor_template = 'action:attribution\n{}\n{}\n{}'
descriptor = descriptor_template.format(CB_API_SECRET, app_signature, data)
signature = hashlib.sha256(descriptor).hexdigest()

headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-Token': CB_API_TOKEN,
  'X-Chartboost-Signature': signature
}

requests.post(CB_ATTRIBUTION_ENDPOINT, data=data, headers=headers)
```

```javascript
var https = require('https');
var crypto = require('crypto');

var data, descriptor, signature, options, req;

const CB_API_TOKEN = "{{your_api_token}}"; 
const CB_API_SECRET = "{{your_api_secret}}"; 
const CB_ATTRIBUTION_HOST = "live.chartboost.com";
const CB_ATTRIBUTION_PATH = "/api/v1/install.json";
const CB_ATTRIBUTION_PORT = "443";

var app_id = "54ecc0535beacdc1e1eff778"; // replace this with your app id
var app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb"; // replace this with your app signature
var gaid = "8df6c9bf-d647-4400-bc13-7ff317ff0003";  // example Google Advertising ID
var android_id = "f533bc6a9d9a2000";  // example Legacy Android ID
var ifa = "61109b4c-0f16-4fbc-82ec-5475313af000";  // example iOS Identifier for Advertising
var claim = 1; // indicates install is attributable, set claim = 0 if install is non-attributable / organic
var attributed_to = "Chartboost"; // optional, send another network name if attributed to other network, or Organic if organic
var is_organic = 0; // optional, send 0 if not organic, 1 if organic

function sendInstall(callback) {
    data = JSON.stringify({
        "app_id": app_id,
        "ifa": ifa,
        "claim": claim,
        "attributed_to": attributed_to,
        "organic": is_organic
    });

    // X-Chartboost-Signature is generated on every request using the following hashing algorithm 
    descriptor = "action:attribution\n" + CB_API_SECRET + "\n" + app_signature + "\n" + data;
    signature = crypto.createHash('sha256').update(descriptor).digest('hex');
    console.log(signature);

    options = {
        host: CB_ATTRIBUTION_HOST,
        path: CB_ATTRIBUTION_PATH,
        port: CB_ATTRIBUTION_PORT,
        method: 'POST',
        agent: false,
        headers: {
            'Content-Type': 'application/json',
            'Content-Length': data.length,
            'X-Chartboost-Token': CB_API_TOKEN,
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
sendInstall( function() {
    console.log(data);
  } 
);
```

> Sample Response

```json
{
  "status": 200,
  "message": "Attribution request received"
}
```

This endpoint can receive attributed and non-attributed app installs, as well as app opens, from an install attribution platform. Installs will be processed, stored, and used in reporting. 

### HTTP Request

`POST https://live.chartboost.com/api/v1/install.json`

<aside class="notice">
This endpoint's response will always return HTTP 200 status code. Check the "status" key on the JSON response for the real status code.
</aside>

### Authentication

To authenticate with the API endpoint, you must generate a unique signature to be included as a header on each request. A string with the following template must be made. The signature is then created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a macro that is meant to be replaced by your server.

The Chartboost app signature is an identifier unique to each individual app in the Chartboost dashboard. Chartboost developers can find their game's app signature on the Chartboost dashboard's **App Settings** page:
<img src="https://s3.amazonaws.com/chartboost/help_assets/partners-app-sig.jpg" />

Computed signature: `"action:attribution\n{{CB_API_SECRET}}\n{{Chartboost app signature}}\n{{JSON body}}"`

The resulting digest from the hash function should be sent in the `X-Chartboost-Signature` header in the request.  For an example of the signature hashing, refer to the code example on the right.

### Headers

Each request must contain the following headers:

Header                 | Value
----                   | -----
Content-Type           | `application/json`
X-Chartboost-Token     | `{{CB_API_TOKEN}}`
X-Chartboost-Signature | `{{computed_signature}}`


### Request Parameters

Each request must use these parameters:

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
app_id        | true     | string | Chartboost app ID (found in the Chartboost dashboard)
claim         | true     | int    | 1 if Chartboost can claim the install, 0 otherwise
gaid          | true*    | string | Google advertising identifier
ifa           | true     | string | Apple identifier for advertising
uuid          | false*   | string | `android_id` if Android
organic       | false    | int    | 1 if organic install, 0 if attributed to a network
attributed_to | false    | string | Name of network that received the attribution
timestamp     | false    | int    | UNIX timestamp in seconds

<aside class="notice">
* Google Advertising ID is *required* in every request unless the device only has Android ID available, in which case the single Android ID (uuid) parameter may be sent.  Both can be sent in a single request if available.
</aside>
