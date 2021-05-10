# Reviews

## Fetch Reviews (by profile URL)

<span class="label label-info">Batch Method</span>

> Fetch reviews for Google+, Yahoo, and Yelp profile URLs

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;
use BrightLocal\Exceptions\BatchAddJobException;

$directories = [
    'https://local.google.com/place?id=2145618977980482902&use=srp&hl=en',
    'https://local.yahoo.com/info-27778787-le-bernardin-new-york',
    'https://www.yelp.com/biz/le-bernardin-new-york'
];
// setup API wrapper
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
// Step 1: Create a new batch
$batch = $api->createBatch();
printf('Created batch ID %d%s', $batch->getId(), PHP_EOL);
// Step 2: Add directory jobs to batch
foreach ($directories as $directory) {
    try {
        $response = $batch->addJob('/v4/ld/fetch-reviews', [
            'profile-url' => $directory,
            'country'     => 'USA'
        ]);
        printf('Added job with ID %d%s', $response->getResult()['job-id'], PHP_EOL);
    } catch (BatchAddJobException $exception) {
        printf('Error, job for directory "%s" not added. Message: %s%s', $directory, $exception->getMessage(), PHP_EOL);
    }
}
// Commit batch (to indicate that all jobs have been added and that processing should start)
$batch->commit();
printf('Batch committed successfully, awaiting results.%s', PHP_EOL);
do {
    sleep(5);
    $response = $batch->getResults();
} while (!in_array($response->getResult()['status'], ['Stopped', 'Finished'], true));
print_r($response->getResult());
```

```csharp
List<string> profileUrls = new List<string>
{
   "https://local.google.com/place?id=2145618977980482902&use=srp&hl=en",
   "https://local.yahoo.com/info-27778787-le-bernardin-new-york",
   "https://www.yelp.com/biz/le-bernardin-new-york"
};

Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Batch batch = api.CreateBatch();
Console.WriteLine("Created batch ID {0}", batch.GetId());
foreach (string profileUrl in profileUrls)
{
    Parameters parameters = new Parameters
    {
        { "country", "USA" },
        { "profile-url", profileUrl }
    };
    try
    {
        // Add jobs to batch
        dynamic jobResponse = batch.AddJob("/v4/ld/fetch-reviews", parameters);
        Console.WriteLine("Added job with ID {0}", jobResponse["job-id"]);
    }
    catch (GeneralException exception)
    {
        Console.WriteLine(exception.Message);
    }
}

batch.Commit();
Console.WriteLine("Batch committed successfully, awaiting results.");
dynamic response;
do
{
    Thread.Sleep(5000);
    response = batch.GetResults();
} while (!(new List<string> { "Stopped", "Finished" }).Contains((string)response.status));
Console.WriteLine(response);
```

> Success (201 Created)

```json
{
    "success": true,
    "job-id": 318
}
```

> Failure (400 Bad Request)

```json
{
  "success": false,
  "errors": {
    "INVALID_COUNTRY": "Invalid  country  specified",
    "INVALID_PROFILE_URL": "Profile Url is not valid",
    "INVALID_DATE_FROM": "Invalid Date From. Date Format: Y-m-d or Y-m-d H:i:s",
    "INVALID_REVIEWS_LIMIT": "Reviews Limit should be positive number or 'all'"
  }
}
```
 
> Failure (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": {
    "INVALID_METHOD": "Invalid method specified. Only POST method is available"
  }
}
```

Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-reviews`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
profile-url | <span class="label label-required">Required</span> For requests to fetch Google profile data please use our [Google Link &amp; ID Generator tool](https://www.brightlocal.com/free-local-seo-tools/google-id-and-review-link-generator/) to generate your Google My Business Knowledge Panel URL.
country | <span class="label label-required">Required</span>
sort | 'rating' or 'date'. By default 'date'.
reviews-limit | Positive number or 'all'. By default 100.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.
start-page | See [paging](#paging) table below for details.

## Fetch Reviews (by business data)

<span class="label label-info">Batch Method</span>

> Fetch reviews for a business using business data

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;
use BrightLocal\Exceptions\BatchAddJobException;

$directories = ['google', 'yahoo'];
// setup API wrapper
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
// Step 1: Create a new batch
$batch = $api->createBatch();
printf('Created batch ID %d%s', $batch->getId(), PHP_EOL);
// Step 2: Add directory jobs to batch
foreach ($directories as $directory) {
    try {
        $response = $batch->addJob('/v4/ld/fetch-reviews-by-business-data', [
            'local-directory' => $directory,
            'business-names'  => 'Le Bernardin',
            'country'         => 'USA',
            'street-address'  => '155 W 51st St',
            'city'            => 'New York',
            'postcode'        => '10019',
            'telephone'       => '(212) 554-1515'
        ]);
        printf('Added job with ID %d%s', $response->getResult()['job-id'], PHP_EOL);
    } catch (BatchAddJobException $exception) {
        printf('Error, job for directory "%s" not added. Message: %s%s', $directory, $exception->getMessage(), PHP_EOL);
    }
}
// Commit batch (to indicate that all jobs have been added and that processing should start)
$batch->commit();
printf('Batch committed successfully, awaiting results.%s', PHP_EOL);
do {
    sleep(5);
    $response = $batch->getResults();
} while (!in_array($response->getResult()['status'], ['Stopped', 'Finished'], true));
print_r($response->getResult());
```

```csharp
List<string> localDirectories = new List<string>
{
    "google",
    "yahoo",
};

Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Batch batch = api.CreateBatch();
Console.WriteLine("Created batch ID {0}", batch.GetId());
foreach (string directory in localDirectories)
{
    Parameters parameters = new Parameters
    {
        { "business-names", "Le Bernardin" },
        { "country", "USA" },
        { "street-address", "155 W 51st St" },
        { "city", "New York" },
        { "postcode", "10019" },
        { "telephone", "(212) 554-1515" },
        { "local-directory", directory }
    };
    try
    {
        // Add jobs to batch
        dynamic jobResponse = batch.AddJob("/v4/ld/fetch-reviews-by-business-data", parameters);
        Console.WriteLine("Added job with ID {0}", jobResponse["job-id"]);
    }
    catch (GeneralException exception)
    {
        Console.WriteLine(exception.Message);
    }
}

batch.Commit();
Console.WriteLine("Batch committed successfully, awaiting results.");
dynamic response;
do
{
    Thread.Sleep(5000);
    response = batch.GetResults();
} while (!(new List<string> { "Stopped", "Finished" }).Contains((string)response.status));
Console.WriteLine(response);
```

> Success (201 Created)

```json
{
    "success": true,
    "job-id": 318
}
```
 
 > Success (200 Ok)

```json
{
  "success": true,
  "results": {
    "LdFetchProfileUrl": [
      {
        "results": [
          {
            "url": "https://www.google.com/search?q=%22%5B%22Pick+A+Bagel%22%5D%22+%2210021%22&gws_rd=cr&gl=us"
          }
        ],
        "payload": {
          "business-names": "[\"Pick A Bagel\"]",
          "country": "USA",
          "city": "Manhattan",
          "postcode": "10021",
          "telephone": "(212) 717-4668",
          "directory": "google",
          "street-address": "1475 2nd Avenue",
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "dependent-job": {
            "name": "LdFetchReviews",
            "payload": {
              "profile-url": null,
              "country": "USA",
              "date-from": null,
              "reviews-limit": 250,
              "sort-type": "date",
               "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
            }
          }
        },
        "status": "Completed",
        "job-id": 549612293
      },
      {
        "results": [
          {
            "url": "http://www.yelp.com/biz/pick-a-bagel-new-york-5"
          }
        ],
        "payload": {
          "business-names": "[\"Pick A Bagel\"]",
          "country": "USA",
          "city": "Manhattan",
          "postcode": "10021",
          "telephone": "(212) 717-4668",
          "directory": "yelp",
          "street-address": "1475 2nd Avenue",
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "dependent-job": {
            "name": "LdFetchReviews",
            "payload": {
              "profile-url": null,
              "country": "USA",
              "date-from": null,
              "reviews-limit": 250,
              "sort-type": "date",
              "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
            }
          }
        },
        "status": "Completed",
        "job-id": 549612304
      }
     
    ],
    "LdFetchReviews": [
      {
        "results": [
          {
           "recommendations": [
             {
               "grade": "positive",
               "author": "Jeremy Dayan",
               "timestamp": "2016-07-30",
               "text": "Nice place to have breakfast in. Relatively good prices and fast service.",
               "id": "0c64b06e4c8ddaa0c6be4ba88df17f7e13cd95a0"
             }
           ],
            "reviews": [
              {
                "rating": 4,
                "author": "Jeremy Dayan",
                "timestamp": "2016-07-30",
                "text": "Nice place to have breakfast in. Relatively good prices and fast service.",
                "id": "0c64b06e4c8ddaa0c6be4ba88df17f7e13cd95a0"
              },
              
              {
                "rating": 4,
                "author": "Alain Schmid",
                "timestamp": "2016-05-30",
                "text": "Choose your Bagle and cream cheese from a broad range of different sets and ingredients.",
                "id": "92d26048a7e297ef8911c21e35479fd2cd267d83"
              },
              {
                "rating": 4,
                "author": "David van der Loo",
                "timestamp": "2016-05-30",
                "text": "Okay for morning breakfast take-away.",
                "id": "1d5abf2447d6d78b467fae216b630c4eef7b3eb5"
              },
              {
                "rating": 4,
                "author": "Riley Sherer",
                "timestamp": "2015-09-30",
                "text": "You want a bagel? Okay, pick a bagel. Come on, I don't got all day. Yeah yeah the coffee's alright.",
                "id": "c88db1e509fbc2e9731f7946b84fdbfc4eb2f607"
              }
            ],
            "reviews-count":4,
            "star-rating": 4
          }
        ],
        "payload": {
          "profile-url": "https://www.google.com/search?q=%22%5B%22Pick+A+Bagel%22%5D%22+%2210021%22&gws_rd=cr&gl=us",
          "country": "USA",
          "date-from": null,
          "reviews-limit": 250,
          "sort-type": "date",
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "parent-id": 549612293
        },
        "status": "Completed",
        "job-id": 549612293
      },
      {
        "results": [
          {
            "reviews": [
              {
                "rating": 1,
                "author": "Krista C.",
                "timestamp": "2008-05-27",
                "text": "One of the worst bagels NYC has to offer.Now I don't consider myself a bagel snob but i'm used to having a Ess-A-Bagel and a Hot Jumbo Bagel around the corner.But now after moving I needed to find my new bagel place, I thought I'd give Pick-A-Bagel a try.",
                "link": "http://www.yelp.com/biz/pick-a-bagel-new-york-5?hrid=6ijWFhvccHDdiSj5MnX3yQ",
                "id": "c0f1160d92b4d60bb6609b7b9d4e7be31013781e"
              },
              {
                "rating": 1,
                "author": "Jeffrey C.",
                "timestamp": "2008-03-04",
                "text": "I don't know about others in the store but I tried from their \"make your own pasta\" menu and had the pesto sauce for the pasta. It was the worst pesto sauce I had in my life.",
                "link": "http://www.yelp.com/biz/pick-a-bagel-new-york-5?hrid=1ZIo0LYcFqmK7IJTMmw_bg",
                "id": "b0223bea06d6fd8e907f41ec73cc792db538b0f9"
              }
            ],
            "reviews-count": 2,
            "star-rating": "1.0"
          }
        ],
        "payload": {
          "profile-url": "http://www.yelp.com/biz/pick-a-bagel-new-york-5",
          "country": "USA",
          "date-from": null,
          "reviews-limit": 250,
          "sort-type": "date",
          "api-key": "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
          "parent-id": 549612304
        },
        "status": "Completed",
        "job-id": 549612304
      }
      
    ]
  },
  "statuses": {
    "Completed": 6,
    "Failed": 0
  },
  "status": "Finished"
}
```

> Failure (400 Bad Request)

```json
{
  "success": false,
  "errors": {
    "INVALID_BUSINESS_NAMES": "Invalid Business names specified",
    "INVALID_COUNTRY": "Invalid country specified",
    "INVALID_CITY": "Invalid city specified",
    "INVALID_POSTCODE": "Invalid postcode specified",
    "INVALID_LOCAL_DIRECTORY": "Invalid local directory specified",
    "INVALID_DATE_FROM": "Invalid Date From. Date Format: Y-m-d or Y-m-d H:i:s",
    "INVALID_REVIEWS_LIMIT": "Reviews Limit should be positive number or 'all'"
  }
}
```
 
> Failure (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": {
    "INVALID_METHOD": "Invalid method specified. Only POST method is available"
  }
}
```

This method finds profile url then fetches reviews using this URL.

Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-reviews-by-business-data`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
business-names | <span class="label label-required">Required</span> A newline (\n) separated list of possible business names to search for. For example: The Rose Pub Rose Pub The Rose.
city | <span class="label label-required">Required</span>
postcode | <span class="label label-required">Required</span>
local-directory | <span class="label label-required">Required</span> See appendix below for possible options.
street-address |
country | <span class="label label-required">Required</span> Only USA.
telephone | A valid telephone number. Providing this will improve the quality of results returned.
sort | 'rating' or 'date'. By default 'date'.
reviews-limit | Positive number or 'all'. By default 100.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.
start-page | See [paging](#paging) table below for details.

## Paging

We support up to 500 reviews per request to a given directory. If you need to retrieve more than 500 reviews you can use the start-page parameter and submit multiple requests to pick up older reviews. For example with Google to fetch 1000 reviews you'd need to make two requests:

1. Without start-page (or with start-page=1) to fetch reviews 1 - 500. In response, you will receive reviews and the 'next-start-page' parameter. It can be integer page number or string token. Use it on your next request.
2. With start-page='Token from previous request' to fetch reviews next reviews.

### Supported Directories

Directory | Number Reviews Per Page or Token
--------- | -----------------------
google    | token
trustpilot| 20
dentist1800| 20
expedia| 500
facebook|token
grubhub| 35
healthgrades|
insiderpages| 50
opentable| 40
realself| 10
selfstorage| 3
tripadvisor| 5 or 10
yellowpages| 20


