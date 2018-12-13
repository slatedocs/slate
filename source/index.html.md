---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php

toc_footers:
  - <a href='https://wordpress.org/plugins/wc-multivendor-marketplace/'>Documentation Powered by WC Lovers</a>

includes:
  - errors

search: true
---

# Introduction

WCFM 2.8+ is fully integrated with the WordPress REST API. This allows to manupulate vendor data using requests in JSON format and using WordPress REST API Authentication methods and standard HTTP verbs which are understood by most HTTP clients.

# Authentication

## HTTP Basic Auth
You may use [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication) by providing the username and password.

For Basic auth you can use [Basic Auth](https://github.com/WP-API/Basic-Auth) Plugin.

Occasionally some servers may not parse the Authorization header correctly (if you see a “Username is missing” error when authenticating over SSL, you have a server issue). In this case, you may provide the username/password as query string parameters instead.

## Using JWT Auth

JSON Web Token (JWT) is an open standard ([RFC 7519](https://tools.ietf.org/html/rfc7519)) that defines a compact and self-contained way for securely transmitting information between parties as a JSON object.

For using this authentication system you can use [JWT Authentication for WP REST API](https://wordpress.org/plugins/jwt-authentication-for-wp-rest-api/) plugin.
When user sign in using their credential a Bearer token will be created corrosponding to this user. Then this token can be used via API header for getting API response

`Authorization: Bearer <token>`


# Products
The products API allows you to create, view, update, and delete individual, or a batch, of products.

## Product Properties

Parameter | Type | Description
--------- | ------- | -----------
`id` |  integer | Unique identifier for the resource. `READ-ONLY`
`name` |  string |  Product name `Required` - Only Create.
`slug` |  string |  Product slug.
`permalink` | string |  Product URL. `READ-ONLY`
`date_created` |  date |-time The date the product was created, in the site’s timezone. `READ-ONLY`
`date_created_gmt` |  date |-time The date the product was created, as GMT. `READ-ONLY`
`date_modified` | date |-time The date the product was last modified, in the site’s timezone. `READ-ONLY`
`date_modified_gmt` | date |-time The date the product was last modified, as GMT. `READ-ONLY`
`type` |  string |  Product type. Options: simple, grouped, external and variable. Default is simple.
`status` |  string |  Product status (post status). Options: draft, pending, publish. It depends on vendor publishing admin settings
`featured` |  boolean | Featured product. Default is false.
`catalog_visibility` |  string |  Catalog visibility. Options: visible, catalog, search and hidden. Default is visible.
`description` | string |  Product description.
`short_description` | string |  Product short description.
`sku` | string |  Unique identifier.
`price` | string |  Current product price. `READ-ONLY`
`regular_price` | string |  Product regular price.
`sale_price` |  string |  Product sale price.
`date_on_sale_from` | date |-time Start date of sale price, in the site’s timezone.
`date_on_sale_from_gmt` | date |-time Start date of sale price, as GMT.
`date_on_sale_to` | date |-time End date of sale price, in the site’s timezone.
`date_on_sale_to_gmt` | date |-time End date of sale price, as GMT.
`price_html` |  string |  Price formatted in HTML. `READ-ONLY`
`on_sale` | boolean | Shows if the product is on sale. `READ-ONLY`
`purchasable` | boolean | Shows if the product can be bought. `READ-ONLY`
`total_sales` | integer | Amount of sales. `READ-ONLY`
`virtual` | boolean | If the product is virtual. Default is false.
`downloadable` |  boolean | If the product is downloadable. Default is false.
`downloads` | array | List of downloadable files. See Product - Downloads properties
`download_limit` |  integer | Number of times downloadable files can be downloaded after purchase. Default is -1.
`download_expiry` | integer | Number of days until access to downloadable files expires. Default is -1.
`external_url` |  string |  Product external URL. Only for external products.
`button_text` | string |  Product external button text. Only for external products.
`tax_status` |  string |  Tax status. Options: taxable, shipping and none. Default is taxable.
`tax_class` | string |  Tax class.
`manage_stock` |  boolean | Stock management at product level. Default is false.
`stock_quantity` |  integer | Stock quantity.
`in_stock` |  boolean | Controls whether or not the product is listed as “in stock” or “out of stock” on the frontend. Default is true.
`backorders` |  string |  If managing stock, this controls if backorders are allowed. Options: no, notify and yes. Default is no.
`backorders_allowed` |  boolean | Shows if backorders are allowed. `READ-ONLY`
`backordered` | boolean | Shows if the product is on backordered. `READ-ONLY`
`sold_individually` | boolean | Allow one item to be bought in a single order. Default is false.
`weight` |  string |  Product weight.
`dimensions` |  object |  Product dimensions. See Product - Dimensions properties
`shipping_required` | boolean | Shows if the product need to be shipped. `READ-ONLY`
`shipping_taxable` |  boolean | Shows whether or not the product shipping is taxable. `READ-ONLY`
`shipping_class` |  string |  Shipping class slug.
`shipping_class_id` | string |  Shipping class ID. `READ-ONLY`
`reviews_allowed` | boolean | Allow reviews. Default is true.
`average_rating` |  string |  Reviews average rating. `READ-ONLY`
`rating_count` |  integer | Amount of reviews that the product have. `READ-ONLY`
`related_ids` | array | List of related products IDs. `READ-ONLY`
`upsell_ids` |  array | List of up-sell products IDs.
`cross_sell_ids` |  array | List of cross-sell products IDs.
`parent_id` | integer | Product parent ID.
`purchase_note` | string |  Optional note to send the customer after purchase.
`categories` |  array | List of categories. See Product - Categories properties `Required` - Only create
`tags` |  array | List of tags. See Product - Tags properties
`attributes` |  array | List of attributes. See Product - Attributes properties
`default_attributes` |  array | Defaults variation attributes. See Product - Default attributes properties
`variations` |  array | List of variations IDs. `READ-ONLY`
`grouped_products` |  array | List of grouped products ID.
`menu_order` |  integer | Menu order, used to custom sort products.
`meta_data` | array | Meta data. See Product - Meta data properties

### Product - Downloads properties
Attribute | Type | Description
--------- | ------- | -----------
`id` | string | File MD5 hash. `READ-ONLY`
`name` | string | File name.
`file` | string | File URL.

### Product - Dimensions properties
Attribute | Type | Description
--------- | ------- | -----------
`length` | string | Product length.
`width` | string | Product width.
`height` | string | Product height.

### Product - Categories properties
Attribute | Type | Description
--------- | ------- | -----------
`id` | integer | Category ID.
`name` | string | Category name. `READ-ONLY`
`slug` | string | Category slug. `READ-ONLY`

### Product - Tags properties
Attribute | Type | Description
--------- | ------- | -----------
`id` | integer | Tag ID.
`name` | string | Tag name. `READ-ONLY`
`slug` | string | Tag slug. `READ-ONLY`

### Product - Images properties
Attribute | Type | Description
--------- | ------- | -----------
`id` |  integer | Image ID.
`date_created` |  date-time | The date the image was created, in the site’s timezone. `READ-ONLY`
`date_created_gmt` |  date-time | The date the image was created, as GMT. `READ-ONLY`
`date_modified` | date-time | The date the image was last modified, in the site’s timezone. `READ-ONLY`
`date_modified_gmt` | date-time | The date the image was last modified, as GMT. `READ-ONLY`
`src` | string | Image URL.
`name` |  string | Image name.
`alt` | string | Image alternative text.
`position` |  integer | Image position. 0 means that the image is featured.

### Product - Attributes properties
Attribute | Type | Description
--------- | ------- | -----------
`id` |  integer | Attribute ID.
`name` |  string |  Attribute name.
`position` |  integer | Attribute position.
`visible` | boolean | Define if the attribute is visible on the “Additional information” tab in the product’s page. Default is false.
`variation` | boolean | Define if the attribute can be used as variation. Default is false.
`options` | array | List of available term names of the attribute.

### Product - Default attributes properties
Attribute | Type | Description
--------- | ------- | -----------
`id` | integer | Attribute ID.
`name` | string |  Attribute name.
`option` | string | Selected attribute term name.

### Product - Meta data properties
Attribute | Type | Description
--------- | ------- | -----------
`id` |  integer | Meta ID. `READ-ONLY`
`key` | string |  Meta key.
`value` | string |  Meta value.

## Create a Product

```php
<?php
$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfmnew.test/wp-json/wcfm/v1/products/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{
    \"name\": \"MI 5S\",
    \"type\": \"simple\",
    \"regular_price\": \"299\",
    \"description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\",
    \"short_description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\",
    \"categories\": [
      {
        \"id\": 48
      }
    ],
    \"images\": [
      {
        \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",
        \"position\": 0
      }
    ]
  }",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_key",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}```

```shell
curl --request POST \
  --url http://wcfmnew.test/wp-json/wcfm/v1/products/ \
  --header 'Authorization: Basic dmVuZG9yOnBhc3N3b3Jk' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --header 'Postman-Token: 2518adad-8135-9904-9107-e62f39c4126f' \
  --data '{
    "name": "MI 5S",
    "type": "simple",
    "regular_price": "299",
    "description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.",
    "short_description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
    "categories": [
      {
        "id": 48
      }
    ],
    "images": [
      {
        "src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg",
        "position": 0
      }
    ]
  }'
```

```python
import http.client

conn = http.client.HTTPConnection("wcfmnew,test")

payload = "{
  \"name\": \"MI 5S\",
  \"type\": \"simple\",
  \"regular_price\": \"299\",
  \"description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\",
  \"short_description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\",
  \"categories\": [
    {
      \"id\": 48
    }
  ],
  \"images\": [
    {
      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",
      \"position\": 0
    }
  ]
}"

headers = {
  'Content-Type': "application/json",
  'Authorization': "Basic authorization_key",
  'Cache-Control': "no-cache",
}

conn.request("POST", "wp-json,wcfm,v1,products,", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfmnew.test/wp-json/wcfm/v1/products/",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic dmVuZG9yOnBhc3N3b3Jk",
    "Cache-Control": "no-cache",
    "Postman-Token": "d8205bab-7d25-2415-3892-d30519c934a7"
  },
  "processData": false,
  "data": "{
    \"name\": \"MI 5S\",
    \"type\": \"simple\",
    \"regular_price\": \"299\",
    \"description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\",
    \"short_description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\",
    \"categories\": [
      {
        \"id\": 48
      }
    ],
    \"images\": [
      {
        \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",
        \"position\": 0
      }
    ]
  }"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfmnew.test/wp-json/wcfm/v1/products/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic dmVuZG9yOnBhc3N3b3Jk'
request["Cache-Control"] = 'no-cache'
request["Postman-Token"] = '9a77c957-57e0-5763-9940-5a64d704842a'
request.body = "{
  \"name\": \"MI 5S\",
  \"type\": \"simple\",
  \"regular_price\": \"299\",
  \"description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\",
  \"short_description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\",
  \"categories\": [
    {
      \"id\": 48
    }
  ],
  \"images\": [
    {
      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",
      \"position\": 0
    }
  ]
}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 601,
    "name": "MI 5S",
    "slug": "",
    "post_author": "31",
    "permalink": "http://wcfmnew.test/?post_type=product&p=601",
    "date_created": "2018-02-15T11:13:14",
    "date_created_gmt": "2018-02-15T05:13:14",
    "date_modified": "2018-02-15T11:13:14",
    "date_modified_gmt": "2018-02-15T05:13:14",
    "type": "simple",
    "status": "pending",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "299",
    "regular_price": "299",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>299.00</span>",
    "on_sale": false,
    "purchasable": true,
    "total_sales": 0,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "external_url": "",
    "button_text": "",
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "sold_individually": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_required": true,
    "shipping_taxable": true,
    "shipping_class": "",
    "shipping_class_id": 0,
    "reviews_allowed": true,
    "average_rating": "0.00",
    "rating_count": 0,
    "related_ids": [],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 48,
            "name": "Mobile",
            "slug": "mobile"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 600,
            "date_created": "2018-02-15T11:13:13",
            "date_created_gmt": "2018-02-15T05:13:13",
            "date_modified": "2018-02-15T11:13:13",
            "date_modified_gmt": "2018-02-15T05:13:13",
            "src": "http://wcfmnew.test/wp-content/uploads/2018/02/T_2_front.jpg",
            "name": "T_2_front.jpg",
            "alt": "",
            "position": 0
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": []
}
```
This endpoint helps you to create a new product.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/products/`

### Query Parameters

Accept all parameters for a product propertiest


## Get single product

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/5611",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/5611 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,5611", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/5611",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/5611")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5611,
    "name": "Premium Quality REST",
    "slug": "premium-quality-rest",
    "post_author": "21",
    "permalink": "http://wcfm.test/product/premium-quality-rest/",
    "date_created": "2018-02-18T05:07:54",
    "date_created_gmt": "2018-02-18T05:07:54",
    "date_modified": "2018-02-18T05:07:54",
    "date_modified_gmt": "2018-02-18T05:07:54",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "24.54",
    "regular_price": "24.54",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>24.54</span>",
    "on_sale": false,
    "purchasable": true,
    "total_sales": 0,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "external_url": "",
    "button_text": "",
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "sold_individually": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_required": true,
    "shipping_taxable": true,
    "shipping_class": "",
    "shipping_class_id": 0,
    "reviews_allowed": true,
    "average_rating": "0.00",
    "rating_count": 0,
    "related_ids": [
        5545,
        76,
        5543,
        5532,
        5518
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 16,
            "name": "Hoodies",
            "slug": "hoodies"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 5609,
            "date_created": "2018-02-18T05:07:50",
            "date_created_gmt": "2018-02-18T05:07:50",
            "date_modified": "2018-02-18T05:07:50",
            "date_modified_gmt": "2018-02-18T05:07:50",
            "src": "http://wcfm.test/wp-content/uploads/2018/02/T_2_front-1.jpg",
            "name": "T_2_front-1.jpg",
            "alt": "",
            "position": 0
        },
        {
            "id": 5610,
            "date_created": "2018-02-18T05:07:53",
            "date_created_gmt": "2018-02-18T05:07:53",
            "date_modified": "2018-02-18T05:07:53",
            "date_modified_gmt": "2018-02-18T05:07:53",
            "src": "http://wcfm.test/wp-content/uploads/2018/02/T_2_back-1.jpg",
            "name": "T_2_back-1.jpg",
            "alt": "",
            "position": 1
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": [
        {
            "id": 7940,
            "key": "pageview",
            "value": "1"
        }
    ]
}
```

This API lets you retrieve and view a specific product by ID.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/<id>`


## Get All Products

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfmnew.test/wp-json/wcfm/v1/products/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_key",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl -X GET \
  http://wcfmnew.test/wp-json/wcfm/v1/products/ \
  -H 'Authorization: Basic authorization_key' \
  -H 'Cache-Control: no-cache'
```

```python
import http.client

conn = http.client.HTTPConnection("wcfmnew,test")

headers = {
    'Authorization': "Basic authorization_key",
    'Cache-Control': "no-cache",
  }

conn.request("GET", "wp-json,wcfm,v1,products,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfmnew.test/wp-json/wcfm/v1/products/",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_key",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfmnew.test/wp-json/wcfm/v1/products/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_key'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
  {
    "id": 592,
    "name": "Lenevo G7",
    "slug": "",
    "post_author": "31",
    "permalink": "http://wcfmnew.test/?post_type=product&p=592",
    "date_created": null,
    "date_created_gmt": null,
    "date_modified": null,
    "date_modified_gmt": null,
    "type": "simple",
    "status": "pending",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "",
    "short_description": "<p>lenevo is splash, water, and dust resistant and was tested under controlled laboratory conditions with a rating of IP67 under IEC standard 60529. Splash, water, and dust resistance are not permanent conditions and resistance might decrease as a result of normal wear.</p>",
    "sku": "",
    "price": "449",
    "regular_price": "449",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>449.00</span>",
    "on_sale": false,
    "purchasable": true,
    "total_sales": 0,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "external_url": "",
    "button_text": "",
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "",
    "backorders_allowed": false,
    "backordered": false,
    "sold_individually": false,
    "weight": "",
    "dimensions": {
      "length": "",
      "width": "",
      "height": ""
    },
    "shipping_required": true,
    "shipping_taxable": true,
    "shipping_class": "",
    "shipping_class_id": 0,
    "reviews_allowed": true,
    "average_rating": "0.00",
    "rating_count": 0,
    "related_ids": [
      589,
      572
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
      {
        "id": 16,
        "name": "Music",
        "slug": "jw-music"
      }
    ],
    "tags": [],
    "images": [
      {
        "id": 0,
        "date_created": "2018-02-15T10:04:46",
        "date_created_gmt": "2018-02-15T04:04:46",
        "date_modified": "2018-02-15T10:04:46",
        "date_modified_gmt": "2018-02-15T04:04:46",
        "src": "http://wcfmnew.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
        "name": "Placeholder",
        "alt": "Placeholder",
        "position": 0
      }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": []
  },
  {
    "id": 591,
    "name": "iPhone x",
    "slug": "",
    "post_author": "31",
    "permalink": "http://wcfmnew.test/?post_type=product&p=591",
    "date_created": null,
    "date_created_gmt": null,
    "date_modified": null,
    "date_modified_gmt": null,
    "type": "simple",
    "status": "pending",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "",
    "short_description": "<p>iPhone X is splash, water, and dust resistant and was tested under controlled laboratory conditions with a rating of IP67 under IEC standard 60529. Splash, water, and dust resistance are not permanent conditions and resistance might decrease as a result of normal wear. Do not attempt to charge a wet iPhone; refer to the user guide for cleaning and drying instructions. Liquid damage not covered under warranty.</p>\n",
    "sku": "",
    "price": "999",
    "regular_price": "999",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>999.00</span>",
    "on_sale": false,
    "purchasable": true,
    "total_sales": 0,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "external_url": "",
    "button_text": "",
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "",
    "backorders_allowed": false,
    "backordered": false,
    "sold_individually": false,
    "weight": "",
    "dimensions": {
      "length": "",
      "width": "",
      "height": ""
    },
    "shipping_required": true,
    "shipping_taxable": true,
    "shipping_class": "",
    "shipping_class_id": 0,
    "reviews_allowed": true,
    "average_rating": "0.00",
    "rating_count": 0,
    "related_ids": [],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
      {
        "id": 48,
        "name": "Mobile",
        "slug": "mobile"
      }
    ],
    "tags": [],
    "images": [
      {
        "id": 0,
        "date_created": "2018-02-15T10:04:46",
        "date_created_gmt": "2018-02-15T04:04:46",
        "date_modified": "2018-02-15T10:04:46",
        "date_modified_gmt": "2018-02-15T04:04:46",
        "src": "http://wcfmnew.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
        "name": "Placeholder",
        "alt": "Placeholder",
        "position": 0
      }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": []
  }
]
```
This endpoint retrieves all Product for authorized vendor.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/`

### Query Parameters

Parameter | Type | Description
--------- | ------- | -----------
`per_page` | integer | Maximum number of items to be returned in result set. Default is `10`.
`page` | integer | Current page of the collection. Default is `1`
`search` | string | Limit results to those matching a string.
`after` | string |  Limit response to resources published after a given ISO8601 compliant date.
`before` |  string |  Limit response to resources published before a given ISO8601 compliant date.
`exclude` | array | Ensure result set excludes specific IDs.
`include` | array | Limit result set to specific ids.
`offset` |  integer | Offset the result set by a specific number of items.
`order` | string |  Order sort attribute ascending or descending. Options: asc and desc. Default is desc.
`orderby` | string |  Sort collection by object attribute. Options: date, id, include, title and slug. Default is date.
`parent` |  array | Limit result set to those of particular parent IDs.
`parent_exclude` |  array | Limit result set to all items except those of a particular parent ID.
`slug` |  string |  Limit result set to products with a specific slug.
`status` |  string |  Limit result set to products assigned a specific status. Options: any, draft, pending, private and publish. Default is any.
`type` |  string |  Limit result set to products assigned a specific type. Options: simple, grouped, external and variable.
`sku` | string |  Limit result set to products with a specific SKU.
`featured` |  boolean | Limit result set to featured products.
`category` |  string |  Limit result set to products assigned a specific category ID.
`tag` | string |  Limit result set to products assigned a specific tag ID.
`shipping_class` |  string |  Limit result set to products assigned a specific shipping class ID.
`attribute` | string |  Limit result set to products with a specific attribute.
`attribute_term` |  string |  Limit result set to products with a specific attribute term ID (required an assigned attribute).
`tax_class` | string |  Limit result set to products with a specific tax class. Default options: standard, reduced-rate and zero-rate.
`in_stock` |  boolean | Limit result set to products in stock or out of stock.
`on_sale` | boolean | Limit result set to products on sale.
`min_price` | string |  Limit result set to products based on a minimum price.
`max_price` | string |  Limit result set to products based on a maximum price.


## Update a product

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/5611",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "{\n  \"regular_price\": \"24.54\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url http://wcfm.test/wp-json/wcfm/v1/products/5611 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --data '{\n  "regular_price": "24.54"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"regular_price\": \"24.54\"\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,products,5611", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/5611",
  "method": "PUT",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"regular_price\": \"24.54\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/5611")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"regular_price\": \"24.54\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5611,
    "name": "Premium Quality REST",
    "slug": "premium-quality-rest",
    "post_author": "21",
    "permalink": "http://wcfm.test/product/premium-quality-rest/",
    "date_created": "2018-02-18T05:07:54",
    "date_created_gmt": "2018-02-18T05:07:54",
    "date_modified": "2018-02-18T05:07:54",
    "date_modified_gmt": "2018-02-18T05:07:54",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "24.54",
    "regular_price": "24.54",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>24.54</span>",
    "on_sale": false,
    "purchasable": true,
    "total_sales": 0,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "external_url": "",
    "button_text": "",
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "sold_individually": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_required": true,
    "shipping_taxable": true,
    "shipping_class": "",
    "shipping_class_id": 0,
    "reviews_allowed": true,
    "average_rating": "0.00",
    "rating_count": 0,
    "related_ids": [
        47,
        5566,
        75,
        5532,
        5543
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 16,
            "name": "Hoodies",
            "slug": "hoodies"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 5609,
            "date_created": "2018-02-18T05:07:50",
            "date_created_gmt": "2018-02-18T05:07:50",
            "date_modified": "2018-02-18T05:07:50",
            "date_modified_gmt": "2018-02-18T05:07:50",
            "src": "http://wcfm.test/wp-content/uploads/2018/02/T_2_front-1.jpg",
            "name": "T_2_front-1.jpg",
            "alt": "",
            "position": 0
        },
        {
            "id": 5610,
            "date_created": "2018-02-18T05:07:53",
            "date_created_gmt": "2018-02-18T05:07:53",
            "date_modified": "2018-02-18T05:07:53",
            "date_modified_gmt": "2018-02-18T05:07:53",
            "src": "http://wcfm.test/wp-content/uploads/2018/02/T_2_back-1.jpg",
            "name": "T_2_back-1.jpg",
            "alt": "",
            "position": 1
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": [
        {
            "id": 7940,
            "key": "pageview",
            "value": "1"
        }
    ]
}
```

This API lets you make changes to a product.

### HTTP Request

`PUT http://wcfm.test/wp-json/wcfm/v1/products/<id>`

## Delete a product

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/5608",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "DELETE",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request DELETE \
  --url http://wcfm.test/wp-json/wcfm/v1/products/5608 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("DELETE", "wcfm,,wp-json,wcfm,v1,products,5608", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test//wp-json/wcfm/v1/products/5608",
  "method": "DELETE",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache"
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/5608")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5608,
    "name": "Premium Quality REST",
    "slug": "premium-quality-rest",
    "post_author": "21",
    "permalink": "http://wcfm.test/product/premium-quality-rest/",
    "date_created": "2018-02-18T04:14:57",
    "date_created_gmt": "2018-02-18T04:14:57",
    "date_modified": "2018-02-18T04:14:57",
    "date_modified_gmt": "2018-02-18T04:14:57",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "29.99",
    "regular_price": "29.99",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>29.99</span>",
    "on_sale": false,
    "purchasable": true,
    "total_sales": 0,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "external_url": "",
    "button_text": "",
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "sold_individually": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_required": true,
    "shipping_taxable": true,
    "shipping_class": "",
    "shipping_class_id": 0,
    "reviews_allowed": true,
    "average_rating": "0.00",
    "rating_count": 0,
    "related_ids": [
        5543,
        75,
        40,
        5566,
        5545
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 16,
            "name": "Hoodies",
            "slug": "hoodies"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 5606,
            "date_created": "2018-02-18T04:14:55",
            "date_created_gmt": "2018-02-18T04:14:55",
            "date_modified": "2018-02-18T04:14:55",
            "date_modified_gmt": "2018-02-18T04:14:55",
            "src": "http://wcfm.test/wp-content/uploads/2018/02/T_2_front.jpg",
            "name": "T_2_front.jpg",
            "alt": "",
            "position": 0
        },
        {
            "id": 5607,
            "date_created": "2018-02-18T04:14:56",
            "date_created_gmt": "2018-02-18T04:14:56",
            "date_modified": "2018-02-18T04:14:56",
            "date_modified_gmt": "2018-02-18T04:14:56",
            "src": "http://wcfm.test/wp-content/uploads/2018/02/T_2_back.jpg",
            "name": "T_2_back.jpg",
            "alt": "",
            "position": 1
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": []
}
```

This endpoint helps you to delete a product.

### HTTP Request

`DELETE http://wcfm.test/wp-json/wcfm/v1/products/<id>`


## Get Products summary

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/summary",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/summary \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,summary", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/summary",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/summary")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "post_counts": {
        "publish": 2,
        "future": 0,
        "draft": 0,
        "pending": 0,
        "private": 0,
        "trash": 0,
        "auto-draft": 0,
        "inherit": 0,
        "total": 2
    },
    "products_url": "http://wcfm.test/dashboard/products/"
}
```

This endpoint helps you to get products summary of a vendor.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/summary`


# Product variations
The product variations API allows you to create, view, update, and delete individual, or a batch, of product variations.

## Product variation properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Unique identifier for the resource. `read-only`
`date_created` | date-time | The date the variation was created, in the site’s timezone. `read-only`
`date_modified` | date-time | The date the variation was last modified, in the site’s timezone. `read-only`
`description` | string | Variation description.
`permalink` | string | Variation URL. `read-only`
`sku` | string | Unique identifier.
`price` | string | Current variation price. `read-only`
`regular_price` | string | Variation regular price.
`sale_price` | string | Variation sale price.
`date_on_sale_from` | date-time | Start date of sale price, in the site’s timezone.
`date_on_sale_from_gmt` | date-time | Start date of sale price, as GMT.
`date_on_sale_to` | date-time | End date of sale price, in the site’s timezone.
`date_on_sale_to_gmt` | date-time | End date of sale price, as GMT.
`on_sale` | boolean | Shows if the variation is on sale. `read-only`
`visible` | boolean | Define if the attribute is visible on the “Additional information” tab in the product’s page. Default is `true`.
`purchasable` | boolean | Shows if the variation can be bought. `read-only`
`virtual` | boolean | If the variation is virtual. Default is `false`.
`downloadable` | boolean | If the variation is downloadable. Default is `false`.
`downloads` | array | List of downloadable files.
`download_limit` | integer | Number of times downloadable files can be downloaded after purchase. Default is `-1`.
`download_expiry` | integer | Number of days until access to downloadable files expires. Default is `-1`.
`tax_status` | string | Tax status. Options: `taxable`, `shipping` and `none`. Default is `taxable`.
`tax_class` | string | Tax class.
`manage_stock` | boolean | Stock management at variation level. Default is `false`.
`stock_quantity` | integer | Stock quantity.
`in_stock` | boolean | Controls whether or not the variation is listed as “in stock” or “out of stock” on the frontend. Default is `true`.
`backorders` | string | If managing stock, this controls if backorders are allowed. Options: `no`, `notify` and `yes`. Default is `no`.
`backorders_allowed` | boolean | Shows if backorders are allowed. `read-only`
`backordered` | boolean | Shows if the variation is on backordered. `read-only`
`weight` | string | Variation weight.
`dimensions` | object | Variation dimensions.
`shipping_class` | string | Shipping class slug.
`shipping_class_id` | string | Shipping class ID. `read-only`
`image` | object | Variation image data.
`attributes` | array | List of attributes.
`menu_order` | integer | Menu order, used to custom sort products.
`meta_data` | array | Meta data.


### Product variation - Downloads properties
Attribute | Type | Description
--------- | ------- | -----------
`id` | string | File MD5 hash. `READ-ONLY`
`name` | string | File name.
`file` | string | File URL.

### Product variation - Dimensions properties
Attribute | Type | Description
--------- | ------- | -----------
`length` | string | Product length.
`width` | string | Product width.
`height` | string | Product height.

### Product - Images properties
Attribute | Type | Description
--------- | ------- | -----------
`id` |  integer | Image ID.
`date_created` |  date-time | The date the image was created, in the site’s timezone. `READ-ONLY`
`date_created_gmt` |  date-time | The date the image was created, as GMT. `READ-ONLY`
`date_modified` | date-time | The date the image was last modified, in the site’s timezone. `READ-ONLY`
`date_modified_gmt` | date-time | The date the image was last modified, as GMT. `READ-ONLY`
`src` | string | Image URL.
`name` |  string | Image name.
`alt` | string | Image alternative text.
`position` |  integer | Image position. 0 means that the image is featured.

### Product variation - Attributes properties
Attribute | Type | Description
--------- | ------- | -----------
`id` | integer | Attribute ID.
`name` | string |  Attribute name.
`option` | string | Selected attribute term name.

### Product - Meta data properties
Attribute | Type | Description
--------- | ------- | -----------
`id` |  integer | Meta ID. `READ-ONLY`
`key` | string |  Meta key.
`value` | string |  Meta value.


## Create a product variation

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://localhost/wcfm//wp-json/wcfm/v1/products/5611/variations/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n  \"name\" : \"Premium Quality REST\",\n  \"regular_price\": \"14.00\",\n  \"categories\": [\n    {\n      \"id\": 16\n    }\n  ],\n  \"images\": [\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",\n      \"position\": 0\n    },\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg\",\n      \"position\": 1\n    }\n  ],\n  \"attributes\": [\n    {\n      \"id\": 6,\n      \"option\": \"Black\"\n    }\n  ]\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic cG9zdG1hbjoxMjM0",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
    "Postman-Token: 1fa266e1-6ad2-b8da-c79a-b0ae1fb45b11"
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request POST \
  --url http://localhost/wcfm//wp-json/wcfm/v1/products/5611/variations/ \
  --header 'Authorization: Basic cG9zdG1hbjoxMjM0' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --header 'Postman-Token: cb959ca1-4682-c7be-0243-a96203f5ff49' \
  --data '{\n  "name" : "Premium Quality REST",\n  "regular_price": "14.00",\n  "categories": [\n    {\n      "id": 16\n    }\n  ],\n  "images": [\n    {\n      "src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg",\n      "position": 0\n    },\n    {\n      "src": "http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg",\n      "position": 1\n    }\n  ],\n  "attributes": [\n    {\n      "id": 6,\n      "option": "Black"\n    }\n  ]\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"name\" : \"Premium Quality REST\",\n  \"regular_price\": \"14.00\",\n  \"categories\": [\n    {\n      \"id\": 16\n    }\n  ],\n  \"images\": [\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",\n      \"position\": 0\n    },\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg\",\n      \"position\": 1\n    }\n  ],\n  \"attributes\": [\n    {\n      \"id\": 6,\n      \"option\": \"Black\"\n    }\n  ]\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic cG9zdG1hbjoxMjM0",
    'Cache-Control': "no-cache",
    'Postman-Token': "e9b4e08b-4b3d-308f-d438-0ffe6b88ff63"
    }

conn.request("POST", "wcfm,,wp-json,wcfm,v1,products,5611,variations,", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://localhost/wcfm//wp-json/wcfm/v1/products/5611/variations/",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic cG9zdG1hbjoxMjM0",
    "Cache-Control": "no-cache",
    "Postman-Token": "06791e2e-a605-27b4-fbc0-c135183719de"
  },
  "processData": false,
  "data": "{\n  \"name\" : \"Premium Quality REST\",\n  \"regular_price\": \"14.00\",\n  \"categories\": [\n    {\n      \"id\": 16\n    }\n  ],\n  \"images\": [\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",\n      \"position\": 0\n    },\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg\",\n      \"position\": 1\n    }\n  ],\n  \"attributes\": [\n    {\n      \"id\": 6,\n      \"option\": \"Black\"\n    }\n  ]\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://localhost/wcfm//wp-json/wcfm/v1/products/5611/variations/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic cG9zdG1hbjoxMjM0'
request["Cache-Control"] = 'no-cache'
request["Postman-Token"] = '85104e68-33b9-48f5-aaff-37033e1c1edd'
request.body = "{\n  \"name\" : \"Premium Quality REST\",\n  \"regular_price\": \"14.00\",\n  \"categories\": [\n    {\n      \"id\": 16\n    }\n  ],\n  \"images\": [\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\",\n      \"position\": 0\n    },\n    {\n      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg\",\n      \"position\": 1\n    }\n  ],\n  \"attributes\": [\n    {\n      \"id\": 6,\n      \"option\": \"Black\"\n    }\n  ]\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5623,
    "date_created": "2018-02-22T08:12:28",
    "date_created_gmt": "2018-02-22T08:12:28",
    "date_modified": "2018-02-22T08:12:29",
    "date_modified_gmt": "2018-02-22T08:12:29",
    "description": "",
    "permalink": "http://localhost/wcfm/product/premium-quality-rest/",
    "sku": "",
    "price": "14.00",
    "regular_price": "14.00",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "on_sale": false,
    "visible": true,
    "purchasable": true,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_class": "",
    "shipping_class_id": 0,
    "image": {
        "id": 0,
        "date_created": "2018-02-22T08:12:29",
        "date_created_gmt": "2018-02-22T08:12:29",
        "date_modified": "2018-02-22T08:12:29",
        "date_modified_gmt": "2018-02-22T08:12:29",
        "src": "http://localhost/wcfm/wp-content/plugins/woocommerce/assets/images/placeholder.png",
        "name": "Placeholder",
        "alt": "Placeholder",
        "position": 0
    },
    "attributes": [],
    "menu_order": 0,
    "meta_data": []
}
```

This API helps you to create a new product variation.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/products/<product_id>/variations`



## Get single product variation

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,72,variations,131", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 131,
    "date_created": "2017-11-19T20:02:23",
    "date_created_gmt": "2017-11-19T20:02:23",
    "date_modified": "2018-02-18T08:12:47",
    "date_modified_gmt": "2018-02-18T08:12:47",
    "description": "",
    "permalink": "http://wcfm.test/product/sunglasses/?attribute_color=red",
    "sku": "",
    "price": "1",
    "regular_price": "1",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "on_sale": false,
    "visible": true,
    "purchasable": true,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_class": "",
    "shipping_class_id": 0,
    "image": {
        "id": 0,
        "date_created": "2018-02-18T10:15:14",
        "date_created_gmt": "2018-02-18T10:15:14",
        "date_modified": "2018-02-18T10:15:14",
        "date_modified_gmt": "2018-02-18T10:15:14",
        "src": "http://wcfm.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
        "name": "Placeholder",
        "alt": "Placeholder",
        "position": 0
    },
    "attributes": [
        {
            "id": 0,
            "name": "color",
            "option": "red"
        }
    ],
    "menu_order": 1,
    "meta_data": []
}
```

This API lets you retrieve and view a specific product variation by ID.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/<product_id>/variations/<id>`


## Get All Product variations

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/72/variations",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/72/variations \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,72,variations", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/72/variations",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/72/variations")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 131,
        "date_created": "2017-11-19T20:02:23",
        "date_created_gmt": "2017-11-19T20:02:23",
        "date_modified": "2018-02-18T08:12:47",
        "date_modified_gmt": "2018-02-18T08:12:47",
        "description": "",
        "permalink": "http://wcfm.test/product/sunglasses/?attribute_color=red",
        "sku": "",
        "price": "1",
        "regular_price": "1",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "on_sale": false,
        "visible": true,
        "purchasable": true,
        "virtual": false,
        "downloadable": false,
        "downloads": [],
        "download_limit": -1,
        "download_expiry": -1,
        "tax_status": "taxable",
        "tax_class": "",
        "manage_stock": false,
        "stock_quantity": null,
        "in_stock": true,
        "backorders": "no",
        "backorders_allowed": false,
        "backordered": false,
        "weight": "",
        "dimensions": {
            "length": "",
            "width": "",
            "height": ""
        },
        "shipping_class": "",
        "shipping_class_id": 0,
        "image": {
            "id": 0,
            "date_created": "2018-02-18T08:13:08",
            "date_created_gmt": "2018-02-18T08:13:08",
            "date_modified": "2018-02-18T08:13:08",
            "date_modified_gmt": "2018-02-18T08:13:08",
            "src": "http://wcfm.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
            "name": "Placeholder",
            "alt": "Placeholder",
            "position": 0
        },
        "attributes": [
            {
                "id": 0,
                "name": "color",
                "option": "red"
            }
        ],
        "menu_order": 1,
        "meta_data": []
    },
    {
        "id": 132,
        "date_created": "2017-11-19T20:02:23",
        "date_created_gmt": "2017-11-19T20:02:23",
        "date_modified": "2018-02-18T08:12:47",
        "date_modified_gmt": "2018-02-18T08:12:47",
        "description": "",
        "permalink": "http://wcfm.test/product/sunglasses/?attribute_color=blue",
        "sku": "",
        "price": "2",
        "regular_price": "2",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "on_sale": false,
        "visible": true,
        "purchasable": true,
        "virtual": false,
        "downloadable": false,
        "downloads": [],
        "download_limit": -1,
        "download_expiry": -1,
        "tax_status": "taxable",
        "tax_class": "",
        "manage_stock": false,
        "stock_quantity": null,
        "in_stock": true,
        "backorders": "no",
        "backorders_allowed": false,
        "backordered": false,
        "weight": "",
        "dimensions": {
            "length": "",
            "width": "",
            "height": ""
        },
        "shipping_class": "",
        "shipping_class_id": 0,
        "image": {
            "id": 0,
            "date_created": "2018-02-18T08:13:08",
            "date_created_gmt": "2018-02-18T08:13:08",
            "date_modified": "2018-02-18T08:13:08",
            "date_modified_gmt": "2018-02-18T08:13:08",
            "src": "http://wcfm.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
            "name": "Placeholder",
            "alt": "Placeholder",
            "position": 0
        },
        "attributes": [
            {
                "id": 0,
                "name": "color",
                "option": "blue"
            }
        ],
        "menu_order": 2,
        "meta_data": []
    },
    {
        "id": 133,
        "date_created": "2017-11-19T20:02:23",
        "date_created_gmt": "2017-11-19T20:02:23",
        "date_modified": "2018-02-18T08:12:47",
        "date_modified_gmt": "2018-02-18T08:12:47",
        "description": "",
        "permalink": "http://wcfm.test/product/sunglasses/?attribute_color=black",
        "sku": "",
        "price": "3",
        "regular_price": "3",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "on_sale": false,
        "visible": true,
        "purchasable": true,
        "virtual": false,
        "downloadable": false,
        "downloads": [],
        "download_limit": -1,
        "download_expiry": -1,
        "tax_status": "taxable",
        "tax_class": "",
        "manage_stock": false,
        "stock_quantity": null,
        "in_stock": true,
        "backorders": "no",
        "backorders_allowed": false,
        "backordered": false,
        "weight": "",
        "dimensions": {
            "length": "",
            "width": "",
            "height": ""
        },
        "shipping_class": "",
        "shipping_class_id": 0,
        "image": {
            "id": 0,
            "date_created": "2018-02-18T08:13:08",
            "date_created_gmt": "2018-02-18T08:13:08",
            "date_modified": "2018-02-18T08:13:08",
            "date_modified_gmt": "2018-02-18T08:13:08",
            "src": "http://wcfm.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
            "name": "Placeholder",
            "alt": "Placeholder",
            "position": 0
        },
        "attributes": [
            {
                "id": 0,
                "name": "color",
                "option": "black"
            }
        ],
        "menu_order": 3,
        "meta_data": []
    }
]
```

This API helps you to view all the product variations.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/<product_id>/variations`

### Query Parameters

Parameter | Type | Description
--------- | ------- | -----------
`context` | string | Scope under which the request is made; determines fields present in response. Options: `view` and `edit`. Default is `view`.
`page` | integer | Current page of the collection. Default is `1`
`per_page` | integer | Maximum number of items to be returned in result set. Default is `10`.
`search` | string | Limit results to those matching a string.
`after` | string |  Limit response to resources published after a given ISO8601 compliant date.
`before` |  string |  Limit response to resources published before a given ISO8601 compliant date.
`exclude` | array | Ensure result set excludes specific IDs.
`include` | array | Limit result set to specific ids.
`offset` |  integer | Offset the result set by a specific number of items.
`order` | string |  Order sort attribute ascending or descending. Options: asc and desc. Default is desc.
`orderby` | string |  Sort collection by object attribute. Options: date, id, include, title and slug. Default is date.
`parent` |  array | Limit result set to those of particular parent IDs.
`parent_exclude` |  array | Limit result set to all items except those of a particular parent ID.
`slug` |  string |  Limit result set to products with a specific slug.
`status` |  string |  Limit result set to products assigned a specific status. Options: any, draft, pending, private and publish. Default is any.
`type` |  string |  Limit result set to products assigned a specific type. Options: simple, grouped, external and variable.
`sku` | string |  Limit result set to products with a specific SKU.
`featured` |  boolean | Limit result set to featured products.
`category` |  string |  Limit result set to products assigned a specific category ID.
`tag` | string |  Limit result set to products assigned a specific tag ID.
`shipping_class` |  string |  Limit result set to products assigned a specific shipping class ID.
`attribute` | string |  Limit result set to products with a specific attribute.
`attribute_term` |  string |  Limit result set to products with a specific attribute term ID (required an assigned attribute).
`tax_class` | string |  Limit result set to products with a specific tax class. Default options: standard, reduced-rate and zero-rate.
`in_stock` |  boolean | Limit result set to products in stock or out of stock.
`on_sale` | boolean | Limit result set to products on sale.
`min_price` | string |  Limit result set to products based on a minimum price.
`max_price` | string |  Limit result set to products based on a maximum price.


## Update a product variation

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "{\n  \"regular_price\": \"24.23\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --data '{\n  "regular_price": "24.23"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"regular_price\": \"24.23\"\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,products,72,variations,131", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131",
  "method": "PUT",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"regular_price\": \"24.23\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"regular_price\": \"24.23\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 131,
    "date_created": "2017-11-19T20:02:23",
    "date_created_gmt": "2017-11-19T20:02:23",
    "date_modified": "2018-02-18T08:12:47",
    "date_modified_gmt": "2018-02-18T08:12:47",
    "description": "",
    "permalink": "http://wcfm.test/product/sunglasses/?attribute_color=red",
    "sku": "",
    "price": "24.23",
    "regular_price": "24.23",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "on_sale": false,
    "visible": true,
    "purchasable": true,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_class": "",
    "shipping_class_id": 0,
    "image": {
        "id": 0,
        "date_created": "2018-02-18T10:50:04",
        "date_created_gmt": "2018-02-18T10:50:04",
        "date_modified": "2018-02-18T10:50:04",
        "date_modified_gmt": "2018-02-18T10:50:04",
        "src": "http://wcfm.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
        "name": "Placeholder",
        "alt": "Placeholder",
        "position": 0
    },
    "attributes": [
        {
            "id": 0,
            "name": "color",
            "option": "red"
        }
    ],
    "menu_order": 1,
    "meta_data": []
}
```

This API lets you make changes to a product variation.

### HTTP Request

`PUT http://wcfm.test/wp-json/wcfm/v1/products/<product_id>/variations/<id>`

## Delete a product variation

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "DELETE",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request DELETE \
  --url http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("DELETE", "wcfm,,wp-json,wcfm,v1,products,72,variations,131", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131",
  "method": "DELETE",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/72/variations/131")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 131,
    "date_created": "2017-11-19T20:02:23",
    "date_created_gmt": "2017-11-19T20:02:23",
    "date_modified": "2018-02-18T08:12:47",
    "date_modified_gmt": "2018-02-18T08:12:47",
    "description": "",
    "permalink": "http://wcfm.test/product/sunglasses/?attribute_color=red",
    "sku": "",
    "price": "24.23",
    "regular_price": "24.23",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "on_sale": false,
    "visible": true,
    "purchasable": true,
    "virtual": false,
    "downloadable": false,
    "downloads": [],
    "download_limit": -1,
    "download_expiry": -1,
    "tax_status": "taxable",
    "tax_class": "",
    "manage_stock": false,
    "stock_quantity": null,
    "in_stock": true,
    "backorders": "no",
    "backorders_allowed": false,
    "backordered": false,
    "weight": "",
    "dimensions": {
        "length": "",
        "width": "",
        "height": ""
    },
    "shipping_class": "",
    "shipping_class_id": 0,
    "image": {
        "id": 0,
        "date_created": "2018-02-18T11:02:21",
        "date_created_gmt": "2018-02-18T11:02:21",
        "date_modified": "2018-02-18T11:02:21",
        "date_modified_gmt": "2018-02-18T11:02:21",
        "src": "http://wcfm.test/wp-content/plugins/woocommerce/assets/images/placeholder.png",
        "name": "Placeholder",
        "alt": "Placeholder",
        "position": 0
    },
    "attributes": [
        {
            "id": 0,
            "name": "color",
            "option": "red"
        }
    ],
    "menu_order": 1,
    "meta_data": []
}
```

This API helps you delete a product variation.

### HTTP Request

`DELETE http://wcfm.test/wp-json/wcfm/v1/products/<product_id>/variations/<id>`


#Coupons
The coupons API allows you to create, view, update, and delete individual, or a batch, of coupon codes.

##Coupon properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Unique identifier for the object. `read-only`
`code` | string | Coupon code. `mandatory`
`amount` | string | The amount of discount. Should always be numeric, even if setting a percentage.
`date_created` | date-time | The date the coupon was created, in the site’s timezone. `read-only`
`date_created_gmt` | date-time | The date the coupon was created, as GMT. `read-only`
`date_modified` | date-time | The date the coupon was last modified, in the site’s timezone. `read-only`
`date_modified_gmt` | date-time | The date the coupon was last modified, as GMT. `read-only`
`discount_type` | string | Determines the type of discount that will be applied. Options: `percent`, `fixed_cart` and `fixed_product`. Default is `fixed_cart`.
`description` | string | Coupon description.
`date_expires` | string | The date the coupon expires, in the site’s timezone.
`date_expires_gmt` | string | The date the coupon expires, as GMT.
`usage_count` | integer | Number of times the coupon has been used already. `read-only`
`individual_use` | boolean | If true, the coupon can only be used individually. Other applied coupons will be removed from the cart. Default is `false`.
`product_ids` | array | List of product IDs the coupon can be used on.
`excluded_product_ids` | array | List of product IDs the coupon cannot be used on.
`usage_limit` | integer | How many times the coupon can be used in total.
`usage_limit_per_user` | integer | How many times the coupon can be used per customer.
`limit_usage_to_x_items` | integer | Max number of items in the cart the coupon can be applied to.
`free_shipping` | boolean | If true and if the free shipping method requires a coupon, this coupon will enable free shipping. Default is `false`.
`product_categories` | array | List of category IDs the coupon applies to.
`excluded_product_categories` | array | List of category IDs the coupon does not apply to.
`exclude_sale_items` | boolean | If true, this coupon will not be applied to items that have sale prices. Default is `false`.
`minimum_amount` | string | Minimum order amount that needs to be in the cart before coupon applies.
`maximum_amount` | string | Maximum order amount allowed when using the coupon.
`email_restrictions` | array | List of email addresses that can use this coupon.
`used_by` | array | List of user IDs (or guest email addresses) that have used the coupon. `read-only`
`meta_data` | array | Meta data.

###Coupon - Meta data properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Meta ID. `read-only`
`key` | string | Meta key.
`value` | string | Meta value.

##Create a coupon

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/coupons/?code=REST",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n  \"code\": \"10off\",\n  \"discount_type\": \"percent\",\n  \"amount\": \"10\",\n  \"product_ids\": [5611,72]\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request POST \
  --url 'http://wcfm.test/wp-json/wcfm/v1/coupons/?code=REST' \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --data '{\n  "code": "10off",\n  "discount_type": "percent",\n  "amount": "10",\n  "product_ids": [5611,72]\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"code\": \"10off\",\n  \"discount_type\": \"percent\",\n  \"amount\": \"10\",\n  \"product_ids\": [5611,72]\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("POST", "wcfm,,wp-json,wcfm,v1,coupons,", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/coupons/?code=REST",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"code\": \"10off\",\n  \"discount_type\": \"percent\",\n  \"amount\": \"10\",\n  \"product_ids\": [5611,72]\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/coupons/?code=REST")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"code\": \"10off\",\n  \"discount_type\": \"percent\",\n  \"amount\": \"10\",\n  \"product_ids\": [5611,72]\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5613,
    "code": "10off",
    "amount": "10.00",
    "date_created": "2018-02-19T05:20:16",
    "date_created_gmt": "2018-02-19T05:20:16",
    "date_modified": "2018-02-19T05:20:16",
    "date_modified_gmt": "2018-02-19T05:20:16",
    "discount_type": "percent",
    "description": "",
    "date_expires": null,
    "date_expires_gmt": null,
    "usage_count": 0,
    "individual_use": false,
    "product_ids": [
        5611,
        72
    ],
    "excluded_product_ids": [],
    "usage_limit": null,
    "usage_limit_per_user": null,
    "limit_usage_to_x_items": null,
    "free_shipping": false,
    "product_categories": [],
    "excluded_product_categories": [],
    "exclude_sale_items": false,
    "minimum_amount": "0.00",
    "maximum_amount": "0.00",
    "email_restrictions": [],
    "used_by": [],
    "meta_data": []
}
```

This API helps you to create a new coupon.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/coupons/?code=REST`


##Get single Coupon

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/coupons/5613",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW"
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/coupons/5613 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'content-type: multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'content-type': "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,coupons,5613", headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/coupons/5613",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "contentType": false,
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/coupons/5613")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["content-type"] = 'multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5613,
    "code": "10off",
    "amount": "10.00",
    "date_created": "2018-02-19T05:20:16",
    "date_created_gmt": "2018-02-19T05:20:16",
    "date_modified": "2018-02-19T05:20:16",
    "date_modified_gmt": "2018-02-19T05:20:16",
    "discount_type": "percent",
    "description": "",
    "date_expires": null,
    "date_expires_gmt": null,
    "usage_count": 0,
    "individual_use": false,
    "product_ids": [
        5611,
        72
    ],
    "excluded_product_ids": [],
    "usage_limit": null,
    "usage_limit_per_user": null,
    "limit_usage_to_x_items": null,
    "free_shipping": false,
    "product_categories": [],
    "excluded_product_categories": [],
    "exclude_sale_items": false,
    "minimum_amount": "0.00",
    "maximum_amount": "0.00",
    "email_restrictions": [],
    "used_by": [],
    "meta_data": []
}
```

This API lets you retrieve and view a specific coupon by ID.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/coupons/<id>`



##Get all Coupons

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/coupons/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/coupons/ \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,coupons,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/coupons/",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/coupons/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5614,
        "code": "5off",
        "amount": "5.00",
        "date_created": "2018-02-19T06:27:16",
        "date_created_gmt": "2018-02-19T06:27:16",
        "date_modified": "2018-02-19T06:27:16",
        "date_modified_gmt": "2018-02-19T06:27:16",
        "discount_type": "percent",
        "description": "",
        "date_expires": null,
        "date_expires_gmt": null,
        "usage_count": 0,
        "individual_use": false,
        "product_ids": [
            5611,
            72
        ],
        "excluded_product_ids": [],
        "usage_limit": null,
        "usage_limit_per_user": null,
        "limit_usage_to_x_items": null,
        "free_shipping": false,
        "product_categories": [],
        "excluded_product_categories": [],
        "exclude_sale_items": false,
        "minimum_amount": "0.00",
        "maximum_amount": "0.00",
        "email_restrictions": [],
        "used_by": [],
        "meta_data": []
    },
    {
        "id": 5613,
        "code": "10off",
        "amount": "10.00",
        "date_created": "2018-02-19T05:20:16",
        "date_created_gmt": "2018-02-19T05:20:16",
        "date_modified": "2018-02-19T05:20:16",
        "date_modified_gmt": "2018-02-19T05:20:16",
        "discount_type": "percent",
        "description": "",
        "date_expires": null,
        "date_expires_gmt": null,
        "usage_count": 0,
        "individual_use": false,
        "product_ids": [
            5611,
            72
        ],
        "excluded_product_ids": [],
        "usage_limit": null,
        "usage_limit_per_user": null,
        "limit_usage_to_x_items": null,
        "free_shipping": false,
        "product_categories": [],
        "excluded_product_categories": [],
        "exclude_sale_items": false,
        "minimum_amount": "0.00",
        "maximum_amount": "0.00",
        "email_restrictions": [],
        "used_by": [],
        "meta_data": []
    }
]
```

This API helps you to list all the coupons of a vendor that have been created.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/coupons/`

### Available parameters

Parameter | Type | Description
--------- | ---- | -----------
`context` | string | Scope under which the request is made; determines fields present in response. Options: `view` and `edit`. Default is `view`.
`page` | integer | Current page of the collection. Default is `1`.
`per_page` | integer | Maximum number of items to be returned in result set. Default is `10`.
`search` | string | Limit results to those matching a string.
`after` | string | Limit response to resources published after a given ISO8601 compliant date.
`before` | string | Limit response to resources published before a given ISO8601 compliant date.
`exclude` | array | Ensure result set excludes specific IDs.
`include` | array | Limit result set to specific ids.
`offset` | integer | Offset the result set by a specific number of items.
`order` | string | Order sort attribute ascending or descending. Options: `asc` and `desc`. Default is `desc`.
`orderby` | string | Sort collection by object attribute. Options: `date`, `id`, `include`, `title` and `slug`. Default is `date`.
`code` | string | Limit result set to resources with a specific code.



##Update a Coupon

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test//wp-json/wcfm/v1/coupons/5613",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "{\n  \"amount\": \"5\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url http://wcfm.test//wp-json/wcfm/v1/coupons/5613 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --data '{\n  "amount": "5"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"amount\": \"5\"\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,coupons,5613", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test//wp-json/wcfm/v1/coupons/5613",
  "method": "PUT",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"amount\": \"5\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test//wp-json/wcfm/v1/coupons/5613")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"amount\": \"5\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5613,
    "code": "10off",
    "amount": "5.00",
    "date_created": "2018-02-19T05:20:16",
    "date_created_gmt": "2018-02-19T05:20:16",
    "date_modified": "2018-02-19T05:20:16",
    "date_modified_gmt": "2018-02-19T05:20:16",
    "discount_type": "percent",
    "description": "",
    "date_expires": null,
    "date_expires_gmt": null,
    "usage_count": 0,
    "individual_use": false,
    "product_ids": [
        5611,
        72
    ],
    "excluded_product_ids": [],
    "usage_limit": null,
    "usage_limit_per_user": null,
    "limit_usage_to_x_items": null,
    "free_shipping": false,
    "product_categories": [],
    "excluded_product_categories": [],
    "exclude_sale_items": false,
    "minimum_amount": "0.00",
    "maximum_amount": "0.00",
    "email_restrictions": [],
    "used_by": [],
    "meta_data": []
}
```

This API lets you make changes to a coupon.

### HTTP Request

`PUT http://wcfm.test/wp-json/wcfm/v1/coupons/<id>`




# Orders

The orders API allows you to create, view, update, and delete individual, or a batch, of orders.

## Order properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Unique identifier for the resource. `read-only`
`parent_id` | integer | Parent order ID.
`number` | string | Order number. `read-only`
`order_key` | string | Order key. `read-only`
`created_via` | string | Shows where the order was created. `read-only`
`version` | integer | Version of WooCommerce which last updated the order. `read-only`
`status` | string | Order status. Options: `pending`, `processing`, `on-hold`, `completed`, `cancelled`, `refunded` and `failed`. Default is `pending`.
`currency` | string | Currency the order was created with, in ISO format. Options: `AED`, `AFN`, `ALL`, `AMD`, `ANG`, `AOA`, `ARS`, `AUD`, `AWG`, `AZN`, `BAM`, `BBD`, `BDT`, `BGN`, `BHD`, `BIF`, `BMD`, `BND`, `BOB`, `BRL`, `BSD`, `BTC`, `BTN`, `BWP`, `BYR`, `BZD`, `CAD`, `CDF`, `CHF`, `CLP`, `CNY`, `COP`, `CRC`, `CUC`, `CUP`, `CVE`, `CZK`, `DJF`, `DKK`, `DOP`, `DZD`, `EGP`, `ERN`, `ETB`, `EUR`, `FJD`, `FKP`, `GBP`, `GEL`, `GGP`, `GHS`, `GIP`, `GMD`, `GNF`, `GTQ`, `GYD`, `HKD`, `HNL`, `HRK`, `HTG`, `HUF`, `IDR`, `ILS`, `IMP`, `INR`, `IQD`, `IRR`, `IRT`, `ISK`, `JEP`, `JMD`, `JOD`, `JPY`, `KES`, `KGS`, `KHR`, `KMF`, `KPW`, `KRW`, `KWD`, `KYD`, `KZT`, `LAK`, `LBP`, `LKR`, `LRD`, `LSL`, `LYD`, `MAD`, `MDL`, `MGA`, `MKD`, `MMK`, `MNT`, `MOP`, `MRO`, `MUR`, `MVR`, `MWK`, `MXN`, `MYR`, `MZN`, `NAD`, `NGN`, `NIO`, `NOK`, `NPR`, `NZD`, `OMR`, `PAB`, `PEN`, `PGK`, `PHP`, `PKR`, `PLN`, `PRB`, `PYG`, `QAR`, `RON`, `RSD`, `RUB`, `RWF`, `SAR`, `SBD`, `SCR`, `SDG`, `SEK`, `SGD`, `SHP`, `SLL`, `SOS`, `SRD`, `SSP`, `STD`, `SYP`, `SZL`, `THB`, `TJS`, `TMT`, `TND`, `TOP`, `TRY`, `TTD`, `TWD`, `TZS`, `UAH`, `UGX`, `USD`, `UYU`, `UZS`, `VEF`, `VND`, `VUV`, `WST`, `XAF`, `XCD`, `XOF`, `XPF`, `YER`, `ZAR` and `ZMW`. Default is `USD`.
`date_created` | date-time | The date the order was created, in the site’s timezone. `read-only`
`date_created_gmt` | date-time | The date the order was created, as GMT. `read-only`
`date_modified` | date-time | The date the order was last modified, in the site’s timezone. `read-only`
`date_modified_gmt` | date-time | The date the order was last modified, as GMT. `read-only`
`discount_total` | string | Total discount amount for the order. `read-only`
`discount_tax` | string | Total discount tax amount for the order. `read-only`
`shipping_total` | string | Total shipping amount for the order. `read-only`
`shipping_tax` | string | Total shipping tax amount for the order. `read-only`
`cart_tax` | string | Sum of line item taxes only. `read-only`
`total` | string | Grand total. `read-only`
`total_tax` | string | Sum of all taxes. `read-only`
`prices_include_tax` | boolean | True the prices included tax during checkout. `read-only`
`customer_id` | integer | User ID who owns the order. 0 for guests. Default is `0`.
`customer_ip_address` | string | Customer’s IP address. `read-only`
`customer_user_agent` | string | User agent of the customer. `read-only`
`customer_note` | string | Note left by customer during checkout.
`billing` | object | Billing address.
`shipping` | object | Shipping address.
`payment_method` | string | Payment method ID.
`payment_method_title` | string | Payment method title.
`transaction_id` | string | Unique transaction ID.
`date_paid` | date-time | The date the order was paid, in the site’s timezone. `read-only`
`date_paid_gmt` | date-time | The date the order was paid, as GMT. `read-only`
`date_completed` | date-time | The date the order was completed, in the site’s timezone. `read-only`
`date_completed_gmt` | date-time | The date the order was completed, as GMT. `read-only`
`cart_hash` | string | MD5 hash of cart items to ensure orders are not modified. `read-only`
`meta_data` | array | Meta data.
`line_items` | array | Line items data.
`tax_lines` | array | Tax lines data. `read-only`
`shipping_lines` | array | Shipping lines data.
`fee_lines` | array | Fee lines data.
`coupon_lines` | array | Coupons line data.
`refunds` | array | List of refunds. `read-only`
`set_paid` | boolean | Define if the order is paid. It will set the status to processing and reduce stock items. Default is `false`. `write-only`


### Order - Billing properties

Attribute | Type | Description
--------- | ---- | -----------
`first_name` | string | First name.
`last_name` | string | Last name.
`company` | string | Company name.
`address_1` | string | Address line 1
`address_2` | string | Address line 2
`city` | string | City name.
`state` | string | ISO code or name of the state, province or district.
`postcode` | string | Postal code.
`country` | string | Country code in ISO 3166-1 alpha-2 format.
`email` | string | Email address.
`phone` | string | Phone number.


### Order - Shipping properties

Attribute | Type | Description
--------- | ---- | -----------
`first_name` | string | First name.
`last_name` | string | Last name.
`company` | string | Company name.
`address_1` | string | Address line 1
`address_2` | string | Address line 2
`city` | string | City name.
`state` | string | ISO code or name of the state, province or district.
`postcode` | string | Postal code.
`country` | string | Country code in ISO 3166-1 alpha-2 format.


### Order - Meta data properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Meta ID. `read-only`
`key` | string | Meta key.
`value` | string | Meta value.


### Order - Line items properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Item ID. `read-only`
`name` | string | Product name.
`product_id` | integer | Product ID.
`variation_id` | integer | Variation ID, if applicable.
`quantity` | integer | Quantity ordered.
`tax_class` | integer | Tax class of product.
`subtotal` | string | Line subtotal (before discounts).
`subtotal_tax` | string | Line subtotal tax (before discounts). `read-only`
`total` | string | Line total (after discounts).
`total_tax` | string | Line total tax (after discounts). `read-only`
`taxes` | array | Line taxes. `read-only`
`meta_data` | array | Meta data.
`sku` | string | Product SKU. `read-only`
`price` | string | Product price. `read-only`

### Order - Tax lines properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Item ID. `read-only`
`rate_code` | string | Tax rate code. `read-only`
`rate_id` | string | Tax rate ID. `read-only`
`label` | string | Tax rate label. `read-only`
`compound` | boolean | Show if is a compound tax rate. `read-only`
`tax_total` | string | Tax total (not including shipping taxes). `read-only`
`shipping_tax_total` | string | Shipping tax total. `read-only`
`meta_data` | array | Meta data.


### Order - Shipping lines properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Item ID. `read-only`
`method_title` | string | Shipping method name.
`method_id` | string | Shipping method ID.
`total` | string | Line total (after discounts).
`total_tax` | string | Line total tax (after discounts). `read-only`
`taxes` | array | Line taxes. `read-only`
`meta_data` | array | Meta data.


### Order - Fee lines properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Item ID. `read-only`
`name` | string | Fee name.
`tax_class` | string | Tax class of fee.
`tax_status` | string | Tax status of fee. Options: `taxable` and `none`.
`total` | string | Line total (after discounts).
`total_tax` | string | Line total tax (after discounts). `read-only`
`taxes` | array | Line taxes. `read-only`
`meta_data` | array | Meta data.


### Order - Coupon lines properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Item ID. `read-only`
`code` | string | Coupon code.
`discount` | string | Discount total.
`discount_tax` | string | Discount total tax. `read-only`
`meta_data` | array | Meta data.


### Order - Refunds properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Refund ID. `read-only`
`reason` | string | Refund reason. `read-only`
`total` | string | Refund total. `read-only`


## Get an Order

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/5616",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/5616 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,orders,5616", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/5616",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/5616")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5616,
    "parent_id": 0,
    "number": "5616",
    "order_key": "wc_order_5a8aa16f15e37",
    "created_via": "checkout",
    "version": "3.3.1",
    "status": "processing",
    "currency": "USD",
    "date_created": "2018-02-19T10:05:35",
    "date_created_gmt": "2018-02-19T10:05:35",
    "date_modified": "2018-02-19T10:05:35",
    "date_modified_gmt": "2018-02-19T10:05:35",
    "discount_total": "0",
    "discount_tax": "0",
    "shipping_total": "0",
    "shipping_tax": "0",
    "cart_tax": "0",
    "total": "45",
    "total_tax": "0",
    "prices_include_tax": false,
    "customer_id": 1,
    "customer_ip_address": "::1",
    "customer_user_agent": "mozilla/5.0 (macintosh; intel mac os x 10_13_3) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.167 safari/537.36",
    "customer_note": "Sample order",
    "billing": {
        "first_name": "Sk",
        "last_name": "Shaikat",
        "company": "weDevs",
        "address_1": "H/15, Extension Pallabi, Rupnagar",
        "address_2": "",
        "city": "Dhaka",
        "state": "DHA",
        "postcode": "1216",
        "country": "BD",
        "email": "sk.shaikat@hotmail.com",
        "phone": "01670737590"
    },
    "shipping": {
        "first_name": "",
        "last_name": "",
        "company": "",
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "postcode": "",
        "country": ""
    },
    "payment_method": "cod",
    "payment_method_title": "Cash on delivery",
    "transaction_id": "",
    "date_paid": null,
    "date_paid_gmt": null,
    "date_completed": null,
    "date_completed_gmt": null,
    "cart_hash": "02debe00d34e20920157a42939a7d0c4",
    "meta_data": [
        {
            "id": 8106,
            "key": "_wcfm_admin_fee",
            "value": "4.503"
        }
    ],
    "line_items": [
        {
            "id": 36,
            "name": "Premium Quality REST",
            "product_id": 5611,
            "variation_id": 0,
            "quantity": 1,
            "tax_class": "",
            "subtotal": "25",
            "subtotal_tax": "0",
            "total": "25",
            "total_tax": "0",
            "taxes": [],
            "meta_data": [],
            "sku": "",
            "price": 24.53999999999999914734871708787977695465087890625
        },
        {
            "id": 37,
            "name": "iPhone X",
            "product_id": 5605,
            "variation_id": 0,
            "quantity": 1,
            "tax_class": "",
            "subtotal": "20",
            "subtotal_tax": "0",
            "total": "20",
            "total_tax": "0",
            "taxes": [],
            "meta_data": [],
            "sku": "",
            "price": 20.489999999999998436805981327779591083526611328125
        }
    ],
    "tax_lines": [],
    "shipping_lines": [],
    "fee_lines": [],
    "coupon_lines": [],
    "refunds": []
}
```

This API lets you retrieve and view a specific order.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/orders/<id>`



## Get all Orders

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/ \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,orders,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5616,
        "parent_id": 0,
        "number": "5616",
        "order_key": "wc_order_5a8aa16f15e37",
        "created_via": "checkout",
        "version": "3.3.1",
        "status": "processing",
        "currency": "USD",
        "date_created": "2018-02-19T10:05:35",
        "date_created_gmt": "2018-02-19T10:05:35",
        "date_modified": "2018-02-19T10:05:35",
        "date_modified_gmt": "2018-02-19T10:05:35",
        "discount_total": "0",
        "discount_tax": "0",
        "shipping_total": "0",
        "shipping_tax": "0",
        "cart_tax": "0",
        "total": "45",
        "total_tax": "0",
        "prices_include_tax": false,
        "customer_id": 1,
        "customer_ip_address": "::1",
        "customer_user_agent": "mozilla/5.0 (macintosh; intel mac os x 10_13_3) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.167 safari/537.36",
        "customer_note": "Sample order",
        "billing": {
            "first_name": "Sk",
            "last_name": "Shaikat",
            "company": "weDevs",
            "address_1": "H/15, Extension Pallabi, Rupnagar",
            "address_2": "",
            "city": "Dhaka",
            "state": "DHA",
            "postcode": "1216",
            "country": "BD",
            "email": "sk.shaikat@hotmail.com",
            "phone": "01670737590"
        },
        "shipping": {
            "first_name": "",
            "last_name": "",
            "company": "",
            "address_1": "",
            "address_2": "",
            "city": "",
            "state": "",
            "postcode": "",
            "country": ""
        },
        "payment_method": "cod",
        "payment_method_title": "Cash on delivery",
        "transaction_id": "",
        "date_paid": null,
        "date_paid_gmt": null,
        "date_completed": null,
        "date_completed_gmt": null,
        "cart_hash": "02debe00d34e20920157a42939a7d0c4",
        "meta_data": [
            {
                "id": 8106,
                "key": "_wcfm_admin_fee",
                "value": "4.503"
            }
        ],
        "line_items": [
            {
                "id": 36,
                "name": "Premium Quality REST",
                "product_id": 5611,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "25",
                "subtotal_tax": "0",
                "total": "25",
                "total_tax": "0",
                "taxes": [],
                "meta_data": [],
                "sku": "",
                "price": 24.53999999999999914734871708787977695465087890625
            },
            {
                "id": 37,
                "name": "iPhone X",
                "product_id": 5605,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "20",
                "subtotal_tax": "0",
                "total": "20",
                "total_tax": "0",
                "taxes": [],
                "meta_data": [],
                "sku": "",
                "price": 20.489999999999998436805981327779591083526611328125
            }
        ],
        "tax_lines": [],
        "shipping_lines": [],
        "fee_lines": [],
        "coupon_lines": [],
        "refunds": []
    },
    {
        "id": 5615,
        "parent_id": 0,
        "number": "5615",
        "order_key": "wc_order_5a8aa052d5bf7",
        "created_via": "checkout",
        "version": "3.3.1",
        "status": "processing",
        "currency": "USD",
        "date_created": "2018-02-19T10:00:50",
        "date_created_gmt": "2018-02-19T10:00:50",
        "date_modified": "2018-02-19T10:00:51",
        "date_modified_gmt": "2018-02-19T10:00:51",
        "discount_total": "0",
        "discount_tax": "0",
        "shipping_total": "0",
        "shipping_tax": "0",
        "cart_tax": "0",
        "total": "25",
        "total_tax": "0",
        "prices_include_tax": false,
        "customer_id": 1,
        "customer_ip_address": "::1",
        "customer_user_agent": "mozilla/5.0 (macintosh; intel mac os x 10_13_3) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.167 safari/537.36",
        "customer_note": "Hello you. Thanks",
        "billing": {
            "first_name": "Mohaiminul",
            "last_name": "Islam",
            "company": "",
            "address_1": "H/15, Extension Pallabi, Rupnagar",
            "address_2": "",
            "city": "Dhaka",
            "state": "DHA",
            "postcode": "1216",
            "country": "BD",
            "email": "sk.shaikat@yhoo.com",
            "phone": "01670737590"
        },
        "shipping": {
            "first_name": "",
            "last_name": "",
            "company": "",
            "address_1": "",
            "address_2": "",
            "city": "",
            "state": "",
            "postcode": "",
            "country": ""
        },
        "payment_method": "cod",
        "payment_method_title": "Cash on delivery",
        "transaction_id": "",
        "date_paid": null,
        "date_paid_gmt": null,
        "date_completed": null,
        "date_completed_gmt": null,
        "cart_hash": "942cb13d44b32e15f0a030aa9c868dbd",
        "meta_data": [
            {
                "id": 8057,
                "key": "_wcfm_admin_fee",
                "value": "2.454"
            }
        ],
        "line_items": [
            {
                "id": 35,
                "name": "Premium Quality REST",
                "product_id": 5611,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "25",
                "subtotal_tax": "0",
                "total": "25",
                "total_tax": "0",
                "taxes": [],
                "meta_data": [],
                "sku": "",
                "price": 24.53999999999999914734871708787977695465087890625
            }
        ],
        "tax_lines": [],
        "shipping_lines": [],
        "fee_lines": [],
        "coupon_lines": [],
        "refunds": []
    }
]
```

This API helps you to view all the orders.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/orders/`

### Available parameters

Attribute | Type | Description
--------- | ---- | -----------
`context` | string | Scope under which the request is made; determines fields present in response. Options: `view` and `edit`. Default is `view`.
`page` | integer | Current page of the collection. Default is `1`.
`per_page` | integer | Maximum number of items to be returned in result set. Default is `10`.
`search` | string | Limit results to those matching a string.
`after` | string | Limit response to resources published after a given ISO8601 compliant date.
`before` | string | Limit response to resources published before a given ISO8601 compliant date.
`exclude` | array | Ensure result set excludes specific IDs.
`include` | array | Limit result set to specific ids.
`offset` | integer | Offset the result set by a specific number of items.
`order` | string | Order sort attribute ascending or descending. Options: `asc` and `desc`. Default is `desc`.
`orderby` | string | Sort collection by object attribute. Options: `date`, `id`, `include`, `title` and `slug`. Default is `date`.
`parent` | array | Limit result set to those of particular parent IDs.
`parent_exclude` | array | Limit result set to all items except those of a particular parent ID.
`status` | string | Limit result set to orders assigned a specific status. Options: `any`, `pending`, `processing`, `on-hold`, `completed`, `cancelled`, `refunded` and `failed`. Default is `any`.
`customer` | integer | Limit result set to orders assigned a specific customer.
`product` | integer | Limit result set to orders assigned a specific product.
`dp` | integer | Number of decimal points to use in each resource. Default is `2`.


## Get all Orders with pagination

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/?per_page=1&page=2",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url 'http://wcfm.test/wp-json/wcfm/v1/orders/?per_page=1&page=2' \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,orders,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/?per_page=1&page=2",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/?per_page=1&page=2")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5615,
        "parent_id": 0,
        "number": "5615",
        "order_key": "wc_order_5a8aa052d5bf7",
        "created_via": "checkout",
        "version": "3.3.1",
        "status": "processing",
        "currency": "USD",
        "date_created": "2018-02-19T10:00:50",
        "date_created_gmt": "2018-02-19T10:00:50",
        "date_modified": "2018-02-19T10:00:51",
        "date_modified_gmt": "2018-02-19T10:00:51",
        "discount_total": "0",
        "discount_tax": "0",
        "shipping_total": "0",
        "shipping_tax": "0",
        "cart_tax": "0",
        "total": "25",
        "total_tax": "0",
        "prices_include_tax": false,
        "customer_id": 1,
        "customer_ip_address": "::1",
        "customer_user_agent": "mozilla/5.0 (macintosh; intel mac os x 10_13_3) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.167 safari/537.36",
        "customer_note": "Hello you. Thanks",
        "billing": {
            "first_name": "Mohaiminul",
            "last_name": "Islam",
            "company": "",
            "address_1": "H/15, Extension Pallabi, Rupnagar",
            "address_2": "",
            "city": "Dhaka",
            "state": "DHA",
            "postcode": "1216",
            "country": "BD",
            "email": "sk.shaikat@yhoo.com",
            "phone": "01670737590"
        },
        "shipping": {
            "first_name": "",
            "last_name": "",
            "company": "",
            "address_1": "",
            "address_2": "",
            "city": "",
            "state": "",
            "postcode": "",
            "country": ""
        },
        "payment_method": "cod",
        "payment_method_title": "Cash on delivery",
        "transaction_id": "",
        "date_paid": null,
        "date_paid_gmt": null,
        "date_completed": null,
        "date_completed_gmt": null,
        "cart_hash": "942cb13d44b32e15f0a030aa9c868dbd",
        "meta_data": [
            {
                "id": 8057,
                "key": "_wcfm_admin_fee",
                "value": "2.454"
            }
        ],
        "line_items": [
            {
                "id": 35,
                "name": "Premium Quality REST",
                "product_id": 5611,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "25",
                "subtotal_tax": "0",
                "total": "25",
                "total_tax": "0",
                "taxes": [],
                "meta_data": [],
                "sku": "",
                "price": 24.53999999999999914734871708787977695465087890625
            }
        ],
        "tax_lines": [],
        "shipping_lines": [],
        "fee_lines": [],
        "coupon_lines": [],
        "refunds": []
    }
]
```

This API helps you to view all the orders with pagination.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/orders/?per_page=2&page=2`

### Available parameters

Attribute | Type | Description
--------- | ---- | -----------
`context` | string | Scope under which the request is made; determines fields present in response. Options: `view` and `edit`. Default is `view`.
`page` | integer | Current page of the collection. Default is `1`.
`per_page` | integer | Maximum number of items to be returned in result set. Default is `10`.
`search` | string | Limit results to those matching a string.
`after` | string | Limit response to resources published after a given ISO8601 compliant date.
`before` | string | Limit response to resources published before a given ISO8601 compliant date.
`exclude` | array | Ensure result set excludes specific IDs.
`include` | array | Limit result set to specific ids.
`offset` | integer | Offset the result set by a specific number of items.
`order` | string | Order sort attribute ascending or descending. Options: `asc` and `desc`. Default is `desc`.
`orderby` | string | Sort collection by object attribute. Options: `date`, `id`, `include`, `title` and `slug`. Default is `date`.
`parent` | array | Limit result set to those of particular parent IDs.
`parent_exclude` | array | Limit result set to all items except those of a particular parent ID.
`status` | string | Limit result set to orders assigned a specific status. Options: `any`, `pending`, `processing`, `on-hold`, `completed`, `cancelled`, `refunded` and `failed`. Default is `any`.
`customer` | integer | Limit result set to orders assigned a specific customer.
`product` | integer | Limit result set to orders assigned a specific product.
`dp` | integer | Number of decimal points to use in each resource. Default is `2`.



## Update an Order

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/5615/?status=wc-pending",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url 'http://wcfm.test/wp-json/wcfm/v1/orders/5615/?status=wc-pending' \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,orders,5615,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/5615/?status=wc-pending",
  "method": "PUT",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/5615/?status=wc-pending")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 5615,
    "parent_id": 0,
    "number": "5615",
    "order_key": "wc_order_5a8aa052d5bf7",
    "created_via": "checkout",
    "version": "3.3.1",
    "status": "pending",
    "currency": "USD",
    "date_created": "2018-02-19T10:00:50",
    "date_created_gmt": "2018-02-19T10:00:50",
    "date_modified": "2018-02-20T03:22:03",
    "date_modified_gmt": "2018-02-20T03:22:03",
    "discount_total": "0",
    "discount_tax": "0",
    "shipping_total": "0",
    "shipping_tax": "0",
    "cart_tax": "0",
    "total": "25",
    "total_tax": "0",
    "prices_include_tax": false,
    "customer_id": 1,
    "customer_ip_address": "::1",
    "customer_user_agent": "mozilla/5.0 (macintosh; intel mac os x 10_13_3) applewebkit/537.36 (khtml, like gecko) chrome/64.0.3282.167 safari/537.36",
    "customer_note": "Hello you. Thanks",
    "billing": {
        "first_name": "Mohaiminul",
        "last_name": "Islam",
        "company": "",
        "address_1": "H/15, Extension Pallabi, Rupnagar",
        "address_2": "",
        "city": "Dhaka",
        "state": "DHA",
        "postcode": "1216",
        "country": "BD",
        "email": "sk.shaikat@yhoo.com",
        "phone": "01670737590"
    },
    "shipping": {
        "first_name": "",
        "last_name": "",
        "company": "",
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "postcode": "",
        "country": ""
    },
    "payment_method": "cod",
    "payment_method_title": "Cash on delivery",
    "transaction_id": "",
    "date_paid": null,
    "date_paid_gmt": null,
    "date_completed": null,
    "date_completed_gmt": null,
    "cart_hash": "942cb13d44b32e15f0a030aa9c868dbd",
    "meta_data": [
        {
            "id": 8057,
            "key": "_wcfm_admin_fee",
            "value": "2.454"
        }
    ],
    "line_items": [
        {
            "id": 35,
            "name": "Premium Quality REST",
            "product_id": 5611,
            "variation_id": 0,
            "quantity": 1,
            "tax_class": "",
            "subtotal": "25",
            "subtotal_tax": "0",
            "total": "25",
            "total_tax": "0",
            "taxes": [],
            "meta_data": [],
            "sku": "",
            "price": 24.53999999999999914734871708787977695465087890625
        }
    ],
    "tax_lines": [],
    "shipping_lines": [],
    "fee_lines": [],
    "coupon_lines": [],
    "refunds": []
}
```

This API lets you make changes to an order.

### HTTP Request

`PUT http://wcfm.test/wp-json/wcfm/v1/orders/<id>/?status=wc-pending`


## Get Orders Summary

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/summary",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/summary \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,orders,summary", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/summary",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/summary")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "wc-pending": 1,
    "wc-completed": 0,
    "wc-on-hold": 0,
    "wc-processing": 1,
    "wc-refunded": 0,
    "wc-cancelled": 0,
    "total": 2
}
```

This API helps you to get summary of orders.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/orders/summary`


# Order Notes

The order notes API allows you to create, view, and delete individual order notes.
Order notes are added by administrators and programmatically to store data about an order, or order events.

## Order note properties

Attribute | Type | Description
--------- | ---- | -----------
`id` | integer | Unique identifier for the resource. `read-only`
`date_created` | date-time | The date the order note was created, in the site’s timezone. `read-only`
`date_created_gmt` | date-time | The date the order note was created, as GMT. `read-only`
`note` | string | Order note content. `mandatory`
`customer_note` | boolean | If true, the note will be shown to customers and they will be notified. If false, the note will be for admin reference only. Default is `false`.


## Create note for an Order

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n  \"note\": \"Order ok!!! Note from API\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request POST \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --data '{\n  "note": "Order ok!!! Note from API"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"note\": \"Order ok!!! Note from API\"\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("POST", "wcfm,,wp-json,wcfm,v1,orders,5616,notes", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"note\": \"Order ok!!! Note from API\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"note\": \"Order ok!!! Note from API\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 169,
    "date_created": "2018-02-20T04:43:55",
    "date_created_gmt": "2018-02-20T04:43:55",
    "note": "Order ok!!! Note from API",
    "customer_note": false
}
```

This API helps you to create a new note for an order.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/orders/<id>/notes`


## Get a note from an Order

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,orders,5616,notes,169", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 169,
    "date_created": "2018-02-20T04:43:55",
    "date_created_gmt": "2018-02-20T04:43:55",
    "note": "Order ok!!! Note from API",
    "customer_note": false
}
```

This API lets you retrieve and view a specific note from an order.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/orders/<order_id>/notes/<id>`


## Get all notes from an Order

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/ \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,orders,5616,notes,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 169,
        "date_created": "2018-02-20T04:43:55",
        "date_created_gmt": "2018-02-20T04:43:55",
        "note": "Order ok!!! Note from API",
        "customer_note": false
    },
    {
        "id": 167,
        "date_created": "2018-02-19T10:05:36",
        "date_created_gmt": "2018-02-19T10:05:36",
        "note": "Payment to be made upon delivery. Order status changed from Pending payment to Processing.",
        "customer_note": false
    }
]
```

This API helps you to view all the notes from an order.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/orders/<id>/notes/`

### Available parameters

Attribute | Type | Description
--------- | ---- | -----------
`context` | string | Scope under which the request is made; determines fields present in response. Options: `view` and `edit`. Default is `view`.
`type` | string | Limit result to customers or internal notes. Options: `any`, `customer` and `internal`. Default is `any`.


## Delete a note from an Order

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "DELETE",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request DELETE \
  --url http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("DELETE", "wcfm,,wp-json,wcfm,v1,orders,5616,notes,169", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169",
  "method": "DELETE",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/orders/5616/notes/169")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 169,
    "date_created": "2018-02-20T04:43:55",
    "date_created_gmt": "2018-02-20T04:43:55",
    "note": "Order ok!!! Note from API",
    "customer_note": false
}
```

This API helps you delete an order note.

### HTTP Request

`DELETE http://wcfm.test/wp-json/wcfm/v1/orders/<order_id>/notes/<id>`



# Withdraws

The coupons API allows you to create, view, update, and cancel Withdraw requests.


## Create a Withdraw

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/withdraw/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n  \"amount\": \"7\",\n  \"notes\": \"API Withdraw notes\",\n  \"method\": \"bank\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
    "Content-Type: application/json",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request POST \
  --url http://wcfm.test/wp-json/wcfm/v1/withdraw/ \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --header 'Content-Type: application/json' \
  --data '{\n  "amount": "7",\n  "notes": "API Withdraw notes",\n  "method": "bank"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"amount\": \"7\",\n  \"notes\": \"API Withdraw notes\",\n  \"method\": \"bank\"\n}"

headers = {
    'Content-Type': "application/json",
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("POST", "wcfm,,wp-json,wcfm,v1,withdraw,", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/withdraw/",
  "method": "POST",
  "headers": {
    "Content-Type": "application/json",
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"amount\": \"7\",\n  \"notes\": \"API Withdraw notes\",\n  \"method\": \"bank\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/withdraw/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Content-Type"] = 'application/json'
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"amount\": \"7\",\n  \"notes\": \"API Withdraw notes\",\n  \"method\": \"bank\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "amount": 7,
    "status": 0,
    "method": "bank",
    "ip": "::1",
    "notes": "API Withdraw notes",
    "id": 9,
    "user": {
        "id": 21,
        "store_name": "postman",
        "first_name": "",
        "last_name": "",
        "email": "email@postman.com",
        "social": {
            "fb": false,
            "gplus": false,
            "twitter": false,
            "pinterest": false,
            "linkedin": false,
            "youtube": false,
            "instagram": false,
            "flickr": false
        },
        "phone": "",
        "show_email": false,
        "address": {
            "street_1": "",
            "street_2": "",
            "city": "",
            "zip": "",
            "country": "",
            "state": ""
        },
        "location": "",
        "banner": false,
        "gravatar": false,
        "products_per_page": 10,
        "show_more_product_tab": true,
        "toc_enabled": false,
        "store_toc": null,
        "featured": false,
        "rating": {
            "rating": "5.00",
            "count": 1
        }
    },
    "created_data": "2018-02-22T04:16:37"
}
```

This API helps you to create a new Withdraw request.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/withdraw/`


## Get all Withdraws

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/withdraw/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/withdraw/ \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,withdraw,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/withdraw/",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/withdraw/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": "1",
        "user": {
            "id": 21,
            "store_name": "postman",
            "first_name": "",
            "last_name": "",
            "email": "email@postman.com",
            "social": {
                "fb": false,
                "gplus": false,
                "twitter": false,
                "pinterest": false,
                "linkedin": false,
                "youtube": false,
                "instagram": false,
                "flickr": false
            },
            "phone": "",
            "show_email": false,
            "address": {
                "street_1": "",
                "street_2": "",
                "city": "",
                "zip": "",
                "country": "",
                "state": ""
            },
            "location": "",
            "banner": false,
            "gravatar": false,
            "products_per_page": 10,
            "show_more_product_tab": true,
            "toc_enabled": false,
            "store_toc": null,
            "featured": false,
            "rating": {
                "rating": "5.00",
                "count": 1
            }
        },
        "amount": "10",
        "created_data": "2018-02-20T06:37:59",
        "status": "pending",
        "method": "bank",
        "note": "API Withdraw notes",
        "ip": "::1"
    },
    {
        "id": "3",
        "user": {
            "id": 21,
            "store_name": "postman",
            "first_name": "",
            "last_name": "",
            "email": "email@postman.com",
            "social": {
                "fb": false,
                "gplus": false,
                "twitter": false,
                "pinterest": false,
                "linkedin": false,
                "youtube": false,
                "instagram": false,
                "flickr": false
            },
            "phone": "",
            "show_email": false,
            "address": {
                "street_1": "",
                "street_2": "",
                "city": "",
                "zip": "",
                "country": "",
                "state": ""
            },
            "location": "",
            "banner": false,
            "gravatar": false,
            "products_per_page": 10,
            "show_more_product_tab": true,
            "toc_enabled": false,
            "store_toc": null,
            "featured": false,
            "rating": {
                "rating": "5.00",
                "count": 1
            }
        },
        "amount": "5",
        "created_data": "2018-02-20T06:40:57",
        "status": "pending",
        "method": "bank",
        "note": "This is a test note",
        "ip": "::1"
    },
]
```

This API helps you to get all Withdraw requests.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/withdraw/`


## Get all Withdraws by Status

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/withdraw/?status=pending",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url 'http://wcfm.test/wp-json/wcfm/v1/withdraw/?status=pending' \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,withdraw,", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/withdraw/?status=pending",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/withdraw/?status=pending")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": "1",
        "user": {
            "id": 21,
            "store_name": "postman",
            "first_name": "sk",
            "last_name": "Islam",
            "email": "email@postman.com",
            "social": {
                "fb": false,
                "gplus": false,
                "twitter": false,
                "pinterest": false,
                "linkedin": false,
                "youtube": false,
                "instagram": false,
                "flickr": false
            },
            "phone": "",
            "show_email": false,
            "address": {
                "street_1": "",
                "street_2": "",
                "city": "",
                "zip": "",
                "country": "",
                "state": ""
            },
            "location": "",
            "banner": false,
            "gravatar": false,
            "products_per_page": 10,
            "show_more_product_tab": true,
            "toc_enabled": false,
            "store_toc": null,
            "featured": false,
            "rating": {
                "rating": "No Ratings found yet",
                "count": 0
            }
        },
        "amount": 10,
        "created_data": "2018-02-20T06:37:59",
        "status": "pending",
        "method": "bank",
        "note": "API Withdraw notes",
        "ip": "::1"
    },
    {
        "id": "9",
        "user": {
            "id": 21,
            "store_name": "postman",
            "first_name": "sk",
            "last_name": "Islam",
            "email": "email@postman.com",
            "social": {
                "fb": false,
                "gplus": false,
                "twitter": false,
                "pinterest": false,
                "linkedin": false,
                "youtube": false,
                "instagram": false,
                "flickr": false
            },
            "phone": "",
            "show_email": false,
            "address": {
                "street_1": "",
                "street_2": "",
                "city": "",
                "zip": "",
                "country": "",
                "state": ""
            },
            "location": "",
            "banner": false,
            "gravatar": false,
            "products_per_page": 10,
            "show_more_product_tab": true,
            "toc_enabled": false,
            "store_toc": null,
            "featured": false,
            "rating": {
                "rating": "No Ratings found yet",
                "count": 0
            }
        },
        "amount": 100.2999999999999971578290569595992565155029296875,
        "created_data": "2018-02-22T04:16:37",
        "status": "pending",
        "method": "bank",
        "note": "API Withdraw notes",
        "ip": "::1"
    }
]
```

This API helps you to get all Withdraw requests by status.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/withdraw/?status=pending`


## Get Balance Details

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/withdraw/balance",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/withdraw/balance \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,withdraw,balance", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/withdraw/balance",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/withdraw/balance")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "current_balance": 162.108,
    "withdraw_limit": "5",
    "withdraw_threshold": -1
}
```

This API helps you to get total balance with withdraw limit and threshold.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/withdraw/balance`


#Stores

The coupons API allows you to get all ingormations about stors.


## Get Single Store Info

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/stores/2",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/stores/2 \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,stores,21", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/stores/2",
  "method": "GET",
  "headers": {
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/stores/2")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 2,
    "store_name": "Seller One",
    "first_name": "Seller",
    "last_name": "One",
    "email": "seller1@ninja.coder",
    "social": {
        "fb": false,
        "gplus": false,
        "twitter": false,
        "pinterest": false,
        "linkedin": false,
        "youtube": false,
        "instagram": false,
        "flickr": false
    },
    "phone": "3493948",
    "show_email": false,
    "address": {
        "street_1": "",
        "street_2": "",
        "city": "",
        "zip": "",
        "country": "BD",
        "state": "DHA"
    },
    "location": "",
    "banner": "http://newwcfm.test/wp-content/uploads/2018/04/cropped-28472214_767944190061441_2093188867011743294_n-3.jpg",
    "gravatar": "http://newwcfm.test/wp-content/uploads/2018/04/cropped-28472214_767944190061441_2093188867011743294_n-4.jpg",
    "shop_url": "http://newwcfm.test/store/seller1/",
    "products_per_page": 10,
    "show_more_product_tab": true,
    "toc_enabled": false,
    "store_toc": null,
    "featured": false,
    "rating": {
        "rating": "0.00",
        "count": 0
    },
    "enabled": true,
    "registered": "2018-03-27 05:12:47",
    "payment": {
        "bank": {
            "ac_name": "Estern Bank LTD.",
            "ac_number": "1291233330433",
            "bank_name": "EBL",
            "bank_addr": "Dhanmondi 27",
            "routing_number": "23322221",
            "iban": "BDDBDHA",
            "swift": "BDDTETE-33"
        },
        "paypal": {
            "email": "seller1@ninja.coder"
        }
    },
    "trusted": false,
    "_links": {
        "self": [
            {
                "href": "http://newwcfm.test/wp-json/wcfm/v1/stores/2"
            }
        ],
        "collection": [
            {
                "href": "http://newwcfm.test/wp-json/wcfm/v1/stores"
            }
        ]
    }
}
```

This API helps you get single store information.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/stores/<vendor_id>`


## Get Store Products

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/stores/2/products",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/stores/2/products \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,stores,21,products", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/stores/2/products",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/stores/2/products")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5611,
        "name": "Premium Quality REST",
        "slug": "premium-quality-rest",
        "post_author": "21",
        "permalink": "http://localhost/wcfm/product/premium-quality-rest/",
        "date_created": "2018-02-18T05:07:54",
        "date_created_gmt": "2018-02-18T05:07:54",
        "date_modified": "2018-02-22T08:08:32",
        "date_modified_gmt": "2018-02-22T08:08:32",
        "type": "variable",
        "status": "publish",
        "featured": false,
        "catalog_visibility": "visible",
        "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
        "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
        "sku": "",
        "price": "9.00",
        "regular_price": "",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>9.00</span> &ndash; <span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>14.00</span>",
        "on_sale": false,
        "purchasable": true,
        "total_sales": 8,
        "virtual": false,
        "downloadable": false,
        "downloads": [],
        "download_limit": -1,
        "download_expiry": -1,
        "external_url": "",
        "button_text": "",
        "tax_status": "taxable",
        "tax_class": "",
        "manage_stock": false,
        "stock_quantity": null,
        "in_stock": true,
        "backorders": "no",
        "backorders_allowed": false,
        "backordered": false,
        "sold_individually": false,
        "weight": "",
        "dimensions": {
            "length": "",
            "width": "",
            "height": ""
        },
        "shipping_required": true,
        "shipping_taxable": true,
        "shipping_class": "",
        "shipping_class_id": 0,
        "reviews_allowed": true,
        "average_rating": "5.00",
        "rating_count": 1,
        "related_ids": [
            75,
            74,
            5605,
            5565,
            5566
        ],
        "upsell_ids": [],
        "cross_sell_ids": [],
        "parent_id": 0,
        "purchase_note": "",
        "categories": [
            {
                "id": 16,
                "name": "Hoodies",
                "slug": "hoodies"
            }
        ],
        "tags": [],
        "images": [
            {
                "id": 5609,
                "date_created": "2018-02-18T05:07:50",
                "date_created_gmt": "2018-02-18T05:07:50",
                "date_modified": "2018-02-18T05:07:50",
                "date_modified_gmt": "2018-02-18T05:07:50",
                "src": "http://localhost/wcfm/wp-content/uploads/2018/02/T_2_front-1.jpg",
                "name": "T_2_front-1.jpg",
                "alt": "",
                "position": 0
            },
            {
                "id": 5610,
                "date_created": "2018-02-18T05:07:53",
                "date_created_gmt": "2018-02-18T05:07:53",
                "date_modified": "2018-02-18T05:07:53",
                "date_modified_gmt": "2018-02-18T05:07:53",
                "src": "http://localhost/wcfm/wp-content/uploads/2018/02/T_2_back-1.jpg",
                "name": "T_2_back-1.jpg",
                "alt": "",
                "position": 1
            }
        ],
        "attributes": [
            {
                "id": 1,
                "name": "color",
                "position": 0,
                "visible": true,
                "variation": true,
                "options": [
                    "Blue",
                    "Green",
                    "Black",
                    "Black Leather"
                ]
            }
        ],
        "default_attributes": [],
        "variations": [],
        "grouped_products": [],
        "menu_order": 0,
        "meta_data": [
            {
                "id": 7940,
                "key": "pageview",
                "value": "2"
            },
            {
                "id": 8368,
                "key": "_upcoming",
                "value": ""
            },
            {
                "id": 8369,
                "key": "_available_on",
                "value": ""
            },
            {
                "id": 8370,
                "key": "_per_product_admin_commission_type",
                "value": "percentage"
            },
            {
                "id": 8371,
                "key": "_per_product_admin_commission",
                "value": ""
            }
        ]
    },
    {
        "id": 5605,
        "name": "iPhone X",
        "slug": "iphone-x-2",
        "post_author": "21",
        "permalink": "http://localhost/wcfm/product/iphone-x-2/",
        "date_created": "2018-02-18T04:08:31",
        "date_created_gmt": "2018-02-18T04:08:31",
        "date_modified": "2018-02-18T04:08:31",
        "date_modified_gmt": "2018-02-18T04:08:31",
        "type": "simple",
        "status": "publish",
        "featured": false,
        "catalog_visibility": "visible",
        "description": "",
        "short_description": "",
        "sku": "",
        "price": "20.49",
        "regular_price": "20.49",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>20.49</span>",
        "on_sale": false,
        "purchasable": true,
        "total_sales": 5,
        "virtual": false,
        "downloadable": false,
        "downloads": [],
        "download_limit": -1,
        "download_expiry": -1,
        "external_url": "",
        "button_text": "",
        "tax_status": "taxable",
        "tax_class": "",
        "manage_stock": false,
        "stock_quantity": null,
        "in_stock": true,
        "backorders": "no",
        "backorders_allowed": false,
        "backordered": false,
        "sold_individually": false,
        "weight": "",
        "dimensions": {
            "length": "",
            "width": "",
            "height": ""
        },
        "shipping_required": true,
        "shipping_taxable": true,
        "shipping_class": "",
        "shipping_class_id": 0,
        "reviews_allowed": true,
        "average_rating": "0.00",
        "rating_count": 0,
        "related_ids": [
            5518,
            40,
            5545,
            47,
            73
        ],
        "upsell_ids": [],
        "cross_sell_ids": [],
        "parent_id": 0,
        "purchase_note": "",
        "categories": [
            {
                "id": 16,
                "name": "Hoodies",
                "slug": "hoodies"
            }
        ],
        "tags": [],
        "images": [
            {
                "id": 0,
                "date_created": "2018-02-22T09:26:03",
                "date_created_gmt": "2018-02-22T09:26:03",
                "date_modified": "2018-02-22T09:26:03",
                "date_modified_gmt": "2018-02-22T09:26:03",
                "src": "http://localhost/wcfm/wp-content/plugins/woocommerce/assets/images/placeholder.png",
                "name": "Placeholder",
                "alt": "Placeholder",
                "position": 0
            }
        ],
        "attributes": [],
        "default_attributes": [],
        "variations": [],
        "grouped_products": [],
        "menu_order": 0,
        "meta_data": [
            {
                "id": 8112,
                "key": "pageview",
                "value": "1"
            }
        ]
    },
    {
        "id": 72,
        "name": "Sunglasses",
        "slug": "sunglasses",
        "post_author": "21",
        "permalink": "http://localhost/wcfm/product/sunglasses/",
        "date_created": "2017-06-15T04:26:47",
        "date_created_gmt": "2017-06-15T04:26:47",
        "date_modified": "2018-02-18T08:12:47",
        "date_modified_gmt": "2018-02-18T08:12:47",
        "type": "variable",
        "status": "publish",
        "featured": true,
        "catalog_visibility": "visible",
        "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
        "short_description": "",
        "sku": "",
        "price": "2",
        "regular_price": "",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>2.00</span> &ndash; <span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>3.00</span>",
        "on_sale": false,
        "purchasable": true,
        "total_sales": 0,
        "virtual": false,
        "downloadable": false,
        "downloads": [],
        "download_limit": -1,
        "download_expiry": -1,
        "external_url": "",
        "button_text": "",
        "tax_status": "taxable",
        "tax_class": "",
        "manage_stock": false,
        "stock_quantity": null,
        "in_stock": true,
        "backorders": "no",
        "backorders_allowed": false,
        "backordered": false,
        "sold_individually": false,
        "weight": "",
        "dimensions": {
            "length": "",
            "width": "",
            "height": ""
        },
        "shipping_required": true,
        "shipping_taxable": true,
        "shipping_class": "",
        "shipping_class_id": 0,
        "reviews_allowed": true,
        "average_rating": "0.00",
        "rating_count": 0,
        "related_ids": [
            70,
            71,
            69
        ],
        "upsell_ids": [],
        "cross_sell_ids": [],
        "parent_id": 0,
        "purchase_note": "",
        "categories": [
            {
                "id": 15,
                "name": "Accessories",
                "slug": "accessories"
            }
        ],
        "tags": [],
        "images": [
            {
                "id": 58,
                "date_created": "2017-06-15T04:26:46",
                "date_created_gmt": "2017-06-15T04:26:46",
                "date_modified": "2017-06-15T04:26:46",
                "date_modified_gmt": "2017-06-15T04:26:46",
                "src": "http://localhost/wcfm/wp-content/uploads/2017/06/sunglasses-1.jpg",
                "name": "Sunglasses",
                "alt": "",
                "position": 0
            }
        ],
        "attributes": [
            {
                "id": 0,
                "name": "color",
                "position": 0,
                "visible": true,
                "variation": true,
                "options": [
                    "red",
                    "blue",
                    "black"
                ]
            }
        ],
        "default_attributes": [],
        "variations": [],
        "grouped_products": [],
        "menu_order": 0,
        "meta_data": [
            {
                "id": 1213,
                "key": "pageview",
                "value": "3"
            },
            {
                "id": 1608,
                "key": "_upcoming",
                "value": "yes"
            },
            {
                "id": 1609,
                "key": "_available_on",
                "value": "2019-02-28"
            },
            {
                "id": 1610,
                "key": "_per_product_commission",
                "value": ""
            },
            {
                "id": 1737,
                "key": "_per_product_admin_commission_type",
                "value": "percentage"
            },
            {
                "id": 1738,
                "key": "_per_product_admin_commission",
                "value": ""
            }
        ]
    }
]
```

This API helps you get single store products.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/stores/<vendor_id>/products`



## Get Store Reviews

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/stores/2/reviews",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/stores/2/reviews \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,stores,21,reviews", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/stores/2/reviews",
  "method": "GET",
  "headers": {
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/stores/2/reviews")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "comment_id": 174,
        "comment_author": "admin",
        "comment_author_email": "sk.shaikat@yahoo.com",
        "comment_author_url": "",
        "comment_author_avatar": "http://1.gravatar.com/avatar/4060406017f132ca0f92679c31bdb59f?s=96&r=g",
        "comment_content": "Great vendor, Great service",
        "comment_permalink": "http://wcfm.testproduct/premium-quality-rest/#comment-174",
        "user_id": "1",
        "comment_post_ID": "5611",
        "comment_approved": "1",
        "comment_date": "2018-02-20T09:27:28",
        "rating": 5
    }
]
```

This API helps you get store reviews.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/stores/<vendor_id>/reviews`


## Get all Stores

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/stores",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/stores \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,stores", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/stores",
  "method": "GET",
  "headers": {
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/stores")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5,
        "store_name": "",
        "first_name": "Jon",
        "last_name": "Doe",
        "email": "jon@yahoo.com",
        "social": [],
        "phone": "",
        "show_email": false,
        "address": [],
        "location": "",
        "banner": false,
        "gravatar": false,
        "products_per_page": 10,
        "show_more_product_tab": true,
        "toc_enabled": false,
        "store_toc": null,
        "featured": false,
        "rating": {
            "rating": "4.27",
            "count": 11
        }
    },
    {
        "id": 12,
        "store_name": "",
        "first_name": "sendbox",
        "last_name": "saimon",
        "email": "st@gmail.com",
        "social": [],
        "phone": "",
        "show_email": false,
        "address": [],
        "location": "",
        "banner": false,
        "gravatar": false,
        "products_per_page": 10,
        "show_more_product_tab": true,
        "toc_enabled": false,
        "store_toc": null,
        "featured": false,
        "rating": {
            "rating": "0.00",
            "count": 0
        }
    }
]
```

This API helps you get all store details.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/stores`



#Reviews

The coupons API allows you get review details.

## Get all reviews

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/reviews/",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/reviews/ \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,reviews", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/reviews/",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/reviews/")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 174,
        "date_created": "2018-02-20T09:27:28",
        "review": "Great vendor, Great service",
        "rating": 5,
        "name": "admin",
        "email": "sk.shaikat@yahoo.com",
        "verified": true
    }
]
```

This API helps you get all reviews.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/reviews/`


## Get review Summary

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/reviews/summary",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/reviews/summary \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,reviews,summary", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/reviews/summary",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/reviews/summary")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "comment_counts": {
        "moderated": 0,
        "approved": 1,
        "spam": 0,
        "trash": 0,
        "total": 1
    },
    "reviews_url": "http://wcfm.test/dashboard/reviews/"
}
```

This API helps you get all reviews.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/reviews/summary`


#Reports

The coupons API allows you to all reports.

## Report Summary

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/reports/summary",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/reports/summary \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,reports,summary", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/reports/summary",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/reports/summary")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "pageviews": 6,
    "orders_count": {
        "wc-pending": 0,
        "wc-completed": 4,
        "wc-on-hold": 0,
        "wc-processing": 0,
        "wc-refunded": 0,
        "wc-cancelled": 1,
        "total": 5
    },
    "sales": "249.6900",
    "seller_balance": 224.72100000000000363797880709171295166015625
}
```

This API helps you get reports summary.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/reports/summary`


## Report Overview

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/reports/sales_overview",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/reports/sales_overview \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,reports,sales_overview", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/reports/sales_overview",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/reports/sales_overview")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "pageviews": 6,
    "orders_count": {
        "wc-pending": 0,
        "wc-completed": 4,
        "wc-on-hold": 0,
        "wc-processing": 0,
        "wc-refunded": 0,
        "wc-cancelled": 1,
        "total": 5
    },
    "sales": "249.6900",
    "seller_balance": 224.72100000000000363797880709171295166015625
}
```

This API helps you get reports overview.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/reports/sales_overview`


## Top Earners Report

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/reports/top_earners?start_date=2018-01-01",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/reports/top_earners?start_date=2018-01-01 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,reports,top_earners", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/reports/top_earners?start_date=2018-01-01",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/reports/top_earners?start_date=2018-01-01")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5611,
        "title": "Premium Quality REST",
        "url": "http://localhost/wcfm/product/premium-quality-rest/",
        "edit_url": "http://localhost/wcfm/product/premium-quality-rest/edit/",
        "sales": "147.23999999999998"
    },
    {
        "id": 5605,
        "title": "iPhone X",
        "url": "http://localhost/wcfm/product/iphone-x-2/",
        "edit_url": "http://localhost/wcfm/product/iphone-x-2/edit/",
        "sales": "102.44999999999999"
    }
]
```

This API helps you get reports overview.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/reports/top_earners?start_date=2018-01-01`


## Top Selling Products Report

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/reports/top_selling?start_date=2018-01-01",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/reports/top_selling?start_date=2018-01-01 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,reports,top_selling", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/reports/top_selling?start_date=2018-01-01",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/reports/top_selling?start_date=2018-01-01")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 5611,
        "title": "Premium Quality REST",
        "url": "http://localhost/wcfm/product/premium-quality-rest/",
        "edit_url": "http://localhost/wcfm/product/premium-quality-rest/edit/",
        "sold_qty": "6"
    },
    {
        "id": 5605,
        "title": "iPhone X",
        "url": "http://localhost/wcfm/product/iphone-x-2/",
        "edit_url": "http://localhost/wcfm/product/iphone-x-2/edit/",
        "sold_qty": "5"
    }
]
```

This API helps you get reports overview.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/reports/top_selling?start_date=2018-01-01`


#Settings

## Get Settings

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/settings",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/settings \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,settings", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/settings",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/settings")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "store_name": "postman",
    "social": {
        "fb": false,
        "gplus": false,
        "twitter": false,
        "pinterest": false,
        "linkedin": false,
        "youtube": false,
        "instagram": false,
        "flickr": false
    },
    "payment": {
        "paypal": [
            "email"
        ],
        "bank": []
    },
    "phone": "",
    "show_email": "off",
    "address": {
        "street_1": "",
        "street_2": "",
        "city": "",
        "zip": "",
        "country": "",
        "state": ""
    },
    "location": "",
    "banner": 0
}
```

This API helps you get all settings.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/settings`


## Update Settings

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/settings",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "store_name=Postman's%20store&payment%5Bskrill%5D%5Bemail%5D=skrill%40postman.com&social%5Bgplus%5D=http%3A%2F%2Fpostman.com",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url http://wcfm.test/wp-json/wcfm/v1/settings \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --data 'store_name=Postman'\''s%20store&payment%5Bskrill%5D%5Bemail%5D=skrill%40postman.com&social%5Bgplus%5D=http%3A%2F%2Fpostman.com'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "store_name=Postman's%20store&payment%5Bskrill%5D%5Bemail%5D=skrill%40postman.com&social%5Bgplus%5D=http%3A%2F%2Fpostman.com"

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,settings", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/settings",
  "method": "PUT",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "data": {
    "store_name": "Postman's store",
    "payment[skrill][email]": "skrill@postman.com",
    "social[gplus]": "http://postman.com"
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/settings")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "store_name=Postman's%20store&payment%5Bskrill%5D%5Bemail%5D=skrill%40postman.com&social%5Bgplus%5D=http%3A%2F%2Fpostman.com"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "store_name": "Postman's store",
    "social": {
        "fb": false,
        "gplus": "http://postman.com",
        "twitter": false,
        "pinterest": false,
        "linkedin": false,
        "youtube": false,
        "instagram": false,
        "flickr": false
    },
    "payment": {
        "paypal": [
            "email"
        ],
        "bank": [],
        "skrill": {
            "email": "skrill@postman.com"
        }
    },
    "phone": "",
    "show_email": "",
    "address": {
        "street_1": "",
        "street_2": "",
        "city": "",
        "zip": "",
        "country": "",
        "state": ""
    },
    "location": "",
    "banner": null,
    "store_ppp": 0,
    "find_address": "",
    "show_more_ptab": "",
    "gravatar": 0,
    "enable_tnc": "",
    "store_tnc": "",
    "profile_completion": {
        "gplus": 2,
        "store_name": 10,
        "Bank": 15,
        "skrill": 0,
        "next_todo": "Add Profile Picture to gain 15% progress",
        "progress": 27,
        "progress_vals": {
            "banner_val": 15,
            "profile_picture_val": 15,
            "store_name_val": 10,
            "social_val": {
                "fb": 2,
                "gplus": 2,
                "twitter": 2,
                "youtube": 2,
                "linkedin": 2
            },
            "payment_method_val": 15,
            "phone_val": 10,
            "address_val": 10,
            "map_val": 15
        }
    }
}
```

This API helps you to update all settings.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/settings`


#Attributes

## Get All Attributes

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,attributes", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 1,
        "name": "color",
        "slug": "pa_color",
        "type": "select",
        "order_by": "menu_order",
        "has_archives": false,
        "_links": {
            "self": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1"
                }
            ],
            "collection": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes"
                }
            ]
        }
    }
]
```

This API helps you get all attributes.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/attributes`

## Get Single Attributes

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,attributes,1", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 1,
    "name": "color",
    "slug": "pa_color",
    "type": "select",
    "order_by": "menu_order",
    "has_archives": false,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes"
            }
        ]
    }
}
```

This API helps you get single attributes.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>`

## Create An Attributes

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n  \"name\": \"Material\",\n  \"slug\": \"pa_material\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request POST \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --data '{\n  "name": "Material",\n  "slug": "pa_material",\n  "type": "select",\n  "order_by": "menu_order",\n  "has_archives": true\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"name\": \"Material\",\n  \"slug\": \"pa_material\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}"

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("POST", "wcfm,,wp-json,wcfm,v1,products,attributes", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes",
  "method": "POST",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"name\": \"Material\",\n  \"slug\": \"pa_material\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"name\": \"Material\",\n  \"slug\": \"pa_material\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 2,
    "name": "Material",
    "slug": "pa_material",
    "type": "select",
    "order_by": "menu_order",
    "has_archives": true,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/2"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes"
            }
        ]
    }
}
```

This API helps you create an attributes.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/products/attributes`

## Update an Attributes

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "{\n  \"name\": \"Material Thing\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --data '{\n  "name": "Material Thing",\n  "type": "select",\n  "order_by": "menu_order",\n  "has_archives": true\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"name\": \"Material Thing\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}"

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,products,attributes,1", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1",
  "method": "PUT",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"name\": \"Material Thing\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"name\": \"Material Thing\",\n  \"type\": \"select\",\n  \"order_by\": \"menu_order\",\n  \"has_archives\": true\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 2,
    "name": "Material Thing",
    "slug": "pa_material-thing",
    "type": "select",
    "order_by": "menu_order",
    "has_archives": true,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/2"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes"
            }
        ]
    }
}
```

This API helps you to update attributes.

### HTTP Request

`PUT http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>`

## Delete an Attribute

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/2",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "DELETE",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request DELETE \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/2 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("DELETE", "wcfm,,wp-json,wcfm,v1,products,attributes,2", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/2",
  "method": "DELETE",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/2")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 2,
    "name": "Material Thing",
    "slug": "pa_material-thing",
    "type": "select",
    "order_by": "menu_order",
    "has_archives": true,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/2"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes"
            }
        ]
    }
}
```

This API helps you delete single attributes.

### HTTP Request

`DELETE http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>`


#Attribute Terms

## Get All Terms of an Attributes

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,attributes,1,terms", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
[
    {
        "id": 25,
        "name": "Black",
        "slug": "black",
        "description": "",
        "menu_order": 0,
        "count": 2,
        "_links": {
            "self": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/25"
                }
            ],
            "collection": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
                }
            ]
        }
    },
    {
        "id": 29,
        "name": "Blue",
        "slug": "blue",
        "description": "",
        "menu_order": 0,
        "count": 2,
        "_links": {
            "self": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/29"
                }
            ],
            "collection": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
                }
            ]
        }
    },
    {
        "id": 35,
        "name": "Green",
        "slug": "green",
        "description": "",
        "menu_order": 0,
        "count": 2,
        "_links": {
            "self": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/35"
                }
            ],
            "collection": [
                {
                    "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
                }
            ]
        }
    },
]
```

This API helps you get all terms of an attribute.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>/terms`

## Get Single term of an Attribute

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/25",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "GET",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request GET \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/25 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("GET", "wcfm,,wp-json,wcfm,v1,products,attributes,1,terms,25", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/25",
  "method": "GET",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/25")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Get.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 25,
    "name": "Black",
    "slug": "black",
    "description": "",
    "menu_order": 0,
    "count": 2,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/25"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
            }
        ]
    }
}
```

This API helps you get single term of an attribute.

### HTTP Request

`GET http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>/terms/<term_id>`

## Create A Term For An Attribute

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{\n  \"name\": \"yellow\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request POST \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --data '{\n  "name": "yellow"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"name\": \"yellow\"\n}"

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("POST", "wcfm,,wp-json,wcfm,v1,products,attributes,1,terms", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms",
  "method": "POST",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"name\": \"yellow\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Post.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"name\": \"yellow\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 95,
    "name": "yellow",
    "slug": "yellow",
    "description": "",
    "menu_order": 0,
    "count": 0,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/95"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
            }
        ]
    }
}
```

This API helps you create an attributes.

### HTTP Request

`POST http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>/terms`

## Update A Term Of An Attribute

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "{\n  \"name\": \"Pink\"\n}",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request PUT \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
  --data '{\n  "name": "Pink"\n}'
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

payload = "{\n  \"name\": \"Pink\"\n}"

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("PUT", "wcfm,,wp-json,wcfm,v1,products,attributes,1,terms,95", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95",
  "method": "PUT",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  },
  "processData": false,
  "data": "{\n  \"name\": \"Pink\"\n}"
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Put.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'
request.body = "{\n  \"name\": \"Pink\"\n}"

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 95,
    "name": "Pink",
    "slug": "yellow",
    "description": "",
    "menu_order": 0,
    "count": 0,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/95"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
            }
        ]
    }
}
```

This API helps you to update a term of an attribute.

### HTTP Request

`PUT http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>/terms/<term_id>`

## Delete a term of an Attribute

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "DELETE",
  CURLOPT_HTTPHEADER => array(
    "Authorization: Basic authorization_token",
    "Cache-Control: no-cache",
  ),
));

$response = curl_exec($curl);
$err = curl_error($curl);

curl_close($curl);

if ($err) {
  echo "cURL Error #:" . $err;
} else {
  echo $response;
}
```

```shell
curl --request DELETE \
  --url http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95 \
  --header 'Authorization: Basic authorization_token' \
  --header 'Cache-Control: no-cache' \
```

```python
import http.client

conn = http.client.HTTPConnection("localhost")

headers = {
    'Authorization': "Basic authorization_token",
    'Cache-Control': "no-cache",
    }

conn.request("DELETE", "wcfm,,wp-json,wcfm,v1,products,attributes,1,terms,95", headers=headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))
```

```javascript
var settings = {
  "async": true,
  "crossDomain": true,
  "url": "http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95",
  "method": "DELETE",
  "headers": {
    "Authorization": "Basic authorization_token",
    "Cache-Control": "no-cache",
  }
}

$.ajax(settings).done(function (response) {
  console.log(response);
});
```

```ruby
require 'uri'
require 'net/http'

url = URI("http://wcfm.test/wp-json/wcfm/v1/products/attributes/1/terms/95")

http = Net::HTTP.new(url.host, url.port)

request = Net::HTTP::Delete.new(url)
request["Authorization"] = 'Basic authorization_token'
request["Cache-Control"] = 'no-cache'

response = http.request(request)
puts response.read_body
```

>JSON response example:

```json
{
    "id": 95,
    "name": "Pink",
    "slug": "yellow",
    "description": "",
    "menu_order": 0,
    "count": 0,
    "_links": {
        "self": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms/95"
            }
        ],
        "collection": [
            {
                "href": "http://localhost/wcfm/wp-json/wcfm/v1/products/attributes/1/terms"
            }
        ]
    }
}
```

This API helps you delete single term of an attribute.

### HTTP Request

`DELETE http://wcfm.test/wp-json/wcfm/v1/products/attributes/<id>/terms/<term_id>`
