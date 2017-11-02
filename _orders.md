# Orders
## Post a Order


```shell
curl -XPOST https://apibodegas.loadingplay.com/order \
    -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "site_name=placare" \
    -d "name=placare" \
    -d "lastname=placare" \
    -d "email=placare" \
    -d "address=placare" \
    -d "telephone=placare" \
    -d "region_id=placare" \
    -d "additional_info=placare" \
    -d "city=placare" \
    -d "rut=placare" \
    -d "shipping=placare" \
    -d "origin=placare" \
    -d "payment_type=placare" \
    -d "voucher=placare" \
    -d "products=placare" \

```

> The above command returns JSON structured like this:

```json
{
	"status": "success", "order": {
		"origin": "WEB",
		"provider_id": null,
		"site_name": "placare",
		"transaction_id": null,
		"site_id": null,
		"tracking_code": "",
		"voucher": "",
		"total": 0.0,
		"id": 4029,
		"extra_info": "",
		"items_quantity": null,
		"adjustment": 0.0,
		"user_id": 323,
		"shipping_id": 2084,
		"url_document": null,
		"source": "",
		"state": 1,
		"type": 1,
		"discount_code": "",
		"status": "1",
		"deleted": false,
		"tax": 0.0,
		"products_quantity": null,
		"date": "2017-10-30T17:51:17.603750",
		"subtotal": 0.0,
		"name": "",
		"shipping": 0,
		"payment_type": 0,
		"reference_code": "",
		"billing_id": 2084
	}
}
```

This endpoint retrieves a Order.

### HTTP Request

`POST https://apibodegas.loadingplay.com/order`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
site_name | (required) | filter by site
name | "" | buyer name
lastname | "" | buyer lastname
email | "" | buyer email
address | "" | buyer address
telephone | "" | buyer telephone
region_id | "" | buyer region_id
additional_info | "" | buyer additional info in realtion to address
city | "" | buyer city
rut | "" | buyer rut
shipping | "" | shipping price
origin | "" | order origin
payment_type | "" | payment type 
voucher | "" | orders voucher
products | "" | products in relation to order_detail

## Get a Spesific Order

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/order/[order_id] 
	-H "Authorization: Bearer ACCESS_TOKEN" 
```

> The above command returns JSON structured like this:

```json
{
	"status": "success",
	"order": {
		"origin": "placare",
		"provider_id": null,
		"site_name": "placare",
		"site_id": null,
		"tracking_code": "35345",
		"voucher": "https://84static.loadingplay.com/static/images/500_ca68f77b6d1381225e5aa3310158576c_Captura_de_pantalla__a_las__ampng.png",
		"total": 18490.0,
		"id": 4097,
		"extra_info": "",
		"items_quantity": null,
		"adjustment": 0.0,
		"user_id": 2738,
		"shipping_id": 2152,
		"url_document": null,
		"source": "",
		"state": 4,
		"type": 1,
		"transaction_id": null,
		"status": "4",
		"deleted": false,
		"tax": 0.0,
		"products_quantity": null,
		"discount": 0,
		"date": "2017-10-10T22:24:24.219831",
		"subtotal": 18490.0,
		"discount_code": "",
		"name": "",
		"shipping": 0,
		"payment_type": 10,
		"reference_code": "",
		"billing_id": 2152
	}
}
```

This endpoint retrieves a Order.

### HTTP Request

`GET  https://apibodegas.loadingplay.com/v1/order/[id]`

### URL Parameters


Parameter | Default | Description
--------- | ------- | -----------
id | (required) | unique identifier for order
site_name | (required) | filter by site




## Put a Spesific Order

```shell
curl -XPUT https://apibodegas.loadingplay.com/order \
    -H "Authorization: Bearer ACCESS_TOKEN" \
    -d "id=4029" \
    -d "adjustment=" \
    -d "is_deleted=" \
    -d "discount_code=" \
    -d "extra_info=" \
    -d "origin=" \\
    -d "reference_code=" \
    -d "source=" \
    -d "status=" \
    -d "tracking_code=" \
    -d "voucher=" \
    -d "payment_type=" \
    -d "url_document=" \

```

> The above command returns JSON structured like this:

```json
{
	"status": "success",
 	"order": {
		"origin": "Sitio Antiguo",
		"provider_id": null,
		"site_name": "gdf",
		"transaction_id": null,
		"site_id": null,
		"tracking_code": "codigodespacho",
		"voucher": "",
		"total": 0.0,
		"id": 4029,
		"extra_info": "",
		"items_quantity": null,
		"adjustment": 0.0,
		"user_id": 323,
		"shipping_id": 2084,
		"url_document": null,
		"source": "web",
		"state": 4,
		"type": 1,
		"discount_code": "",
		"status": "4",
		"deleted": false,
		"tax": 0.0,
		"products_quantity": null,
		"date": "2017-10-30T17:51:17.603750",
		"subtotal": 0.0,
		"name": "",
		"shipping": 0,
		"payment_type": 1,
		"reference_code": "",
		"billing_id": 2084
	}
}
```

This endpoint retrieves a Order.

### HTTP Request

`PUT https://apibodegas.loadingplay.com/order`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
id | (required) | unique identifier for order
adjustment | "" | order adjustment
is_deleted | "" | dverify is a deleted order
discount_code | "" | discont code over the order
extra_info | "" | extra info into the order
origin | "" | origin from the order
reference_code | "" | reference code into the order
source | "" | source from the order
status | "" | order status
tracking_code | "" | tracking code og the order
voucher | "" | orde voucher
payment_type | "" | order payment type
url_document | "" | url document into the order

## Get a Spesific Order Detail

```shell
curl -XGET https://apibodegas.loadingplay.com/v1/order/[id]/detail \
    -H "Authorization: Bearer ACCESS_TOKEN" \
```

> The above command returns JSON structured like this:

```json
{
	"status": "success",
	"products": [{
		"sku": "HA-E990-S18-WHI-SAN-CAS-T25",
		"product_id": null,
		"combination": "36",
		"order_id": 4097,
		"price": 18490,
		"name": "Sandalia Blanco / Beige Balasi",
		"order_name": "",
		"state": 4,
		"quantity": 1,
		"subtotal": 18490.0,
		"id": 5385,
		"size": ""
	}]
}
```

This endpoint retrieves a Order Detail.

### HTTP Request

`GET https://apibodegas.loadingplay.com/v1/order/[id]/detail`

### URL Parameters

Parameter | Default | Description
--------- | ------- | -----------
id | (required) | unique identifier for order


