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
extra-business-categories | 50 characters max
working-hours | 
payment-methods | 
brief-description | 200 characters max
full-description | 500 characters max
services| Newline (\n) separated list of services

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
extra-business-categories | 50 characters max
working-hours | 
payment-methods | 
brief-description | 200 characters max
full-description | 500 characters max
services| Newline (\n) separated list of services

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
        "location-name":"Location from API NEW (S)",
        "client-id":8,
        "location-url":"http:\/\/created.com",
        "business-category-id":650,
        "country":"USA",
        "address1":"39000 Bob Hope",
        "address2":"78",
        "region":"California",
        "town":"Sacramento",
        "postcode":"91000",
        "telephone":"80500 050 0505",
        "location-reference":"get_reference_number",
        "contact-first-name":"first name",
        "contact-last-name":"last name",
        "contact-telephone":"8818818181",
        "contact-fax":"889499879879",
        "contact-mobile":"80409890",
        "num-of-employees":"0",
        "year-of-formation":"1958",
        "extra-business_categories":"",
        "working-hours":[
        ],
        "payment-methods-accepted":[
        ],
        "short-desc":"",
        "long-desc":"",
        "services-or-products":[
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
            "location-name":"Location from API NEW (S)",
            "client-id":8,
            "location-url":"http:\/\/created.com",
            "business-category-id":650,
            "country":"USA",
            "address1":"39000 Bob Hope",
            "address2":"78",
            "region":"California",
            "town":"Sacramento",
            "postcode":"91000",
            "telephone":"80500 050 0505",
            "location-reference":"get_reference_number",
            "contact-first-name":"first name",
            "contact-last-name":"last name",
            "contact-telephone":"8818818181",
            "contact-fax":"889499879879",
            "contact-mobile":"80409890",
            "num-of-employees":"0",
            "year-of-formation":"1958",
            "extra-business_categories":"",
            "working-hours":[
            ],
            "payment-methods-accepted":[
            ],
            "short-desc":"",
            "long-desc":"",
            "services-or-products":[
            ]
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
