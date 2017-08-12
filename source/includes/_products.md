# Products

## Get all Products

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/product/list \
    -H 'Authorization: Bearer ACCESS_TOKEN' \
    -d "site_name=fm"
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "metadata": { "total_records": 169, "records_filtered": 100 },  // only if enabled
    "products": [
        {
            "balance_units": 44,
            "brand": "CAT CHOW",
            "bulk_price": 1,
            "bullet_1": "Alimento para gato adulto, Pescado y Mariscos",
            "bullet_2": "15k",
            "bullet_3": "",
            "cost_price": 29277,
            "critical_stock": 1,
            "description": "product description",
            "enabled": false,
            "for_sale": true,
            "id": 1237,
            "images": [
                "https://7static.loadingplay.com/static/images/4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png",
                "https://84static.loadingplay.com/static/images/1_4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png",
                "https://7static.loadingplay.com/static/images/200_4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png",
                "https://7static.loadingplay.com/static/images/500_4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png"
            ],
            "main_price": 29277,
            "manufacturer": "Nestle",
            "name": "Cat Chow Adultos",
            "position": 0,
            "profit_margin": 0,
            "promotion_price": 0,
            "site_id": 2,
            "sku": "2212110",
            "tags": "gato",
            "upp": 1,
            "weight": 0
        },
        ....
    ]
}
```

This endpoint retrieves a Products list.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/product/list`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
site_name | (required) | filter by site
page | 1 | startig page
items | 10 | items to show per page
metadata | false | true if you need to return total rows
search | '' | perform a search in products
column | 'main_price' | column for sorting items
order | 'ASC' | type of orden DESC|ASC default "ASC"

## Get a Specific Product

```shell
curl -XGET "https://apibodegas.loadingplay.com/v1/product" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
  -d "site_name=fm" \
  -d "sku=2212110"
```

> The above command returns JSON structured like this:

```json
{
    "status" : "success",
    "product" : [
        {
            "balance_units": 44,
            "brand": "CAT CHOW",
            "bulk_price": 1,
            "bullet_1": "Alimento para gato adulto, Pescado y Mariscos",
            "bullet_2": "15k",
            "bullet_3": "",
            "cost_price": 29277,
            "critical_stock": 1,
            "description": "product description",
            "enabled": false,
            "for_sale": true,
            "id": 1237,
            "images": [
                "https://7static.loadingplay.com/static/images/4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png",
                "https://84static.loadingplay.com/static/images/1_4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png",
                "https://7static.loadingplay.com/static/images/200_4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png",
                "https://7static.loadingplay.com/static/images/500_4799bd4dd9fdc1599355e6743ed9580c_PESCADO2.png.png"
            ],
            "main_price": 29277,
            "manufacturer": "Nestle",
            "name": "Cat Chow Adultos",
            "position": 0,
            "profit_margin": 0,
            "promotion_price": 0,
            "site_id": 2,
            "sku": "2212110",
            "tags": "gato",
            "upp": 1,
            "weight": 0
        },
        ...
    ]
}
```

This endpoint retrieves a specific product.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/product`

### URL Parameters

Parameter | Description
--------- | -----------
site_name | (required) filter by site
sku | unique identifier for product it can be a comma separated list, and return a comma separated list of products

## Create a Product
```shell
curl -XPOST "https://apibodegas.loadingplay.com/v1/product" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "sku=2212110" \
    -d "site_name=fm" \
    -d "name=" \
    -d "description=" \
    -d "main_price=" \
    -d "cost_price=" \
    -d "promotion_price=" \
    -d "bulk_price=" \
    -d "brand=" \
    -d "manufacturer=" \
    -d "bullet_1=" \
    -d "bullet_2=" \
    -d "bullet_3="
```

> The above command returns json with product info, including id:

```json
{
    "statuts" : "success",
    "product" : {
        "id" : [product_id],
        "sku" : [product_sku]
    }
}
```

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/product`

### URL Parameters

Parameter | Description
--------- | -----------
site_name | (required) filter by site
sku | unique identifier for product it can be a comma separated list, and return a comma separated list of products

## Edit a Product
```shell
curl -XPUT "https://apibodegas.loadingplay.com/v1/product" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "sku=2212110" \
    -d "site_name=fm" \
    -d "name=" \
    -d "description=" \
    -d "main_price=" \
    -d "cost_price=" \
    -d "promotion_price=" \
    -d "bulk_price=" \
    -d "brand=" \
    -d "manufacturer=" \
    -d "bullet_1=" \
    -d "bullet_2=" \
    -d "bullet_3="
```

> The above command returns json with product info, including id:

```json
{
    "statuts" : "success",
    "product" : {
        "id" : [product_id],
        "sku" : [product_sku]
    }
}
```

### HTTP Request

`PUT https://apibodegas.loadingplay.com/v1/product`

### URL Parameters

Parameter | Description
--------- | -----------
site_name | (required) filter by site
sku | unique identifier for product it can be a comma separated list, and return a comma separated list of products
