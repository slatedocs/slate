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
    'contact_name'               => 'Bloggs',
    'contact_firstname'          => 'Joe',
    'contact_telephone'          => '+1 212-554-1515',
    'contact_email'              => 'joe.bloggs@test.com',
    'brief_description'          => $briefDescription,
    'full_description'           => $fullDescription,
    'employees_number'           => 35,
    'start_year'                 => 1976,
    'working_hours_apply_to_all' => 1,
    'working_hours_mon_start'    => 0800,
    'working_hours_mon_end'      => 2200,  
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
parameters.Add("contact_name", "Bloggs");
parameters.Add("contact_firstname", "Joe");
parameters.Add("contact_telephone", "+1 212-554-1515";
parameters.Add("contact_email", "joe.bloggs@test.com");		
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
working_hours_mon_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_mon_start and working_hours_mon_end.
working_hours_tue_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_tue_start and working_hours_tue_end.
working_hours_wed_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_wed_start and working_hours_wed_end.
working_hours_thu_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_thu_start and working_hours_thu_end.
working_hours_fri_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_fri_start and working_hours_fri_end.
working_hours_sat_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_sat_start and working_hours_sat_end.
working_hours_sun_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_sun_start and working_hours_sun_end.
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


```php
<?php
use BrightLocal\Api;

$campaignId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$success = $api->put('/v2/cb/' .$campaignId, [
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
    'contact_name'               => 'Bloggs',
    'contact_firstname'          => 'Joe',
    'contact_telephone'          => '+1 212-554-1515',
    'contact_email'              => 'joe.bloggs@test.com'	
]);
print_r($success);
```


```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

var campaignId = 1;

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
parameters.Add("contact_name", "Bloggs");
parameters.Add("contact_firstname", "Joe");
parameters.Add("contact_telephone", "+1 212-554-1515";
parameters.Add("contact_email", "joe.bloggs@test.com");		

var success = request.Put("/v2/cb/" + campaignId + "", parameters);
```

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
working_hours_mon_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_mon_start and working_hours_mon_end.
working_hours_tue_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_tue_start and working_hours_tue_end.
working_hours_wed_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_wed_start and working_hours_wed_end.
working_hours_thu_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_thu_start and working_hours_thu_end.
working_hours_fri_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_fri_start and working_hours_fri_end.
working_hours_sat_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_sat_start and working_hours_sat_end.
working_hours_sun_24hrs | Y or N. Defaults to N. This can be used in place of working_hours_sun_start and working_hours_sun_end.
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

> Upload Image

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$success = $api->post('/v2/cb/upload/<campaignId>/<imageType>', [
    'file' => fopen('/path/to/image.jpg', 'r')
]);
print_r($success);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
var campaignId = 1;
var imageType = ".jpg";
var path = "/path/to/image.jpg";

var success = request.PostImage("/v2/cb/upload/" + campaignId + "/" + imageType "", path);
```


> Success (200 OK)

```json
{
  "success": true,
  "error":   false,
  "result":  "File companyLogo.jpg uploaded"
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
	'campaign_id'       => 1,
	'package_id'        => 'cb15',
	'autoselect'        => 'N',
	'remove-duplicates' => 'Y',
	'aggregators'       => '["factual"]',
	'citations'         => '["brownbook.net", "bing.com", "manta.com", "yell.com", "accessplace.com", "bizfo.co.uk", "bizwiki.co.uk", "citylocal.co.uk", "cylex-uk.co.uk", "where2go.com", "yelp.co.uk", "scoot.co.uk", "restaurants.co.uk", "opendi.co.uk", "misterwhat.co.uk"]',
	'notes'             => 'Some very important notes'
]);
print_r($success);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");

var campaignId = 1;
var parameters = new api.Parameters();
parameters.Add("campaign_id", campaignId);
parameters.Add("package_id", "cb15");
parameters.Add("autoselect", "N");
parameters.Add("remove-duplicates", "Y");
parameters.Add("aggregators", "['factual']");
parameters.Add("citations", "['brownbook.net', 'bing.com', 'manta.com', 'yell.com', 'accessplace.com', 'bizfo.co.uk', 'bizwiki.co.uk', 'citylocal.co.uk', 'cylex-uk.co.uk', 'where2go.com', 'yelp.co.uk', 'scoot.co.uk', 'restaurants.co.uk', 'opendi.co.uk', 'misterwhat.co.uk']");
parameters.Add("notes", "Some very important notes");

var success = request.Post("/v2/cb/confirm-and-pay", parameters);
```

> Validation Failure

```json
{
  "error": true,
  "errors": {
    "citations": "No citations supplied",
    "package_id": "Invalid package id"
  }
}
```
> Success (200 OK)
```json
{
  "error": false
}
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
    "response": {
        "results": {
            "campaign_id": "116225",
            "location_id": 522411,
            "campaign_name": "CUCINA urbana",
            "creation_date": "2017-01-11 14:56:56",
            "package_id": "1",
            "selection_type": "manual",
            "paid": "Yes",
            "status": "Complete",
            "submission_date": null,
            "purchase_date": "2017-01-11 15:06:18",
            "completion_date": "2017-01-25 00:00:00",
            "username": "",
            "email": "",
            "password": "",
            "campaign_note": "",
            "customer_note": "",
            "white_label_profile_id": "0",
            "num_citations": null,
            "package_price": "75",
            "website_address": "http:\/\/www.cucinaurbana.com\/",
            "campaign_country": "USA",
            "campaign_state": "CA",
            "campaign_city": "San Diego",
            "business_category_id": "2291",
            "business_category_name": "bar, liquor store, restaurant, food, store",
            "address": {
                "street_address_1": "505 Laurel Street",
                "street_address_2": null,
                "city": null,
                "region": null,
                "postcode": "92101"
            },
            "contact": {
                "last_name": "name",
                "first_name": "name",
                "email": "<hidden>",
                "telephone": "+1 619-239-2222"
            },
            "mobile_number": null,
            "fax_number": null,
            "descriptions": {
                "brief": "",
                "full": ""
            },
            "num_employees": "20",
            "start_year": "2000",
            "service_names": {
                "1": null,
                "2": null,
                "3": null,
                "4": null,
                "5": null
            },
            "working_hours": {
                "apply_to_all": "1",
                "days": {
                    "mon": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    },
                    "tue": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    },
                    "wed": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    },
                    "thu": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    },
                    "fri": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    },
                    "sat": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    },
                    "sun": {
                        "start": null,
                        "end": null,
                        "24_hours": "1"
                    }
                }
            },
            "payment_methods": {
                "cash": "on"
            },
            "company_logo": null,
            "photos": {
                "1": null,
                "2": null,
                "3": null
            },
            "email_alerts": {
                "enabled": "N",
                "addresses": [
                    "<hidden>",
                    "<hidden>",
                    "<hidden>",
                    "<hidden>",
                    "<hidden>"
                ]
            },
            "old_business_name": null,
            "specialist_info": [],
            "stats": [
                {
                    "start_date": "2017-01-11 15:06:18",
                    "citations_count": 25,
                    "scheduled": 0,
                    "submitted": 0,
                    "live": 25,
                    "updated": 0,
                    "replaced": 0
                }
            ],
            "citations": [
                {
                    "site": "google.com",
                    "type": "Local Directory",
                    "domain_authority": "100",
                    "status": "Live",
                    "link": "https:\/\/www.google.com\/search?q=CUCINA+urbana&npsic=0&gbv=2&gws_rd=cr&ludocid=1563397020059271303&hl=en&gl=us",
                    "notes": ""
                },
                {
                    "site": "mapsconnect.apple.com",
                    "type": "General Directory",
                    "domain_authority": "100",
                    "status": "Live",
                    "link": "mapsconnect.apple.com",
                    "notes": "We can't give you a link to your live listing in Apple Maps. You can find your listing by using the Apple Maps app of any iOS device."
                },
                {
                    "site": "bing.com",
                    "type": "General Directory",
                    "domain_authority": "99",
                    "status": "Live",
                    "link": "bing.com",
                    "notes": "Bingplaces will send you verification PIN at your registered postal address."
                },
                {
                    "site": "mapquest.com",
                    "type": "Local Map Site",
                    "domain_authority": "95",
                    "status": "Live",
                    "link": "https:\/\/www.mapquest.com\/us\/california\/italian-restaurants-san-diego\/cucina-urbana-265234833",
                    "notes": "This site does not allow images to be uploaded and displays limited information on company profile."
                },
                {
                    "site": "yellowpages.com",
                    "type": "General Directory",
                    "domain_authority": "92",
                    "status": "Live",
                    "link": "http:\/\/www.yellowpages.com\/san-diego-ca\/mip\/cucina-urbana-22866099",
                    "notes": ""
                },
                {
                    "site": "angieslist.com",
                    "type": "General Directory",
                    "domain_authority": "91",
                    "status": "Live",
                    "link": "angieslist.com",
                    "notes": "The site supports a limited number of cities in Canada only (no problem with US located businesses). Please don't be surprise if we end up replacing this site in your order; it means your city is not supported."
                },
                {
                    "site": "citysearch.com",
                    "type": "Local Directory",
                    "domain_authority": "90",
                    "status": "Live",
                    "link": "http:\/\/www.citysearch.com\/profile\/607571610\/san_diego_ca\/cucina_urbana.html",
                    "notes": "We list your business here via Expressupdate.com; site does not accept Toll Free phone. It takes 2-3 months before your listing goes live here."
                },
                {
                    "site": "superpages.com",
                    "type": "General Directory",
                    "domain_authority": "90",
                    "status": "Live",
                    "link": "http:\/\/www.superpages.com\/bp\/san-diego-ca\/cucina-urbana-L2129766314.htm",
                    "notes": "We submit your listing to this site via Dexmedia.com"
                },
                {
                    "site": "manta.com",
                    "type": "General Directory",
                    "domain_authority": "87",
                    "status": "Live",
                    "link": "http:\/\/www.manta.com\/c\/mtxfvs9\/cucina-urbana",
                    "notes": ""
                },
                {
                    "site": "switchboard.com",
                    "type": "Local Directory",
                    "domain_authority": "87",
                    "status": "Live",
                    "link": "switchboard.com",
                    "notes": "We list your business here via Expressupdate.com; site does not accept Toll Free phone. It takes 2-3 months before your listing goes live here."
                },
                {
                    "site": "tomtom.com",
                    "type": "GPS Data Provider",
                    "domain_authority": "85",
                    "status": "Live",
                    "link": "tomtom.com",
                    "notes": "We submit data to Tomtom once every quarter, so your data will be submitted the next round during the next round of submissions to Tomtom."
                },
                {
                    "site": "whowhere.com",
                    "type": "General Directory",
                    "domain_authority": "83",
                    "status": "Live",
                    "link": "whowhere.com",
                    "notes": "We submit your listing to this site via Dexmedia.com"
                },
                {
                    "site": "kudzu.com",
                    "type": "General Directory",
                    "domain_authority": "82",
                    "status": "Live",
                    "link": "http:\/\/www.kudzu.com\/m\/Cucina-Urbana-841435",
                    "notes": ""
                },
                {
                    "site": "local.com",
                    "type": "General Directory",
                    "domain_authority": "81",
                    "status": "Live",
                    "link": "local.com",
                    "notes": "We create basic listing on this site (no images) & create a new account. Client\/agency respond to email to put listing live. See campaign email inbox."
                },
                {
                    "site": "local.botw.org",
                    "type": "Local Directory",
                    "domain_authority": "80",
                    "status": "Live",
                    "link": "local.botw.org",
                    "notes": "This site does not display URL in live listing."
                },
                {
                    "site": "aboutus.com",
                    "type": "General Directory",
                    "domain_authority": "79",
                    "status": "Live",
                    "link": "aboutus.com",
                    "notes": ""
                },
                {
                    "site": "heraldtribune.com",
                    "type": "News \/ Content Site",
                    "domain_authority": "79",
                    "status": "Live",
                    "link": "heraldtribune.com",
                    "notes": ""
                },
                {
                    "site": "directory.wfaa.com",
                    "type": "Local Directory",
                    "domain_authority": "78",
                    "status": "Live",
                    "link": "directory.wfaa.com",
                    "notes": "This site does not allow images to be uploaded and displays limited information on company profile."
                },
                {
                    "site": "chamberofcommerce.com",
                    "type": "General Directory",
                    "domain_authority": "74",
                    "status": "Live",
                    "link": "https:\/\/chamberofcommerce.com\/san-diego-ca\/2736482-cucina-urbana",
                    "notes": "We can only list your business name, address, and phone number here. Please be guided before ordering a listing from this site."
                },
                {
                    "site": "hotfrog.com",
                    "type": "General Directory",
                    "domain_authority": "74",
                    "status": "Live",
                    "link": "hotfrog.com",
                    "notes": ""
                },
                {
                    "site": "411.com",
                    "type": "Local Directory",
                    "domain_authority": "72",
                    "status": "Live",
                    "link": "411.com",
                    "notes": "We list your business here via Expressupdate.com; site does not accept Toll Free phone. It takes 2-3 months before your listing goes live here."
                },
                {
                    "site": "tupalo.com",
                    "type": "General Directory",
                    "domain_authority": "70",
                    "status": "Live",
                    "link": "tupalo.com",
                    "notes": "Tupalo is notorious on auto updating address: for example, Suite to Ste, or North to just \"N\"."
                },
                {
                    "site": "brownbook.net",
                    "type": "General Directory",
                    "domain_authority": "64",
                    "status": "Live",
                    "link": "http:\/\/www.brownbook.net\/business\/11048772\/laurel-restaurant",
                    "notes": "We cannot update the business name in this site after submission. Ensure that you get the business name provided is correct from the very beginning."
                },
                {
                    "site": "citysquares.com",
                    "type": "General Directory",
                    "domain_authority": "57",
                    "status": "Live",
                    "link": "http:\/\/citysquares.com\/b\/cucina-urbana-19686169",
                    "notes": "This site does not display URL, description for free listing. They are reserved to paid listing only."
                },
                {
                    "site": "routeandgo.net",
                    "type": "General Directory",
                    "domain_authority": "22",
                    "status": "Live",
                    "link": "http:\/\/www.routeandgo.net\/place\/3118699\/united-states\/cucina-urbana",
                    "notes": ""
                }
            ],
            "aggregators": [],
            "urls": {
                "interactive_url": "<hidden>",
                "pdf_url": "<hidden>",
                "csv_url": "<hidden>"
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

## Get Credits Balance

<span class="label label-info">Account Method</span>

> Get Credits

```php
<?php
use BrightLocal\Api;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$results = $api->get('/v2/cb/credits');
print_r($results);
```

```csharp
api request = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
var parameters = new api.Parameters();
var results = request.Get("/v2/cb/credits", parameters);
```

> Success (200 OK)

```json
{
    "success": true,
    "credits": 9000
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/cb/credits`

### Query Parameters

Parameter | Notes
--------- | -----
api-key	| <span class="label label-required">Required</span>	
sig	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires	| <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
