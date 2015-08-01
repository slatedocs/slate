# Level and Event Tracking

For a more complete analysis of player level data across platforms or networks, Chartboost customers can configure third-party tracking services to send their event/level data to Chartboost. After the integration, Chartboost customers can then view the third-party data in the Chartboost dashboard.

Third-party tracking services can use the instructions on this page to build their initial level tracking integration. Chartboost customers using level tracking should refer to [these customer-facing instructions](https://answers.chartboost.com/hc/en-us/articles/204639335). 

## General Level Tracking Information

The PIA level tracking integration works by sending player level data – tutorial completed, for example – from a third party tracking service to Chartboost via S2S integration in the form of distinct **Event Fields**.

We designed the fields to let developers collect and send level data in a way that will maximize reengagement and monetization via intelligent segmentation of players.

Each event field must correspond to a single type of level data.

The available fields are listed in the table below; common use cases follow:

<a name="IDs"></a>

<table>
<thead>
<tr><th>Event Field</th><th>Sequential? <sup>2</sup></th><th>Definition</th><th>Example Event Label <sup>1</sup></th><th>Optional<br />Description Example <sup>3</sup></th></tr>
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
<td>.</td>
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
<td>.</td>
<td>Extra field for developers to send non-sequential data</td>
<td>"FTUE completed?"</td>
<td>"Tutorial Completed"</td>
</tr>
</tbody>
</table>

### Notes

1. Event labels are required and will be used to identify the type of event field in the Chartboost dashboard
2. A sequential event field is used to track either 1) level data that is always increasing and can never decrease; or 2) numerical data developers need to segment based on whether a player is "higher" or "lower" than a certain number
3. Optional event descriptions can be used to identify the level name ("Lunar Caverns," for example, as opposed to the event_label which defines the type of level event).

Of the five event types, three can be used specifically for sequential Level Tracking. These will accept integer-based level information (the player has gotten to level 3, 8, 17, etc.) which is always increasing and can never decrease, or any other numerical data you need to segment based on whether a player is "higher" or "lower" than a certain number. **Note:** For level tracking event types, Chartboost only records the player's first level event along with each subsequent level value increase. Events with level values that are equal to or less than the player's current value are disregarded.

In addition, all five event types can be used to track achievement events.

## Level Tracking Setup (for Third-Party Tracking Services)

This section will walk you – the third-party tracking service – through the initial Level Tracking integration. 

### Event Requests

Inside the request, the `track_info` array contains within it a single JSON object element. This object specifies the details of the event. Multiple events can be sent as unique JSON objects within this array, though single events are most common.

The `track_info` array requires an `event_field` that specifies the event type (1,2,3,4, or 5). In your advertiser-facing UI, the `event_field` should be able to be selected by the Chartboost customer and will correspond to a specific event tracked in your platform, labeled as the **Event ID**. 

The `track_info` array also requires an `event_label`, which describes the nature of its corresponding `event_field`. The `event_label` can be the name of the event according to the attribution platform, but if possible, Chartboost would request that you allow user override of the event name in your dashboard.

For non-sequential or non-numerical events, set <code>main_level:1</code> and <code>sub_level:0</code> in the request

### HTTP Request Method

`POST`

### Endpoint

`https://live.chartboost.com/event_service/v2/level`

<h3 id="authenticate">Authentication</h3>

```python
# Generate computed signature
import json
import hashlib
import requests

app_id = {{Chartboost App ID}} # example: 4f7aa26ef77659d869000003
app_token = {{Chartboost App token}} # example: 173e6aeff28e4b76b488d5acf49ed8ebb8e95559
app_platform = {{Device OS}}  # example: 'Android 5.1.0'
gaid = {{Google Advertising ID}}  # example: '8df6c9bf-d647-4400-bc13-7ff317f046f3'
android_id = {{Android ID / UUID}}  # example: '358414046356276'
# ifa = {{iOS IDFA - no dashes}} # example: '7e8ec8092004283043e99d515ab0c51b0ef755ff'

event_label = {{Custom label for event}}  # Example: "Level of character"
event_field = {{Chartboost Event ID}} # corresponding to type of event, 1-5.  Example: 3
main_level = {{Main level}} # non-zero integer; use 1 if event does not have any numerical value associated with it.  Example: 1
sub_level = {{Sub-level integer}} # use 0 if event does not have any sub-level associated with it.  Example: 0
description = {{Optional description of the main level}} # example: "Lunar Caverns Level"
timestamp = {{Unix timpestamp of event}} # Example: 1408480492

party = '3rd Party Company'
data_type = 'level_info'  # must always be "level_info"
POST_INSTALL_ENDPOINT = 'https://live.chartboost.com/event_service/v2/level'

data = json.dumps(
 {
    "track_info":[
       {
         "event_label": event_label,
         "event_field": event_field,
         "main_level": main_level,
         "sub_level": sub_level,
         "data_type": data_type
       }
    ],
    "platform": app_platform,
    "timestamp": timestamp,
    "identifiers": {
      "gaid": gaid,
      "uuid": android_id
    },
    "token": app_token,
    "party": party
 }
)

request_signature_string = 'action:pia;app:{0};token:{1};timestamp:{2};'.format(app_id, app_token, timestamp)
signature = hashlib.sha256(request_signature_string).hexdigest()
 
headers = {
  'Content-Type': 'application/json',
  'X-Chartboost-App': app_id,
  'X-Chartboost-Signature': signature
}

requests.post(POST_INSTALL_ENDPOINT, data=data, headers=headers)
```

To authenticate with this endpoint, you must generate a **computed signature** for each request. The computed signature is created by taking the SHA-256 hash of a canonical string as shown in the <a href="http://partners.chartboost.com/?python#authenticate">code example in the right-side panel</a>.

The endpoint will always respond with an HTTP `200` status code. Check the `status` key on the JSON response for success or error notifications.

<h3 id="headers">Headers</h4>

(Note that headers contain authentication information.)

<table class="table-creative-set">
<thead class="table-creative-head">
<tr><th>Header Name</th><th>Example</th><th>Description</th></tr>
</thead>
<tbody>
<tr>
<td>X-Chartboost-App</td>
<td>4f7aa26ef77659d869000003</td>
<td>Your Chartboost app ID</td>
</tr>
<tr>
<td>X-Chartboost-Signature</td> 
<td>173e6aeff28e4b76b488d5acf49ed8ebb8e95559</td>
<td>See <a href="http://partners.chartboost.com/?python#authenticate">code example at right</a> to generate. <b>This is NOT the same value as the Chartboost app signature!</b></td>
</tr>
</tbody>
</table>

<h3 id="params">JSON Body: Level Tracking Parameters</h4>

<table class="table-creative-set">
<thead class="table-creative-head">
<tr><th style="width:20%">Parameters</th><th>iOS Apps</th><th>Android Apps</th><th>Example</th><th>Description</th></tr>
</thead>
<tbody>
<tr>
<td><code>track_info</code></td>
<td> </td>
<td> </td>
<td> </td>
<td>Array of JSON object(s) containing event parameters below</td>
</tr>
<tr>
<td><code>event_label</code></td>
<td>Required</td>
<td>Required</td>
<td><code>"Highest level puzzle solved"</code></td>
<td>Custom label for in-game event</td>
</tr>
<tr>
<td><code>event_field</code></td>
<td>Required</td>
<td>Required</td>
<td><code>1</code></td>
<td>ID corresponding to type of event; see <a href="#IDs">this table</a> for IDs</td>
</tr>
<tr>
<td><code>main_level</code></td>
<td>Required</td>
<td>Required</td>
<td><code>2</code></td>
<td>Main level (non-zero integer)</td>
</tr>
<tr>
<td><code>sub_level</code></td>
<td>Required</td>
<td>Required</td>
<td><code>1</code></td>
<td>Sub-level integer (use <code>0</code> if your game doesn't use sub-levels)</td>
</tr>
<tr>
<td><code>description</code></td>
<td>Required</td>
<td>Required</td>
<td><code>"The boss level"</code></td>
<td>Description of the level</td>
</tr>
<tr>
<td><code>data_type</code></td>
<td>Required</td>
<td>Required</td>
<td><code>"level_info"</code></td>
<td>This must always be <code>"level_info"</code></td>
</tr>
</tbody>
</table>

<h3 id="identifiers">JSON Body: Identifiers Parameters</h4>

<table>
<thead>
<tr><th>Parameters</th><th>iOS Apps</th><th>Android Apps</th><th>Example</th><th>Description</th></tr>
</thead>
<tbody>
<tr>
<td><code>ifa</code></td>
<td>Required</td>
<td>N/A</td>
<td><code>"b1c99c76f014428590cf3a5c99d9dfc6"</code> 
(32 characters; dashes OK; uppercase letters OK)</td>
<td>Identifier for Advertising</td>
</tr>
<tr>
<td><code>gaid</code></td>
<td>N/A</td>
<td>Required*</td>
<td><code>"a2c79c76-f014-4285-90cf-3a5c57999fc6"</code> 
(32 characters w/ 4 dashes)</td>
<td>Google Play Services Advertising ID (Android Only), if available</td>
</tr>
<tr>
<td><code>uuid</code></td>
<td>N/A</td>
<td>Required*</td>
<td><code>"7b7940e5800bfcc2"</code></td>
<td>For legacy Android IDs or Amazon games, if available</td>
</tr>
</tbody>
</table>

#### Notes

<p><b>*</b> One of the two Android identifiers must always be sent, but it is strongly recommended to send both when available, as only sending one may lead to discrepancies.</p>

### JSON Body: Other Parameters

<table>
<thead>
<tr><th style="width:20%">Parameters</th><th>iOS Apps</th><th>Android Apps</th><th style="width:20%">Example</th><th>Description</th></tr>
</thead>
<tbody>
<tr>
<td><code>platform</code></td>
<td>Required</td>
<td>Required</td>
<td><code>"Android 4.1"</code></td>
<td>Device OS</td>
</tr>
<tr>
<td><code>sdk_version</code></td>
<td>Optional</td>
<td>Optional</td>
<td><code>"3.2.3"</code></td>
<td>SDK version of <b>third party</b> (not Chartboost SDK version)</td>
</tr>
<tr>
<td><code>token</code></td>
<td>Required</td>
<td>Required</td>
<td><code>"06da93314c1f6f93c6cae82d76..."</code></td>
<td>64-character HEX string provided by customer; they should contact Chartboost for their app token.</td>
</tr>
<tr>
<td><code>timestamp</code></td>
<td>Required</td>
<td>Required</td>
<td><code>1408480492</code></td>
<td>UNIX Timestamp of event occurrence</td>
</tr>
<tr>
<td><code>party</code></td>
<td>Required</td>
<td>Required</td>
<td><code>"tune"</code></td>
<td>Name of third-party tracking service</td>
</tr>
</tbody>
</table>

### Building the Request

```
{
   "track_info":[
      {
        "event_label":"GameLevel1",
        "event_field":1,
        "main_level":1,
        "sub_level":2,
        "data_type": "level_info" 
      }
   ],
   "platform": "Android 5.0.1",
   "timestamp": 1423854942,
   "identifiers": {
      "gaid": "8ccaa247-1177-4c09-8117-c9bec33447d0",
      "uuid": "7b7940e5800bfcc2"
   },
   "token": "cb8b8abc2860ab0ffdfab6bce72270b1bf9c213c83190815f61c0ac5d03794ac",
   "party": "TUNE"
}
```

First, start with the endpoint:

`https://live.chartboost.com/event_service/v2/level`

Next, add the parameters in the JSON body, as shown in the example in the right panel.

And then you're done – successful requests will receive: `{"status":200,"message":"Success"}`.

If your call receives a `500` HTTP error code, your server should reattempt the S2S call at a later time: Try again in 2 seconds, then 4 seconds, then 8 seconds, then 16 seconds until successful.
