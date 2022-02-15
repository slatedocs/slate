# Local Directories

## Fetch Profile URL

<span class="label label-info">Batch Method</span>

> Fetch profile url for 3 local directories

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;
use BrightLocal\Exceptions\BatchAddJobException;

$directories = ['google', 'yelp', 'yahoo'];
// setup API wrapper
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
// Step 1: Create a new batch
$batch = $api->createBatch();
printf('Created batch ID %d%s', $batch->getId(), PHP_EOL);
// Step 2: Add directory jobs to batch
foreach ($directories as $directory) {
    try {
        $response = $batch->addJob('/v4/ld/fetch-profile-url', [
            'local-directory' => $directory,
            'business-names'  => 'La Bernardin',
            'country'         => 'USA',
            'city'            => 'New York',
            'postcode'        => '10019'
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
    "yelp",
    "yahoo"
};

Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Batch batch = api.CreateBatch();
Console.WriteLine("Created batch ID {0}", batch.GetId());
foreach (string directory in localDirectories)
{
    Parameters parameters = new Parameters
    {
        { "business-names", "La Bernardin" },
        { "country", "USA" },
        { "city", "New York" },
        { "postcode", "10019" },
        { "local-directory", directory }
    };
    try
    {
        // Add jobs to batch
        dynamic jobResponse = batch.AddJob("/v4/ld/fetch-profile-url", parameters);
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
    "INVALID_BUSINESS_NAMES": "Invalid Business names specified",
    "INVALID_COUNTRY": "Invalid  country  specified",
    "INVALID_CITY": "Invalid  city  specified",
    "INVALID_POSTCODE": "Invalid  postcode  specified",
    "INVALID_LOCAL_DIRECTORY": "Invalid  local directory  specified"
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

> Get Batch Fetch Profile Url Results, Success (200 Ok)

```json
{
  "success": true,
  "results": {
    "LdFetchProfileUrl": [
      {
        "results": [
          {
            "url": null
          }
        ],
        "payload": {
          "business-names": "La Bernardin\nBernardin Cafe\nBernardin restaraunt",
          "country": "USA",
          "city": "New York",
          "postcode": "10019",
          "telephone": "",
          "directory": "google",
          "street-address": "",
          "api-key": "1a08b2e1fd07fa4150f91b80636906a9a29b8e47"
        },
        "status": "Completed",
        "job-id": 605592911
      }
    ]
  },
  "statuses": {
    "Completed": 1
  },
  "status": "Finished"
}
```

Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-profile-url`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
business-names | <span class="label label-required">Required</span> A newline (\n) separated list of possible business names to search for. For example: The Rose Pub Rose Pub The Rose.
country | <span class="label label-required">Required</span>
city | <span class="label label-required">Required</span>
postcode | <span class="label label-required">Required</span>
local-directory | <span class="label label-required">Required</span> See possible options in appendix below.
telephone |
street-address |

Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-profile-url`

### Query Parameters

Parameter | Value | Notes
--------- | ----- | -----
api-key | | <span class="label label-required">Required</span>
batch-id | | <span class="label label-required">Required</span>
local-directory | | <span class="label label-required">Required</span> See possible options in appendix below.
telephone | | <span class="label label-required">Required</span>
search-type | search-by-phone | <span class="label label-required">Required</span>

## Fetch Profile Details (by profile URL)

<span class="label label-info">Batch Method</span>

> Fetch profile details (by profile URL)

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;
use BrightLocal\Exceptions\BatchAddJobException;

$directories = [
    'https://local.google.com/place?id=2145618977980482902&use=srp&hl=en',
    'https://www.yelp.com/biz/le-bernardin-new-york',
];
// setup API wrapper
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
// Step 1: Create a new batch
$batch = $api->createBatch();
printf('Created batch ID %d%s', $batch->getId(), PHP_EOL);
// Step 2: Add directory jobs to batch
foreach ($directories as $directory) {
    try {
        $response = $batch->addJob('/v4/ld/fetch-profile-details', [
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
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Batch batch = api.CreateBatch();
Console.WriteLine("Created batch ID {0}", batch.GetId());
Parameters parameters = new Parameters
    {
        { "profile-url", "https://local.google.com/place?id=2145618977980482902&use=srp&hl=en" },
        { "country", "USA" },
    };
try
{
    // Add jobs to batch
    dynamic jobResponse = batch.AddJob("/v4/ld/fetch-profile-details", parameters);
    Console.WriteLine("Added job with ID {0}", jobResponse["job-id"]);
}
catch (GeneralException exception)
{
    Console.WriteLine(exception.Message);
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
    "INVALID_PROFILE_URL": "Profile Url is not valid"
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

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-profile-details`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
profile-url | <span class="label label-required">Required</span> For requests to fetch Google profile data please use our [Google Link &amp; ID Generator tool](https://www.brightlocal.com/free-local-seo-tools/google-id-and-review-link-generator/) to generate your Google My Business Knowledge Panel URL.
country | <span class="label label-required">Required</span>

## Fetch Profile Details (by business data)

<span class="label label-info">Batch Method</span>

> Fetch profile details (by business data)

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;
use BrightLocal\Exceptions\BatchAddJobException;

$directories = ['google', 'yelp', 'yahoo'];
// setup API wrapper
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
// Step 1: Create a new batch
$batch = $api->createBatch();
printf('Created batch ID %d%s', $batch->getId(), PHP_EOL);
// Step 2: Add directory jobs to batch
foreach ($directories as $directory) {
    try {
        $response = $batch->addJob('/v4/ld/fetch-profile-details-by-business-data', [
            'local-directory' => $directory,
            'business-names'  => 'La Bernardin',
            'country'         => 'USA',
            'city'            => 'New York',
            'postcode'        => '10019'
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
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Batch batch = api.CreateBatch();
Console.WriteLine("Created batch ID {0}", batch.GetId());
List<string> localDirectories = new List<string>
{
    "google",
    "yelp",
    "yahoo"
};
foreach (string directory in localDirectories)
{
    Parameters parameters = new Parameters
    {
        { "business-names", "La Bernardin" },
        { "country", "USA" },
        { "city", "New York" },
        { "postcode", "10019" },
        { "local-directory", directory }
    };
    try
    {
        // Add jobs to batch
        dynamic jobResponse = batch.AddJob("/v4/ld/fetch-profile-details-by-business-data", parameters);
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
    "INVALID_BUSINESS_NAMES": "Invalid Business names specified",
    "INVALID_COUNTRY": "Invalid  country  specified",
    "INVALID_CITY": "Invalid city  specified",
    "INVALID_POSTCODE": "Invalid postcode  specified",
    "INVALID_LOCAL_DIRECTORY": "Invalid local directory specified"
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

This method shortcuts Fetch Profile URL and Fetch Profile Details above by carrying out both in one step. It essentially looks up the URL and then uses that to fetch the profile details.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-profile-details-by-business-data`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
business-names | <span class="label label-required">Required</span> A newline (\n) separated list of possible business names to search for. For example: The Rose Pub Rose Pub The Rose.
country | <span class="label label-required">Required</span>
city | <span class="label label-required">Required</span>
postcode | <span class="label label-required">Required</span>
local-directory | <span class="label label-required">Required</span> See possible options in appendix below.
telephone |
street-address |
