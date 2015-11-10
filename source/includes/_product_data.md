# Product Data (Read)

## URL
The URL for fetching properties looks like this:

`/product/v1/site/{site id}/stage/{name of stage}/{stage id}/{action}`

`/product/v1/site/123/stage/intermediate/0/properties/`

It consists of the folowing parts:

name | example | description
---- | ------- | -----------
site_id | `sites/123`| the entity the upload is related to, see [sites](#sites).
stage | `stage/intermediate` | one of `import`, `intermediate`,`export` or `channel`
stage_id | `0` or `321` | 0 for import and intermediate, channel_id for [channels](#channels), export_id for exports.
action | empty for queries, or `properties` | see [properties](#properties) or [query](#query) 


## Properties
The properties endpoint provides some meta data about the queried dataset

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
curl https://platform-api.productsup.io/product/v1/site/123/stage/intermediate/0/properties/
```
```shell
result: 
{
    "success": true,
    "columns": ["id", "gtin", "price", ...],
    "products": 42
}
```

field | type | description
----- | ---- | -----------
columns | Array | Columns of the dataset
products | Integer | Count of products in dataset

## Query

```shell
curl  https://platform-api.productsup.io/product/v1/site/123/stage/intermediate/
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

$productData->setReference($reference);

$query = new \Productsup\Query();
$query->fields = array(
    'id',
    'gtin'
);

$query->filter = "id <> ''";
$query->limit = 5000;
$query->offset = 0;

$products = $productData->get(\Productsup\Service\ProductData::STAGE_INTERMEDIATE,0,$query);
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

Querying product data allows to search for products withing the provided stage

name | example | default | description
---- | ------- | ------- | -----------
limit | `50` | `5000` | maximum number of data
offset | `50` | `0` |  offset for querying data
fields | `id` | all fields |  array of fields
hidden | `1` | `0` | if set to `1` also hidden fields (fields that are not exported) are included
filter | `id=123` | none | condition to filter for, in [SQL syntax](http://www.tutorialspoint.com/sql/sql-operators.htm)
