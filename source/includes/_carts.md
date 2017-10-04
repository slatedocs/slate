# Shopping cart

endpoints:

* /v1/cart
* /v1/cart/[ID]
* /v1/cart/[ID]/extrainfo

## Create an empty shopping cart
```shell
curl -XPOST "https://apibodegas.loadingplay.com/v1/cart" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
```

> The above command returns json with cart info, including id:

```json
{
    "statuts" : "success",
    "cart" : {
        "items": [],
        "total": 0,
        "expired": false,
        "id": "unique string id (GUUID)"
    }
}
```

### HTTP Request

you can post to an unexistent cart id, and the api will create it automatically

`POST https://apibodegas.loadingplay.com/v1/cart`

## Create a new shopping cart with an externally generated GUUID

```shell
curl -XPOST "https://apibodegas.loadingplay.com/v1/cart/[GUUID]" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d 'items=[{
        "sku": "test",
        "bullet_1": "",
        "name": "test",
        "bullet_3": "",
        "bullet_2": "",
        "price": 2000.0,
        "weight": 0.0,
        "equate": "different",
        "images": [
                [
                    "https://7static.loadingplay.com/static/images/1_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png",
                    "https://7static.loadingplay.com/static/images/200_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png",
                    "https://7static.loadingplay.com/static/images/500_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png"
                ]
        ],
        "quantity": 2,
        "subtotal": 4000.0,
        "id": 1,
        "upp": 1,
        "not_discount_price": 10.0
    }]'
```

> The above command returns json with cart info, including id:

```json
{
	"status": "success",
	"cart": {
		"items": [{
			"sku": "test",
			"bullet_1": "",
			"name": "test",
			"bullet_3": "",
			"bullet_2": "",
			"price": 2000.0,
			"weight": 0.0,
			"equate": "different",
			"images": [
				["https://7static.loadingplay.com/static/images/1_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png", "https://7static.loadingplay.com/static/images/200_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png", "https://7static.loadingplay.com/static/images/500_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png"]
			],
			"quantity": 2,
			"subtotal": 4000.0,
			"id": 1,
			"upp": 1,
			"not_discount_price": 10.0
		}],
		"total": 4000,
		"expired": false,
		"id": "GUUID"
	}
}
```

### HTTP Request

`POST https://apibodegas.loadingplay.com/v1/cart/[GUUID]`


## Get a Specific Cart

```shell
curl -XGET "https://apibodegas.loadingplay.com/v1/cart/[GUUID]" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
```

> The above command returns JSON structured like this:

```json
{
	"status": "success",
	"cart": {
		"items": [{
			"sku": "test",
			"bullet_1": "",
			"name": "test",
			"bullet_3": "",
			"bullet_2": "",
			"price": 2000.0,
			"weight": 0.0,
			"equate": "different",
			"images": [
				["https://7static.loadingplay.com/static/images/1_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png", "https://7static.loadingplay.com/static/images/200_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png", "https://7static.loadingplay.com/static/images/500_ee40a90852bd0608123f3988fb512888_Captura_de_pantalla_2016-11-19_a_las_18.42.41.png.png"]
			],
			"quantity": 2,
			"subtotal": 4000.0,
			"id": 1,
			"upp": 1,
			"not_discount_price": 10.0
		}],
		"total": 4000,
		"expired": false,
		"id": "GUUID"
	}
}
```

### HTTP Request

This endpoint retrieves a specific cart.

`GET https://apibodegas.loadingplay.com/v1/cart/[GUUID]`

### URL Parameters

Parameter | Description
--------- | -----------
GUUID | (required) cart unique global identifier


## Add some extra data to a shopping cart

```shell
curl -XPOST "https://apibodegas.loadingplay.com/v1/cart/[GUUID]/extrainfo" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
    -d 'data=some arbitrary data'
```

> The above command returns json with cart extra info, including id:

```json
{
    "status": "success",
    "data": "some arbitrary data"
}
```

### HTTP Request

sometimes you may want to show some extra data in the shopping cart, you can use this field

`POST https://apibodegas.loadingplay.com/v1/cart/[GUUID]/extrainfo`

### URL Parameters

Parameter | Description
--------- | -----------
GUUID | (required) cart unique global identifier


## Get extrainfo from a shopping cart

```shell
curl -XGET "https://apibodegas.loadingplay.com/v1/cart/[GUUID]/extrainfo" \
  -H "Authorization: Bearer ACCESS_TOKEN" \
```

> The above command returns JSON structured like this:

```json
{
    "status": "success",
    "data": "some arbitrary data"
}
```


### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/cart/[GUUID]/extrainfo`

### URL Parameters

Parameter | Description
--------- | -----------
GUUID | (required) cart unique global identifier
