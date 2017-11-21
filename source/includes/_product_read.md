# Product Data (Read)

## Get

```shell
curl  https://platform-api.productsup.io/product/v2/site/123/stage/intermediate/
    ?filter=id+%3C%3E+%27%27
    &limit=5000
    &offset=0
    &fields%5B0%5D=id
    &fields%5B1%5D=gtin
    &hidden=0
```

```shell
{
    "success": true,
    "products": [{
        "id": "123",
        "gtin": "42"
    }]
}
```

```php
<?php
$productData = new \Productsup\Service\ProductData($client);
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey(\Productsup\Platform\Site\Reference::REFERENCE_SITE);
$reference->setValue(123); // site id
$productData->setReference($reference);

$query = new \Productsup\Query();
$query->fields = array(
    'id',
    'gtin'
);

$query->filter = "id <> ''";
$query->limit = 5000;
$query->offset = 0;

$products = $productData->get(
    \Productsup\Service\ProductData::STAGE_INTERMEDIATE,
    0,
    $query
);
```

```php
result:
Array
(
    [success] => 1
    [products] => Array
        (
            [0] => Array
                (
                    [id] => 123
                    [gtin] => 42
                )
        )
)
```

### HTTP Request - Get product data
`GET https://platform-api.productsup.io/product/v2/site/<siteId>/stage/<stageName>/<stageId>?limit=<limit>&ofset=<offset>&fields=<fields>&hidden=<hidden>&filter=<filter>`

#### <a name="product-read-request-url-parameters"></a> URL parameters
Field | Type | Description
--- | --- | ---
siteId | integer | Site identifier
stageName | integer | [Stage name](#product-read-request-stage-name)
stageId | integer | Stage id, set to 0 for stages _import_ and _intermediate_

#### <a name="product-read-request-stage-name"></a> Stage names
The table below represents the processing stages in which the product data is 
available. Each stage can add transformations and filters on product data. 
_Export_ and _channel_ are quite similar in their use. However we no longer use
new exports, we only create new channels.

Name | Stage description
--- | ---
import | Directly after importing the product data from an API upload
intermediate | Generic transformations, always required for all product data, may be applied
export | Specific export transformations are applied 
channel | Specific channel transformations are applied 

#### Query fields
The query fields allow a more precise control over the product data being 
returned. Certain requirements and filters can be set, as well as functionality
to paginate through long result sets.

Name | Type | Default | Description
--- | --- | --- | ---
limit | integer | 5000 | Maximum number of products
offset | integer | 0 | Offset for querying products
fields | array | all fields | Array of fields to select
hidden | numeric boolean (0 or 1) | 0 | If set to _1_ also hidden fields (fields that are not exported) are included
filter | string | none | Condition to filter for, in [SQL syntax](http://www.tutorialspoint.com/sql/sql-operators.htm)

### Response body fields
Field | Type | Description
--- | --- | ---
success | boolean | Indicates request status
products | array | List of product data, at least containing and id column

```php
<?php
// see Product Data write for more info
$ProductService = new Productsup\Service\ProductData($Client);
$Reference = new Productsup\Platform\Site\Reference();

$productData = new \Productsup\Service\ProductData($client);
$reference = new \Productsup\Platform\Site\Reference();
$reference->setKey(\Productsup\Platform\Site\Reference::REFERENCE_SITE);
$reference->setValue(123); // site id
$productData->setReference($reference);
$metaData = $productData->getProperties(\Productsup\Service\ProductData::STAGE_INTERMEDIATE,0);
/** response: 
Array (
      [success] => 1
      [columns] => Array
          (
              [0] => id
              [1] => gtin
              [2] => price
              ...
          )
      [products] => 42
  )

*/
```

```shell
curl https://platform-api.productsup.io/product/v2/site/123/stage/intermediate/0/properties/
```
```shell
result: 
{
    "success": true,
    "columns": ["id", "gtin", "price", ...],
    "products": 42
}
```

### HTTP Request - Get product data properties 
`GET https://platform-api.productsup.io/product/v2/site/<siteId>/stage/<stageName>/<stageId>/properties`

#### URL parameters
See [url parameters](#product-read-request-url-parameters)

### Response body fields
Field | Type | Description
--- | --- | ---
success | boolean | Indicates request status
columns | array | Columns of the data set
products | integer | Total amount of products in data set
