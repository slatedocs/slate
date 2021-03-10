# Offsite SEO

## Offsite SEO

<span class="label label-info">Batch Method</span>

> Fetch offsite SEO information for a website address

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;
use BrightLocal\Exceptions\BatchAddJobException;

$directories = [
    'http://www.gramercytavern.com/',
    'https://bodegawinebar.com/'
];
// setup API wrapper
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
// Step 1: Create a new batch
$batch = $api->createBatch();
printf('Created batch ID %d%s', $batch->getId(), PHP_EOL);
// Step 2: Add directory jobs to batch
foreach ($directories as $directory) {
    try {
        $response = $batch->addJob('/v4/seo/offsite', [
            'website-url' => $directory,
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
List<string> directories = new List<string>
{
    "http://www.gramercytavern.com/",
    "https://bodegawinebar.com/"
};

Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Batch batch = api.CreateBatch();
Console.WriteLine("Created batch ID {0}", batch.GetId());
foreach (string directory in directories)
{
    Parameters parameters = new Parameters
    {
        { "website-url", directory }
    };
    try
    {
        // Add jobs to batch
        dynamic jobResponse = batch.AddJob("/v4/seo/offsite", parameters);
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
