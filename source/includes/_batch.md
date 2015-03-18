# Batches

A batch acts like a container for API requests. It allows you to group requests for several types of data together and poll for results via a single consolidated call. All bar one of our raw data APIs need to be used within the context of a batch. The basic steps for using a batch are outlined below:

1. Request a new batch ID
2. Add one or more requests for data to the batch
3. Commit the batch
4. Poll for results

## Create

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

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/batch`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | Required
stop-on-job-error | 1 or 0. default 0. If errors are found in one job the batch will be stopped and no further jobs will be processed.

## Commit Batch

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
api-key | Required
batch-id | Required

## Get Results

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
api-key | Required
batch-id | Required

## Delete

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
api-key | Required
batch-id | Required
