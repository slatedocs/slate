# Product Data (Write)

## Uploading
```shell
curl -d '[{
   "id": 123,
   "title": "test title",
   "price": 1.23
}, {
   "id": 124,
   "title": "next title",
   "price": 3.21,
   "shipping": "0.99"
}]'
https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/md5string32chars/upload
```

```php
<?php
// our php client builds the urls for you, but you have to set the info in the classes:
$ProductService = new Productsup\Service\ProductData($Client);
$Reference = new Productsup\Platform\Site\Reference();

/**
 * You have to specify the site the products belong to.
 * This is done by references to the site.
 **/
// In case you have a productsup site id, you can pass it like this:
$Reference->setKey($Reference::REFERENCE_SITE);
$Reference->setValue(123); // Site ID

// In case you have a custom reference, you can use the follow logic
$Reference->setKey($siteTagName);
$Reference->setValue($siteTagValue);

// Assign the reference to the endpoint class
$ProductService->setReference($Reference);

// Actual creating of upload data
$ProductService->insert(array(
        'id' => 123,
        'price' => 1.23,
        'description' => 'test title',
    )
);

$ProductService->insert(array(
        'id' => 124,
        'price' => 3.21,
        'description' => 'next title',
        'shipping' => 0.99
    )
);
```

Uploading to the API works via batches. A batch is a collection of products,
potentially delivered by multiple requests. The batch can, once all product 
data is delivered, be committed or discarded. 

### HTTP Request
`POST https://platform-api.productsup.io/platform/v1/sites/<siteIdentifier>/products/<batchId>/upload`

#### <a name="product-write-request-url-parameters"></a> URL parameters
Field | Type | Description
------ | -------- | --------------
siteIdentifier | mixed | Either a [siteId or siteTags](#product-write-request-site-identifier)
batchId | string (32 characters) | Any sequence of characters which indicate a unique batch. It should be exactly 32 characters long. A possible idea is to generate a unique number and then hash it with the md5 algorithm.

#### <a name="product-write-request-site-identifier"></a> Site identifier values
Type | Data type | Description
------ | -------- | --------------
siteId | integer | Using a site identifier (numeric value)
siteTags | string (format: `tagName:tagValue`) | A combination of a tag name and tag value for a site, see also [site tags]()

#### <a name="product-write-request-http-headers"></a> HTTP headers
Name | Value
--- | ---
Content-Type | application/json

The data to be inserted has to be provided as a JSON-Object.

### Product format

When uploading products the following rules apply:

- Columns can be named freely, but ideally should be in lowercase and not contain any spaces or special characters. Our technology relies on SQLite databases so that's where our limits lie.
- When columns are added:
 - Existing data will have an empty value for these columns.
- When columns are not uploaded (removed):
 - If any existing data has a value for that column, it will remain and the new data will just have an empty value.
 - If no existing data has a value, that column will be automatically removed.
- The amount of products per upload request is limited to 10000. We recommend sending multiple upload requests with the same batch id, if you reach this limit.

<aside class="notice">The key `id` is mandatory, all other keys end up as columns.</aside>

A list of example product data:

id | title | price | shipping | pup:isdeleted
--- | --- | --- | --- | ---
123 | my first product | 1.23 | | 
124 | my second product | 3.21 | 0.99 | 
125 | my other product | 5.99 | - | 1 

### Deleting products

```shell
curl -d '[{
    "id": 124,
    "pup:isdeleted": 1
}]'
https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/md5string32chars/upload
```

```php
<?php
$ProductService->delete(array(
        'id' => 123,
    )
);
```

Deleting products can be achieved either by:

- Sending a *full* upload, this will override all existing data
- Or when using a *delta* upload, add a column _pup:isdeleted_: and set it's value to 1 for products that should be deleted.

## Committing

```shell
curl -d '{"type":"full"}'
https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/md5string32chars/commit
```

```php
<?php
$productsService->setImportType(\Productsup\Service\ProductData::TYPE_DELTA);
// OR
$productsService->setImportType(\Productsup\Service\ProductData::TYPE_FULL);

// note: if you do not define the type the "full" is used as default

$result = $ProductService->commit();
```

Once you are finished with uploading all product data, you can start the processing 
of the data. This is done batch by batch, so it's advisable to use one batch ID
per upload (even if it consists of multiple upload requests).

### HTTP Request
`POST https://platform-api.productsup.io/platform/v1/sites/<siteIdentifier>/products/<batchId>/commit`

#### URL parameters
See [url parameters](#product-write-request-url-parameters)

#### HTTP Headers
See [HTTP headers](#product-write-request-http-headers)

#### Request body fields
Field | Type | Description
------ | -------- | --------------
type | string | Type of [upload](#products-write-request-type)

#### Type values     
Value| Description
---- | -----------
full | The current upload are all products for the given site, all data from past uploads will be removed.
delta | The current upload is only a part of all your products. Use this in case you plan to send incremental uploads.

<aside class="info">When setting up the API as a Data Source in our 
<a target="blank" href="https://platform.productsup.com">Platform</a>, the field <i>Product 
Update Mode</i> represents the mode of handling products.</aside>
Values should be set accordingly:

Commit value| Product Update Mode value
--- | ---
full | replace
delta | update

## Discarding

```shell
curl https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/md5string32chars/discard
```

```php
<?php
$result = $ProductService->discard();
```

If something has gone wrong during the upload process, it is possible to cancel 
the whole batch. This allows you be more strict with your data integrity. This 
is achieved by calling the discard endpoint on a batch id.

### HTTP Request
`POST https://platform-api.productsup.io/platform/v1/sites/<siteIdentifier>/products/<batchId>/discard`

#### URL parameters
See [url parameters](#product-write-request-url-parameters)

#### HTTP Headers
See [HTTP headers](#product-write-request-http-headers)
