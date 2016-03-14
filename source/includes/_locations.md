# Locations

## Add Location

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
    "success": true,
    "location-id": 1
}
```

Adds a new location and associates it with your account.

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span> 50 characters max.
client-id | <span class="label label-required">Required</span>
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

## Update Location

<span class="label label-info">Account Method</span>

Update an existing location. Only supply values you want to update. The rest will be left unchanged.

> Success (200 OK)

```json
{
    "success": true,
    "location-id": 1
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span> 50 characters max.
client-id | <span class="label label-required">Required</span>
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

> Success (200 OK)

```json
{
    "success": true
}
```

Delete an existing location. If there are reports associated with this location then the association is removed but the reports are not deleted. Warning: This action cannot be undone.

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | <span class="label label-required">Required</span>

## Get Location

<span class="label label-info">Account Method</span>

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
            "working-hours":[
            	"mon_start":"9 a.m.",
            	"mon_end":"7 p.m.",
            ],
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

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations/:id`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Search Locations

<span class="label label-info">Account Method</span>

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
	   }
    ]
}
```

Search for locaions matching a specified search string. The search uses a number of fields including location name, contact firstname, lastname and email address.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/locations`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
q | <span class="label label-required">Required</span>
client-id | Client Id
