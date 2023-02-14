# Rank Checker

## Add Report

<span class="label label-info">Account Method</span>

> Add Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/lsrc/add', [
    'location-id'       => 1,
    'name'              => 'Le Bernardin',
    'schedule'          => 'Adhoc',
    'search-terms'      => 'Restaurant\nfood+nyc\ndelivery+midtown+manhattan',
    'website-addresses' => '["le-bernardin.com", "le-bernardin2.com"]',
    'search-engines'    => 'google,google-mobile,google-local,bing,bing-local'
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'location-id=1' \
 -d 'name=Le Bernardin' \
 -d 'schedule=Adhoc' \
 -d $'search-terms=Restaurant\nfood+nyc\ndelivery+midtown+manhattan' \ 
 -d 'website-addresses=["le-bernardin.com","le-bernardin2.com"]' \
 -d 'search-engines=google,google-mobile,google-local,bing,bing-local' \ 
 https://tools.brightlocal.com/seo-tools/api/v2/lsrc/add
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
    {
        { "location-id", 1},
        { "name", "Le Bernardin" },
        { "schedule", "Adhoc" },
        { "search-terms", "Restaurant\nfood+nyc\ndelivery+midtown+manhattan" },
        { "website-addresses", new List<string> { "le-bernardin.com", "le-bernardin.ca" } },
        { "search-engines", "google,google-mobile,google-local,bing,bing-local" }

};
Response response = api.Post("/v2/lsrc/add", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Added",
        "campaign-id": "9907",
        "credits": 298
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span>	
schedule | Adhoc, Weekly or Monthly - defaults to Adhoc
day-of-week | Relevant to Weekly schedule only. Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday. Defaults to Tuesday.
day-of-month | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month). Defaults to 1
location-id |	<span class="label label-required">Required</span>	
white-label-profile-id | (branding-profile-id is also supported but deprecated)
tags | Comma separated list of tags
search-terms | <span class="label label-required">Required</span> Newline (\n) separated list of search terms.
website-addresses	| Supply one or more website addresses (max 10) as a JSON string. For example, [“test.com”,“test2.com”].
website-address	| (supported but deprecated)
website-address-2 | (supported but deprecated)
website-address-3 | (supported but deprecated)
country	| One of USA, GBR, AUS, CAN:EN, CAN:FR. Defaults to USA.
google-location	| Specify a location to perform search from. When set search keywords do not need to include a location.
bing-location | Specify a location to perform search from. When set search keywords do not need to include a location.
business-names | Newline (\n) separated list of business names
postcode |	80 characters max. 
telephone |	
search-engines | Comma separated list of search engines. Options are google, google-mobile, google-local, bing, bing-local. Defaults to all search engines.
include-local-directory-results	| Yes or No. Defaults to Yes.
notify | Yes or No. Defaults to No.
email-addresses	| Newline (\n) separated list of email addresses
is-public | Publish reports on a white label URL. Yes or No. Defaults to No.

## Update Report

<span class="label label-info">Account Method</span>

> Update Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/lsrc/update', [
    'location-id'       => 1,
    'campaign-id'       => 9907,
    'name'              => 'Le Bernardin',
    'schedule'          => 'Adhoc',
    'search-terms'      => 'Restaurant\nfood+nyc\ndelivery+midtown+manhattan',
    'website-addresses' => '["le-bernardin.com", "le-bernardin2.com"]',
    'search-engines'    => 'google,google-mobile,google-local,bing,bing-local'
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'location-id=1' \
 -d 'campaign-id=9907' \
 -d 'name=Le Bernardin' \
 -d 'schedule=Adhoc' \
 -d $'search-terms=Restaurant\nfood+nyc\ndelivery+midtown+manhattan' \ 
 -d 'website-addresses=["le-bernardin.com","le-bernardin2.com"]' \
 -d 'search-engines=google,google-mobile,google-local,bing,bing-local' \ 
 https://tools.brightlocal.com/seo-tools/api/v2/lsrc/update
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "location-id", 1 },
    { "campaign-id", 9907 },
    { "name", "Le Bernardin" },
    { "schedule", "Adhoc" },
    { "search-terms", "Restaurant\nfood+nyc\ndelivery+midtown+manhattan" },
    { "website-addresses", new List<string> { "le-bernardin.com", "le-bernardin.ca" } },
    { "search-engines", "google,google-mobile,google-local,bing,bing-local" }

};
Response response = api.Post("/v2/lsrc/update", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Updated",
        "campaign-id": 9907
    }
}
```

Change report settings such as name, search terms, country, website URL, schedule etc. Only specify the fields you want to change.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/update`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>	
name |	
schedule | Adhoc, Weekly or Monthly
day-of-week | Relevant to Weekly schedule only. Monday, Tuesday, Wednesday, Thursday, Friday, Saturday or Sunday.
day-of-month | One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month).
location-id |	<span class="label label-required">Required</span>	
white-label-profile-id | (branding-profile-id is also supported but deprecated)
tags | Comma separated list of tags
search-terms | Newline (\n) separated list of search terms
website-addresses	| Supply one or more website addresses (max 10) as a JSON string. For example, [“test.com”,“test2.com”].
website-address	| (supported but deprecated)
website-address-2 | (supported but deprecated)
website-address-3 | (supported but deprecated)
country	| One of USA, GBR, AUS, CAN:EN, CAN:FR.
google-location	| Specify a location to perform search from. When set search keywords do not need to include a location.
bing-location | Specify a location to perform search from. When set search keywords do not need to include a location.
business-names | Newline (\n) separated list of business names
postcode |	80 characters max. 
telephone |	
search-engines | Comma separated list of search engines. Options are google, google-mobile, google-local, bing, bing-local.
include-local-directory-results	| Yes or No
notify | Yes or No
email-addresses | Newline (\n) separated list of email addresses
is-public | Publish reports on a white label URL. Yes or No.

## Delete Report

<span class="label label-info">Account Method</span>

> Delete Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/lsrc/delete', [
    'campaign-id' => 9907
]);
var_dump($response->getResult());
if ($response->isSuccess()) {
    echo 'Successfully deleted report.' . PHP_EOL;
}
```

```csharp
int campaignId = 9907;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters {
   { "campaign-id", campaignId }
};
Response response = api.Post("/v2/lsrc/delete", parameters);
if (response.IsSuccess())
{
    Console.WriteLine("Successfully deleted report");
}
else
{
    Console.WriteLine(response.GetContent());
}
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Deleted"
    }
}
```

Deletes a report and all history and ranking data associated with that report. Warning: This action cannot be undone.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/delete`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>

## Get All Reports

<span class="label label-info">Account Method</span>

> Get All Reports

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('v2/lsrc/get-all');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/lsrc/get-all?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters { };
Response response = api.Get("v2/lsrc/get-all", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "campaign_id": "49",
                "name": "Test 1",
                "schedule": "Weekly",
                "day_of_week": "Thursday",
                "day_of_month": "0",
                "location_id": "0"
            },
            {
                "campaign_id": "50",
                "name": "Test 2",
                "schedule": "Weekly",
                "day_of_week": "Wednesday",
                "day_of_month": null,
                "location_id": "0"
            },
            {
                "campaign_id": "52",
                "name": "Test 3",
                "schedule": "Weekly",
                "day_of_week": "Wednesday",
                "day_of_month": null,
                "location_id": "0"
            }
        ]
    }
}
```

Returns basic details about all reports associated with your account.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/get-all`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id |

## Get Report

<span class="label label-info">Account Method</span>

> Get Single Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v2/lsrc/get', [
    'campaign-id' => 50
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/lsrc/get?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&campaign-id=50'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters {
   { "campaign-id", 50 }
};
Response response = api.Get("/v2/lsrc/get", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "result":  {
            "campaign_id": "50",
            "customer_id": "35",
            "white_label_profile_id": "19",
            "location_id": "19",
            "name": "Test Pub",
            "schedule": "Weekly",
            "day_of_week": "Wednesday",
            "day_of_month": null,
            "search_terms":  [
                "pub fulham",
                "pub in fulham",
                "london pub",
                "pub putney",
                "beer garden in fulham",
                "gastro pub fulham",
                "pubs in fulham",
                "fulham pubs",
                "nice pub fulham",
                "good pub fulham",
                "nice pubs fulham",
                "good pubs fulham",
                "best pubs fulham",
                "excellent pubs fulham",
                "lovely fulham pub",
                "lovely fulham pubs",
                "fulham lovely pubs",
                "close pub fulham",
                "fulham with pubs",
                "pubs around fulham",
                "pubs fulham broadway",
                "pub fulham broadway"
            ],
            "ppc_search_terms": null,
            "lookup_ppc": "No",
            "website-addresses": [
                "http://www.testpub.com/"
            ],
            "website_address": "http://www.testpub.com/",
            "website_address_2": null,
            "website_address_3": null,
            "country": "GBR",
            "google_location": "",
            "bing_location": null,
            "business_names":  [
                "Test Pub"
            ],
            "postcode": "TEST TEST",
            "telephone": "0123456789",
            "search_engines":  [
                "google",
                "google-local",
                "bing",
                "bing-local"
            ],
            "include_local_directory_results": "Yes",
            "notify": "Yes",
            "email_addresses": "test@testpub.com",
            "created": "2011-04-15",
            "last_processed": "2013-07-18",
            "last_message": "",
            "currently_running": "No",
            "status": "Enabled",
            "red_flag": "No",
            "is_public": "No",
            "public_key": null,
            "tags":  [
                "fulham",
                "london",
                "pub"
            ]
        }
    }
}
```

Returns information about the specified report such as its name, search terms, country, website URL, schedule etc. You can also use this method to find out if a report is currently running (currently_running = Yes) or if the latest run failed (red_flag = Yes).

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>	

## Run Report

<span class="label label-info">Account Method</span>

> Run Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v2/lsrc/run', [
    'campaign-id' => 50
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'campaign-id=50' \
  https://tools.brightlocal.com/seo-tools/api/v2/lsrc/run
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters {
   { "campaign-id", 50 }
};
Response response = api.Post("/v2/lsrc/run", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "status": "Report Run",
        "campaign-id": 50,
        "credits": 298
    }
}
```

Runs the specified report if your account has sufficient monthly adhoc run credits.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v2/lsrc/run`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>

## Get Report History

<span class="label label-info">Account Method</span>

> Get Report History

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v2/lsrc/history/get', [
    'campaign-id' => 50
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/lsrc/history/get?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&campaign-id=50'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters {
   { "campaign-id", 50 }
};
Response response = api.Get("/v2/lsrc/history/get", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "campaign_history_id": "25554",
                "campaign_id": "50",
                "location_id": "5",
                "history_type": "Scheduled",
                "generation_date": "2013-07-18 13:42:32"
            },
            {
                "campaign_history_id": "25499",
                "campaign_id": "50",
                "location_id": "5",
                "history_type": "Scheduled",
                "generation_date": "2013-07-18 11:29:50"
            },
            {
                "campaign_history_id": "25439",
                "campaign_id": "50",
                "location_id": "5",
                "history_type": "Scheduled",
                "generation_date": "2013-07-18 11:17:48"
            }
        ]
    }
}
```

Returns the campaign history IDs associated with all report runs for the specified report (adhoc or scheduled).

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/history/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>

## Get Report Results

<span class="label label-info">Account Method</span>

> Get Report Results

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v2/lsrc/results/get', [
    'campaign-id' => 9636
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v2/lsrc/results/get?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&campaign-id=9636'
```

### Get Report Results

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters {
   { "campaign-id", 9636 }
};
Response response = api.Get("/v2/lsrc/results/get", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
  "response": {
    "result": {
      "campaign_details": {
        "campaign_id": "9636",
        "customer_id": "1",
        "white_label_profile_id": "24",
        "location_id": "0",
        "name": "Alaska Bar Association",
        "schedule": "Adhoc",
        "day_of_week": "Monday",
        "day_of_month": "18",
        "search_terms": [
          "Alaska Bar Association"
        ],
        "ppc_search_terms": "",
        "lookup_ppc": "No",
        "website_addresses": [
          "https://www.alaskabar.org/"
        ],
        "country": "USA",
        "google_location": "Alaska",
        "bing_location": "",
        "previous_bing_location": null,
        "business_names": [
          ""
        ],
        "postcode": "",
        "telephone": "",
        "search_engines": [
          "google",
          "google-local",
          "bing",
          "bing-local"
        ],
        "include_local_directory_results": "No",
        "notify": "No",
        "email_addresses": "test@testpub.com",
        "created": "2016-01-18",
        "last_processed": "2016-02-01",
        "last_message": "",
        "currently_running": "No",
        "status": "Enabled",
        "red_flag": "No",
        "is_public": "Yes",
        "public_key": "<hidden>",
        "show_advanced_settings": "No",
        "last_batch_id": "2444",
        "tags": []
      },
      "urls": {
        "interactive_url": "https://tools.brightlocal.com/seo-tools/admin/lsrc/reports/interactive/9636",
        "pdf_url": "https://tools.brightlocal.com/seo-tools/admin/lsrc/reports/pdf/9636.pdf",
        "csv_url": "https://tools.brightlocal.com/seo-tools/admin/lsrc/reports/csv/9636.csv",
        "public_interactive_url": "http://www.local-marketing-reports.com/ranking-reports/<hidden>/9636",
        "public_pdf_url": "http://www.local-marketing-reports.com/ranking-reports/<hidden>/9636.pdf",
        "public_csv_url": "http://www.local-marketing-reports.com/ranking-reports/<hidden>/9636.csv"
      },
      "rankings": {
        "keywords": [
          "Alaska Bar Association"
        ],
        "keywords_num_rankings": {
          "Alaska Bar Association": "2"
        },
        "starred_keywords": {
          "Alaska Bar Association": true
        },  
        "extra_results": {
          "Alaska Bar Association": ["local", "video"]
        },
        "search_engines": [
          "google",
          "google-places",
          "bing",
          "bing-local"
        ],
        "rankings": {
          "Alaska Bar Association": {
            "google": [
              {
                "id": "11764",
                "url": "https://alaskabar.org/",
                "orig_url": "https://www.alaskabar.org/",
                "title": "Alaska Bar Association",
                "ludocid": "",
                "rank": "1",
                "unblended_rank": "1",
                "page": "1",
                "type": "Organic",
                "match": "website address",
                "directory": null,
                "date": "2016-02-01 19:00:24",
                "hash": "32d3f35ad7633a34b2cf93dec7dfdd2455d25f84",
                "search_url": "https://www.google.com/search?q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th&pws=0",
                "search_engine": "google",
                "sub_type": null,
                "sub_rank": "1",
                "last": "1"
              }
            ],
            "google-places": [
              {
                "id": "11766",
                "url": "http://alaskabar.org/",
                "orig_url": "http://www.alaskabar.org/",
                "title": "Alaska Bar Association",
                "ludocid": "331232242342",
                "rank": "1",
                "unblended_rank": "1",
                "page": "1",
                "type": "Places",
                "match": "website address",
                "directory": null,
                "date": "2016-02-01 19:00:24",
                "hash": "e008f8d346b2b8f124702d64be0ec1131adba959",
                "search_url": "https://www.google.com/search?tbm=lcl&q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th",
                "search_engine": "google-places",
                "sub_type": null,
                "sub_rank": "1",
                "last": "1"
              }
            ],
            "bing": [
              {
                "id": "11770",
                "url": "http://alaskabar.org/",
                "orig_url": "http://www.alaskabar.org/",
                "title": "Alaska Bar Association",
                "ludocid": "",
                "rank": "1",
                "unblended_rank": "1",
                "page": "0",
                "type": "Organic",
                "match": "website address",
                "directory": null,
                "date": "2016-02-01 19:00:24",
                "hash": "bbd31c444764b5dd44685b5eae35578bbef68166",
                "search_url": "http://www.bing.com/search?q=Alaska+Bar+Association&mkt=en-us&count=50",
                "search_engine": "bing",
                "sub_type": null,
                "sub_rank": "0",
                "last": "1"
              }
            ],
            "bing-local": [
              {
                "id": "11771",
                "url": "",
                "orig_url": "",
                "rank": "0",
                "unblended_rank": "0",
                "page": "0",
                "type": "",
                "match": "",
                "directory": null,
                "date": "2016-02-01 19:00:24",
                "hash": null,
                "search_url": "http://www.bing.com/local/default.aspx?q=Alaska+Bar+Association&mkt=en-us&FORM=LLSV",
                "search_engine": "bing-local",
                "sub_type": null,
                "sub_rank": "0"
              }
            ]
          }
        },
        "hashes": {
          "google": {
            "Alaska Bar Association": [
              "32d3f35ad7633a34b2cf93dec7dfdd2455d25f84"
            ]
          },
          "google-places": {
            "Alaska Bar Association": [
              "e008f8d346b2b8f124702d64be0ec1131adba959"
            ]
          },
          "bing": {
            "Alaska Bar Association": [
              "bbd31c444764b5dd44685b5eae35578bbef68166"
            ]
          },
          "bing-local": {
            "Alaska Bar Association": []
          }
        },
        "byPosition": {
          "Position 1": {
            "Alaska Bar Association||google||Organic": {
              "id": "11764",
              "url": "https://alaskabar.org/",
              "orig_url": "https://www.alaskabar.org/",
              "rank": "1",
              "page": "1",
              "type": "Organic",
              "match": "website address",
              "directory": null,
              "date": "2016-02-01 19:00:24",
              "hash": "32d3f35ad7633a34b2cf93dec7dfdd2455d25f84",
              "search_url": "https://www.google.com/search?q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th&pws=0",
              "search_engine": "google"
            },
            "Alaska Bar Association||google-places||Places": {
              "id": "11766",
              "url": "http://alaskabar.org/",
              "orig_url": "http://www.alaskabar.org/",
              "rank": "1",
              "page": "1",
              "type": "Places",
              "match": "website address",
              "directory": null,
              "date": "2016-02-01 19:00:24",
              "hash": "e008f8d346b2b8f124702d64be0ec1131adba959",
              "search_url": "https://www.google.com/search?tbm=lcl&q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th",
              "search_engine": "google-places"
            },
            "Alaska Bar Association||bing||Organic": {
              "id": "11770",
              "url": "http://alaskabar.org/",
              "orig_url": "http://www.alaskabar.org/",
              "rank": "1",
              "page": "0",
              "type": "Organic",
              "match": "website address",
              "directory": null,
              "date": "2016-02-01 19:00:24",
              "hash": "bbd31c444764b5dd44685b5eae35578bbef68166",
              "search_url": "http://www.bing.com/search?q=Alaska+Bar+Association&mkt=en-us&count=50",
              "search_engine": "bing"
            }
          },
          "Positions 2-5": [],
          "Positions 6-10": [],
          "Positions 11-20": [],
          "Positions 21-50": [],
          "Positions 51+": {
            "Alaska Bar Association||bing-local||": {
              "id": "11771",
              "url": "",
              "orig_url": "",
              "rank": "0",
              "page": "0",
              "type": "",
              "match": "",
              "directory": null,
              "date": "2016-02-01 19:00:24",
              "hash": null,
              "search_url": "http://www.bing.com/local/default.aspx?q=Alaska+Bar+Association&mkt=en-us&FORM=LLSV",
              "search_engine": "bing-local"
            }
          }
        },
        "summary": {
          "all_search_engines": {
            "up": 0,
            "down": 0,
            "no_change": 6,
            "gained_hashes": [],
            "lost_hashes": []
          },
          "google": {
            "up": 0,
            "down": 0,
            "no_change": 1,
            "gained_hashes": [],
            "lost_hashes": []
          },
          "google-places": {
            "up": 0,
            "down": 0,
            "no_change": 1,
            "gained_hashes": [],
            "lost_hashes": []
          },
          "bing": {
            "up": 0,
            "down": 0,
            "no_change": 1,
            "gained_hashes": [],
            "lost_hashes": []
          },
          "bing-local": {
            "up": 0,
            "down": 0,
            "no_change": 0,
            "gained_hashes": [],
            "lost_hashes": []
          }
        }
      },
      "serp-screenshots": {
        "google": {
          "Alaska Bar Association": {
            "1": {
              "url": "https://brightlocal-serp-pages.s3.amazonaws.com/2016/02/01/18/a7cf190f51b2572fa166803bec9bb07920d3c678.png",
              "expiry_date": "2016-03-17 19:00:24"
            },
            "2": {
              "url": "https://brightlocal-serp-pages.s3.amazonaws.com/2016/02/01/18/e7cd9afb659ecd572c59f4556ae6f1bcf2cac665.png",
              "expiry_date": "2016-03-17 19:00:24"
            },
            "3": {
              "url": "https://brightlocal-serp-pages.s3.amazonaws.com/2016/02/01/18/593e4e97b9780de2e71e3581f1a47d784deb1c4c.png",
              "expiry_date": "2016-03-17 19:00:24"
            },
            "4": {
              "url": "https://brightlocal-serp-pages.s3.amazonaws.com/2016/02/01/18/6ddb19e8c10b899aeee8e4b11d5a8a6fa1129ebd.png",
              "expiry_date": "2016-03-17 19:00:24"
            },
            "5": {
              "url": "https://brightlocal-serp-pages.s3.amazonaws.com/2016/02/01/18/a404cc8a6c30f81a0744d6661f2004b7bcfa2a34.png",
              "expiry_date": "2016-03-17 19:00:24"
            }
          }
        }
      },
      "competitors": [
        {
          "id": 1,
          "name": "Test Competitor",
          "url": "https://test-competitor.com/",
          "rankings": {
            "bear bar": {
              "google": [
                {
                  "id": 11764,
                  "url": "https://alaskabar.org/",
                  "orig_url": "https://www.alaskabar.org/",
                  "title": "Test Competitor",
                  "ludocid": "",
                  "rank": 1,
                  "page": 1,
                  "type": "Organic",
                  "match": "website address",
                  "directory": null,
                  "hash": "32d3f35ad7633a34b2cf93dec7dfdd2455d25f84",
                  "search_url": "https://www.google.com/search?q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th&pws=0",
                  "last": 1
                },
                {
                  "id": "11764",
                  "url": "https://alaskabar.org/",
                  "orig_url": "https://www.alaskabar.org/",
                  "title": "Test Competitor Bar Association",
                  "ludocid": "",
                  "rank": 8,
                  "page": 1,
                  "type": "Organic",
                  "match": "website address",
                  "directory": null,
                  "hash": "32d3f35ad7633a34b2cf93dec7dfdd2455d25f84",
                  "search_url": "https://www.google.com/search?q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th&pws=0",
                  "last": 1
                }                
              ],
              "google-places": [
                {
                  "id": "11764",
                  "url": "https://alaskabar.org/",
                  "orig_url": "https://www.alaskabar.org/",
                  "title": "Alaska Bar Association",
                  "ludocid": "546467123423233",
                  "rank": 1,
                  "page": 1,
                  "type": "Organic",
                  "match": "website address",
                  "directory": null,
                  "hash": "32d3f35ad7633a34b2cf93dec7dfdd2455d25f84",
                  "search_url": "https://www.google.com/search?q=Alaska+Bar+Association&gl=us&gws_rd=cr&uule=w+CAIQICIGQWxhc2th&pws=0",
                  "last": 1
                }
              ]
            }
          }
        }
      ]        
    }
  }
}
```

If no campaign history ID or previous campaign history ID are passed then the latest results for the specified report are returned.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v2/lsrc/results/get`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
campaign-id | <span class="label label-required">Required</span>	
campaign-history-id | If both campaign-history-id and previous-campaign-history-id are not specified then the latest report is returned.
previous-campaign-history-id | If both campaign-history-id and previous-campaign-history-id are not specified then the latest report is returned.
