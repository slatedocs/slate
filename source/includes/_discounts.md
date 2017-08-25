# Discounts

## Get a Discount

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID \
    -H 'Authorization: Bearer ACCESS_TOKEN'
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : "...",
            "percentage": "...",
            "code": "...",
            "site_name": "...",
            "activate": ""
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


POR HACER POR HACER POR HACER

## Add a discount

```shell
curl -XPOST https://apibodegas.loadingplay.com/v1/discount \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "percentage=PORBUSCAR" \
    -d "code=PORBUSCAR" \
    -d "site_name=PORBUSCAR" \
    -d "activate=False"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : "...",
            "percentage": "...",
            "code": "...",
            "site_name": "...",
            "activate": ""
        }
    ]
}
```

This endpoint add a Discount.

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/discount`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
action    | (required) | Accion que ejecuta el discount
site_name | (required) | nombre del sitio del cual pertenece discount
url       | (optional) | url del cual discount realiza la accion



## Edit a Discount

```shell
curl -XPUT https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "url=PORBUSCAR" \
    -d "action=PORBUSCAR"

```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : "...",
            "url": "...",
            "action": "..."
        }
    ]
}
```

This endpoint edit a Discount.

### HTTP Request

`PUT https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
DISCOUNT_ID   | (required) | identificador unico para discount
url       | (optional) | url del cual discount realiza la accion
action    | (optional) | Accion que ejecuta el discount




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
            "id" : "...",
            "percentage": "...",
            "code": "...",
            "site_name": "...",
            "activate": ""
        }
    ]
}
```

This endpoint delete a discount.

### HTTP Request

`DELETE https://apibodegas.loadingplay.com/v1/discount/DISCOUNT_ID`

### URL Parameters

Parameter | Default    | Description
--------- | -------    | -----------
DISCOUNT_ID   | (required) | identificador unico para discount




## Get a discount list

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/discount \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "site_name=PORBUSCAR"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "discounts" : [
        {
            "id" : "...",
            "percentage": "...",
            "code": "...",
            "site_name": "...",
            "activate": ""
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
