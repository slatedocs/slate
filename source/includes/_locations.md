# Locations

## Add Location

<span class="label label-info">Account Method</span>

> Add Location

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$success = $api->post('v1/clients-and-locations/locations/', [
    'name'                 => 'Le Bernardin',    
    'url'                  => 'le-bernardin.com',
	'business-category-id' =>  605,
	'country'              => 'USA', // 3 letter iso code
	'address1'             => '155 West 51st Street',
    'address2'             => '',
	'region'               => 'NY' // State or Region
	'city'                 => 'New York',
	'postcode'             => '10019',
    'telephone'            => '+1 212-554-1515'
]);
print_r($success);
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'name=Le Bernardin' \
 -d 'url=le-bernardin.com' \
 -d 'business-category-id=605' \ 
 -d 'country=USA' \
 -d 'address1=155 West 51st Street' \
 -d 'address1=' \
 -d 'region=NY' \
 -d 'city=New York' \
 -d 'postcode=10019' \
 -d 'telephone=+1 212-554-1515' \
 https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/
```

> Success (200 OK)

```json
{
    "success": true,
    "location-id": 1
}
```

Adds a new location and associates it with your account.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span> 50 characters max.
client-id | 
url | <span class="label label-required">Required</span> 150 characters max
business-category-id | <span class="label label-required">Required</span> [See here for a full list of valid business codes.](#appendix)
country | <span class="label label-required">Required</span> ISO 3 country code.
address1 | <span class="label label-required">Required</span> 50 characters max
address2 | 50 characters max
region | <span class="label label-required">Required</span> 20 characters max
city | <span class="label label-required">Required</span> 20 characters max
postcode | <span class="label label-required">Required</span> 20 characters max
telephone | <span class="label label-required">Required</span> 20 characters max
unique-reference | An arbitrary unique reference you can use to identify a location. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.
contact-first-name | 50 characters max
contact-last-name | 50 characters max
contact-mobile | 20 characters max
contact-telephone | 20 characters max
contact-email | 100 characters max
contact-fax | 20 characters max
number-of-employees | 10 characters max
year-of-formation | 20 characters max
extra-business-categories | Json encoded array.
working-hours | Json encoded array. Available array keys: mon_start, mon_end, tue_start, tue_end, wed_start, wed_end, thu_start, thu_end, fri_start, fri_end, sat_start, sat_end, sun_start, sun_end 
payment-methods | Json encoded array. Available values: cash, visa, mastercard, amex, cheque, invoice, insurance, atm, travelers, financing, paypal, discover
short-description | 200 characters max
long-description | 500 characters max
services-of-products| Json encoded array

## Update Location

<span class="label label-info">Account Method</span>

Update an existing location. Only supply values you want to update. The rest will be left unchanged.

> Update Location

```php
<?php
use BrightLocal\Api;

$locationId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$success = $api->put('v1/clients-and-locations/locations/' .$locationId, [
    'name'                 => 'Le Bernardin',    
    'url'                  => 'le-bernardin.com',
	'business-category-id' =>  605,
	'country'              => 'USA', // 3 letter iso code
	'address1'             => '155 West 51st Street',
    'address2'             => '',
	'region'               => 'NY', // State or Region
	'city'                 => 'New York',
	'postcode'             => '10019',
    'telephone'            => '+1 212-554-1515'
]);
print_r($success);
```

```shell
curl -X PUT \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'name=Le Bernardin' \
 -d 'url=le-bernardin.com' \
 -d 'business-category-id=605' \ 
 -d 'country=USA' \
 -d 'address1=155 West 51st Street' \
 -d 'address1=' \
 -d 'region=NY' \
 -d 'city=New York' \
 -d 'postcode=10019' \
 -d 'telephone=+1 212-554-1515' \
 https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/1
```

> Success (200 OK)

```json
{
    "success": true,
    "location-id": 1
}
```

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/<locationId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span> 50 characters max.
client-id |
url | <span class="label label-required">Required</span> 150 characters max
business-category-id | <span class="label label-required">Required</span> See here for a full list of valid business codes.
country | <span class="label label-required">Required</span> ISO 3 country code.
address1 | <span class="label label-required">Required</span> 50 characters max
address2 | 50 characters max
region | <span class="label label-required">Required</span> 20 characters max
city | <span class="label label-required">Required</span> 20 characters max
postcode | <span class="label label-required">Required</span> 20 characters max
telephone | <span class="label label-required">Required</span> 20 characters max
unique-reference | An arbitrary unique reference you can use to identify a location. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.
contact-first-name | 50 characters max
contact-last-name | 50 characters max
contact-mobile | 20 characters max
contact-telephone | 20 characters max
contact-email | 100 characters max
contact-fax | 20 characters max
number-of-employees | 10 characters max
year-of-formation | 20 characters max
extra-business-categories | Json encoded array.
working-hours | Json encoded array. Available array keys: mon_start, mon_end, tue_start, tue_end, wed_start, wed_end, thu_start, thu_end, fri_start, fri_end, sat_start, sat_end, sun_start, sun_end 
payment-methods | Json encoded array. Available values: cash, visa, mastercard, amex, cheque, invoice, insurance, atm, travelers, financing, paypal, discover
short-description | 200 characters max
long-description | 500 characters max
services-of-products| Json encoded array

## Delete Location

<span class="label label-info">Account Method</span>

> Delete a Location

```php
<?php
use BrightLocal\Api;

$locationId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$result = $api->delete('v1/clients-and-locations/locations/' . $locationId);
if (!empty($result['success'])) {
    echo 'Successfully deleted location.' . PHP_EOL;
}
```

> Success (200 OK)

```json
{
    "success": true
}
```

Delete an existing location. If there are reports associated with this location then the association is removed but the reports are not deleted. Warning: This action cannot be undone.

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/<locationId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | <span class="label label-required">Required</span>

## Get Location

<span class="label label-info">Account Method</span>

> Get location

```php
<?php
use BrightLocal\Api;

$locationId = 1;
$api = new Api(<INSERT_API_KEY>', '<INSERT_API_SECRET>);
$location = $api->get('v1/clients-and-locations/locations/' . $locationId);
print_r($location);
```

> Success (200 OK)

```json
{
   "success":true,
   "location":{
            "location-name":"BrightLocal HQ",
            "client-id":1,
            "location-url":"https://www.brightlocal.com",
            "business-category-id":650,
            "country":"GBR",
            "address1":"The Old Candlemakers",
            "address2":"West St, Lewes",
            "region":"East Sussex",
            "town":"Lewes",
            "postcode":"BN7 2NZ",
            "telephone":"80500 050 0505",
            "location-reference":"BL1",
            "contact-first-name":"first name",
            "contact-last-name":"last name",
            "contact-telephone":"+44 1273 917 374",
            "contact-fax":"",
            "contact-mobile":"",
            "num-of-employees":"50",
            "year-of-formation":"2009",
            "extra-business_categories":[
            	"marketing"
            ],
            "working-hours":{
            	"mon_start":"9 a.m.",
            	"mon_end":"7 p.m."
            },
            "payment-methods-accepted":[
                "visa",
                "paypal"
            ],
            "short-desc":"",
            "long-desc":"",
            "services-or-products":[
                "analytics"
            ]
   }
}
```

Get extended details for a specific location.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/<locationId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Search Locations

<span class="label label-info">Account Method</span>

> Search for a location

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$results = $api->call('v1/clients-and-locations/locations/search', [
    'q' => 'BrightLocal'    
]);
print_r($results);
```

```shell
curl -X GET \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'q=My+Sample+Query' \	
  https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/search/
```

> Success (200 OK)

```json
{
    "success": true,
    "locations":  [
        {
			"location-id": 1,
			"location-name":"BrightLocal HQ",
			"client-id":1,
			"location-reference":"BL1"
	   },
	    {
			"location-id": 2,
			"location-name":"Talking Elephant",
			"client-id":12,
			"location-reference":"TE12"
	   }
    ]
}
```

Search for locations matching a specified search string. The search uses a number of fields including location name, contact firstname, lastname and email address.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
q | <span class="label label-required">Required</span>
client-id | Client Id
