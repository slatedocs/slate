# Google My Business

## Add Report

<span class="label label-info">Account Method</span>

> Add Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v4/gpw/add', [
    'location_id'     => 1,
    'report_name'     => 'Le Bernardin',
    'business_names'  => 'Le Bernardin',
    'schedule'        => 'Adhoc',
    'day_of_month'    => '2',
    'report_type'     => 'with',
    'address1'        => '155 West 51st Street',
    'address2'        => '',
    'city'            => 'New York',
    'state_code'      => 'NY',
    'google_location' => 'New York, NY',
    'postcode'        => '10019',
    'phone_number'    => '+1 212-554-1515',
    'country'         => 'USA',
    'search_terms'    => '["restaurant manhattan","cafe new york"]'
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \ 
 -d 'location_id=1' \
 -d 'report_name=Le Bernardin' \
 -d 'business_names=Le Bernardin' \
 -d 'schedule=Adhoc' \
 -d 'day_of_month=2' \
 -d 'report_type=with' \ 
 -d 'address1=155 West 51st Street' \ 
 -d 'address2=' \
 -d 'city=New York' \
 -d 'state_code=NY' \
 -d 'postcode=10019' \
 -d 'phone_number=+1 212-554-151' \
 -d 'country=USA' \
 -d 'search_terms=["restaurant manhattan","cafe new york"]'
 https://tools.brightlocal.com/seo-tools/api/v4/gpw/add
```

```csharp
Api api = new Api(apiKey, apiSecret);
Parameters parameters = new Parameters
{
    { "location_id", 1 },
    { "report_name", "Le Bernardin" },
    { "business_names", "Le Bernardin" },
    { "schedule", "Adhoc" },
    { "day_of_month", "2" },
    { "report_type", "with" },
    { "address1", "155 West 51st Street" },
    { "address2", "" },
    { "city", "New York" },
    { "state_code", "NY" },
    { "google_location", "New York, NY" },
    { "postcode", "10019" },
    { "phone_number", "+1 212-554-1515" },
    { "country", "USA" },
    { "search_terms", new List<string> { "restaurant manhattan", "cafe new york" } },
};
Response response = api.Post("/v4/gpw/add", parameters);
Console.WriteLine(response.GetContent());
```


> Success (201 Created)

```json
{
    "success": true,
    "report-id": "1"
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "run": "You don\'t have any credits left",
    "business_names": "Please enter one business name",
    "report_type": "Report type is not available",
    "phone_number": "Please enter a telephone number",
    "postcode": "Please enter a postcode",
    "address1": "Please enter an address",
    "city": "Please enter a city",
    "search_terms": "Please enter at least one search term",
    "country": "Please choose country from the list",
    "report_name": "Please enter a report name",
    "google_location": "The location was not recognized. Please enter a correct location",
    "schedule": "Please select schedule",
    "white_label_profile_id": "Such White Label Profile doesn't exists"
  }
}
```

Adds a new Google My Business report to your account.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/gpw/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report_name | <span class="label label-required">Required</span>
location_id | <span class="label label-required">Required</span> Associate this report with a location in your account. This ID needs to correspond to a valid location in your account.
white_label_profile_id | Assign a white label profile to this report. The ID needs to correspond to a valid white label profile in your account.
business_names | <span class="label label-required">Required</span> Supply one business name. For example, Greens Restaurant.
schedule | <span class="label label-required">Required</span> One of Adhoc or Monthly
day_of_month | <span class="label label-required">Required</span> One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month).
report_type | <span class="label label-required">Required</span> One of with or without. 'with' - the business has a Google Local profile. 'without' - Ignore this business, just display competitor information. Defaults to with.
address1 | <span class="label label-required">Required</span> 80 characters max.  Optional for report_type=without
address2 | 80 characters max. 
city | <span class="label label-required">Required</span> Optional for report_type=without
state_code | <span class="label label-required">Required</span> (USA, CAN:EN and AUS)
google_location | <span class="label label-required">Required</span> A valid google search location. Please refer to our location check method.
is_public | Determines whether or not to make the report available on a public URL you can give to your customers. One of Yes or No. Defaults to No.
postcode | <span class="label label-required">Required</span> A valid postcode or ZIP. 80 characters max. Optional for report_type=without
phone_number | <span class="label label-required">Required</span> Optional for report_type=without
country | <span class="label label-required">Required</span> One of USA, CAN:EN, GBR or AUS.
search_terms | <span class="label label-required">Required</span> Supply one or more search terms (max 5) as a JSON string. For example, ["restaurant san francisco","cafe san francisco"].
notify | One of Yes or No. If set to yes we will send report alerts to all email addresses specified (see field below). If you include customer email addresses when setting up your report we'll also email them the alerts so please be sure this is what you want before adding their addresses. Default is No.
email_addresses | Supply one or more (max 5) email addresses for us to send report alerts to. This only takes effect if notify is set to Yes. JSON string. For example, ["email1@test.com","email2@test.com"].
run | One of Yes or No. Runs the report after adding. Defaults to Yes.

## Update Report

<span class="label label-info">Account Method</span>

> Update Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->put('/v4/gpw/' . $reportId, [
    'location-id'       => 1,
    'business-name'     => 'Le Bernardin',
    'contact-telephone' => '+1 212-554-1515'
]);
print_r($response->getResult());
```

```shell
curl -X PUT \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'location_id=1' \
 -d 'report_name=Le Bernardin' \
 -d 'business_names=Le Bernardin' \
 -d 'schedule=Adhoc' \
 -d 'day_of_month=2' \
 https://tools.brightlocal.com/seo-tools/api/v4/gpw/1
```

```csharp
int reportId = 1;
Api api = new Api(apiKey, apiSecret);
Parameters parameters = new Parameters
{

    { "location-id", 1 },
    { "business-names", "Le Bernardin" },
    { "contact-telephone", "+1 212-554-1515" },

};
Response response = api.Put("/v4/gpw/"+ reportId, parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "success": true
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID": "Report ID invalid"
  }
}
```


### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v4/gpw/<reportId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-ID | <span class="label label-required">Required</span>
report_name |
location_id | <span class="label label-required">Required</span> Associate this report with a location in your account. This ID needs to correspond to a valid location in your account.
white_label_profile_id | Assign a white label profile to this report. The ID needs to correspond to a valid white label profile in your account.
business_names |  Supply one business name. For example, Greens Restaurant.
schedule |  One of Adhoc or Monthly
day_of_month |  One of 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, -1 (last day of month).
report_type | One of with or without. 'with' - the business has a Google Local profile. 'without' - Ignore this business, just display competitor information. Defaults to with.
address1 | 80 characters max. 
address2 | 80 characters max. 
city |
state_code | (USA, CAN:EN and AUS)
postcode | A valid postcode or ZIP. 80 characters max. 
phone_number |
country | One of USA, CAN:EN, GBR or AUS.
search_terms | Supply one or more search terms (max 5) as a JSON string. For example, ["restaurant san francisco","cafe san francisco"].
notify | One of Yes or No. If set to yes we will send report alerts to all email addresses specified (see field below). If you include customer email addresses when setting up your report we'll also email them the alerts so please be sure this is what you want before adding their addresses. Default is No.
email_addresses | Supply one or more (max 5) email addresses for us to send report alerts to. This only takes effect if notify is set to Yes. JSON string. For example, ["email1@test.com","email2@test.com"].
google_location | A valid google search location. Please refer to our location check method.
is_public | Determines whether or not to make the report available on a public URL you can give to your customers. One of Yes or No. Defaults to No.
run | One of Yes or No. Runs the report after adding. Defaults to Yes.

## Get Report

<span class="label label-info">Account Method</span>

> Get Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/gpw/' . $reportId);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/gpw/1?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 1;
Api api = new Api(apiKey, apiSecret);
Response response = api.Get("v4/gpw/" + reportId);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
  "success": true,
  "report": {
  	"report_id": "1",
        "report_name": "Report name",
        "customer_id": "1",
        "location_id": "1000",
        "schedule": "Adhoc",
        "day_of_week": "0",
        "day_of_month": "0",
        "white_label_profile_id": "24",
        "report_type": "without",
        "business_names": [
            "Business name1"
        ],
        "postcode": "90210",
        "country": "USA",
        "state_code": "IL",
        "address1": "email@test.com",
        "address2": null,
        "city": "Chicago, IL",
        "phone_number": null,
        "search_terms": [
            "search_term1",
            "search_term2",
            "search_term3"
        ],
        "google_location": "Chicago, IL",
        "notify": "Yes",
        "email_addresses": [
        	"email@company.com"
        ],
        "notify_about_changes": true,
        "email_addresses_for_changes": [
        	"email@company.com"
        ],
        "is_public": "Yes",
        "public_key": "<hidden>",
        "is_running": "No"
      }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID invalid"
  }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/gpw/<reportId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Delete Report

<span class="label label-info">Account Method</span>

> Delete Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->delete('/v4/gpw/' . $reportId);
var_dump($response->getResult());
if ($response->isSuccess()) {
    echo 'Successfully deleted report.' . PHP_EOL;
}
```

```shell
curl -X DELETE \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 https://tools.brightlocal.com/seo-tools/api/v4/gpw/1
```

```csharp
int reportId = 1;
Api api = new Api(apiKey, apiSecret);
Response response = api.Delete("/v4/gpw/" + reportId);
if (response.IsSuccess())
{
    Console.WriteLine("Successfully deleted report.");
}
else
{
    Console.WriteLine(response.GetContent());
}
```


> Success (200 OK)

```json
{
    "success": true
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID": "Report ID invalid"
  }
}
```

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v4/gpw/<reportId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get All Reports

<span class="label label-info">Account Method</span>

> Get All Reports

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/gpw/');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/gpw?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
Api api = new Api(apiKey, apiSecret);
Response response = api.Get("/v4/gpw/");
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "response":  {
        "results":  [
            {
                "report_id": "49",
                "report_name": "Test 1",
                "schedule": "Weekly",
                "is_running": "Yes",
                "running_message": "Identifying your top Google Local competitors"
            },
            {
                "report_id": "50",
                "report_name": "Test 2",
                "schedule": "Monthly",
                "is_running": "No",
                "running_message": ""
            }
        ]
    }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_LOCATION_ID": "Invalid location ID supplied"
  }
}
```

Returns basic details about all reports associated with your account.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/gpw`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id |


## Run Report

<span class="label label-info">Account Method</span>

> Run Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v4/gpw/run', [
    'report-id' => 860
]);
print_r($response->getResult());
```

```shell
curl -X PUT \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'report-id=860' \
  https://tools.brightlocal.com/seo-tools/api/v4/gpw/run
```

```csharp
int reportId = 860;
Api api = new Api(apiKey, apiSecret);
Response response = api.Put("/v4/gpw/run", new Parameters { ["report-id"] = reportId });
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "success": true
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing",
    "NO_CREDITS" : "You don't have any credits left"
  }
}
```

> Failure when report already running (400 Bad Request)

```json
{
    "success": false,
    "errors":  {
      "REPORT_RUNNING": "Report is already running"
    }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/gpw/run`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-id | <span class="label label-required">Required</span> The unique ID for the report in your account.

## Get Report Results

<span class="label label-info">Account Method</span>

> Get Report Results

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/gpw/' . $reportId . '/results');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/gpw/1/results?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId =1;
Api api = new Api(apiKey, apiSecret);
Response response = api.Get("/v4/gpw/" + reportId + "/results");
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
  "success": true,
  "results": {
  	"summary": {
      "business_name": "Iron Galaxy Studios LLC",
      "address": "300 E Colorado Blvd, Pasadena, CA 91101, United States",
      "telephone": "+1 123-456-7890",
      "website_address": "http://www.example.com",
      "opening_hours": [
        "Wednesday 4PM–1AM",
        "Thursday 4PM–1AM",
        "Friday 4PM–1AM",
        "Saturday 4PM–1AM",
        "Sunday(Easter) 4PM–1AM Hours might differ",
        "Monday 4PM–1AM",
        "Tuesday 4PM–1AM"
      ],
      "profile_url": "https://www.google.co.uk/search?q=Iron+Galaxy+Studios+LLC&oq=Iron+Galaxy+Studios+LLC",
      "claimed": false,
      "citations_count": 74,
      "domain_authority": 37.65,
      "backlinks": 1395,
      "num_reviews": 6,
      "star_rating": 4,
      "review_content": "The Hotel is very conveniently located and the room nice",
      "num_photos": 0,
      "categories": [
                    "Financial Planner"
                  ]
     },          
    "keywords": {
      "iron": {
        "client_rank": 1,
        "top_10": [
          {
            "business_name": "Iron Galaxy Studios LLC",
            "rank": "A",
            "client_business": true,
            "profile_url": "https://www.google.co.uk/search?q=Iron+Galaxy+Studios+LLC&oq=Iron+Galaxy+Studios+LLC",
            "claimed": false,
            "citations_count": 74,
            "domain_authority": "37/100",
            "backlinks": 1395,
            "num_reviews": 4,
            "star_rating": "5/5",
            "num_photos": 0,
            "categories": [
              "Hotel"
            ]
          },
          {
            "business_name": "Iron Financial Management Inc",
            "rank": "B",
            "client_business": false,
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&q=Iron+Financial+Management+Inc",
            "claimed": false,
            "citations_count": 118,
            "domain_authority": "22/100",
            "backlinks": 86,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Financial Planner"
            ]
          },
          {
            "business_name": "Chicago Tube and Iron Company",
            "rank": "C",
            "client_business": false,            
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&q=Chicago+Tube+and+Iron+Company+Chicago",
            "claimed": false,
            "citations_count": 106,
            "domain_authority": "30/100",
            "backlinks": 190,
            "num_reviews": 2,
            "star_rating": "1/5",
            "num_photos": 0,
            "categories": [
              "Hotel",
              "Hotel",
              "Hotel",
              "Hotel"
            ]
          },
          {
            "business_name": "Acorn Wire &amp; Iron Works LLC",
            "rank": "D",
            "client_business": false,                   
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&gbv=2&q=Acorn+Wire+%26+Iron+Works+LLC%2C+chicago",
            "claimed": false,
            "citations_count": 56,
            "domain_authority": "29/100",
            "backlinks": 80,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 1,
            "categories": [
              "Fence Supply Store"
            ]
          },
          {
            "business_name": "Iron &amp; Wire Custom Metal Studio LLC",
            "rank": "E",
            "client_business": false,                   
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&gbv=2&q=Iron+%26+Wire+Custom+Metal+Studio+LLC%2C+chicago",
            "claimed": true,
            "citations_count": 25,
            "domain_authority": "18/100",
            "backlinks": 18,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 2,
            "categories": [
              "Metal Fabricator",
              "Interior Designer",
              "Steel Fabricator"
            ]
          },
          {
            "business_name": "Adams Street Iron Inc",
            "rank": "F",
            "client_business": false,                   
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&biw=1277&bih=573&q=Adams+Street+Iron+Inc%2C+Chicago",
            "claimed": false,
            "citations_count": 66,
            "domain_authority": "10/100",
            "backlinks": 7,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Hotel",
              "General Contractor"
            ]
          },
          {
            "business_name": "Iron Workers Union",
            "rank": "G",
            "client_business": false,                   
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&gbv=2&q=Iron+Workers+Union%2C+chicago+60130",
            "claimed": false,
            "citations_count": 39,
            "domain_authority": "48/100",
            "backlinks": 5037,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Hotel",
              "Non-Profit Organization"
            ]
          },
          {
            "business_name": "Shaw Environmental/Infrstrctr",
            "rank": "H",
            "client_business": false,                   
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&gbv=2&q=Shaw+Environmental%2FInfrstrctr%2C+chicago",
            "claimed": false,
            "citations_count": 52,
            "domain_authority": "60/100",
            "backlinks": 8884,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Hotel"
            ]
          }
        ],
        "citations_matrix": [
          {
            "domain": "facebook.com",
            "authority": "100/100",
            "count": 5,
            "businesses": [
              {
                "business_name": "Iron Galaxy Studios LLC",
                "citations_count": "74",
                "url": "https://www.facebook.com/103101903089752"
              },
              {
                "business_name": "Iron Financial Management Inc",
                "citations_count": "118",
                "url": null
              },
              {
                "business_name": "Chicago Tube and Iron Company",
                "citations_count": "106",
                "url": "https://www.facebook.com/pages/Law-Offices-of-Bernard-D-Ward-PC-708-349-5600-815-834-2000/143994815665091"
              },
              {
                "business_name": "Acorn Wire &amp; Iron Works LLC",
                "citations_count": "56",
                "url": null
              },
              {
                "business_name": "Iron &amp; Wire Custom Metal Studio LLC",
                "citations_count": "25",
                "url": "https://www.facebook.com/pages/Iron-Wire/104803202926726?sk=info"
              },
              {
                "business_name": "Adams Street Iron Inc",
                "citations_count": "66",
                "url": "https://www.facebook.com/pages/Adams-Street-Iron/117016575024837"
              },
              {
                "business_name": "Iron Workers Union",
                "citations_count": "39",
                "url": null
              },
              {
                "business_name": "Shaw Environmental/Infrstrctr",
                "citations_count": "52",
                "url": "https://www.facebook.com/pages/International-Technology-Corp/154765177895978"
              }
            ]
          },
          {
            "domain": "linkedin.com",
            "authority": "100/100",
            "count": 2,
            "businesses": [
              {
                "business_name": "Iron Galaxy Studios LLC",
                "citations_count": "74",
                "url": "https://www.linkedin.com/in/michaelpickens"
              },
              {
                "business_name": "Iron Financial Management Inc",
                "citations_count": "118",
                "url": "https://www.linkedin.com/pub/miles-muslin/18/287/950"
              },
              {
                "business_name": "Chicago Tube and Iron Company",
                "citations_count": "106",
                "url": null
              },
              {
                "business_name": "Acorn Wire &amp; Iron Works LLC",
                "citations_count": "56",
                "url": null
              },
              {
                "business_name": "Iron &amp; Wire Custom Metal Studio LLC",
                "citations_count": "25",
                "url": null
              },
              {
                "business_name": "Adams Street Iron Inc",
                "citations_count": "66",
                "url": null
              },
              {
                "business_name": "Iron Workers Union",
                "citations_count": "39",
                "url": null
              },
              {
                "business_name": "Shaw Environmental/Infrstrctr",
                "citations_count": "52",
                "url": null
              }
            ]
          }
        ],
        "nap_comparison": [
          {
            "taken_from": "User supplied",
            "business_name": "Example & Co",
            "address": "email@example.com  Chicago, IL IL",
            "postcode": "90210",
            "telephone": "4234324234"
          },
          {
            "taken_from": "Google Listing",
            "business_name": null,
            "address": "",
            "postcode": null,
            "telephone": null
          }
        ],
        "top_categories": {
          "Hotel": 8,
          "General Contractor": 1,
          "Non-Profit Organization": 1,
          "Steel Fabricator": 1,
          "Metal Fabricator": 1
        },
        "other_ranking_factors": []
      },
      "gold": {
        "top_10": [
          {
            "business_name": "Gold Eagle",
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&site=&source=hp&q=gold+eagle+chicago",
            "claimed": true,
            "citations_count": 62,
            "domain_authority": "45/100",
            "backlinks": 9918,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Shipping Company"
            ]
          },
          {
            "business_name": "Rickey Gold Associates",
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&q=Rickey+Gold+Associates",
            "claimed": false,
            "citations_count": 96,
            "domain_authority": "26/100",
            "backlinks": 57,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Marketing Consultant"
            ]
          },
          {
            "business_name": "Bentley Gold Coast",
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&q=Bentley+Gold+Coast%2C+Chicago&oq=Bentley+Gold+Coast%2C+Chicago",
            "claimed": false,
            "citations_count": 89,
            "domain_authority": "32/100",
            "backlinks": 87,
            "num_reviews": 58,
            "star_rating": "4.2/5",
            "num_photos": 5,
            "categories": [
              "Car Dealer"
            ]
          },
          {
            "business_name": "Gold Coast Tickets",
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&q=Gold+Coast+Tickets%2C+Chicago",
            "claimed": false,
            "citations_count": 47,
            "domain_authority": "34/100",
            "backlinks": 1362,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Event Ticket Seller"
            ]
          },
          {
            "business_name": "Gold Canyon Candles",
            "profile_url": "https://www.google.co.uk/search?newwindow=1&safe=active&q=Gold+Canyon+Candles%2C+Schaumburg%2C+IL+60193",
            "claimed": true,
            "citations_count": 19,
            "domain_authority": "n/a",
            "backlinks": 0,
            "num_reviews": 0,
            "star_rating": "0/5",
            "num_photos": 0,
            "categories": [
              "Gift Basket Store",
              "Hotel"
            ]
          }
        ],
        "citations_matrix": [
          {
            "domain": "facebook.com",
            "authority": "100/100",
            "count": 6,
            "businesses": [
              {
                "business_name": "Iron Galaxy Studios LLC",
                "citations_count": "74",
                "url": "https://www.facebook.com/103101903089752"
              },
              {
                "business_name": "Iron Financial Management Inc",
                "citations_count": "118",
                "url": null
              },
              {
                "business_name": "Chicago Tube and Iron Company",
                "citations_count": "106",
                "url": "https://www.facebook.com/pages/Law-Offices-of-Bernard-D-Ward-PC-708-349-5600-815-834-2000/143994815665091"
              },
              {
                "business_name": "Acorn Wire &amp; Iron Works LLC",
                "citations_count": "56",
                "url": null
              },
              {
                "business_name": "Iron &amp; Wire Custom Metal Studio LLC",
                "citations_count": "25",
                "url": "https://www.facebook.com/pages/Iron-Wire/104803202926726?sk=info"
              },
              {
                "business_name": "Adams Street Iron Inc",
                "citations_count": "66",
                "url": "https://www.facebook.com/pages/Adams-Street-Iron/117016575024837"
              },
              {
                "business_name": "Iron Workers Union",
                "citations_count": "39",
                "url": null
              },
              {
                "business_name": "Shaw Environmental/Infrstrctr",
                "citations_count": "52",
                "url": "https://www.facebook.com/pages/International-Technology-Corp/154765177895978"
              },
              {
                "business_name": "Gold Eagle",
                "citations_count": "62",
                "url": null
              },
              {
                "business_name": "Rickey Gold Associates",
                "citations_count": "96",
                "url": null
              },
              {
                "business_name": "Bentley Gold Coast",
                "citations_count": "89",
                "url": "https://www.facebook.com/pages/Bentley-Gold-Coast/135572886504845"
              },
              {
                "business_name": "Gold Coast Tickets",
                "citations_count": "47",
                "url": null
              },
              {
                "business_name": "Gold Canyon Candles",
                "citations_count": "19",
                "url": null
              }
            ]
          },
          {
            "domain": "linkedin.com",
            "authority": "100/100",
            "count": 2,
            "businesses": [
              {
                "business_name": "Iron Galaxy Studios LLC",
                "citations_count": "74",
                "url": "https://www.linkedin.com/in/michaelpickens"
              },
              {
                "business_name": "Iron Financial Management Inc",
                "citations_count": "118",
                "url": "https://www.linkedin.com/pub/miles-muslin/18/287/950"
              },
              {
                "business_name": "Chicago Tube and Iron Company",
                "citations_count": "106",
                "url": null
              },
              {
                "business_name": "Acorn Wire &amp; Iron Works LLC",
                "citations_count": "56",
                "url": null
              },
              {
                "business_name": "Iron &amp; Wire Custom Metal Studio LLC",
                "citations_count": "25",
                "url": null
              },
              {
                "business_name": "Adams Street Iron Inc",
                "citations_count": "66",
                "url": null
              },
              {
                "business_name": "Iron Workers Union",
                "citations_count": "39",
                "url": null
              },
              {
                "business_name": "Shaw Environmental/Infrstrctr",
                "citations_count": "52",
                "url": null
              },
              {
                "business_name": "Gold Eagle",
                "citations_count": "62",
                "url": null
              },
              {
                "business_name": "Rickey Gold Associates",
                "citations_count": "96",
                "url": null
              },
              {
                "business_name": "Bentley Gold Coast",
                "citations_count": "89",
                "url": null
              },
              {
                "business_name": "Gold Coast Tickets",
                "citations_count": "47",
                "url": null
              },
              {
                "business_name": "Gold Canyon Candles",
                "citations_count": "19",
                "url": null
              }
            ]
          }
        ],
        "nap_comparison": [
          {
            "taken_from": "User supplied",
            "business_name": "Example & Co",
            "address": "email@example.com  Chicago, IL IL",
            "postcode": "85300",
            "telephone": "4234324234"
          },
          {
            "taken_from": "Google Listing",
            "business_name": null,
            "address": "",
            "postcode": null,
            "telephone": null
          }
        ],
        "top_categories": {
          "Gift Basket Store": 1,
          "Hotel": 1,
          "Event Ticket Seller": 1,
          "Car Dealer": 1,
          "Marketing Consultant": 1
        },
        "other_ranking_factors": []
      }
    },
    "urls": {
      "report_url": "https://tools.brightlocal.com/seo-tools/admin/gpw/reports/view/275",
      "wl_url": "http://local-marketing-reports.com/google-plus-reports/<hidden>/275"
    }
  }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_LOCATION_ID": "Invalid location ID supplied"
  } 
}
```

Return report URLs and raw data.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/gpw/<reportId>/results`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
