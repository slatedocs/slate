# Variants

## Get variants for a product

```shell
curl -XGET "https://apibodegas.loadingplay.com/v1/variant/list" \
  -d "namespace=[site_name]_[product_sku]"
```

> The above command returns JSON structured like this:

```json
{
    'status': 'success', 
    'variants': [
        {'id': 8, 'name': 'talla'},
        ...
    ]
}
```

This endpoint retrieves a list of variants for a specific namespace([site_name]_[product_sku]).

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/variant/list`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | (required) string identifier of the variant group

## Create a Variant

```shell
curl -XPOST "https://apibodegas.loadingplay.com/v1/variant" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "namespace=[site_name]_[product_sku]" \
    -d "name=talla"
```

> The above command returns json with variant info, including id:

```json
{
    "status": "success",
    "variant": [variant_id]
}
```

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/variant`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | a namespace should be compound by [site_name]_[product_sku]
name | name of the variant i.e: size, color

## Delete a Variant
```shell
curl -XDELETE "https://apibodegas.loadingplay.com/v1/variant" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "namespace=[site_name]_[product_sku]" \
    -d "variant=[variant_name]"
```

> The above command returns json:

```json
{
    "statuts" : "success"
}
```

### HTTP Request

`DELETE https://apibodegas.loadingplay.com/v1/variant`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | [site_name]_[product_sku]
variant | variant name

## Create a Value for a variant

```shell
curl -XPOST "https://apibodegas.loadingplay.com/v1/variant/value" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "namespace=[site_name]_[product_sku]" \
    -d "variant=[variant_name]" \
    -d "value=[new_value]"
```

> The above command returns json with variant info, including id:

```json
{
    "status": "success",
    "value": {
        "id": [id],
        "value":  [value],
        "variant_name": [variant],
        "namespace": [namespace]
    }
}
```

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/variant/value`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | a namespace should be compound by [site_name]_[product_sku]
variant | name of the variant i.e: size, color
value | value name i.e (s, m, l)

## Delete a Value for a Variant
```shell
curl -XDELETE "https://apibodegas.loadingplay.com/v1/variant/value" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "namespace=[site_name]_[product_sku]" \
    -d "variant=[variant_name]" \
    -d "value=[new_value]"
```

> The above command returns json:

```json
{
    "statuts" : "success"
}
```

### HTTP Request

`DELETE https://apibodegas.loadingplay.com/v1/variant/value`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | [site_name]_[product_sku]
variant | variant name
value | value name


## Get Value list

```shell
curl -XGET "https://apibodegas.loadingplay.com/v1/variant/value/list" \
  -d "namespace=[site_name]_[product_sku]" \
  -d "variant=[variant_name]"
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "values": {
        'variant_name': v,
        'values': [{
            "site_name": "me_NBK-SACO-NEGRA-C168", 
            "id": 1, 
            "value": "1", 
            "variant_name": "talla"
        }]
    }
}
```

This endpoint retrieves a list of values for a specific namespace([site_name]_[product_sku]).

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/variant/value/list`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | [site_name]_[product_sku]
variant | variant name

## Get Combination list

```shell
curl -XGET "https://apibodegas.loadingplay.com/v1/variant/combination" \
  -d "namespace=[site_name]_[product_sku]" \
  -d "sku=[product_sku]"
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "combination": [
        {'sku': 'test-m-azul', 'data': ''},
        ...
    ]
}
```

This endpoint retrieves a list of combinatios for a specific namespace([site_name]_[product_sku]) and product sku.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/variant/combination`

### URL Parameters

Parameter | Description
--------- | -----------
namespace | [site_name]_[product_sku]
sku | the product sku
