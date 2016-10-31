# Reviews

## Fetch Reviews (by profile URL)

<span class="label label-info">Batch Method</span>

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
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
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
        } while (!in_array($results['status'], array('Stopped', 'Finished')));
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
profile-url | <span class="label label-required">Required</span> For requests to fetch Google reviews please see [constructing Google URLs](#constructing-google+-urls).
country | <span class="label label-required">Required</span>
sort | 'rating' or 'date'. By default 'date'.
reviews-limit | Positive number or 'all'. By default 250.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.

## Fetch Reviews (by business data)

<span class="label label-info">Batch Method</span>

> Fetch reviews for a business using business data

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
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
        } while (!in_array($results['status'], array('Stopped', 'Finished')));
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
reviews-limit | Positive number or 'all'. By default 250.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.
