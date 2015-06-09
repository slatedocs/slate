# Products

## URL
The URL for the uploading is looking like this:

`/platform/v1/sites/Identifier:123/products/abcdef123/upload`

It consists of the folowing parts:

example | description
------- | -----------
sites/Identifier:123 | the entity the upload is related to.
/products | tells the api that you are about to upload products
abcdef123 | is an identifier (batch id) you can create. It is only used during the upload and tells the API that all actions belong to this batch
upload | is the action you want to perform.


## Upload
To upload products, you can simply add an json encoded array of arrays as post body of the url from above:
<aside class="notice">The key `id` is mandatory, all other keys end up as columns</aside>

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
https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/abcdef123/upload
```

The example would result in a import that looks like this:


id | title | price | shipping
-------------- | -------------- | -------------- | ----------
123 |test title | 1.23
124 | next title | 3.21 | 0.99

## Delete
If you do "delta" or "incremental" uploads (see commit action) you may want to delete old products you already uploaded. To do so, just add the key ```pup:isDelete``` with value ```1``` and the id of the product:

```shell
curl -d '[{
    "id": 124,
    "pup:isDelete": 1
}]'
https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/abcdef123/upload
```


## Commit
When you finished all uploads into one batch, you can tell the API that it is done and the "batch" can be started to be processed.

Url in this case would be `https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/abcdef123/commit`

> As body of the POST request you have to provide again a JSON, this time with only one parameter:

```shell
curl -d '{"type":"full"}'
https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/abcdef123/upload
```

There are two types for commits:


type | description
---- | -----------
full | tells the API that the current upload are all products for the given entity, all past uploads are removed
delta | tells the API that the current upload is only a part of all your products, in case you plan to send incremental uploads

## Discard
The third action "discard" is only to abort a started upload. This removes all uploads for the given batch id and you can start over.

```shell
curl https://platform-api.productsup.io/platform/v1/sites/Identifier:123/products/abcdef123/discard
```