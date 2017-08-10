# Orders

## Get a Order

```shell
curl -XGET https://apibodegas.loadingplay.com/order \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "id=PORBUSCAR" \
    -d "site_name=PORBUSCAR"
```

> The above command returns JSON structured like this:

```json
{
    TO DO
}
```

This endpoint retrieves a Order.

### HTTP Request

`GET https://apibodegas.loadingplay.com/order`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
id | (required) | unique identifier for order
site_name | (required) | filter by site

