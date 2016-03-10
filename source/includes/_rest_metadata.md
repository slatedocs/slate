# Metadata Endpoints

<!-- TODO this is a weak page, some examples would help -->

Each site has a metadata object. The properties of the metadata object can be used within the snippets for a site by using the [Liquid](https://github.com/Shopify/liquid) template syntax.

## Get Metadata

### HTTP Request
`GET /api/v1/sites/{:site_id}/metadata`

> Response:

```json
{
  "my_meta_key": "my_meta_value"
}
```

## Update Metadata

Replace the metdata object with a new metadata object

`PUT /api/v1/sites/{:site_id}/metadata`
