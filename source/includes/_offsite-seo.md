# Offsite SEO &amp; Social Profiles

## Offsite SEO <span class="label label-info">Batch Method</span>

> Fetch offsite SEO information for a website address

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
        $result = $api->call('/v4/seo/offsite', array(
            'batch-id'        => $batchId,
            'website-url'     => 'http://www.gramercytavern.com/'
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
    "INVALID_BATCH_ID": "Batch ID not found",
    "INVALID_WEBSITE_URL": "Website URL missing"
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

This API method returns offsite SEO information domain age, hosting location, number of pages indexed and authority. Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/seo/offsite`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
website-url | <span class="label label-required">Required</span> URL of the business web site. Can be specified with or without http(s).

## Social Profiles <span class="label label-info">Batch Method</span>

> Fetch details of the social profiles a business has

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
        $result = $api->call('/v4/social/profiles', array(
            'batch-id'         => $batchId,
            'website-url'      => 'http://www.gramercytavern.com/',
            'fetch-twitter'    => 'yes',
            'fetch-facebook'   => 'yes',
            'fetch-foursquare' => 'yes',
            'business-names'   => '["Gramercy Tavern"]',
            'street-address'   => '42 E 20th St',
            'city'             => 'New York',
            'state-code'       => 'NY',
            'telephone'        => '(212) 477-0777',
            'postcode'         => '10003',
            'country'          => 'USA'
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
    "INVALID_WEBSITE_URL": "Website URL missing",
    "INVALID_CITY": "City missing",
    "INVALID_COUNTRY": "Country missing",
    "INVALID_BUSINESS_NAMES": "Business name(s) missing"
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

This API method returns details of the social profiles a business has on Twitter, Facebook and Foursquare. Authentication for this method is via API key only.

Please Note: Address and telephone fields are mostly optional but the more information you provide the more likely that we'll return correct matches for your business.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/social/profiles`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
website-url | <span class="label label-required">Required</span> URL of the business website. Can be specified with or without http(s).
fetch-twitter | yes or no. Defaults to no. Fetch Twitter profile for the business if available.
fetch-facebook | yes or no. Defaults to no. Fetch Facebook profile for the business if available.
fetch-foursquare | yes or no. Defaults to no. Fetch Foursquare profile for the business if available.
business-names | <span class="label label-required">Required</span> A JSON encoded string of business names, e.g. ["Delmonico's","Delmonico's Restaurant"]
street-address |
city | <span class="label label-required">Required</span>
state-code | <span class="label label-required">Required</span> (USA only). A valid two letter state code, e.g. CA.
telephone |
postcode | A valid ZIP or postal code.
country | <span class="label label-required">Required</span> Valid 3 letter ISO code. e.g, USA, GBR, CAN.
follow-mode | This determines how our crawler extracts information from your website. We crawl your website to help us identify Twitter, Facebook and Foursquare profile information.<ol><li>Only follow links that lead to the same root domain (e.g. foo.brightlocal.com and bar.brightlocal.com).</li><li>Only follow links that lead to the same domain (e.g. www.brightlocal.com). This is the default.</li><li>Only follow links that lead to pages under the same path as that specified in website-url.</li></ul>
