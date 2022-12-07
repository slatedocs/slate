# Reputation Manager

## Add Report

<span class="label label-info">Account Method</span>

> Add Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v4/rf/add', [
    'location-id'       => 1,
    'report-name'       => 'Le Bernardin',
    'business-name'     => 'Le Bernardin',
    'contact-telephone' => '+1 212-554-1515',
    'address1'          => '155 West 51st Street',
    'address2'          => '',
    'city'              => 'New York',
    'postcode'          => '10019',
    'country'           => 'USA', // USA only
    'directories'       => [
        'yellowbot'   => [
            'url'     => 'https://www.yellowbot.com/le-bernardin-new-york-ny.html',
            'include' => true,
        ],
        'yellowpages' => [
            'url'     => 'https://www.yellowpages.com/new-york-ny/mip/le-bernardin-9909153',
            'include' => true,
        ],
        'yelp'        => [
            'url'     => 'https://www.yelp.com/biz/le-bernardin-new-york',
            'include' => true,
        ],
    ],
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
 -d 'contact-telephone=+1 212-554-1515' \
 -d 'address1=155 West 51st Street' \ 
 -d 'address2=' \
 -d 'city=New York' \
 -d 'postcode=10019' \
 -d 'country=USA' \
 https://tools.brightlocal.com/seo-tools/api/v4/rf/add
```

```csharp
Dictionary<string, object> directories = new Dictionary<string, object>()
{
    {
        "yellowbot", new {
            url = "https://www.yellowbot.com/le-bernardin-new-york-ny.html",
            include = true
        }
    }
}; 
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "location-id", 1 },
    { "report-name", "Le Bernardin" },
    { "business-name", "Le Bernardin" },
    { "contact-telephone", "+1 212-554-1515" },
    { "address1", "155 West 51st Street" },
    { "city", "New York" },
    { "postcode", "10019" },
    { "country", "USA" },
    { "directories", directories }
};

dynamic response = api.Post("v4/rf/add", parameters).GetContent();
Console.WriteLine(response);         
```

> Example of specifying directories

```php
<?php
echo json_encode([
        'yellowbot'   => [
            'url'     => 'https://www.yellowbot.com/le-bernardin-new-york-ny.html',
            'include' => true,
        ],
        'yellowpages' => [
            'url'     => 'https://www.yellowpages.com/new-york-ny/mip/le-bernardin-9909153',
            'include' => true,
        ],
        'yelp'        => [
            'url'     => 'https://www.yelp.com/biz/le-bernardin-new-york',
            'include' => true,
        ],
    ]);
```

```csharp
var directories = new List<dynamic>();
directories.Add(new
{
    yellowbot = new
    {
        url = "http://www.yellowbot.com/le-bernardin-new-york-ny.html",
        include = true
    },
    yellowpages = new
    {
        url = "http://www.yellowpages.com/new-york-ny/mip/le-bernardin-9909153",
        include = true
    },
    yelp = new
    {
        url = "",
        include = true
    }
});
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
    "INVALID_REPORT_NAME": "Please enter report name",
    "INVALID_BUSINESS_NAME": "Please enter business name",
    "INVALID_CONTACT_TELEPHONE": "Please enter phone number",
    "INVALID_ADDRESS1": "Please enter street address",
    "INVALID_CITY": "Please enter city",
    "INVALID_POSTCODE": "Please enter post code",
    "INVALID_COUNTRY": "Please select country"
  }
}
```

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rf/add`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
report-name | <span class="label label-required">Required</span>
location-id | <span class="label label-required">Required</span> Associate this report with a location in your account. This ID needs to correspond to a valid location in your account.
white-label-profile-id | Assign a white label profile to this report. The ID needs to correspond to a valid white label profile in your account.
business-name | <span class="label label-required">Required</span>
contact-telephone | <span class="label label-required">Required</span>
address1 | <span class="label label-required">Required</span>
address2 |
city | <span class="label label-required">Required</span>
postcode | <span class="label label-required">Required</span> A valid postcode or ZIP.
country | <span class="label label-required">Required</span> USA only.
schedule | D (Daily), W (Weekly) or M (Monthly). You to purchase an add on before you can use daily reporting. Defaults to M (Monthly).
run-on | Numeric day of week or day of month to run the report on (applicable to weekly and monthly schedules). Defaults to current day of month. If you create your report today it'll be run on the 17th of each month unless you specify otherwise.
receive-email-alerts | One of 0, 1 or 2. If set to 1 we will send report alerts every time a report finishes (regardless of whether or not new reviews were found) to all email addresses specified (see field below). If you include customer email addresses when setting up your report we’ll also email them the alerts so please be sure this is what you want before adding their addresses. If set to 2 we will only send email alerts if new reviews were found upon report completion. Defaults to 0 which means no alerts will be sent.
alert-email-addresses | Supply a list of email addresses as a JSON string, e.g. ["user1@test.com","user2@test.com","user3@test.com"]
is-public | Determines whether or not to make the report available on a public URL you can give to your customers. One of 1 or 0. Defaults to 0.
directories | <p>By default we try and find profile URLs and reviews in all directories we support. If you'd like your report to contain only specific directories or already know the profile URLs for some directories you can supply them here. Please note that if you supply information for this parameter you need to give us all details of the directories you want included. If you have profile URLs for some but not others you can leave those URL fields empty and we'll do our best to find them. Generally we recommend you run your report for the first time without this setting and then use our update method to add/change URLs or remove directories if needed.</p><p>The data for this parameter needs to be supplied as a JSON string. Local directory identifiers (the keys in the example below) are documented here. Here's an example of how to generate suitable values in PHP:</p>

<aside class="notice">
    Once added a report won't show in your control panel until all profile URLs have been found (the first stage of running the report). Once this is complete and reviews are being fetched the report will be shown.
</aside>

## Update Report

<span class="label label-info">Account Method</span>

> Update Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->put('/v4/rf/' . $reportId, [
    'location-id'       => 1,
    'report-name'       => 'Le Bernardin',
    'contact-telephone' => '+1 212-554-1855',
]);
print_r($response->getResult());
```

```shell
curl -X PUT \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'location-id=1' \
 -d 'report_name=Le Bernardin' \
 -d 'business_names=Le Bernardin' \
 -d 'schedule=Adhoc' \
 -d 'day_of_month=2' \
 https://tools.brightlocal.com/seo-tools/api/v4/rf/1
```

```csharp
int reportId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic directories = new
{
    yellowbot = new
    {
        url = "https://www.yellowbot.com/le-bernardin-new-york-ny.html",
        include = true
    },
    yelp = new
    {
        url = "",
        include = false
    }
};

Parameters parameters = new Parameters
{
    { "location-id", 1 },
    { "report-name", "Le Bernardin updated" },
    { "directories", directories }
};

dynamic reviews = api.Put("v4/rf/" + reportId, parameters).GetContent();
Console.WriteLine(reviews);
```

> Example of modifying directories

```php
<?php
echo json_encode([
    'yellowbot'   => [
        'url'     => 'https://www.yellowbot.com/le-bernardin-new-york-ny.html',
        'include' => true,
    ],
    'yellowpages' => [
        'url'     => 'https://www.yellowpages.com/new-york-ny/mip/le-bernardin-9909153',
        'include' => true,
    ],
    'yelp'        => [
        'url'     => 'https://www.yelp.com/biz/le-bernardin-new-york',
        'include' => true,
    ],
]);
```

```csharp
var directories = new List<dynamic>();
directories.Add(new
{
    yellowbot = new
    {
        url = "http://www.yellowbot.com/le-bernardin-new-york-ny.html",
        include = true
    },
    yellowpages = new
    {
        url = "http://www.yellowpages.com/new-york-ny/mip/le-bernardin-9909153",
        include = true
    },
    yelp = new
    {
        url = "",
        include = true
    }
});


> Success (200 Created)

```json
{
    "success": true
}
```

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | <span class="label label-required">Required</span>
report-name |
white-label-profile-id | Assign a white label profile to this report. The ID needs to correspond to a valid white label profile in your account.
schedule | D (Daily), W (Weekly) or M (Monthly). You to purchase an add on before you can use daily reporting. Defaults to M (Monthly).
run-on | Numeric day of week or day of month to run the report on (applicable to weekly and monthly schedules). Defaults to current day of month. If you create your report today it'll be run on the 17th of each month unless you specify otherwise.
receive-email-alerts | One of 0, 1 or 2. If set to 1 we will send report alerts every time a report finishes (regardless of whether or not new reviews were found) to all email addresses specified (see field below). If you include customer email addresses when setting up your report we’ll also email them the alerts so please be sure this is what you want before adding their addresses. If set to 2 we will only send email alerts if new reviews were found upon report completion. Defaults to 0 which means no alerts will be sent.
alert-email-addresses | Supply a list of email addresses as a JSON string, e.g. ["user1@test.com","user2@test.com","user3@test.com"]
is-public | Determines whether or not to make the report available on a public URL you can give to your customers. One of 1 or 0. Defaults to 0.
directories | <p>If you need to add or change a profile URL you can do so here.</p><p>The data for this parameter needs to be supplied as a JSON string. Local directory identifiers (the keys in the example below) are documented here. Here's an example of how to generate suitable values in PHP:</p>

## Get Report

<span class="label label-info">Account Method</span>

> Get Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/1?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic report = api.Get("v4/rf/" + reportId).GetContent();
Console.WriteLine(report);
```

> Success (200 OK)

```json
{
    "success": true,
    "report": {
        "report_id": "270",
        "report_name": "Le Bernardin",
        "location_id": "0",
        "customer_id": "35",
        "business_name": "Le Bernardin",
        "contact_telephone": "+1 212-554-1515",
        "address1": "155 West 51st Street",
        "address2": "",
        "city": "New York",
        "postcode": "10019",
        "country": "USA",
        "receive_email_alerts": false,
        "alert_email_addresses": [
            "<hidden>",
            "<hidden>",
            "<hidden>"
        ],
        "last_update": "2015-01-06 11:51:35",
        "created_at": "2015-01-06 11:43:57",
        "schedule": "M",
        "run_on": "1",
        "reviews_count": "2772",
        "rating": "4.49",
        "is_running": false,
        "white_label_profile_id": null,
        "is_public": true,
        "public_key": "<hidden>",
        "directories": {
            "botw": {
                "url": "http://local.botw.org/New_York/New_York/Ayza/1000053931.html",
                "searched": true,
                "include": true
            },
            "citysearch": {
                "url": "http://www.citysearch.com/profile/7143737/new_york_ny/le_bernardin.html",
                "searched": true,
                "include": true
            },
            "dexknows": {
                "url": "",
                "searched": true,
                "include": true
            },
            "foursquare": {
                "url": "https://foursquare.com/v/le-bernardin-new-york-ny/3fd66200f964a52066e31ee3",
                "searched": true,
                "include": true
            },
            "google": {
                "url": "https://plus.google.com/106100547192468577963/about?hl=en&rfmt=s",
                "searched": true,
                "include": true
            },
            "insiderpages": {
                "url": "http://www.insiderpages.com/b/15241026606/le-bernardin-new-york-1",
                "searched": true,
                "include": true
            },
            "judysbook": {
                "url": "http://www.judysbook.com/Le-Bernardin-Restaurant-Home-and-Garden-newyork-r29294246.htm",
                "searched": true,
                "include": true
            },
            "kudzu": {
                "url": "http://www.kudzu.com/m/Le-Bernardin-20063962",
                "searched": true,
                "include": true
            },
            "localcom": {
                "url": "http://www.local.com/business/details/new-york-ny/le-bernardin-117822808/",
                "searched": true,
                "include": true
            },
            "manta": {
                "url": "http://www.manta.com/c/mmgg127/le-bernardin-restaurant",
                "searched": true,
                "include": true
            },
            "merchantcircle": {
                "url": "http://www.merchantcircle.com/business/le.Bernardin.212-554-1515",
                "searched": true,
                "include": true
            },
            "superpages": {
                "url": "http://www.superpages.com/bp/New-York-NY/Le-Bernardin-L0500767889.htm",
                "searched": true,
                "include": true
            },
            "yahoo": {
                "url": "https://local.yahoo.com/info-27778787-le-bernardin-new-york",
                "searched": true,
                "include": true
            },
            "yellowbot": {
                "url": "http://www.yellowbot.com/le-bernardin-new-york-ny.html",
                "searched": true,
                "include": true
            },
            "yellowpages": {
                "url": "http://www.yellowpages.com/new-york-ny/mip/le-bernardin-9909153",
                "searched": true,
                "include": true
            },
            "yelp": {
                "url": "http://www.yelp.com/biz/le-bernardin-new-york",
                "searched": true,
                "include": true
            }
        },
        "urls": {
            "interactive_url": "https://tools.brightlocal.com/seo-tools/admin/rf/tracker/276",
            "pdf_url": "https://tools.brightlocal.com/seo-tools/admin/rf/pdf-report/276",
            "public_interactive_url": "http://www.local-marketing-reports.com/review-reports/<hidden>/tracker/276",
            "public_pdf_url": "http://www.local-marketing-reports.com/review-reports/<hidden>/276.pdf"
        }
    }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>`

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
$response = $api->delete('/v4/rf/' . $reportId);
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
 https://tools.brightlocal.com/seo-tools/api/v4/rf/1
```

```csharp
int reportId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic status = api.Delete("v4/rf/" + reportId).GetContent();
Console.WriteLine(status);
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
    "INVALID_REPORT_ID": "Report ID missing"
  }
}
```
 
> Failure when report running (400 Bad Request)

```json
{
    "success": false,
    "errors":  {
      "REPORT_RUNNING": "Report is running"
    }
}
```

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get Reports

<span class="label label-info">Account Method</span>

> Get Reports

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic report = api.Get("v4/rf").GetContent();
Console.WriteLine(report);
```

> Success (200 OK)

```json
{
    "success": true,
    "reports": [
        {
            "report_id": "270",
            "report_name": "Le Bernardin",
            "location_id": "0",
            "created_at": "2015-01-06 11:43:57",
            "last_update": "2015-01-06 11:51:35",
            "is_running": false,
            "running_message": "",
            "fetching": false,
            "complete": true
        },
        {
            "report_id": "141",
            "report_name": "Zuni cafe #2",
            "location_id": "0",
            "created_at": "2013-12-10 15:24:53",
            "last_update": "2014-12-15 02:07:38",
            "is_running": false,
            "running_message": "",
            "fetching": false,
            "complete": true
        },
        {
            "report_id": "119",
            "report_name": "Zuni Cafe",
            "location_id": "0",
            "created_at": "2013-10-21 10:23:00",
            "last_update": "2014-12-15 02:06:54",
            "is_running": false,
            "running_message": "",
            "fetching": false,
            "complete": true
        },
        {
            "report_id": "144",
            "report_name": "Slade & Baker Vision Center",
            "location_id": "0",
            "created_at": "2013-12-16 15:17:10",
            "last_update": "2014-12-15 02:05:48",
            "is_running": false,
            "running_message": "",
            "fetching": false,
            "complete": true
        }
    ]
}
```

> Validation Failure (400 Bad Request)

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
location-id | Filter the list of reports returned by location ID. This ID must correspond to a valid location in your account.

## Report Search

<span class="label label-info">Account Method</span>

> Search for a Reputation Manager Report

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/search', [
    'q' => 'Le Bernardin'
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/search?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&q=My+Sample+Query'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "q", "Le Bernardin" }
};
dynamic report = api.Get("v4/rf/search", parameters).GetContent();
Console.WriteLine(report);
```


> Success (200 OK)

```json
{
    "success": true,
    "reports": [
        {
            "report_id": "270",
            "report_name": "Le Bernardin",
            "location_id": "0",
            "created_at": "2015-01-06 11:43:57",
            "last_update": "2015-01-06 11:51:35",
            "is_running": false,
            "running_message": "",
            "fetching": false,
            "complete": true
        }
    ]
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_SEARCH": "Search string missing"
  }
}
```

Search for reports in your account.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
q | <span class="label label-required">Required</span> Supply an arbitrary search string.

## Get Reviews

<span class="label label-info">Account Method</span>

> Get Reviews

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 141;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId . '/reviews');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/141/reviews?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 141;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
{
    { "limit", 100 }
};
dynamic reviews = api.Get("v4/rf/" + reportId + "/reviews", parameters).GetContent();
Console.WriteLine(reviews);
```

> Success (200 OK)

```json
{
    "success": true,
    "reviews": [
        {
            "dt": "2014-12-15 02:04:16",
            "report_id": "141",
            "directory": "yelp",
            "timestamp": "2014-12-14 02:04:43",
            "rating": "1",
            "title": "",
            "author": "Stephen Z.",
            "text": "I have not been in a number of years. Went there this past Friday night and was beyond disappointed. Service was not great at the bar or during dinner. The squash appetizer was completely overwhelmed by a very strong garlic component. The size of the main courses were about the size of the appetizers. I had the pork which looked like dog food with a side of beans. The meat was over cooked and was over powered by one spice. The fish was the same and the pasta dish looked like it had four or five pieces. The desserts were not much better. It was a very sad, disappointing experience. Will not be back.",
            "link": "http://www.yelp.com/biz/zuni-cafe-san-francisco?hrid=O-VJJEgwqsi02q4YnOJ8Qw",
            "url": "http://www.yelp.com/biz/zuni-cafe-san-francisco",
            "source": "",
            "name": "Yelp",
            "report_run_id": "15608"
        },
        {
            "dt": "2014-12-15 02:04:16",
            "report_id": "141",
            "directory": "yelp",
            "timestamp": "2014-12-11 02:04:43",
            "rating": "4",
            "title": "",
            "author": "Carl A.",
            "text": "After years of 5 stars from me, we had our first so-so experience at Zuni. Is it slipping now?  I hope not. But the buzz was gone. The service was halting and off. Let's hope that it was just an off-night, but maybe the time has come to move on??",
            "link": "http://www.yelp.com/biz/zuni-cafe-san-francisco?hrid=0xdzL2swNvC6cQ8yUDL4XQ",
            "url": "http://www.yelp.com/biz/zuni-cafe-san-francisco",
            "source": "",
            "name": "Yelp",
            "report_run_id": "15608"
        },
        {
            "dt": "2014-12-15 02:04:16",
            "report_id": "141",
            "directory": "yelp",
            "timestamp": "2014-12-10 02:04:43",
            "rating": "3",
            "title": "",
            "author": "Mary B.",
            "text": "Very expensive over rated restaurant. I feel the city has lost its zest for good food and overcharges for the mediocre.  Maybe we all should start eating at the food trucks where people cook their hearts out and keep the prices affordable.  Pork chop (from Llano Secco) delicious. Nettles?  Isn't spinach just as good. My husband thought the Ceasar salad was one of the best he's ever had, but the spaghetti was inedible. Thought he should have stopped at the Caesar's.  I'm not going back. I can find better food at better prices in this city.",
            "link": "http://www.yelp.com/biz/zuni-cafe-san-francisco?hrid=SEB7nqhlzF8pg2PALEvI7Q",
            "url": "http://www.yelp.com/biz/zuni-cafe-san-francisco",
            "source": "",
            "name": "Yelp",
            "report_run_id": "15608"
        }
    ]
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

Fetch all reviews associated with a report.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>/reviews`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
directory | Fetch reviews for a specific directory. See directory identifiers in appendix below.
stars | Fetch reviews for a specific star rating (0-5).
sort | By date "asc" or "desc". Default is "asc"
from | Fetch reviews from specified date. Format yyyy-mm-dd.
to | Fetch reviews up until specified date. Format yyyy-mm-dd.
offset | By default 20 reviews are returned at once. Use in combination with limit to page results. Defaults to 0.
limit | Defaults to 20.

### Response Fields Explained

A few of the fields are explained below:

Field | Explanation
----- | -----------
source | Determines where a review came from. Yahoo!, for example, can contain reviews that were posted directly on Yahoo! and reviews that have been sourced from Yelp.
source_link | Link to the site where the review was originally written.
hash | Unique identifier based on directory, author and review text. This can be used when storing reviews locally to prevent duplicates.

## Get Reviews Count

<span class="label label-info">Account Method</span>

> Get Reviews Count

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 141;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId . '/reviews/count');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/141/reviews/count?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 141;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic response = api.Get("v4/rf/" + reportId + "/reviews/count").GetContent();
Console.WriteLine(response);
```

> Success (200 OK)

```json
{
    "success": true,
    "count": "2770"
}
```
 
> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>/reviews/count`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get Growth

<span class="label label-info">Account Method</span>

> Get Growth

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 141;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId . '/reviews/growth');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/141/reviews/growth?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic grows = api.Get("v4/rf/{reportId}/reviews/growth").GetContent();
Console.WriteLine(grows);
```

Get count and percentage of new reviews since last report run.

> Success (200 OK)

```json
{
    "success": true,
    "growth": {
        "number": "1",
        "percent": "0.03"
    }
}
```
 
> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>/reviews/growth`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get Directories

<span class="label label-info">Account Method</span>

> Get Directories

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 141;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId . '/directories');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/141/directories?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 141;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic directories = api.Get("v4/rf/" + reportId + "/directories").GetContent();
Console.WriteLine(directories);
```

> Success (200 OK)

```json
{
    "success": true,
    "directories": {
        "citysearch": {
            "directory": "citysearch",
            "name": "Citysearch",
            "use": true,
            "url": "http://www.citysearch.com/profile/612944020/los_angeles_ca/pizzeria_mozza.html",
            "searched": true,
            "reviews": 117
        },
        "dexknows": {
            "directory": "dexknows",
            "name": "DexKnows",
            "use": true,
            "url": "http://www.dexknows.com/business_profiles/pizzeria_mozza_los_angeles-l900211841",
            "searched": true,
            "reviews": 0
        },
        "google": {
            "directory": "google",
            "name": "Google+ Local",
            "use": true,
            "url": "https://plus.google.com/116883746235536288122/about?hl=en&rfmt=s",
            "searched": true,
            "reviews": 145
        },
        "insiderpages": {
            "directory": "insiderpages",
            "name": "Insider Pages",
            "use": true,
            "url": "http://www.insiderpages.com/b/15240159890/pizzeria-mozza-los-angeles",
            "searched": true,
            "reviews": 5
        },
        "judysbook": {
            "directory": "judysbook",
            "name": "Judy's Book",
            "use": true,
            "url": "http://www.judysbook.com/Pizzeria-Mozza-Restaurants-losangeles-r26871385.htm",
            "searched": true,
            "reviews": 127
        },
        "kudzu": {
            "directory": "kudzu",
            "name": "Kudzu",
            "use": true,
            "url": "http://www.kudzu.com/m/Pizzeria-Mozza-20924094",
            "searched": true,
            "reviews": 117
        },
        "localcom": {
            "directory": "localcom",
            "name": "Local.com",
            "use": true,
            "url": "http://www.local.com/business/details/los-angeles-ca/mozza-cafe-105106399/",
            "searched": true,
            "reviews": 1
        },
        "manta": {
            "directory": "manta",
            "name": "Manta",
            "use": true,
            "url": "http://www.manta.com/c/mrsy0q6/falbo-bros-pizzeria",
            "searched": true,
            "reviews": 0
        },
        "merchantcircle": {
            "directory": "merchantcircle",
            "name": "Merchant Circle",
            "use": true,
            "url": "http://www.merchantcircle.com/business/Pizzeria.Mozza.323-297-0101",
            "searched": true,
            "reviews": 42
        },
        "superpages": {
            "directory": "superpages",
            "name": "Super Pages",
            "use": true,
            "url": "http://www.superpages.com/bp/Los-Angeles-CA/Pizzeria-Mozza-L0136883359.htm",
            "searched": true,
            "reviews": 3
        },
        "yahoo": {
            "directory": "yahoo",
            "name": "Yahoo! Local",
            "use": true,
            "url": "http://local.yahoo.com/info-36089572-pizzeria-mozza-los-angeles;_ylt=A0oG7hXne95SMD4AyqhXNyoA;_ylu=X3oDMTBybnZlZnRlBHNlYwNzcgRwb3MDMQRjb2xvA2FjMgR2dGlkAw--",
            "searched": true,
            "reviews": 2
        },
        "yellowbot": {
            "directory": "yellowbot",
            "name": "Yellow Bot",
            "use": true,
            "url": "http://www.yellowbot.com/pizzeria-mozza-los-angeles-ca.html",
            "searched": true,
            "reviews": 324
        },
        "yellowpages": {
            "directory": "yellowpages",
            "name": "Yellow Pages",
            "use": true,
            "url": "http://www.yellowpages.com/los-angeles-ca/mip/pizzeria-mozza-18463301",
            "searched": true,
            "reviews": 108
        },
        "yelp": {
            "directory": "yelp",
            "name": "Yelp",
            "use": true,
            "url": "http://www.yelp.com/biz/pizzeria-mozza-los-angeles",
            "searched": true,
            "reviews": 2966
        }
    }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

Get a list of directories associated with a report. Results contain directory details, profile URLs and review counts.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>/directories`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get Directory Stats

<span class="label label-info">Account Method</span>

Fetch stats showing average rating and review count for every directory in a given report.

> Get Directory Stats

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 141;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId . '/directories/stats');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/141/directories/stats?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId = 141;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic response = api.Get("v4/rf/{reportId}/directories/stats").GetContent();
Console.WriteLine(response);
```

> Success (200 OK)

```json
{
  "success": true,
  "stats":  {
    "botw":  {
      "directory": "botw",
      "name": "Best of the Web",
      "use": true,
      "url": "http://local.botw.org/New_York/New_York/Ayza/1000053931.html",
      "searched": true,
      "rating": 0,
      "reviews": 0
    },
    "citysearch":  {
      "directory": "citysearch",
      "name": "Citysearch",
      "use": true,
      "url": "http://www.citysearch.com/profile/7143737/new_york_ny/le_bernardin.html",
      "searched": true,
      "rating": "4.00",
      "reviews": 91
    },
    "foursquare":  {
      "directory": "foursquare",
      "name": "FourSquare",
      "use": true,
      "url": "https://foursquare.com/v/le-bernardin-new-york-ny/3fd66200f964a52066e31ee3",
      "searched": true,
      "rating": "0.00",
      "reviews": 190
    }
  }
}
```

> Validation Failure (400 Bad Request)

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>/directories/stats`

Fetch stats showing average rating and review count for every directory in a given report.

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)

## Get Star Counts

<span class="label label-info">Account Method</span>

> Get Start Counts

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$reportId = 141;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v4/rf/' . $reportId . '/stars/count');
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v4/rf/141/stars/count?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>'
```

```csharp
int reportId =141;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
dynamic response = api.Get("v4/rf/" + reportId + "/stars/count").GetContent();
Console.WriteLine(response);
```

> Success (200 OK)

```json
{
    "success": true,
    "counts": {
        "0star": "91",
        "1star": "223",
        "2star": "180",
        "3star": "394",
        "4star": "704",
        "5star": "1178"
    }
}
```
 
> Validation Failure 400 Bad Request

```json
{
  "success": false,
  "errors":  {
    "INVALID_REPORT_ID" : "Report ID missing"
  }
}
```

Get count of reviews for each star rating for a given report.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/rf/<reportId>/stars/count`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
