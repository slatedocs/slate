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
### HTTP Request

`GET https://platform-api.productsup.io/platform/v1/sites/123/errors`

### Response fields
Field | Type | Description
------ | -------- | --------------
id | Integer | Internal ID
pid | String | Process ID
error | Integer | Error ID
data | JSON/Array | additional infos about the error
