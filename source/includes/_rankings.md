# Rankings

## Search

<span class="label label-info">Batch Method</span>

> Fetch rankings

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$searches = array(
    array(
        'search-engine'   => 'google',
        'country'         => 'USA',
        'google-location' => 'New York, NY',
        'search-term'     => 'restaurant new york',
        'urls'            => '["le-bernardin.com"]',
        'business-names'  => 'Le Bernardin'
    ),
    array(
        'search-engine'   => 'google',
        'country'         => 'USA',
        'google-location' => 'New York, NY',
        'search-term'     => 'restaurant manhattan',
        'urls'            => '["le-bernardin.com"]',
        'business-names'  => 'Le Bernardin'
    ),
    array(
        'search-engine'   => 'google',
        'country'         => 'USA',
        'google-location' => 'New York, NY',
        'search-term'     => 'restaurant 10019',
        'urls'            => '["le-bernardin.com"]',
        'business-names'  => 'Le Bernardin'
    )
);
$api = new Api(API_KEY, API_SECRET, API_ENDPOINT);
$batchApi = new BatchApi($api);
$batchId = $batchApi->create();
if ($batchId) {
    printf('Created batch ID %d%s', $batchId, PHP_EOL);
    foreach ($searches as $search) {
        $result = $api->call(
            '/v4/rankings/search',
            array_merge(
                $search, array('batch-id' => $batchId)
            )
        );
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
    "job-id": "1"
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

> Failure (500 Internal Server Error)

 ```json
{
    "success": false,
    "reason": "Unable to add job"
}
```

This API method allows you to retrieve search ranking (and listing data) from the major search engines and their local variants, namely Google, Google Maps, Yahoo!, Yahoo! Local, Bing and Bing Maps. It works for the USA, United Kingdom, Canada and Australia. The only exception is in Australia where Yahoo! Local is not supported.

This method needs to be used in conjunction with the [batch methods](#batches) described above.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rankings/search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
search-engine | <span class="label label-required">Required</span> One of google, google-places, yahoo, yahoo-local, bing, bing-local.
country | <span class="label label-required">Required</span> Determines whether or not to search against .com, .ca, co.uk, .com.au search engines. One of USA, CAN:EN, CAN:FR, GBR, AUS, IRL or NZL.
google-location | Allows you to optionally localize results by specifying your physical location. Specify a ZIP, city name or region. Only applicable to US searches. Also see [Check Location](#check-location) method.
bing-location | Allows you to optionally localize results by specifying your physical location. See [Check Location](#check-location) method.
search-term | <span class="label label-required">Required</span> The search term to get ranking information for.
urls | The URLs to get ranking information for. Encode as a JSON string, e.g. \["www.bluehillfarm.com", "www.candle79.com", "shabutatsu.com", "marea-nyc.com", "www.taorestaurant.com"\] (max 10).
business-names | A list of possible business names to search for. Encode as a JSON string, e.g. ["The Rose Pub","Rose Pub","The Rose"]. For backwards compatibility this also supports a newline (\n) separated list.
postcode | A valid ZIP or country postal code.
telephone | A valid telephone number.
include-secondary-matches | Determines whether or not to include results matched by name, telephone and/or ZIP/postal code. One of yes or no. This should be used in conjunction with the postal and telephone parameters.
listings | Include details of all SERPs returned, not just the matches. Defaults to "no". Accepts "yes" or "no". The default is "no".
screenshots | Determines whether or not to generate SERP screenshots and include the links to those screenshots in the response. Accepts "yes" or "no". The default is "no".

<aside class="notice">
    By default we return 5 pages or 50 results (whichever is lower). If you need more than this please contact us. We can increase to a maximum of 10 pages or 100 results on a case by case basis.
</aside>

## Bulk Search

<span class="label label-info">Batch Method</span>

> Fetch rankings

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$searches = array(
    'restaurant new york',
    'restaurant manhattan',
    'restaurant 10019'
);
$api = new Api(API_KEY, API_SECRET, API_ENDPOINT);
$batchApi = new BatchApi($api);
$batchId = $batchApi->create();
if ($batchId) {
    printf('Created batch ID %d%s', $batchId, PHP_EOL);
    foreach ($searches as $search) {
        $result = $api->call(
            '/v4/rankings/bulk-search',
            array(
                'batch-id' => $batchId,
                'search-engine'   => 'google',
                'country'         => 'USA',
                'google-location' => 'New York, NY',
                'search-term'     => $search,
                'urls'            => '["le-bernardin.com"]',
                'business-names'  => 'Le Bernardin'
            )
        );
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
    "job-ids": ["1", "2","3"]    
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

> Failure (500 Internal Server Error)

 ```json
{
    "success": false,
    "reason": "Unable to add job(s)"
}
```

This method works the same as the [search](#search) method above except it allows you to submit up to 100 search terms in one request. Use this when you want to look up rankings for many hundreds or thousands of search terms.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rankings/bulk-search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
search-engine | <span class="label label-required">Required</span> One of google, google-places, yahoo, yahoo-local, bing, bing-local.
country | <span class="label label-required">Required</span> Determines whether or not to search against .com, .ca, co.uk, .com.au search engines. One of USA, CAN:EN, CAN:FR, GBR, AUS, IRL or NZL.
google-location | Allows you to optionally localize results by specifying your physical location. Specify a ZIP, city name or region. Only applicable to US searches. Also see [Check Location](#check-location) method.
bing-location | Allows you to optionally localize results by specifying your physical location. See [Check Location](#check-location) method.
search-terms | <span class="label label-required">Required</span> Encode as a JSON string, e.g. \["restaurant new york", "restaurant", "cafe"\] (max 100).
urls | The URLs to get ranking information for. Encode as a JSON string, e.g. \["www.bluehillfarm.com", "www.candle79.com", "shabutatsu.com", "marea-nyc.com", "www.taorestaurant.com"\] (max 10).
business-names | A list of possible business names to search for. Encode as a JSON string, e.g. ["The Rose Pub","Rose Pub","The Rose"]. For backwards compatibility this also supports a newline (\n) separated list.
postcode | A valid ZIP or country postal code.
telephone | A valid telephone number.
include-secondary-matches | Determines whether or not to include results matched by name, telephone and/or ZIP/postal code. One of yes or no. This should be used in conjunction with the postal and telephone parameters.
listings | Include details of all SERPs returned, not just the matches. Defaults to "no". Accepts "yes" or "no". The default is "no".
screenshots | Determines whether or not to generate SERP screenshots and include the links to those screenshots in the response. Accepts "yes" or "no". The default is "no".

<aside class="notice">
    By default we return 5 pages or 50 results (whichever is lower). If you need more than this please contact us. We can increase to a maximum of 10 pages or 100 results on a case by case basis.
</aside>

## Check Location

> Location Found (200 OK)

```json
{
    "success": true,
    "response": true
}
```
 
> Location Not Found (200 OK)

```json
{
    "success": true,
    "response": false
}
```
 
> Suggestions (Bing only) (200 OK)

```json
{
    "success": true,
    "response": [
        "lat:40.7145500183105|long:-74.0071182250977|New York, NY",
        "lat:39.6849212646484|long:-93.9093475341797|New York, MO",
        "lat:32.1684989929199|long:-95.669189453125|New York, TX"
    ]
}
```

Look up a location that's suitable for use when setting Google or Bing location whilst performing a search using the method above. This method is deprecated for use with Google as there's no longer any need to check if the location you want to set is valid.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/rankings/check-location`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
search-engine | <span class="label label-required">Required</span> One of google or bing.
country| One of USA, CAN, GBR, AUS, IRL or NZL.
location | e.g. postcode/ZIP, city and state code
