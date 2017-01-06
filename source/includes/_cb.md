# Citation Burst

## Create Campaign

<span class="label label-info">Account Method</span>

> Create Campaign

```php
<?php
use BrightLocal\Api;

$briefDescription = 'Born in Paris in 1972 by sibling duo Maguy and Gilbert Le Coze, Le Bernardin only served fish: Fresh, simple and prepared with respect. After receiving its first Michelin star in 1976, and two more in 1980, the Le Coze’s set to open Le Bernardin in New York in 1986.';
$fullDescription = 'The restaurant has held three stars from the Michelin Guide since its 2005 New York launch and currently ranks 24 on the World’s 50 Best Restaurants list. The New York Zagat Guide has recognized Le Bernardin as top rated in the category of “Best Food” for the last nine consecutive years, and in 2015 was rated by the guide as New York City’s top restaurant for food and service.  Le Bernardin has earned seven James Beard Awards since 1998 including “Outstanding Restaurant of the Year,” “Top Chef in New York City,” “Outstanding Service,” “Outstanding Chef in the United States,” “Outstanding Pastry Chef,” “Outstanding Wine Service,” and “Best Restaurant Design” in 2012. 
Most recently, the Foundation named Maguy Le Coze as Outstanding.';

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$success = $api->post('/v2/cb/create', [
    'campaign_name'              => 'Le Bernardin CItation Burst',
    'business_name'              => 'Le Bernardin',
	'website_address'            => 'le-bernardin.com',
	'campaign_country'           => 'USA',
	'campaign_city'              => 'NY',
	'business_category_id'       => 605,
	'business_categories'        => '["restaurant", "cafe"]',
	'address1'                   => '155 West 51st Street',
	'address2'                   => '',
	'city'                       => 'New York',
	'region'                     => 'New York, USA',
	'postcode'                   => '10019',
	'contact_name'               => 'Hanane Moshe',
	'contact_firstname'          => 'Hanane',
	'contact_telephone'          => '+1 212-554-1515',
	'contact_email'              => 'hananemo@gmail',
	'brief_description'          => $briefDescription,
	'full_description'           => $fullDescription,
	'employees_number'           => 35,
	'start_year'                 => 1976,
	'working_hours_apply_to_all' => 0,
	'working_hours_mon_start'    => 0800,
	'working_hours_mon_end'      => 2200,
	'working_hours_tue_start'    => 0800,
	'working_hours_tue_end'      => 2200,
	'working_hours_wed_start'    => 0800,
	'working_hours_wed_end'      => 2200,
	'working_hours_thu_start'    => 0800,
	'working_hours_thu_end'      => 2200,
	'working_hours_fri_start'    => 0800,
	'working_hours_fri_end'      => 2200,
	'working_hours_sat_start'    => 0800,
	'working_hours_sat_end'      => 2200,
	'working_hours_sun_start'    => 0800,
	'working_hours_sun_end'      => 2200   
]);
print_r($success);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

string brief_description = "Born in Paris in 1972 by sibling duo Maguy and Gilbert Le Coze, Le Bernardin only served fish: Fresh, simple and prepared with respect. After receiving its first Michelin star in 1976, and two more in 1980, the Le Coze’s set to open Le Bernardin in New York in 1986.";
string full_description = "The restaurant has held three stars from the Michelin Guide since its 2005 New York launch and currently ranks 24 on the World’s 50 Best Restaurants list. The New York Zagat Guide has recognized Le Bernardin as top rated in the category of “Best Food” for the last nine consecutive years, and in 2015 was rated by the guide as New York City’s top restaurant for food and service.  Le Bernardin has earned seven James Beard Awards since 1998 including “Outstanding Restaurant of the Year,” “Top Chef in New York City,” “Outstanding Service,” “Outstanding Chef in the United States,” “Outstanding Pastry Chef,” “Outstanding Wine Service,” and “Best Restaurant Design” in 2012. 
Most recently, the Foundation named Maguy Le Coze as Outstanding.";

var parameters = new api.Parameters();
parameters.Add("campaign_name", "Sample Citation Burst Campaign");
parameters.Add("business_name", "Le Bernardin");
parameters.Add("website_address", "le-bernardin.com");
parameters.Add("campaign_country", "USA");
parameters.Add("campaign_city", "New York");
parameters.Add("campaign_state", "NY");
parameters.Add("business_category_id", 605);
parameters.Add("business_categories", "['restaurant', 'cafe']");
parameters.Add("address1", "155 West 51st Street");
parameters.Add("address2", "");
parameters.Add("city", "New York");
parameters.Add("region", "New York, USA");
parameters.Add("postcode", "10019");
parameters.Add("contact_name", "Hanane Moshe");
parameters.Add("contact_firstname", "Hanane");
parameters.Add("contact_telephone", "+1 212-554-1515";
parameters.Add("contact_email", "hananemo@gmail.com");		
parameters.Add("brief_description", brief_description);
parameters.Add("full_description", full_description);
parameters.Add("employees_number", 35);
parameters.Add("start_year", 1976);            
parameters.Add("working_hours_apply_to_all", 0);
parameters.Add("working_hours_mon_start", 0800);
parameters.Add("working_hours_mon_end", 2200);
parameters.Add("working_hours_tue_start", 0800);
parameters.Add("working_hours_tue_end", 2200);
parameters.Add("working_hours_wed_start", 0800);
parameters.Add("working_hours_wed_end", 2200);
parameters.Add("working_hours_thu_start", 0800);
parameters.Add("working_hours_thu_end", 2200);
parameters.Add("working_hours_fri_start", 0800);
parameters.Add("working_hours_fri_end", 2400);
parameters.Add("working_hours_sat_start", 1000);
parameters.Add("working_hours_sat_end", 2400);
parameters.Add("working_hours_sun_start", 1000);
parameters.Add("working_hours_sun_end", 2400);			

var success = request.Post("/v2/cb/create", parameters);
```

> Validation Failure

```json
{
  "error": true,
  "errors": {
    "business_name": "Please enter business name",
    "campaign_name": "Please enter campaign name",
    "contact_firstname": "Please enter contact first name",
    "contact_name": "Please enter contact last name",
    "business_category_id": "Please select business category",
    "business_categories": "Please enter at least one business category or tag",
    "campaign_country": "Please select country",
    "campaign_state": "Please select state",
    "campaign_city": "Please select location",
    "address1": "Please enter street address",
    "postcode": "Please enter zip / postal code",
    "website_address": "Please enter the website address for the business",
    "contact_email": "Please enter correct email address",
    "contact_telephone": "Please check your entered telephone number. Only digits 0-9 and ( ) - + characters can be entered.",
    "brief_description": "Please enter short description",
    "full_description": "Please enter full description",
    "employees_number": "Please enter number of employees",
    "start_year": "Please enter starting year",
    "working_hours": "Your must provide Working Hours for at least one day in the week",
    "campaign_status": "Invalid campaign status",
    "location_id": "Location with ID 0 not found or doesn't belong to this customer"
  }
}
```

> Success (200 OK)

```json
{
  "error": false,
  "campaign-id": 280
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/cb/create`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location_id |		
business_name | <span class="label label-required">Required</span>	
campaign_name | <span class="label label-required">Required</span>	
website_address	| <span class="label label-required">Required</span>	
campaign_country | <span class="label label-required">Required</span>	
campaign_state | <span class="label label-required">Required</span>
campaign_city | <span class="label label-required">Required</span>	
business_category_id | <span class="label label-required">Required</span>	
business_categories	| <span class="label label-required">Required</span>	
address1 | <span class="label label-required">Required</span>	
address2 |			
postcode | <span class="label label-required">Required</span>	
contact_name | <span class="label label-required">Required</span>	
contact_firstname | <span class="label label-required">Required</span>	
contact_telephone | <span class="label label-required">Required</span>	
mobile_number |		
fax_number |		
brief_description | <span class="label label-required">Required</span>	
full_description | <span class="label label-required">Required</span>	
employees_number | <span class="label label-required">Required</span>	
start_year | <span class="label label-required">Required</span>	
service_name_1 |		
service_name_2 |		
service_name_3 |		
service_name_4 |		
service_name_5 |		
working_hours_apply_to_all | <span class="label label-required">Required</span> If this field has a value of Y you only need to specify working hours for Monday and these values are then also used for the other days of the week.
working_hours_mon_start	| <span class="label label-required">Required</span>	
working_hours_mon_end | <span class="label label-required">Required</span>	
working_hours_tue_start	| <span class="label label-required">Required</span>	
working_hours_tue_end | <span class="label label-required">Required</span>	
working_hours_wed_start | <span class="label label-required">Required</span>	
working_hours_thu_end | <span class="label label-required">Required</span>	
working_hours_thu_start | <span class="label label-required">Required</span>	
working_hours_fri_end | <span class="label label-required">Required</span>	
working_hours_fri_start | <span class="label label-required">Required</span>	
working_hours_sat_end | <span class="label label-required">Required</span>	
working_hours_sat_start | <span class="label label-required">Required</span>	
working_hours_sun_end | <span class="label label-required">Required</span>	
working_hours_sun_start	| <span class="label label-required">Required</span>	
special_offer |		
special_offer_description |		
special_offer_expiry_date |		
payment_methods	| <p>String with '&#124;' delimiter. E.g. cash&#124;visa&#124;mastercard&#124;amex&#124;cheque&#124;atm&#124;discover. Possible values - cash&#124;visa&#124;mastercard&#124;amex&#124;cheque&#124;invoice&#124;insurance&#124;atm&#124;travellers&#124;financing&#124;paypal&#124;discover</p>
receive-email-alerts | 		
alert-email-addresses | 		
old_business_name |		
old_lookup_data	| For e.g, old postcode
is_public | Publish reports on a white label URL. Y or N.

## Update Campaign

<span class="label label-info">Account Method</span>

> Validation Failure

```json
{
  "success": false,
  "error": true,
  "errors": {
    "business_name": "Please enter business name",
    "campaign_name": "Please enter campaign name",
    "contact_firstname": "Please enter contact first name",
    "contact_name": "Please enter contact last name",
    "business_categories": "Please enter at least one business category or tag",
    "campaign_state": "Please select state",
    "campaign_city": "Please select location",
    "address1": "Please enter street address"  
  }
}
```

> Success (200 OK)

```json
{
  "error": false,
  "success": true,
  "result": "Campaign updated"
}
```

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v2/cb/<campaignId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
business_name | 	
campaign_name | 	
website_address	| 		
campaign_state |
campaign_city | 		
business_categories	| 	
address1 | 	
address2 |		 	
postcode | 	
contact_name | 	
contact_firstname | 	
contact_telephone | 	
mobile_number |		
fax_number |		
brief_description | 	
full_description | 	
employees_number | 	
start_year | 	
service_name_1 |		
service_name_2 |		
service_name_3 |		
service_name_4 |		
service_name_5 |		
working_hours_apply_to_all |  If this field has a value of Y you only need to specify working hours for Monday and these values are then also used for the other days of the week.
working_hours_mon_start	| 	
working_hours_mon_end | 	
working_hours_tue_start	| 	
working_hours_tue_end | 	
working_hours_wed_start | 	
working_hours_thu_end | 	
working_hours_thu_start | 	
working_hours_fri_end | 	
working_hours_fri_start | 	
working_hours_sat_end | 	
working_hours_sat_start | 	
working_hours_sun_end | 	
working_hours_sun_start	| 	
special_offer |		
special_offer_description |		
special_offer_expiry_date |		
payment_methods	| <p>String with '&#124;' delimiter. E.g. cash&#124;visa&#124;mastercard&#124;amex&#124;cheque&#124;atm&#124;discover. Possible values - cash, visa, mastercard, amex, cheque, invoice, insurance, atm, travellers, financing, paypal, discover</p>
receive-email-alerts | 		
alert-email-addresses | 		
old_business_name |		
old_lookup_data	| For e.g, old postcode
is_public | Publish reports on a white label URL. Y or N.

## Upload Image

<span class="label label-info">Account Method</span>

> Success (200 OK)

```json
{
  "error": false,
  "result": "File companyLogo.jpg uploaded"
}
```

Upload an image to be used in CB campaign. <campaignId> is the id of existing campaign, <imageType> is one of: logo, image1, image2, image3. Request must contain standard file upload. There should be exactly one file uploaded with size not exceeding 2 MB. Acceptable formats are: jpg, png.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/cb/upload/[campaignId]/[imageType]`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

### Example URL

http://tools.brightlocal.com/seo-tools/api/v2/cb/upload/5533/logo

## Get Citations

<span class="label label-info">Account Method</span>

> Get Citations

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$results = $api->get('/v2/cb/citations', [
	'campaign_id' => 1 
]);
print_r($results);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

var campaignId = 1;
var parameters = new api.Parameters();
parameters.Add("campaign-id", campaignId);

var citations = request.Get("/v2/cb/citations", parameters);
```

> Success (200 OK)

```json
{
    "error": false,
    "campaignId": 123,
    "citations": {
        "bing.com": {
            "citation_value": "Very High",
            "domain_authority": "99",
            "type": "General Directory",
            "phone_verification": "N",
            "client_verification": "Y",
            "notes": "Bingplaces will send you verification PIN at your registered postal address.",
            "no_update": "Y",
            "no_photos": "Y",
            "part_of_yext_network": "Y",
            "quick_listing": "N",
            "secondary_campaign_id": "b",
            "status": "To Do"
        }
    },
    "aggregators": [
        {
            "citation" : "factual",
            "domain_authority": "N/A",
            "type": "Aggregators",
            "phone_verification": "N/A",
            "client_verification": "N/A",
            "notes": "Factual will only contact the business if key data doesn’t align",
            "no_update": "N/A",
            "no_photos": "N/A",
            "part_of_yext_network": "N/A",
            "quick_listing": "N/A",
            "secondary_campaign_id": "b",
            "status": "To Do"
        }
    ]
}
```

Retrieve list of citations associated with campaign.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/citations`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id	| <span class="label label-required">Required</span>

## Confirm &amp; Pay

<span class="label label-info">Account Method</span>

> Confirm &amp; Pay

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$success = $api->post('/v2/cb/confirm-and-pay', [
	'campaign_id' => 1,
	'package_id'  => 'cb15'
]);
print_r($success);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

var campaignId = 1;
var parameters = new api.Parameters();
parameters.Add("campaign_id", campaignId);
parameters.Add("package_id", "cb15");

var success = request.Post("/v2/cb/confirm-and-pay", parameters);
```

> Validation Failure

```json
{
  "error": true,
  "errors": {
    "citations": "No citations supplied",
    "invalid_package_id": "Invalid package id"
  }
}
```
> Success (200 OK)
```json
//needs to be added
```

Confirm and pay (using credits) for a CB campaign.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/cb/confirm-and-pay`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign_id	| <span class="label label-required">Required</span>	
package_id | <span class="label label-required">Required</span> CB package id corresponding to the number of ordered credits: 'cb10' for 10 citations, 'cb15' for 15, then 25, 30, 50, 75, 100. To use only aggregators and ignore citations or package_id, please use 'cb0' package only. 
autoselect | String. Possible values 'N' or 'Y'. Default 'N'.
citations | JSON Array. List of sites you require listings for. You can leave citations empty for auto selecting citations.
remove-duplicates | String. Possible values 'N' or 'Y'. Default 'N'. Find and Remove Duplicate Listings
aggregators | JSON Array. List of aggregators you require listings for. Possible values are 'factual', 'infogroup', 'neustar', 'acxiom' for USA. The only possible value for all non USA countries is 'factual'.
notes | Provide instructions to our submissions team with specifics about how you'd like your campaign handled.

## Get Campaigns

<span class="label label-info">Account Method</span>

> Get Campaigns

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$results = $api->post('/v2/cb/get-all');
print_r($results);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

var parameters = new api.Parameters();

var campaigns = request.Get("/v2/cb/get-all", parameters);
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "campaign_id": "4",
                "location_id": "7459",
                "campaign_name": "Test 1",
                "date_purchased": "2012-06-11 00:00:00",
                "date_completed": "2012-06-25 00:00:00",
                "email": "test@test1.com",
                "username": "",
                "password": "",
                "citations":  [
                    {
                        "name": "advertiserdirectory.co.uk",
                        "status": "Live",
                        "site_type": "Local Directory",
                        "citation_url": "advertiserdirectory.co.uk",
                        "domain_authority": "21/100",
                        "citation_value": "Low"
                    },
                    {
                        "name": "freeindex.co.uk",
                        "status": "Updated",
                        "site_type": "General Directory",
                        "citation_url": "freeindex.co.uk",
                        "domain_authority": "< 10/100",
                        "citation_value": "High"
                    }
                ],
                "aggregators":  [
				    {
					    "name": "infogroup",
					    "status": "Live",
					    "site_type": "Aggregator",
					    "citation_url": "infogroup.com",
					    "domain_authority": "NA",
					    "citation_value": "NA"
				    },
				    {
					    "name": "factual",
					    "status": "Updated",
					    "site_type": "Aggregator",
					    "citation_url": "factual.com",
					    "domain_authority": "NA",
					    "citation_value": "NA"
				    }
			    ]                
            }
        ]
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id |

## Get Campaign

<span class="label label-info">Account Method</span>

> Get Campaign

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$campaign = $api->get('/v2/cb/get', [
	'campaign_id' => 1
]);
print_r($campaign);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

var campaignId = 1;
var parameters = new api.Parameters();
parameters.Add("campaign-id", campaignId);

var campaign = request.Get("/v2/cb/get", parameters);
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  {
            "campaign_id": "5",
            "purchase_date": "2012-07-12 16:14:27",
            "completion_date": "2012-07-26 16:14:27",
            "username": "",
            "email": "",
            "password": "",
            "stats":  [
                {
                    "start_date": "2012-07-12 16:14:27",
                    "citations_count": 50,
                    "scheduled": 50,
                    "submitted": 0,
                    "live": 0,
                    "updated": 0,
                    "replaced": 0
                }
            ],
            "citations":  [
                {
                    "site": "ezlocal.com",
                    "type": "General Directory",
                    "domain_authority": "< 10/100",
                    "status": "To Do",
                    "link": "",
                    "notes": "Site issues a temporary password for accessing account - check email account post submission."
                },
                {
                    "site": "insiderpages.com",
                    "type": "General Directory",
                    "domain_authority": "< 10/100",
                    "status": "To Do",
                    "link": "",
                    "notes": ""
                }
            ],
            "aggregators":  [
				{
					"site": "infogroup",
					"type": "Aggregator",
					"domain_authority": "NA",
					"status": "To Do",
					"link": "www.dropbox.com/short-url",
					"notes": "Site issues a temporary password for accessing account - check email account post submission."
				},
				{
					"site": "factual",
					"type": "Aggregator",
					"domain_authority": "NA",
					"status": "To Do",
					"link": "",
					"notes": ""
				}
			],            
            "location_id": 1,
            "urls": {
                "interactive_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/cb\/campaign\/view\/5",
                "pdf_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/cb\/campaign\/pdf\/5",
                "csv_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/cb\/campaign\/csv\/5"
            }
        }
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id	| <span class="label label-required">Required</span>	
