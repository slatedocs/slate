# Batches

A batch acts like a container for API requests. It allows you to group requests for several types of data together and poll for results via a single consolidated call. All bar one of our raw data APIs need to be used within the context of a batch. The basic steps for using a batch are outlined below:

1. Request a new batch ID
2. Add one or more requests for data to the batch
3. Commit the batch
4. Poll for results

## Create

<span class="label label-info">Batch Method</span>

> Creating a batch

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
$result = $batchApi->create();
if ($result['success']) {
    $batchId = $result['batch-id'];
}
```

```shell
curl -X POST \
    -d 'api-key=<INSERT_API_KEY>' \
    https://tools.brightlocal.com/seo-tools/api/v4/batch
```

> Success - status code 201 Created

```json
{
    "success": true,
    "batch-id": "17"
}
```
       
> Failure

```json
{
    "success": false
}
```

Creates a new batch. You can add jobs to the batch to enable you to fetch different kinds of data.

A batch can have one of 5 states:

* Created - jobs can be added to the batch
* Committed - batch closed for further jobs, no jobs being processed yet
* Running - one or more jobs are being processed
* Stopped - one or more jobs in the batch failed
* Finished

Jobs within a batch can also have one of 5 states:

* Pending - added to batch but not queued for processing
* Queued - added to batch and queued for processing
* Processing - currently being processed by a worker
* Failed - processing failed
* Completed - processing completed successfully and job results are available
* Authentication for this method is via API key only.

Whilst you can technically add as many jobs as you want to a batch we recommend you submit jobs in batches of a few hundred at a time. This will allow you to start receiving results sooner.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/batch`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
stop-on-job-error | 1 or 0. default 0. If errors are found in one job the batch will be stopped and no further jobs will be processed.

## Commit Batch

<span class="label label-info">Batch Method</span>

> Committing a batch

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$batchId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
if ($batchApi->commit($batchId)) {
    echo 'Committed batch successfully.' . PHP_EOL;
}
```

```shell
curl -X PUT \
    -d 'api-key=<INSERT_API_KEY>' \
    -d 'batch-id=<INSERT_BATCH_ID>' \
    https://tools.brightlocal.com/seo-tools/api/v4/batch
```

> Success - status code 200 OK

```json
{
    "success":true
}
```
   
> Failure - status code 400 Bad Request

```json
{
  "success": false,
  "errors" : { "INVALID_JOBS_COUNT":"Batch can't be committed with no jobs" }
}
```

```json
{
  "success": false,
  "errors" : { "BATCH_ALREADY_COMMITTED":"This batch has been committed already" }
}
```

Committing a batch signals that you've finished adding jobs. At this point our systems will start processing the jobs that you've added. Once you commit a batch no further jobs can be added to it.

Authentication for this method is via API key only.

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v4/batch`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>

## Get Results

<span class="label label-info">Batch Method</span>

> Getting batch results

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$batchId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
print_r($batchApi->get_results($batchId));
```

```shell
curl 'https://tools.brightlocal.com/seo-tools/api/v4/batch?api-key=<INSERT_API_KEY>&batch-id=<INSERT_BATCH_ID>'
```

> Success - status code 200 OK

```json
{
  "success": true,
  "status": "Finished",
  "results": {
    "LdFetchProfileUrl": [
      {
        "results": [
          {
            "url": "https://plus.google.com/117512971192208385977/about?hl=en&rfmt=s"
          }
        ],
        "status": "Completed",
        "job-id": 318
      }
    ],
    "LdFetchProfileDetails": [
      {
        "results": [
          {
            "business_name": "Hub Plumbing & Mechanical",
            "street_address": null,
            "postcode": null,
            "region": null,
            "locality": null,
            "address": "Greenwich Village New York, NY",
            "contact_telephone": "+1 917-634-8888",
            "description_present": true,
            "num_photos": 2,
            "star_rating": "4.7",
            "num_reviews": 10,
            "claimed": true,
            "website_url": "http://www.hubplumbingnyc.com/",
            "cid": "117512971192208385977",
            "categories": "Plumber",
            "check_in": null
          }
        ],
        "status": "Completed",
        "job-id": 318
      }
    ]
  },
  "statuses": {
    "Completed": 2
  }
}
```

This retrieves the results of all jobs added to the batch. Results are added as they're returned so you can keep polling this endpoint to retrieve results progressively. Once results for all jobs have been returned the batch will be marked as "Finished".

Authentication for this method is via API key only.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v4/batch`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>

## Delete

<span class="label label-info">Batch Method</span>

> Delete a batch

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$batchId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
if ($batchApi->delete($batchId)) {
    echo 'Successfully deleted batch.' . PHP_EOL;
}
```

```shell
curl -X DELETE 'https://tools.brightlocal.com/seo-tools/api/v4/batch?api-key=<INSERT_API_KEY>&batch-id=<INSERT_BATCH_ID>'
```

> Success - status code 200 Ok

```json
{
    "success": true
}
```
 
> Failure - status code 404 Not Found

```json
{
  "success": false,
  "errors" : { "INVALID_BATCH_ID": "Batch ID not found" }
}
```

Delete a batch. This also deletes all data retrieved for jobs added to the batch.

Authentication for this method is via API key only.

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v4/batch`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>

## Stop Batch

<span class="label label-info">Batch Method</span>

```php
<?php
use BrightLocal\Api;
use BrightLocal\Batches\V4 as BatchApi;

$batchId = 1;
$api = new Api('<INSERT_API_KEY>', '<INSERT_API_SECRET>');
$batchApi = new BatchApi($api);
if ($batchApi->stop($batchId)) {
    echo 'Successfully stopped batch.' . PHP_EOL;
}
```

```shell
curl -X PUT
    -d 'api-key=<INSERT_API_KEY>' \
    -d 'batch-id=<INSERT_BATCH_ID>' \
    https://tools.brightlocal.com/seo-tools/api/v4/batch/stop
```

> Success - status code 200 Ok

```json
{
    "success": true
}
```
 
> Failure - status code 404 Not Found

```json
{
  "success": false,
  "errors" : { "INVALID_BATCH_ID": "Batch ID not found" }
}
```

Cancels a batch midway through processing. Any jobs in the batch that haven't already been processed will also be cancelled.

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v4/batch/stop`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
batch-id | <span class="label label-required">Required</span>
