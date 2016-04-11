# Post-Install Events
For a more complete analysis of player level data across platforms or networks, Chartboost customers can configure third-party tracking services to send their event/level data to Chartboost. After the integration, Chartboost customers can then view the third-party data in the Chartboost dashboard.

Third-party tracking services can use the instructions on this page to build their initial event tracking integration. Chartboost customers using level tracking should refer to [these customer-facing instructions](https://answers.chartboost.com/hc/en-us/articles/204639335). 

## Purchase events

```php
<?php

const CB_PIA_ENDPOINT = "https://live.chartboost.com/event_service/v3/track";
const CB_API_TOKEN = "{{your_api_token}}"; 
const CB_API_SECRET = "{{your_api_secret}}";

$app_id = "54ecc0535beacdc1e1eff778";  # replace this with your app id
$app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";  # replace this with your app signature
$gaid = "8df6c9bf-d647-4400-bc13-7ff317ff0003";  # example Google Advertising ID
$ifa = "8df6c9bf-d647-4400-bc13-7ff317ff0004";  # example iOS Identifier For Advertising
$product_id = "bag_of_gems";  # example `product_id`
$currency = "USD";  # example `currency` code
$price = 1.99;  # example `price`
$localized_title = "bolsa de gemas";  # optional, used for translating product name from English to another language
$localized_description = "un bolsa de gemas";  # optional, used for translating product description from English to another language

$data = json_encode(array(
    "app_id" = > $app_id,
    "gaid" => $gaid,
    "iap" => array(
            "product_id": $product_id, 
            "currency": $currency, 
            "price": $price, 
            "localized_title": $localized_title, 
            "localized_description": $localized_description
    ),
));

# Create the header signature
$descriptor = "action:pia\n" + CB_API_SECRET + "\n" + app_signature + "\n" + data;
$signature = crypto.createHash('sha256').update(descriptor).digest('hex');

$headers = array(
  "Content-Type" => "application/json",
  "X-Chartboost-Token" => CB_API_TOKEN,
  "X-Chartboost-Signature" => $signature
);

# Send the postback
Requests::post(CB_PIA_ENDPOINT, $headers, $data);
?>
```

```python
import json
import hashlib
import requests

CB_PIA_ENDPOINT = 'https://live.chartboost.com/event_service/v3/track'
CB_API_TOKEN = '{{your_api_token}}'
CB_API_SECRET = '{{your_api_secret}}'

app_id = '54ecc0535beacdc1e1eff778'  # replace this with your app id
app_signature = '601be68e3bb4e7eb953024eb4f2ac03376e2c2fb'  # replace this with your app signature
gaid = '8df6c9bf-d647-4400-bc13-7ff317ff0003'  # example Google Advertising ID
ifa = '8df6c9bf-d647-4400-bc13-7ff317ff0004'  # example iOS Identifier For Advertising
product_id = 'bag_of_gems'  # example `product_id`
currency = 'USD'  # example `currency` code
price = 1.99  # example `price`
localized_title = 'bolsa de gemas'  # optional, used if translating product title from English to another language
localized_description = 'un bolsa de gemas'  # optional, used if translating product description from English to another language

data = json.dumps({
    'app_id': app_id,
    'gaid': gaid,
    'iap': {
        'product_id': product_id,
        'currency': currency,
        'price': price,
        'localized_title': localized_title,
        'localized_description': localized_description
    }
})

# Create the header signature
descriptor_template = 'action:pia\n{}\n{}\n{}'
descriptor = descriptor_template.format(CB_API_SECRET, app_signature, data)
signature = hashlib.sha256(descriptor).hexdigest()

headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-Token': CB_API_TOKEN,
  'X-Chartboost-Signature': signature
}

# Send the postback
requests.post(CB_PIA_ENDPOINT, data=data, headers=headers)
```

```javascript
var https = require('https');
var crypto = require('crypto');

var data, descriptor, signature, options, req;
const CB_PIA_HOST = "live.chartboost.com";
const CB_PIA_PATH = "/event_service/v3/track"; 
const CB_PIA_PORT = "443";
const CB_API_SECRET = "{{your_api_secret}}"; 
const CB_API_TOKEN = "{{your_api_token}}"; 


var app_id = "54ecc0535beacdc1e1eff778";  // replace this with your app id
var app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";  // replace this with your app signature
var gaid = "8df6c9bf-d647-4400-bc13-7ff317f046f3";  // example Google Advertising ID
var ifa = "8df6c9bf-d647-4400-bc13-7ff317ff0004"  // example iOS Identifier For Advertising
var product_id = "bag_of_gems";  // example `product_id`
var currency = "USD";  // example `currency` code
var price = 1.99;  // example `price`
var localized_title = "bolsa de gemas";  // optional, used if translating product title from English to another language
var localized_description = "un bolsa de gemas"  // optional, used if translating product description from English to another language


function sendEvent(callback) {
    data = JSON.stringify({
        "app_id": app_id, 
        "gaid": gaid, 
        "iap": {
            "product_id": product_id,
            "currency": currency,
            "price": price,
            "localized_title": localized_title,
            "localized_description": localized_description
        }
    });

    // X-Chartboost-Signature is generated on every request using the following hashing algorithm 
    descriptor = "action:pia\n" + CB_API_SECRET + "\n" + app_signature + "\n" + data;
    signature = crypto.createHash('sha256').update(descriptor).digest('hex');

    options = {
        host: CB_HOST,
        port: CB_PORT,
        path: CB_PATH,
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

// Send the postback
sendEvent( function() {
        console.log(data);
    }
);
```

> Sample Response

```json
{
  "status": 200,
  "message": "OK"
}
```

### HTTP Request

`POST https://live.chartboost.com/event_service/v3/track`

<aside class="notice">
This endpoint's response will always be an HTTP 200 status code. Check the "status" key on the JSON response for the real status code.
</aside>

### Authentication

To authenticate with this endpoint, you must generate a signature on each request. A string with the following template must be made, and the signature is created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a variable that is meant to be replaced by your server.

Computed Signature: `"action:pia\n{{CB_API_SECRET}}\n{{app_signature}}\n{{JSON data}}"`

The Chartboost app signature is an identifier unique to each individual app in the Chartboost dashboard. Chartboost developers can find their game's app signature on the Chartboost dashboard's **App Settings** page:
<img src="https://s3.amazonaws.com/chartboost/help_assets/partners-app-id.jpg" />

The resulting digest from the hash function should be sent in the X-Chartboost-Signature header in the request.  For an example of the signature hashing, refer to the code example.


### Required Headers

Header                 | Value
----                   | -----
Content-Type           | `application/json`
X-Chartboost-Token     | `{{your_api_token}}`
X-Chartboost-Signature | `{{computed signature}}`

### Request Parameters

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
app_id        | true     | string | Chartboost app ID (found in the Chartboost dashboard)
gaid          | true*     | string | Google advertising identifier, required if Google Play Store app
uuid          | false    | string | Legacy Android ID, required if `gaid` unavailable such as with Amazon devices
ifa           | true     | string | Apple identifier for advertising, required if iTunes Store app
iap           | true    | object | JSON of in-app purchase details; see `IAP` section below

### IAP

Name                    | Required | Type   | Description
----                    | -------- | ----   | -----------
product_id              | true     | string | Unique identifier describing the purchased item
price                   | true     | float  | Price paid for the item
currency                | true     | string | 3-letter currency code, if currency is unavaiable, a static string of <code>"USD"</code> is acceptable.
localized_title         | false    | string | Localized name of the purchased item. 
localized_description   | false    | string | Localized description of the purchased item.

<aside class="success">
* Either `iap` or `event` must be sent with the request, do not include both in a single request.
<p>* GAID must always be sent for Android devices, unless only Android ID is available on the device, such as with Amazon devices.</p>
</aside>

## Custom events

```php
<?php

const CB_PIA_ENDPOINT = "https://live.chartboost.com/event_service/v3/track";
const CB_API_TOKEN = "{{your_api_token}}"; 
const CB_API_SECRET = "{{your_api_secret}}";

$app_id = "54ecc0535beacdc1e1eff778"; # replace this with your app id
$app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb"  # replace this with your app signature
$gaid = "8df6c9bf-d647-4400-bc13-7ff317ff0000";  # example Google Advertising ID
$ifa = "8df6c9bf-d647-4400-bc13-7ff317ff0004";  # example iOS Identifier For Advertising
$event_label = "Level Completed";  # example `event_label`; use only one `event_label` per `event_field` value.
$event_field = 1;  # example `event_field`; use only one `event_field` per `event_label` value.
$main_level = 12; # example `main_level`; indicates that player completed level 12 in game.
$sub_level = 0;  # example `sub_level`; indicates that there is no sub_level associated with the event -- set as 0 if no sub_level value is provided.
$description = "Hidden Caverns";  # example `description`; indicates that main_level 12 is known as "Hidden Caverns".

$data = json_encode(array(
    "app_id" => $app_id,
    "gaid" => $gaid,
    "event" => array( 
            "event_label": $event_label,  
            "event_field": $event_field,  
            "main_level": $main_level,
            "sub_level": $sub_level,
            "description": $description
    ),
));

# Create the header signature
$descriptor = "action:pia\n" + CB_API_SECRET + "\n" + app_signature + "\n" + data;
$signature = crypto.createHash('sha256').update(descriptor).digest('hex');

$headers = array(
  "Content-Type" => "application/json",
  "X-Chartboost-Token" => CB_API_TOKEN,
  "X-Chartboost-Signature" => $signature
);

# Send the postback
Requests::post(CB_PIA_ENDPOINT, $headers, $data);
?>
```

```python
import json
import hashlib
import requests

CB_PIA_ENDPOINT = 'https://live.chartboost.com/event_service/v3/track'
CB_API_TOKEN = '{{your_api_token}}'
CB_API_SECRET = '{{your_api_secret}}'

app_id = '54ecc0535beacdc1e1eff778'  # replace this with your app id
app_signature = '601be68e3bb4e7eb953024eb4f2ac03376e2c2fb'  # replace this with your app signature
gaid = '8df6c9bf-d647-4400-bc13-7ff317f046f3'  # example Google Advertising ID
ifa = '8df6c9bf-d647-4400-bc13-7ff317ff0004'  # example iOS Identifier For Advertising
event_label = 'Level Completed'  # example `event_label`; use only one `event_label` per `event_field` value.
event_field = 1  # example `event_field`; use only one `event_field` per `event_label` value.
main_level = 12  # example `main_level`; indicates that player completed level 12 in game.
sub_level = 0  # example `sub_level`; indicates that there is no sub_level associated with the event -- set as 0 if no sub_level value is provided.
description = 'Hidden Caverns'  # example `description`; indicates that main_level 12 is known as "Hidden Caverns".

data = json.dumps({
    'app_id': app_id,
    'gaid': gaid,
    'event': {
        'event_label': event_label,  
        'event_field': event_field,  
        'main_level': main_level,
        'sub_level': sub_level,
        'description': description
    }
})

# Create the header signature
descriptor_template = 'action:pia\n{}\n{}\n{}'
descriptor = descriptor_template.format(CB_API_SECRET, app_signature, data)
signature = hashlib.sha256(descriptor).hexdigest()

headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-Token': CB_API_TOKEN,
  'X-Chartboost-Signature': signature
}

# Send the postback
requests.post(CB_PIA_ENDPOINT, data=data, headers=headers)
```

```javascript
var https = require('https');
var crypto = require('crypto');

var data, descriptor, signature, options, req;
const CB_PIA_HOST = "live.chartboost.com";
const CB_PIA_PATH = "/event_service/v3/track"; 
const CB_PIA_PORT = "443";
const CB_API_SECRET = "{{your_api_secret}}"; 
const CB_API_TOKEN = "{{your_api_token}}"; 


var app_id = "54ecc0535beacdc1e1eff778";  // replace this with your app id
var app_signature = "601be68e3bb4e7eb953024eb4f2ac03376e2c2fb";  // replace this with your app signature
var gaid = "8df6c9bf-d647-4400-bc13-7ff317f046f3";  // example Google Advertising ID
var ifa = "8df6c9bf-d647-4400-bc13-7ff317ff0004";  // example iOS Identifier For Advertising
var event_label = "Level Completed";  // example `event_label`; use only one `event_label` per `event_field` value.
var event_field = 1;  // example `event_field`; use only one `event_field` per `event_label` value.
var main_level = 12;  // example `main_level`; indicates that player completed level 12 in game.
var sub_level = 0;  // example `sub_level`; indicates that there is no sub_level associated with the event -- set as 0 if no sub_level value is provided.
var description = "Hidden Caverns";  // example `description`; indicates that main_level 12 is known as "Hidden Caverns".


function sendEvent(callback) {
    data = JSON.stringify({
        "app_id": app_id, 
        "ifa": ifa, 
        "event": {
            "event_label": event_label,  
            "event_field": event_field,  
            "main_level": main_level,
            "sub_level": sub_level,
            "description": description
        }   
    });

    // X-Chartboost-Signature is generated on every request using the following hashing algorithm 
    descriptor = "action:pia\n" + CB_API_SECRET + "\n" + app_signature + "\n" + data;
    signature = crypto.createHash('sha256').update(descriptor).digest('hex');

    options = {
        host: CB_PIA_HOST,
        port: CB_PIA_PORT,
        path: CB_PIA_PATH,
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

// Send the postback
sendEvent( function() {
        console.log(data);
    }
);
```

The PIA event tracking integration works by sending player event/level data – tutorial completed, for example – from a third party tracking service to Chartboost via S2S integration in the form of distinct **Event Fields**.

### HTTP Request

`POST https://live.chartboost.com/event_service/v3/track`

<h3 id="authenticate">Authentication</h3>

To authenticate with this endpoint, you must generate a signature on each request. A string with the following template must be made, and the signature is created by taking the SHA-256 hash of the string. Note that anything contained within double curly brackets is a variable that is meant to be replaced by your server.

Computed Signature: `"action:pia\n{{CB_API_SECRET}}\n{{app_signature}}\n{{JSON data}}"`

The Chartboost app signature is an identifier unique to each individual app in the Chartboost dashboard. Chartboost developers can find their game's app signature on the Chartboost dashboard's **App Settings** page:
<img src="https://s3.amazonaws.com/chartboost/help_assets/partners-app-id.jpg" />

The resulting digest from the hash function should be sent in the X-Chartboost-Signature header in the request.  For an example of the signature hashing, refer to the code example.

### Required Headers

Header                 | Value
----                   | -----
Content-Type           | `application/json`
X-Chartboost-Token     | `{{your_api_token}}`
X-Chartboost-Signature | `{{computed signature}}`

### Request Parameters

Name          | Required | Type   | Description
----          | -------- | ----   | -----------
app_id        | true     | string | Chartboost app ID (found in the Chartboost dashboard)
gaid          | true*     | string | Google advertising identifier, required if Google Play Store app
uuid          | false    | string | Legacy Android ID, required if `gaid` unavailable such as with Amazon devices
ifa           | true     | string | Apple identifier for advertising, required if iTunes Store app
event         | true    | object | JSON of custom event details; see `Event` section below

### Event

Name                    | Required | Type    | Description
----                    | -------- | ----    | -----------
event_label             | true     | string  | Unique string describing the type of event, should always be the same for a given `event_field`.
event_field             | true     | integer | An integer 1 through 5, should always be the same for a given `event_label`.
main_level              | true     | integer | Represents the main value to be associated with the event; must be >= 1.
sub_level               | true     | integer | Represents the sub value to be associated with the event; must be >= 0; send 0 if no `sub_level` is provided.
description             | false    | string  | Description of the main_level value (such as the given level's name); optional.

<aside class="success">
* Either `iap` or `event` must be sent with the request, do not include both in a single request.
<p>* GAID must always be sent for Android devices, unless only Android ID is available on the device, such as with Amazon devices.</p>
</aside>

### Event Field / Event Label
Each event field must correspond to a single type of event, e.g. "Level Reached" or "Registration Completed".

Example event fields are listed in the table below; common use cases follow:

<a name="IDs"></a>

<table>
<thead>
<tr><th>Event Field</th><th>Sequential?<sup>2</sup></th><th>Definition</th><th>Example Event Label <sup>1</sup></th><th>Optional<br />Description Example <sup>3</sup></th></tr>
</thead>
<tbody>
<tr>
<td><code>1</code></td>
<td>Yes</td>
<td>Highest numerical level a user has reached</td>
<td>"Highest level puzzle solved"</td>
<td>"Chocolate Fudge Level"</td>
</tr>
<tr>
<td><code>2</code></td>
<td> </td>
<td>User's current level/area</td>
<td>"Area main character is in"</td>
<td>"Lunar Caverns"</td>
</tr>
<tr>
<td><code>3</code></td>
<td>Yes</td>
<td>The level of the player’s character in game</td>
<td>"Level of the character class"</td>
<td>"Master Wizard"</td>
</tr>
<tr>
<td><code>4</code></td>
<td>Yes</td>
<td>Extra field for developers to send sequential data</td>
<td>"VIP reward level"</td>
<td>"5"</td>
</tr>
<tr>
<td><code>5</code></td>
<td> </td>
<td>Extra field for developers to send non-sequential data</td>
<td>"FTUE completed?"</td>
<td>"Tutorial Completed"</td>
</tr>
</tbody>
</table>

#### Notes

1. `event_label` is required and will be used to identify the type of event field in the Chartboost dashboard
2. An associated `event_field` is used to track either 1) level data that is always increasing and can never decrease; or 2) numerical data developers need to segment based on whether a player is "higher" or "lower" than a certain number
3. Optional event `description` can be used to identify specific level values.  For example, if main_level==2, `description` might be "Lunar Caverns,", while main_level==3 might be "Lunar Landing". The `event_label` describes more generically the type of the event, such as "Level Reached".

Of the five event_field options, three (1,3,4) can be used for sequential level values, while the other two (2,5) can be used for non-sequential level values. These integer-based level values can be used, for example, to track if the player has gotten to level 3, 8, 17, etc., which is always increasing and can never decrease, or any other numerical data you need to segment based on whether a player is "higher" or "lower" than. 

**Note:** For event_field 1, 3, or 4 (sequential events), Chartboost only records the player's first level event along with subsequent level value increases. Sequential events with level values that are equal to or less than the player's current value are discarded.


### Additional Notes on Custom Events

Inside the request, `event` is a single JSON object element. This object specifies the details of the event.

The `event_field` specifies the event type (1,2,3,4, or 5). In your advertiser-facing UI, the `event_field` should be able to be selected by the Chartboost customer and will correspond to a specific event tracked in your platform, labeled as the **Event ID**. 

The `event_label` describes the nature of its corresponding `event_field`. The `event_label` can be the name of the event according to the app, but if possible you should allow user override of the event name in your dashboard.

For non-sequential or non-numerical events, set <code>main_level:1</code> and <code>sub_level:0</code> in the request.

