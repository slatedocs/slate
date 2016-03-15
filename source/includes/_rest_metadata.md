# Metadata Endpoints

Each site has a metadata object. The properties of the metadata object can be used within the snippets for a site by using the [Liquid](https://github.com/Shopify/liquid) template syntax.

## Get Metadata

``` http
GET /sites/{:site_id}/metadata HTTP/1.1
```

> Example Response:

``` json
{
  "my_meta_key": "my_meta_value"
}
```

## Update Metadata

Replace the metdata object with a new metadata object

`PUT /sites/{:site_id}/metadata`
