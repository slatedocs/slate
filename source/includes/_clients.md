# Clients

## Add Client

<span class="label label-info">Account Method</span>

> Creating a Client

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->post('/v1/clients-and-locations/clients', [
    'name'        => 'Le Bernardin',
    'company-url' => 'le-bernardin.com'
]);
print_r($response->getResult());
```

```shell
curl -X POST \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'name=Le Bernardin' \
 -d 'company-url=le-bernardin.com' \
 https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
    {
        { "name", "Le Bernardin" },
        { "company-url", "le-bernardin.com" }
    };
Response response = api.Post("/v1/clients-and-locations/clients", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "success": true,
    "client-id": 1
}
```

Adds a new client and associates it with your account.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | <span class="label label-required">Required</span> 50 characters max.
company-url | <span class="label label-required">Required</span> 150 characters max
reference-number | An arbitrary unique reference you can use to identify a client. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.

## Update Client

<span class="label label-info">Account Method</span>

Update an existing client. Only supply values you want to update. The rest will be left unchanged.

> Update a Client

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$clientId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->put('/v1/clients-and-locations/clients/' . $clientId, [
    'name'        => 'Le Bernardin',
    'company-url' => 'le-bernardin.com'
]);
print_r($response->getResult());
```

```shell
curl -X PUT \
 -d 'api-key=<INSERT_API_KEY>' \
 -d 'sig=<INSERT_API_SIG>' \
 -d 'expires=<INSERT_API_EXPIRES>' \
 -d 'name=Le Bernardin' \
 -d 'company-url=le-bernardin.com' \
   https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/<client_id>
```

### Update a client

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters
    {
        { "name", "Le Bernardin" },
        { "company-url", "le-bernardin.com" }
    };
Response response = api.Put("/v1/clients-and-locations/clients/" + clientId, parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "success": true,
    "client-id": 1
}
```

### HTTP Request

`PUT https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/<client_id>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
name | 50 characters max
company-url | 150 characters max
reference-number | An arbitrary unique reference you can use to identify a client. This may correspond to a unique value used within your system and can be useful when importing or exporting data. 50 characters max.

## Delete Client

<span class="label label-info">Account Method</span>

> Delete a Client

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$clientId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->delete('/v1/clients-and-locations/clients/' . $clientId);
var_dump($response->getResult());
if ($response->isSuccess()) {
    echo 'Successfully deleted client.' . PHP_EOL;
}
```

```csharp
int clientId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters { };
Response response = api.Delete("/v1/clients-and-locations/clients/" + clientId, parameters);
if (response.IsSuccess())
{
    Console.WriteLine("Successfully deleted client");
}
else
{
    Console.WriteLine(response.GetContent());
}
```

> Success (200 OK)

```json
{
    "success": true
}
```

Delete an existing client. If there are reports associated with this client then the association is removed but the reports are not deleted. Warning: This action cannot be undone.

### HTTP Request

`DELETE https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/<client_id>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>

## Get Client

<span class="label label-info">Account Method</span>

> Get a Client

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$clientId = 1;
$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v1/clients-and-locations/clients/' . $clientId);
print_r($response->getResult());
```

```csharp
int clientId = 1;
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Response response = api.Get("/v1/clients-and-locations/clients/" + clientId);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "success": true,
    "client": {
        "client-id":1,
        "company-name": "BrightLocal",
        "status": "client",
        "client-reference": "BrightLocal-1"
    }
}
```

Get extended details for a specific client.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/<clientId>`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
client-id | <span class="label label-required">Required</span>

## Search Clients

<span class="label label-info">Account Method</span>

> Search for a client

```php
<?php
require '../../vendor/autoload.php';

use BrightLocal\Api;

$api = new Api('<YOUR_API_KEY>', '<YOUR_API_SECRET>');
$response = $api->get('/v1/clients-and-locations/clients/search', [
    'q' => 'BrightLocal'
]);
print_r($response->getResult());
```

```shell
curl -X GET 'https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/search?api-key=<INSERT_API_KEY>&sig=<INSERT_API_SIG>&expires=<INSERT_API_EXPIRES>&q=My+Sample+Query'
```

```csharp
Api api = new Api("<INSERT_API_KEY>", "<INSERT_API_SECRET>");
Parameters parameters = new Parameters {
       { "q", "BrightLocal" }
};
Response response = api.Get("/v1/clients-and-locations/clients/search", parameters);
Console.WriteLine(response.GetContent());
```

> Success (200 OK)

```json
{
    "success": true,
    "clients":  [
        {
            "client-id": 1,
            "company-name": "BrightLocal",
            "status": "client",
            "client-reference": "BrightLocal-1"
        },
        {
            "client-id": 2,
            "company-name": "BrightLocal 2",
            "status": "client",
            "client-reference": "BrightLocal-2"
        }
    ]
}
```

Search for clients matching a specified search string.

### HTTP Request

`GET https://tools.brightlocal.com/seo-tools/api/v1/clients-and-locations/clients/search`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | <span class="label label-required">Required</span>	
sig | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
expires | <span class="label label-required">Required</span> [See above for how to generate signature and expires values.](#authentication)
q | <span class="label label-required">Required</span>
