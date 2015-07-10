# Post-Install Events

## Purchase events

```php
<?php

const POST_INSTALL_ENDPOINT = "https://live.chartboost.com/event_service/v2/iap";

$now = time();

$app_id = "54ecc0535beacdc1e1eff778";
$app_specific_token = "06da93314c187242827faf6f93c6cae82d76799dace61ce60c964f12ba29dd30";
$app_platform = "android";

$gaid = "8df6c9bf-d647-4400-bc13-7ff317f046f3";
$android_id = "358414046356276";

$product_id = "bag_of_gems";
$purchase_currency = "USD";
$purchase_price = 1.99;

$data = json_encode(array(
	"token" => $app_specific_token,
	"platform" => $app_platform,
	"timestamp" => $now,
	"identifiers" => array(
		"gaid" => $gaid,
		"uuid" => $android_id
	),
	"iap" => array(
		"product_id" => $product_id,
		"currency" => $purchase_currency,
		"price" => $purchase_price
	)
));


$descriptor = "action:pia;app:$app_id;token:$app_specific_token;timestamp:$now;";
$signature = hash("sha256", $descriptor);

headers = array(
  "Content-Type" => "application/json",
  "X-Chartboost-App" => $app_id,
  "X-Chartboost-Signature" => $signature
);

Requests::post(POST_INSTALL_ENDPOINT, $headers, $data);
?>
```

```python
import time
import json
import hashlib
import requests


POST_INSTALL_ENDPOINT = 'https://live.chartboost.com/event_service/v2/iap'

now = int(time.time())

app_id = '54ecc0535beacdc1e1eff778'
app_specific_token = '06da93314c187242827faf6f93c6cae82d76799dace61ce60c964f12ba29dd30'
app_platform = 'android'

gaid = '8df6c9bf-d647-4400-bc13-7ff317f046f3'
android_id = '358414046356276'

product_id = 'bag_of_gems'
purchase_currency = 'USD'
purchase_price = 1.99

data = json.dumps({
	'token': app_specific_token,
	'platform': app_platform,
	'timestamp': now,
	'identifiers': {
		'gaid': gaid,
		'uuid': android_id
	},
	'iap': {
		'product_id': product_id,
		'currency': purchase_currency,
		'price': purchase_price
	}
})

descriptor_template = 'action:pia;app:{};token:{};timestamp:{};'
descriptor = descriptor_template.format(app_id, app_specific_token, now)
signature = hashlib.sha256(descriptor).hexdigest()

headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-App': app_id,
  'X-Chartboost-Signature': signature
}

requests.post(POST_INSTALL_ENDPOINT, data=data, headers=headers)
```

```shell
curl 'https://live.chartboost.com/event_service/v2/iap' \
  -H 'Content-Type: application/json' \
  -H 'X-Chartboost-App: 54ecc0535beacdc1e1eff778' \
  -H 'X-Chartboost-Signature: caca610497640fbb7e8d46ce048d19a71e8cde09d067cf3a32450026a6e49f60' \
  -d '{"platform": "android", "token": "06da93314c187242827faf6f93c6cae82d76799dace61ce60c964f12ba29dd30", "identifiers": {"gaid": "8df6c9bf-d647-4400-bc13-7ff317f046f3", "uuid": "358414046356276"}, "iap": {"currency": "USD", "price": 1.99, "product_id": "bag_of_gems"}, "timestamp": 1427931538}'
```

> Sample Response

```json
{
  "status": 200,
  "message": "OK"
}
```

This endpoint receives purchase events from a particular app. The purchase events can contain receipt, pricing, and other information about the purchase. The purchase events will be processed, stored, and utilized in app analytics.

### HTTP Request

`POST https://live.chartboost.com/event_service/v2/iap`

<aside class="notice">
This endpoint's response will always be an HTTP 200 status code. Check the "status" key on the JSON response for the real status code.
</aside>

### Authentication

To authenticate with this endpoint, you must generate a signature on each request. A string with the following template must be made, and the signature is created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a variable that is meant to be filled in.

Computed Signature: `"action:pia;app:{{Chartboost app ID}};token:{{Chartboost App post-install token}};timestamp:{{UNIX timestamp of request}};"`

(The Chartboost app ID is an identifier unique to each individual app in the Chartboost dashboard. Chartboost developers can find their game's app ID on the Chartboost dashboard's **App Settings** page:)

<img src="https://s3.amazonaws.com/chartboost/help_assets/partners-app-id.jpg" />

The resulting digest from the hash function should be sent in the X-Chartboost-Signature header in the request.

For an example of the signature hashing, refer to the code example.


### Required Headers

Header                 | Value
----                   | -----
Content-Type           | `application/json`
X-Chartboost-App       | `{{app id}}`
X-Chartboost-Signature | `{{computed signature}}`

### Request Parameters

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
token         | true     | string | Post-install analytics token belonging to app
platform      | true     | string | Name of the app's platform (e.g. "iOS")
identifiers   | true     | object | See identifiers parameters below
iap           | true     | object | See in-app purchase parameters below
timestamp     | true     | int    | UNIX timestamp in seconds
party         | false    | string | Name of the network sending the request
receipt_valid | false    | bool   | Whether or not the receipt has been validated

#### Identifiers

One of the following is required in the identifiers parameter.

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
gaid          | true     | string | Google advertising identifier
ifa           | true     | string | Apple identifier for advertising
uuid          | true     | string | `UUID` (if iOS), `Android ID` (if Android)

#### IAP

Name                    | Required | Type   | Description
----                    | -------- | ----   | -----------
product_id              | true     | string | Unique identifier describing the purchased item
price                   | true     | float  | Price paid for the item
currency                | true     | string | 3-letter currency code. If currency is unavailable or all currencies are converted to USD, a static string of <code>"USD"</code> is acceptable.
localized_title         | false    | string | Name of the purchased item. If actual purchase names are unavailable, a static string like <code>purchase</code> or <code>revenue</code> is acceptable.
localized_description   | false    | string | Description of the purchased item
receipt                 | false    | string | The receipt string from the purchased item


<aside class="success">
Remember &ndash; each app has a unique token.
</aside>
