# Citation Tracker

## Add Report

<span class="label label-info">Account Method</span>

> Add Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/ct/add', [
    'location-id'       => 1,
    'report-name'       => 'Le Bernardin',
    'business-name'     => 'Le Bernardin',
    'address-1'         => '155 West 51st Street',
    'address-2'         => 'The Equitable Bldg',
    'business-location' => 'New York, NY',
    'postcode'          => '10020',
    'phone'             => '+1 212-554-1515',
    'website'           => 'le-bernardin.com',
    'business-type'     => 'Restaurant',
    'state-code'        => 'NY',
    'primary-location'  => '10020'
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'location-id=1' \
 -d 'report-name=Le Bernardin' \
 -d 'business-name=Le Bernardin' \
 -d 'address-1=155 West 51st Street' \
 -d 'address-2=The Equitable Bldg' \
 -d 'business-location=New York, NY' \ 
 -d 'phone=+1 212-554-1515' \
 -d 'postcode=10020' \
 -d 'website=le-bernardin.com' \ 
 -d 'business-type=Restaurant' \
 -d 'state-code=NY' \
 -d 'primary-location=10020' \
 https://tools.brightlocal.com/seo-tools/api/v2/ct/add
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "location-id", 1 },
    { "report-name", "Le Bernardin" },
    { "business-name", "Le Bernardin" },
    { "phone", "+1 212-554-1515" },
    { "address-1", "155 West 51st Street" },
    { "business-location", "New York, NY" },
    { "postcode", "10019" },
    { "website", "le-bernardin.com" },
    { "business-type", "Restaurant" },
    { "state-code", "NY" },
    { "primary-location", "10019" },
};

dynamic response = api.Post("v2/ct/add", parameters).GetContent();
Console.WriteLine(response);
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "added",
        "report-id": 682
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | <span class="label label-required">Required</span> You can specify location ID or unique reference to create report for a location
report-name | <span class="label label-required">Required</span>	
business-name | <span class="label label-required">Required</span>	
address-1 | <span class="label label-required">Required</span> Street address of where the business is located. 80 characters max.
address-2 | 80 characters max.
business-location | <span class="label label-required">Required</span> Town or city name in which business is located.
old-business-name-1	|
old-business-name-2	|
postcode |	<span class="label label-required">Required</span> 80 characters max. 
old-postcode-1 |	
old-postcode-2 |	
country | One of USA, GBR, CAN, AUS. Defaults to USA.
phone | <span class="label label-required">Required</span>	
website | <span class="label label-required">Required</span> Link to the website of your business. 256 characters max. 
business-type | <span class="label label-required">Required</span> Business type (e.g. Hotel) NOT a business category (e.g. Hotels & Guest houses).
state-code | <span class="label label-required">Required</span> (USA only). 2-letter state code (USA only).
monthly-run | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31. Defaults to 0 (none).
weekly-run | One of 1, 2, 3, 4, 5, 6, 7. Defaults to 0 (none).
white-label-profile-id |	
active-only | Flag to fetch only active citations. One of Yes, No. Defaults to No. This cannot be changed once the report has been added.
notify | One of yes or no. If set to yes we will send report alerts to all email addresses specified (see field below). If you include customer email addresses when setting up your report we'll also email them the alerts so please be sure this is what you want before adding their addresses. Default is no.
email-addresses | Supply one or more (max 5) email addresses for us to send report alerts to. Emails should be passed as a JSON encoded array. This only takes effect if notify is set to yes.
is-public | Publish reports on a white label URL. Yes or No.
primary-location | <span class="label label-required">Required</span> We use ‘Location’ to identify your top 10 ‘Google+ Local’ competitors. Please enter your city/town name or zip/postcode. Note: for US businesses we strongly recommend that you use only 5 digit zips (99750, NOT 99750-0077) as using the longer format can make it harder for us to find competitors.

## Update Report

<span class="label label-info">Account Method</span>

> Update Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/ct/update', [
    'location-id'       => 1,
    'report-id'         => 682,
    'report-name'       => 'Le Bernardin',
    'business-name'     => 'Le Bernardin',
    'address1'          => '155 West 51st Street',
    'address2'          => 'The Equitable Bldg',
    'business-location' => 'New York, NY',
    'phone'             => '+1 212-554-1515',
    'website'           => 'le-bernardin.com',
    'business-type'     => 'Restaurant',
    'state-code'        => 'NY'
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'location-id'=1,
 -d 'report-id'=682,
 -d 'report-name=Le Bernardin' \
 -d 'business-name=Le Bernardin' \
 -d 'address-1=155 West 51st Street' \
 -d 'address-2=The Equitable Bldg' \
 -d 'business-location=New York, NY' \ 
 -d 'phone=+1 212-554-1515' \
 -d 'website=le-bernardin.com' \ 
 -d 'business-type=Restaurant' \
 -d 'state-code=NY' \
 https://tools.brightlocal.com/seo-tools/api/v2/ct/update
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "location-id", 1 },
    { "report-id", 682 },
    { "report-name", "Le Bernardin updated" },
    { "business-name", "Le Bernardin" },
    { "phone", "+1 212-554-1515" },
    { "address-1", "155 West 51st Street" },
    { "business-location", "New York, NY" },
    { "postcode", "10019" },
    { "website", "le-bernardin.com" },
    { "business-type", "Restaurant" },
    { "state-code", "NY" },
    { "primary-location", "10019" },
};

dynamic response = api.Post("v2/ct/update", parameters).GetContent();
Console.WriteLine(response);
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "edited"
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/update`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | <span class="label label-required">Required</span> You can specify location ID or unique reference to create report for a location.
report-id | <span class="label label-required">Required</span>	
report-name |	
business-name |	
address-1 | <span class="label label-required">Required</span> Street address of where the business is located. 80 characters max.
address-2 | 80 characters max.
business-location | Town or city name in which business is located.
old-business-name-1	|
old-business-name-2	|
postcode |	80 characters max. 
old-postcode-1 |	
old-postcode-2 |	
country	| One of USA, GBR, CAN, AUS. Defaults to USA.
phone |	
website	| Link to the website of your business. 256 characters max. 
business-type |	Business type (e.g. Hotel) NOT a business category (e.g. Hotels & Guest houses).
location |	
state-code | 2-letter state code (USA only).
monthly-run | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31. Defaults to 0 (none).
weekly-run | One of 1, 2, 3, 4, 5, 6, 7. Defaults to 0 (none).
white-label-profile-id |	
active-only | Flag to fetch only active citations. One of Yes, No. Defaults to No.
notify | One of yes or no. If set to yes we will send report alerts to all email addresses specified (see field below). If you include customer email addresses when setting up your report we'll also email them the alerts so please be sure this is what you want before adding their addresses. Default is no.
email-addresses | Supply one or more (max 5) email addresses for us to send report alerts to. Emails should be passed as a JSON encoded array. This only takes effect if notify is set to yes.
is-public | Publish reports on a white label URL. Yes or No.

## Get Report

<span class="label label-info">Account Method</span>

> Get Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v2/ct/get', [
    'report-id' => 682
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/ct/get?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&report-id=682'
```

```csharp
int reportId = 682;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Response report = api.Get("v2/ct/get", new Parameters { { "report-id", reportId } });
Console.WriteLine(report.GetContent());
```

> Success (200 OK)

```json
{
    "success": true,
    "report": {
        "report_id": "255565",
        "customer_id": "88",
        "location_id": "1",
        "weekly_run": "3",
        "monthly_run": "0",
        "report_name": "The View",
        "website_address": "www.ullubatanc.com",
        "business_name": "Ullu Bata Inc.",
        "business_location": "London",
        "postcode": "ABCD1234",
        "country": "GBR",
        "state_code": null,
        "address1": "",
        "address2": "",
        "telephone": "01273 207 100",
        "business_type": "Restaurant",
        "primary_location": "Brighton",
        "last_run_id": "1185703",
        "old_business_name_1": "View Hove",
        "old_postcode_1": "01273 207 037",
        "old_business_name_2": "Babylon Lounge",
        "old_postcode_2": "BN3 4FA",
        "last_run": "2015-10-28 05:31:59",
        "company_name": "Ullu Bata Inc.",
        "white_label_profile_id": "7819",
        "notify": "0",
        "email_addresses": "[\"example@brightlocal.com\"]",
        "active_only": "",
        "is_public": "Yes",
        "public_key": "<REPLACED>",
        "created": "2015-10-28 05:00:34",
        "status": "complete",
        "urls": {
            "interactive_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/ct\/reports\/view\/255565",
            "pdf_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/ct\/reports\/pdf\/255565",
            "csv_url": "https:\/\/tools.brightlocal.com\/seo-tools\/admin\/ct\/reports\/csv\/255565",
            "public_interactive_url": "<REPLACED>",
            "public_pdf_url": "<REPLACED>",
            "public_csv_url": "<REPLACED>"
            }
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/ct/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>

## Run Report

<span class="label label-info">Account Method</span>

> Run Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/ct/run', [
    'report-id' => 682
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'report-id=682' \ 
 https://tools.brightlocal.com/seo-tools/api/v2/ct/run
```

```csharp
int reportId = 682;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "report-id", reportId }
};
Response response = api.Post("v2/ct/run", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "running"
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/run`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>

## Delete Report

<span class="label label-info">Account Method</span>

> Delete Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/ct/delete', [
    'report-id' => 682
]);
var_dump($response->getResult());
if ($response->isSuccess()) {
    echo 'Successfully deleted report.' . PHP_EOL;
}
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'report-id=682' \ 
 https://tools.brightlocal.com/seo-tools/api/v2/ct/delete
```

```csharp
int reportId = 682;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Response status = api.Post(
    "v2/ct/delete",
    new Parameters { { "report-id", reportId } });
Console.WriteLine(status.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "deleted"
    }
}
```

Warning: This action cannot be undone.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/ct/delete`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>

## Get All Reports

<span class="label label-info">Account Method</span>

> Get All Reports

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v2/ct/get-all');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/ct/get-all?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int locationId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Response reports = api.Get("v2/ct/get-all");
Console.WriteLine(reports.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "report_id": "278",
                "customer_id": "35",
                "location_id": "5",
                "report_run_id": "2457",
                "report_name": "Test 1",
                "website_address": "http://www.test1.com",
                "business_name": "Test 1",
                "business_location": "Test location",
                "postcode": "TEST TEST",
                "country": "GBR",
                "state_code": null,
                "cancel_run": "0",
                "address1": "",
                "address2": "",
                "telephone": "0123456789",
                "business_type": "Pub",
                "primary_location": "Fulham",
                "old_business_name_1": "",
                "old_postcode_1": "",
                "old_business_name_2": "",
                "old_postcode_2": "",
                "currently_running": "No",
                "generation_error": "No",
                "terminal_fail": "No",
                "last_run": "2012-09-07 11:45:56",
                "report_status": null,
                "your_ct_count": "197",
                "your_ct_count_up": "0",
                "your_ct_count_down": "0",
                "total_ct_sources": "230",
                "total_ct_sources_up": "0",
                "competitor_ct_count": "76",
                "competitor_ct_count_diff": null,
                "old_ct_count": "0",
                "company_name": null,
                "branding_profile_id": null,
                "notify": "0",
                "email_addresses": "['test@test1.com']",
                "your_ct_count_diff": 0,
                "competitor_ct_count_up": 0,
                "competitor_ct_count_down": 0,
                "total_ct_sources_diff": 0,
                "successful_runs": "1"
            },
            {
                "report_id": "660",
                "customer_id": "35",
                "location_id": "0",
                "report_run_id": "2756",
                "report_name": "Test 2",
                "website_address": "",
                "business_name": "Test 2",
                "postcode": "chicago",
                "country": "USA",
                "state_code": "IL",
                "cancel_run": "0",
                "address1": "",
                "address2": "",
                "telephone": "0123456789",
                "business_type": "car hire",
                "primary_location": "chicago",
                "old_business_name_1": "",
                "old_postcode_1": "",
                "old_business_name_2": "",
                "old_postcode_2": "",
                "currently_running": "No",
                "generation_error": "No",
                "terminal_fail": "No",
                "last_run": "2013-05-21 11:18:31",
                "report_status": null,
                "your_ct_count": "633",
                "your_ct_count_up": "129",
                "your_ct_count_down": "0",
                "total_ct_sources": "356",
                "total_ct_sources_up": "100",
                "competitor_ct_count": "90",
                "competitor_ct_count_diff": "10",
                "old_ct_count": "0",
                "company_name": null,
                "branding_profile_id": null,
                "notify": "0",
                "email_addresses": "['test@test2.com']",
                "your_ct_count_diff": 0,
                "competitor_ct_count_up": 0,
                "competitor_ct_count_down": 0,
                "total_ct_sources_diff": 0,
                "successful_runs": "2"
            }
        ]
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/ct/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id |

## Get Report Results

<span class="label label-info">Account Method</span>

> Get Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v2/ct/get-results', [
    'report-id' => 2457
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/ct/get-results?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&report-id=2457'
```

```csharp
int reportId = 2457;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Response response = api.Get("v2/ct/get-results", new Parameters
{
    { "report-id", reportId }
});
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  {
            "active":  [
                {
                    "id": "",
                    "citation_id": 182555,
                    "customer_id": "35",
                    "report_id": "2457",
                    "citation-status": "active",
                    "source": "carricktoday.co.uk",
                    "url": "http://www.carricktoday.co.uk/findit?action=showMap&placeid=68739",
                    "citation-notes": null,
                    "status": "Got it",
                    "date-identified-sorting": "2012-09-07T00:00:00+00:00",
                    "date-identified": "07 Sep 12",
                    "domain-authority": "38.75",
                    "citation-value": "Unknown",
                    "moz-rank": "Unknown",
                    "site-type": "Local Directory",
                    "listing-type": "Free Listing",
                    "seomoz-lookup-complete": "Yes",
                    "business-name": null,
                    "postcode": null
                }
            ],
            "pending":  [

            ],
            "possible": [

            ],
            "activeDomains":  {
                "facebook.com": true,
                "twitter.com": true,
                "yelp.com": true,
                "yell.com": true,
                "thomsonlocal.com": true,
                "beerintheevening.com": true,
                "hotfrog.co.uk": true,
                "cylex-uk.co.uk": true
            },
            "pendingDomains": {

            },
            "possibleDomains": {

            },
            "topDirectories":  [
                {
                    "citation_id": 182555,
                    "customer_id": "35",
                    "report_id": "2457",
                    "citation-status": "active",
                    "source": "carricktoday.co.uk",
                    "url": "http://www.carricktoday.co.uk/findit?action=showMap&placeid=68739",
                    "citation-notes": null,
                    "status": "Got it",
                    "date-identified-sorting": "2012-09-07T00:00:00+00:00",
                    "date-identified": "07 Sep 12",
                    "domain-authority": "38.75",
                    "citation-value": "Unknown",
                    "moz-rank": "Unknown",
                    "site-type": "Local Directory",
                    "listing-type": "Free Listing",
                    "seomoz-lookup-complete": "Yes",
                    "business-name": "John's business",
                    "address": "Lungomare Zara, 1234 Giulianova",
                    "postcode": "1234",
                    "website-url": "http://www.johns-s-business.co.uk/",
                    "telephone": "03 12345678"
                }
            ],
            "flags": {
                "customer":  {
                    "new":  [],
                    "disappeared":  []
                },
                "competitor":  {
                    "new":  [],
                    "disappeared":  []
                }
            },
            "competitors": {

            }
        }
    }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/ct/get-results`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span>
