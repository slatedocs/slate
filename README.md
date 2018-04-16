---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php
  - javascript

toc_footers:
  - <a href='#'>Contact Anarock team for API KEY</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to Anarock! You can use API for pushing leads from your system to our database.

Below is a documentation about how to use the API for publishing leads to Anarock databse.

# Authentication

> Code for creating hash using time_stamp:

```php

<?php

// the shared secret key here
$key = 'KEY'; 
$current_time = time();
$message = (string)$current_time;

// to lowercase hexits
$hash = hash_hmac('sha256', $message, $key);


```

```javascript

// NodeJS
var cryto = require('crypto');

var key =  'KEY'; // the shared secret key here
var time_stamp = Math.round((new Date()).getTime() / 1000);
var message = time_stamp.toString();

var hash = crypto.createHmac('sha256', key).update(message);

// to lowercase hexits
return hash.digest('hex');

```

> Make sure to replace `KEY` with your API key.

Anarock uses SHA256 HMAC authentication method. The hash is created using current timestamp and your key as parameters.

You can request key by getting in touch with Anarock team.

Anarock expects the two keys `hash` and `current_time` to be included in all API requests to server.
 
### KEY

These will be provided by your point of contact in ANAROCK team.

<aside class="notice">
You must replace <code>KEY</code> with your personal API key.
</aside>

<aside class="notice">
You must test first with <code>staging KEY</code> and then only put in <code>production KEY</code>.
</aside>


# Sync Leads

## Post Lead to Anarock Database

```php
<?php 

$api_url = 'STAGING OR PRODUCTION URL'; // as mentioned on left under HTTP Request Heading


$key = 'KEY'; 
$current_time = time();
$message = (string)$current_time;

// to lowercase hexits
$hash = hash_hmac('sha256', $message, $key);


// you can use libraries like https://github.com/brick/phonenumber to format numbers before sending

$number = PhoneNumber::parse('+447123456789'); // phone number of the lead with +
$country_code = $number->getRegionCode(); // GB
$phone = $number->getNationalNumber(); // 7123456789

$campaign_id = "UniqueString"; // String to Attribute the lead to specific project. contact ANAROCK team for this.

$postFields  = "";
$postFields .= "&field=".$value; // refer to query parameters section on left section
$postFields .= "&current_time=".$current_time;
$postFields .= "&phone=".$phone; // Phone number without country code
$postFields .= "&country_code=".$country_code; // Standard ISO3166-1 alpha-2 code for a country.
$postFields .= "&hash=".$hash; // its mandatory to create hash using same timestamp as sent in current_time parameter
$postFields .= "&campaign_id=".$campaign_id;

$ch = curl_init();

curl_setopt($ch, CURLOPT_URL,$api_url);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS,
            $postFields);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$server_output = curl_exec ($ch);
// print_r($server_output);


?>
```


```javascript
const crypto = require('crypto');
const PhoneNumber = require( 'awesome-phonenumber' );
const axios = require('axios'); // using axios to make post request, you can use any other method/library you are comfortable with

const timeStamp = Math.round((new Date()).getTime() / 1000);
const message = timeStamp.toString()
const hash = crypto.createHmac('sha256', key).update(message).digest('hex')

const number = new PhoneNumber(number.toString()); // pass the number with + to the PhoneNumber Library
const phone = number.getNumber('significant');
const country_code = number.getRegionCode();

const campaign_id = 'UniqueString';// String to Attribute the lead to specific project. contact ANAROCK team for this.

return axios({
  url: 'STAGING OR PRODUCTION URL', // as mentioned on left under HTTP Request Heading
  method: 'POST',
  data: {
    phone: phone,
    country_code: country_code,
    current_time: timeStamp,
    hash: hash,
    campaign_id: campaign_id,
    ... other fields as given in the query parameters section on left section
  }
})
```

> The above command returns JSON structured like this:

```json
{
  "status":"OK",
  "message":"success",
  "response":
    {
      "lead_id": 17863
    }
}
```

This endpoint is used to posts a lead to ANAROCK database.

### HTTP Request

`staging`

`POST https://lead.staging.anarock.com/api/v0/CHANNEL_NAME/sync-lead`

``


`production`

`POST https://lead.anarock.com/api/v0/CHANNEL_NAME/sync-lead`


<aside class="notice">
Authentication keys are environment specific. Make sure you are using <code>Staging KEY</code> in <code>Staging API</code> and <code>Production KEY</code> in<code>Production API</code>.
</aside>

### CHANNEL_NAME

This will be provided by your point of contact from ANAROCK team

### QUERY PARAMETERS

Parameter | Type | Mandatory | Description
--------- | ------- | ------- | -----------
name | String | - | Example "Rahul Kumar"
phone | String | True | phone number without country code. Example: "9988998899"
country_code | String | True | Standard ISO3166-1 alpha-2 code for a country. Link: <a href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2</a> You can also use libraries like, example: "IN" for India Defaults to "IN"
email | String | - | Exmaple "abc@def.com"
purpose | String | True | "buy" This should be hardcoded
listing_id  | String | - |  Id of the product/listing/project/property for which lead is generated. Example: "111"
listing_name |  String | - | name of the project/property for which lead is generated. Example: "Runwal Green"
current_time | Integer | True | current epoch time in second(notmilisecond) Link: <a href="https://www.epochconverter.com/clock">https://www.epochconverter.com/clock</a>
hash | String | True | Generated in the section  <a href="/?php#authentication">above</a> Hash should be created using the same time stamp as sent in the parameter `current_time`
city | String | - | Example "Mumbai"
locality | String | - | Example "Bandra West"
min_budget | Integer | - | exmaple 10000000
max_budget | Integer | - | exmaple 50000000
contact_date | Integer | - | epoch time(in second) at which lead has contacted
remarks | String | - | additional comment about lead
homeloan_required | Boolean | - | whether the lead is interested in home loan or not
is_otp_verified | Boolean | - | whether the lead is OTP verified or not
is_call_verified | Boolean | - | whether the lead is Call verified or not
credit_value | Stirng | - | credit/ cost of the lead. Exmaple: "250"
is_broker | Boolean | - | whether the lead submitted is of a broker or not
apartment_types |  String | - | comma separated bhk types where bhk type can be `1bhk/2bhk/3bhk/3+bhk/1rk`) example: "2bhk,3+bhk"
source | String | - |  `google`, `facebook`, `affiliate`, `emailer`, `linkedin`, `portals`,`twitter`, etc - this field should always contain primary origin or lead
sub_source | String | - | `google_display`, `google_search`, `facebook_brands`, `facebook_lead_gen`, `affiliate`  - this should identify the type of campaign either branding or performance 
placement |  String | - | `utm_campaign` , `affiliate_name` e.g. taboola, nestoria, polyvalent, times_of_india, `portal_name` e.g. 99acres, magicbricks, housing  - this should tell exact campaign details be it google facebook etc. generally you should pass utm_campaign in this
extra_details | JSON | - | key-value pair which will contain any extra details for lead e.g. {"utm_medium: "something", "utm_source": "something", "keyword": "targetted keyword on google for the campaign"}
campaign_id | String | True | The is a unique identifier for the project you are sending the lead for. Should be collected from point of contact in ANAROCK team. Without this lead attribution will be incorrect.
source_id | Integer | True | This is mandatory field for sending any lead. This helps categorization of leads based on different sources. Refer to <a href="/leads?#lead-source-and-sub-sources-api"> Lead Source Sub Source API</a>
sub_source_id | Integer | True | This is mandatory field for sending any lead. This helps categorization of leads based on different sub_sources. Refer to <a href="/leads?#lead-source-and-sub-sources-api"> Lead Source Sub Source API</a>



<aside class="success">
Remember — without proper <code>campaign_id</code>, leads will not be attributed to the correct team, Always check with your point of contact that leads are attributed to the desired project only.
</aside>

### PHONE NUMBER VALIDATION

Please format phone numbers before sending using one of the libraries below

Language | Link
------- | -------
PHP | <a href="https://github.com/brick/phonenumber">https://github.com/brick/phonenumber</a>
NodeJS | <a href="https://www.npmjs.com/package/awesome-phonenumber">https://www.npmjs.com/package/awesome-phonenumber</a>


# Lead Source and Sub Sources API


```php
<?php
// shows that lead is generated from google
$source_id = 1
// shows that lead is generated from google GDN.
$sub_source_id = 8 

$postFields .= "&source_id=".$source_id;
$postFields .= "&sub_source_id=".$sub_source_id;
```

```javascript
const source_id : 1 // shows that lead is generated from google
const sub_source_id : 8 // shows that lead is generated from google GDN.

{
  source_id : 1 
  sub_source_id: 8
}
```

Its very important to categorize lead depending upon the source and sub source for better understanding of performance and analysis of over all marketting channels.

While posting a lead the parameters should also have a source_id and sub_source_id as fields.

The values for which can be accessed from this API. 

### <a target="_blank" href="https://lead.anarock.com/api/v0/source-metadata">https://lead.anarock.com/api/v0/source-metadata</a>


Example - If a lead is been generated from google GDN then 

<aside class="success">
Remember — without proper <code>source_id</code> and <code>sub_source_id</code>, leads will not be attributed to the correct sources. If you are running campaign on a new source and it's not present in the API, please contact Anarock team for the same.
</aside>
