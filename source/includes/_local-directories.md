# Local Directories

## Fetch Profile URL

<span class="label label-info">Batch Method</span>

```csharp
api Api = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
batchApi batchRequest = new batchApi(Api);

// Create a new batch
int batchId = batchRequest.Create();
var parameters = new api.Parameters();
        parameters.Add("batch-id", batchId);
        parameters.Add("business-names", "La Bernardin\nBernardin Cafe\nBernardin restaraunt");
        parameters.Add("country", "USA");
        parameters.Add("city", "New York");
        parameters.Add("postcode", "10019");
        parameters.Add("local-directory", "google");

var jobId = Api.Post("/v4/ld/fetch-profile-url", parameters);

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

// Poll for results. In a real world example you should do this in a backgroud process, such as HangFire,  or use the Task Parallel Library to create a BackGroundWorker Task.
// It is bad practice to use Thread.Sleep(). This is only for the example and will actually freeze the UI until the while loop is finished. 

var results = batchRequest.GetResults(batchId);
dynamic directoryResults = JsonConvert.DeserializeObject(results.Content);

if (directoryResults.success)
{
    while (directoryResults.status != "Stopped" || directoryResults.status != "Finished")
    {
        Thread.Sleep(10000);
        results = batchRequest.GetResults(batchId);
        directoryResults = JsonConvert.DeserializeObject(results.Content);
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

## Fetch Profile URL (Telephone Number Only)

<span class="label label-info">Batch Method</span>

```csharp
api Api = new api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
batchApi batchRequest = new batchApi(Api);

// Create a new batch
int batchId = batchRequest.Create();
var parameters = new api.Parameters();
        parameters.Add("batch-id", batchId);
        parameters.Add("local-directory", "google");
        parameters.Add("telephone", "+1 212-554-1515");
        parameters.Add("search-type", "search-by-phone");

var jobId = Api.Post("/v4/ld/fetch-profile-url", parameters);

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

// Poll for results. In a real world example you should do this in a backgroud process, such as HangFire,  or use the Task Parallel Library to create a BackGroundWorker Task.
// It is bad practice to use Thread.Sleep(). This is only for the example and will actually freeze the UI until the while loop is finished. 

var results = batchRequest.GetResults(batchId);
dynamic directoryResults = JsonConvert.DeserializeObject(results.Content);

if (directoryResults.success)
{
    while (directoryResults.status != "Stopped" || directoryResults.status != "Finished")
    {
        Thread.Sleep(10000);
        results = batchRequest.GetResults(batchId);
        directoryResults = JsonConvert.DeserializeObject(results.Content);
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
   "INVALID_TELEPHONE": "Invalid telephone specified",
   "INVALID_LOCAL_DIRECTORY": "Invalid local directory  specified"
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

> Get Batch Fetch Profile Url (Telephone Number Only) Results, Success (200 Ok)

```json
```

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
profile-url | <span class="label label-required">Required</span> For requests to fetch Google profile data please see [constructing Google URLs](#constructing-google+-urls).
country | <span class="label label-required">Required</span>

## Fetch Profile Details (by business data)

<span class="label label-info">Batch Method</span>

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
