# Offsite SEO &amp; Social Profiles

## Offsite SEO

<span class="label label-info">Batch Method</span>

> Fetch offsite SEO information for a website address

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
        } while (!in_array($results['status'], array('Stopped', 'Finished')));
        print_r($results);
    }
}
```

```csharp
api Api = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
batchApi batchRequest = new batchApi(Api);

// Create a new batch
int batchId = batchRequest.Create();

var parameters = new api.Parameters();
parameters.Add("batch-id", batchId);
parameters.Add("website-url", "http://le-bernardin.com");   

var jobId = Api.Post("/v4/seo/offsite", parameters);

if (jobId.ResponseStatus == ResponseStatus.Completed)
{
    dynamic job = JsonConvert.DeserializeObject(jobId.Content);
    if (!job.success)
    {
        string message = "Error adding job";
        var batchException = new ApplicationException(message + job.errors, job.ErrorException);
        throw batchException;
    }
}
else
{
    throw new ApplicationException(jobId.ErrorMessage);
}

// Commit the batch, resturns true or false
bool commit = batchRequest.Commit(batchId);

// Poll for results. In a real world example you should do this in a background process, such as HangFire, or use the Task Parallel Library to create a BackGroundWorker Task.
// It is bad practice to use Thread.Sleep(). This is only for the example and will actually freeze the UI until the while loop is finished. 

var results = batchRequest.GetResults(batchId);
dynamic offsiteResults = JsonConvert.DeserializeObject(results.Content);

if (offsiteResults.success)
{
    while (offsiteResults.status != "Stopped" || offsiteResults.status != "Finished")
    {
        Thread.Sleep(10000);
        results = batchRequest.GetResults(batchId);
        offsiteResults = JsonConvert.DeserializeObject(results.Content);
    }
    return results;
}
else
{
    const string message = "Error Retrieving batch results ";
    var batchException = new ApplicationException(message, results.ErrorException);
    throw batchException;
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

## Social Profiles

<span class="label label-info">Batch Method</span>

> Fetch details of the social profiles a business has

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
        } while (!in_array($results['status'], array('Stopped', 'Finished')));
        print_r($results);
    }
}
```

```csharp
api Api = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
batchApi batchRequest = new batchApi(Api);

// Create a new batch
int batchId = batchRequest.Create();

var parameters = new api.Parameters();
parameters.Add("batch-id", batchId);
parameters.Add("website-url", "http://le-bernardin.com");
parameters.Add("fetch-twitter", "yes");
parameters.Add("fetch-facebook", "yes");
parameters.Add("fetch-foursqaure", "yes");
parameters.Add("business-names", "['Le Bernardin', 'Bernardin Cafe']");
parameters.Add("street-addess", "155 West 51st Street");
parameters.Add("city", "New York");
parameters.Add("state-code", "NY");
parameters.Add("telephone", "+1 212-554-1515");
parameters.Add("postcode", "10019");
parameters.Add("country", "USA");

var jobId = Api.Post("/v4/social/profiles", parameters);

if (jobId.ResponseStatus == ResponseStatus.Completed)
{
    dynamic job = JsonConvert.DeserializeObject(jobId.Content);
    if (!job.success)
    {
        string message = "Error adding job";
        var batchException = new ApplicationException(message + job.errors, job.ErrorException);
        throw batchException;
    }
}
else
{
    throw new ApplicationException(jobId.ErrorMessage);
}

// Commit the batch, resturns true or false
bool commit = batchRequest.Commit(batchId);

// Poll for results. In a real world example you should do this in a background process, such as HangFire, or use the Task Parallel Library to create a BackGroundWorker Task.
// It is bad practice to use Thread.Sleep(). This is only for the example and will actually freeze the UI until the while loop is finished. 

var results = batchRequest.GetResults(batchId);
dynamic socialResults = JsonConvert.DeserializeObject(results.Content);

if (socialResults.success)
{
    while (socialResults.status != "Stopped" || socialResults.status != "Finished")
    {
        Thread.Sleep(10000);
        results = batchRequest.GetResults(batchId);
        socialResults = JsonConvert.DeserializeObject(results.Content);
    }
    return results;
}
else
{
    const string message = "Error Retrieving batch results ";
    var batchException = new ApplicationException(message, results.ErrorException);
    throw batchException;
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
