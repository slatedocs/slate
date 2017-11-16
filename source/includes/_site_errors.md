# Site Errors
 
With site errors, you can see the last errors or add new custom errors for a site.
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication)</aside>


## Get
To list errors for one site, you can use get. See [Sites](#sites) for how to identify sites.

```php
<?php
$site = new \Productsup\Platform\Site();
$site->id = 123;

$errorService = new \Productsup\Service\Errors($client);
$errorService->setSite($site);

// optional params
$errorService->setParam('pid','abc456def');
$errorService->setParam('limit',1);
$errorService->setParam('offset',2);


$result = $errorService->get();

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\Error Object
        (
            [id] => 123
            [pid] => abd456
            [error] => 10081
            [data] => 
            [links:protected] => ...
        )

    [1] => Productsup\Platform\Error Object
        (
            [id] => 124
            [pid] => 537df1d87c39c
            [error] => 10012
            [data] => {"FTP Host":"sftp:\/\/example.org","User":"sftpuser"}
            [links:protected] => ...
        )
...
*/
```

```shell
# requesting all channels of one site
curl https://platform-api.productsup.io/platform/v1/sites/123/errors
ls/321
```
    
```shell    
response: 
{{
     "success": true,
     "Errors": [{
                 "id": "1802017",
                 "pid": "537cb0659a7dc",
                 "error": "10012",
                 "data": "{"FTP Host":"sftp:\/\/example.org","User":"sftpuser"}",
                 "site_id": "123",
                 "links": [{...}]
                 }, ....
```
### <a name="siteerrors-request"></a> HTTP Request

`GET https://platform-api.productsup.io/platform/v1/sites/<siteId>/errors`

`GET https://platform-api.productsup.io/platform/v1/sites/<siteid>/errors?pid=<pid>&limit=<limit>&offset=<offset>`

### URL parameters
Name | Type | Description
----- | -------| -----------
siteId | integer | Site to get the errors for

### Optional query parameters
Name | Example | Default | Description
----- | ------- | ------- | -----------
pid | `abc456def` | (latest) | Process id, by default the latest process is shown
limit | `10` | `50` | Maximum number of results
offset | `20` | `0` | Results begin at this position

### <a name="siteerrors-response"></a> Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
Errors | array | List of [errors](#siteerrors-response-error)

#### <a name="siteerrors-response-error"></a> Error fields
Field | Type | Description
------ | -------- | --------------
id | integer | Internal identifier
pid | string | Process identifier
error | integer | Error identifier
data | array | Additional information about the error
site_id | integer | Site identifier
links | array | List of  [relevant resources](#siteerrors-response-link)

#### <a name="siteerrors-response-link"></a> Links fields and values
Name | Description
--- | ---
self | Link to the [error endpoint](#siteerrors-request)

## Create
To create a new error (information) for one site, you can use a POST request (or the insert method).

```shell
 curl 
    -d '{"pid":"abd456def","error":123,"data":{"foo":"bar"}}' 
    https://platform-api.productsup.io/platform/v1/sites/123/errors


# result:
{
    "success": true,
    "Errors": [{
        "id": 42,
        "pid": "abc456def",
        "error": 123,
        "data": "{\"foo\":\"bar\"}",
        "site_id": 123,
        "links": [...]
    }]
}
```

```php
<?php
$site = new \Productsup\Platform\Site();
$site->id = 123;
$errorService = new \Productsup\Service\Errors($client);
$errorService->setSite($site);
$result = $errorService->get();

$error = new \Productsup\Platform\Error();
$error->pid = 'something';
$error->error = 123;
$error->data = ['foo' => 'bar'];
$result = $errorService->insert($error);
print_r($result);

/**
Productsup\Platform\Error Object
(
    [id] => 42
    [pid] => something
    [error] => 123
    [data] => {"foo":"bar"}
    [links:protected] => ...
)
*/

```

### HTTP Request

`POST https://platform-api.productsup.io/platform/v1/sites/<siteId>/errors`

### URL parameters
Name | Type | Description
----- | -------| -----------
siteId | integer | Site to which the error will be added

#### HTTP headers
Name | Description
--- | ---
Content-Type | application/json

The data to insert has to be provided as a JSON-Object.

#### Request body parameters
Field | Type | Description
------ | -------- | --------------
pid | string | Process identifier
error | integer | Error id, this should be a valid identifier according to our error codes
data | array | Additional information about the error

### Response fields
See [response fields](#siteerrors-response)

#### Error fields
See [error fields](#siteerrors-response-error)

#### Link fields and values
See [link fields](#siteerrors-response-link)
