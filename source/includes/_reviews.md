# Reviews

## Fetch Reviews (by profile URL) <span class="label label-info">Batch Method</span>

> Fetch reviews for 3 Google+ profile URLs

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$profileUrls = array(
    'https://plus.google.com/114222978585544488148/about?hl=en',
    'https://plus.google.com/117313296997732479889/about?hl=en',
    'https://plus.google.com/111550668382222753542/about?hl=en'
);
$api = new Api(API_KEY, API_SECRET, API_ENDPOINT);
$batchApi = new BatchApi($api);
$batchId = $batchApi->create();
if ($batchId) {
    printf('Created batch ID %d%s', $batchId, PHP_EOL);
    foreach ($profileUrls as $profileUrl) {
        $result = $api->call('/v4/ld/fetch-reviews', array(
            'batch-id'    => $batchId,
            'profile-url' => $profileUrl,
            'country'     => 'USA'
        ));
        if ($result['success']) {
            printf('Added job with ID %d%s', $result['job-id'], PHP_EOL);
        }
    }
    if ($batchApi->commit($batchId)) {
        echo 'Committed batch successfully.'.PHP_EOL;
        // poll for results, in a real world example you might
        // want to do this in a separate process (such as via an
        // AJAX poll)
        do {
            $results = $batchApi->get_results($batchId);
            sleep(10); // limit how often you poll
        } while ($results['status'] !== 'Finished');
        print_r($results);
    }
}
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
profile-url | <span class="label label-required">Required</span>
country | <span class="label label-required">Required</span>
sort | 'rating' or 'date'. By default 'date'.
reviews-limit | Positive number or 'all'. By default 250.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.

## Fetch Reviews (by business data) <span class="label label-info">Batch Method</span>

> Fetch reviews for a business using business data

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$api = new Api(API_KEY, API_SECRET, API_ENDPOINT);
$batchApi = new BatchApi($api);
$batchId = $batchApi->create();
if ($batchId) {
    printf('Created batch ID %d%s', $batchId, PHP_EOL);
    foreach ($profileUrls as $profileUrl) {
        $result = $api->call('/v4/ld/fetch-reviews-by-business-data', array(
            'batch-id'        => $batchId,
            'business-names'  => 'Le Bernardin',
            'city'            => 'New York',
            'postcode'        => '10019',
            'street-address'  => '155 W 51st St',
            'local-directory' => 'google',
            'country'         => 'USA',
            'telephone'       => '(212) 554-1515'
        ));
        if ($result['success']) {
            printf('Added job with ID %d%s', $result['job-id'], PHP_EOL);
        }
    }
    if ($batchApi->commit($batchId)) {
        echo 'Committed batch successfully.'.PHP_EOL;
        // poll for results, in a real world example you might
        // want to do this in a separate process (such as via an
        // AJAX poll)
        do {
            $results = $batchApi->get_results($batchId);
            sleep(10); // limit how often you poll
        } while ($results['status'] !== 'Finished');
        print_r($results);
    }
}
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
reviews-limit | Positive number or 'all'. By default 250.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.
