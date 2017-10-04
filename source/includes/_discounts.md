# Discounts

## Get a Discount

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/discount/1 \
    -H 'Authorization: Bearer ACCESS_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : 1,
            "percentage": 20,
            "code": "testCode",
            "site_name": "test",
            "activate": true
        }
    ]
}
```

This endpoint retrieves a Discount.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID`

### URL Parameters

Parameter     | Default    | Description
---------     | -------    | -----------
DISCOUNT_ID   | (required) | identificador unico para discount




## Add a discount

```shell
curl -XPOST https://apibodegas.loadingplay.com/v1/discount \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "site_name=test" \
    -d "percentage=10" \
    -d "code=addTestCode" \
    -d "activate=False"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : CRAETED_DISCOUNT_ID,
            "percentage": 10,
            "code": "addTestCode",
            "site_name": "test",
            "activate": false
        }
    ]
}
```

This endpoint add a Discount.

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/discount`

### URL Parameters

Parameter  | Default    | Description
---------  | -------    | -----------
site_name  | (required) | nombre del sitio del cual pertenece discount
percentage | (optional) | porcentaje de descuento
code       | (optional) | codigo con el cual se obtiene descuento
activate   | (optional) | valor que indica si el codigo de descuento esta activado




## Edit a Discount

```shell
curl -XPUT https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "percentage=20" \
    -d "code=editTestCode" \
    -d "activate=True"

```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : DISCOUNT_ID,
            "percentage": 20,
            "code": "editTestCode",
            "activate": true
        }
    ]
}
```

This endpoint edit a Discount.

### HTTP Request

`PUT https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID`

### URL Parameters

Parameter     | Default    | Description
---------     | -------    | -----------
DISCOUNT_ID   | (required) | identificador unico para discount
percentage    | (optional) | porcentaje de descuento
code          | (optional) | codigo con el cual se obtiene descuento
activate      | (optional) | valor que indica si el codigo de descuento esta activado




## Remove a discount

```shell
curl -XDELETE https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID \
    -H 'Authorization: Bearer ACCESS_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : DISCOUNT_ID,
            "percentage": 20,
            "code": "editTestCode",
            "site_name": "test",
            "activate": true
        }
    ]
}
```

This endpoint delete a discount.

### HTTP Request

`DELETE https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID`

### URL Parameters

Parameter     | Default    | Description
---------     | -------    | -----------
DISCOUNT_ID   | (required) | identificador unico para discount




## Get a discount list

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/discount \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "site_name=test"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : 1,
            "percentage": 20,
            "code": "testCode",
            "site_name": "test",
            "activate": true
        },
        {
            "id" : "...",
            "percentage": "...",
            "code": "...",
            "site_name": "...",
            "activate": ""
        },
        ...
    ]
}
```

This endpoint retrieves a discount list.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/discount`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
site_name | (required) | nombre del sitio del cual pertenece discount
