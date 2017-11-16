# Import History
 
With the endpoint import history, you may query for meta information about the last imports.
<aside class="info">Authentication is not included in the examples, see [Authentication](#authentication)</aside>


## Get
Lists the information about your last imports.
<aside class="info">Import history is always for one site, for more information about querying sites see [Sites](#sites)</aside>


```php
<?php
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey(\Productsup\Platform\Site\Reference::REFERENCE_SITE);
$reference->setValue(123); // site id
$importHistory = new \Productsup\Service\ImportHistory($client);
$importHistory->setReference($reference);
$history = $importHistory->get();
print_r($history);

/*
result will look like this:
Array
(
    [0] => Productsup\Platform\ImportHistory Object
        (
            [id] => 1111111111
            [site_id] => 123
            [import_time] => 2015-07-15 15:02:11
            [product_count] => 18370
            [links:protected] => Array
                (
                    [site] => http://api.productsup.com/platform/v1/sites/123
                )

            [reference:protected] => 
        )

)
*/
```

```shell
# requesting one site by its ID
curl https://platform-api.productsup.io/platform/v1/sites/123/importhistory


```
    
```shell    
response: 
{
    "success": true,
    "Sites": [{
                "id": "11111111",
                "site_id": 1234,
                "import_time": "2015-01-01 11:22:33",
                "product_count": "18370",
                "links": [...]
            },
            ...
    ]
}
```
### HTTP Request
`GET https://platform-api.productsup.io/platform/v1/sites/<siteId>/importhistory`

### URL parameters
Field | Type | Description
------ | -------- | --------------
siteID | integer | Site to list import history for

### Response fields
Field | Type | Description
------ | -------- | --------------
status | boolean | Indicates request status
Sites | array | List of [imports](#importhistory-response-site)

#### <a name="importhistory-response-site"></a> Site fields
Field | Type | Description
------ | -------- | --------------
id | integer | Internal ID
site_id | integer | ID of the referenced site
import_time | date | Date of the import
product_count | integer | Total amount of imported products
links | array | List of [relevant resources](#importhistory-response-links)

#### <a name="importhistory-response-links"></a> Links fields and values
Name | Description
--- | ---
site | Link to [site](#sites-request-by-id)

<aside class="notice">Creating and deleting import history are not available.</aside>
