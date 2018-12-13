---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - php: PHP

toc_footers:
  - <a href='https://wordpress.org/plugins/wc-multivendor-marketplace/'>Documentation Powered by WC Lovers</a>

includes:
  - errors

search: true
---

# Introduction

WCFM Marketplace – REST API plugin fully integrates WordPress REST API with WCFM Marketplace. This allows to manipulate vendor data using requests in JSON format and using WordPress REST API Authentication methods and standard HTTP verbs which are understood by most HTTP clients.

# Authentication

## HTTP Basic Auth
You may use [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication) by providing the username and password.

For Basic auth you can use [Basic Auth](https://github.com/WP-API/Basic-Auth) Plugin.

Occasionally some servers may not parse the Authorization header correctly (if you see a “Username is missing” error when authenticating over SSL, you have a server issue). In this case, you may provide the username/password as query string parameters instead.


# Products
The products API allows you to create, view, update, and delete products.

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
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/products",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "POST",
  CURLOPT_POSTFIELDS => "{
    \"name\": \"TEST PRODUCT\",
    \"type\": \"simple\",
    \"regular_price\": \"20\",
    \"description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.\",
    \"short_description\": \"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\",
    \"featured_image\": {
      \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\"
    },
    \"gallery_images\": [
      {
        \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_back.jpg\"
      },
      {
        \"src\": \"http://demo.woothemes.com/woocommerce/wp-content/uploads/sites/56/2013/06/T_2_front.jpg\"
      }
    ],
    \"categories\": [\"37\", \"38\"]
      
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


>JSON response example:

```json
{
    "id": 311,
    "name": "Test Product",
    "slug": "test-product",
    "post_author": "2",
    "permalink": "<site_base_url>/product/test-product/",
    "date_created": "2018-12-13T11:38:00",
    "date_created_gmt": "2018-12-13T11:38:00",
    "date_modified": "2018-12-13T11:38:03",
    "date_modified_gmt": "2018-12-13T11:38:03",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "20",
    "regular_price": "20",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>20.00</span>",
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
    "low_stock_amount": "",
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
        37,
        33,
        35,
        32,
        34
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 37,
            "name": "Accessories",
            "slug": "accessories"
        },
        {
            "id": 38,
            "name": "Hoodies",
            "slug": "hoodies"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 312,
            "date_created": "2018-12-13T11:38:01",
            "date_created_gmt": "2018-12-13T11:38:01",
            "date_modified": "2018-12-13T11:38:01",
            "date_modified_gmt": "2018-12-13T11:38:01",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-17.jpg",
            "name": "T_2_front-17.jpg",
            "alt": "",
            "position": 0
        },
        {
            "id": 313,
            "date_created": "2018-12-13T11:38:02",
            "date_created_gmt": "2018-12-13T11:38:02",
            "date_modified": "2018-12-13T11:38:02",
            "date_modified_gmt": "2018-12-13T11:38:02",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-18.jpg",
            "name": "T_2_front-18.jpg",
            "alt": "",
            "position": 1
        },
        {
            "id": 314,
            "date_created": "2018-12-13T11:38:03",
            "date_created_gmt": "2018-12-13T11:38:03",
            "date_modified": "2018-12-13T11:38:03",
            "date_modified_gmt": "2018-12-13T11:38:03",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_back-1.jpg",
            "name": "T_2_back-1.jpg",
            "alt": "",
            "position": 2
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": [
        {
            "id": 5990,
            "key": "_catalog",
            "value": "no"
        },
        {
            "id": 5991,
            "key": "disable_add_to_cart",
            "value": "no"
        },
        {
            "id": 5992,
            "key": "disable_price",
            "value": "no"
        },
        {
            "id": 5993,
            "key": "wcfm_policy_product_options",
            "value": [
                ""
            ]
        }
    ],
    "_links": {
        "self": [
            {
                "href": "<site_base_url>/wp-json/wcfmmp/v1/products/311"
            }
        ],
        "collection": [
            {
                "href": "<site_base_url>/wp-json/wcfmmp/v1/products"
            }
        ]
    }
}
```
This endpoint helps you to create a new product.

### HTTP Request

`POST <site_base_url>/wp-json/wcfmmp/v1/products/`

### Query Parameters

Accept all parameters for a product propertiest


## Get single product

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/products/311",
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


>JSON response example:

```json
{
    "id": 311,
    "name": "Test Product",
    "slug": "test-product",
    "post_author": "2",
    "permalink": "<site_base_url>/product/test-product/",
    "date_created": "2018-12-13T11:38:00",
    "date_created_gmt": "2018-12-13T11:38:00",
    "date_modified": "2018-12-13T11:38:03",
    "date_modified_gmt": "2018-12-13T11:38:03",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "20",
    "regular_price": "20",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>20.00</span>",
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
    "low_stock_amount": "",
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
        31,
        32,
        33,
        38,
        37
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 37,
            "name": "Accessories",
            "slug": "accessories"
        },
        {
            "id": 38,
            "name": "Hoodies",
            "slug": "hoodies"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 312,
            "date_created": "2018-12-13T11:38:01",
            "date_created_gmt": "2018-12-13T11:38:01",
            "date_modified": "2018-12-13T11:38:01",
            "date_modified_gmt": "2018-12-13T11:38:01",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-17.jpg",
            "name": "T_2_front-17.jpg",
            "alt": "",
            "position": 0
        },
        {
            "id": 313,
            "date_created": "2018-12-13T11:38:02",
            "date_created_gmt": "2018-12-13T11:38:02",
            "date_modified": "2018-12-13T11:38:02",
            "date_modified_gmt": "2018-12-13T11:38:02",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-18.jpg",
            "name": "T_2_front-18.jpg",
            "alt": "",
            "position": 1
        },
        {
            "id": 314,
            "date_created": "2018-12-13T11:38:03",
            "date_created_gmt": "2018-12-13T11:38:03",
            "date_modified": "2018-12-13T11:38:03",
            "date_modified_gmt": "2018-12-13T11:38:03",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_back-1.jpg",
            "name": "T_2_back-1.jpg",
            "alt": "",
            "position": 2
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": [
        {
            "id": 5990,
            "key": "_catalog",
            "value": "no"
        },
        {
            "id": 5991,
            "key": "disable_add_to_cart",
            "value": "no"
        },
        {
            "id": 5992,
            "key": "disable_price",
            "value": "no"
        },
        {
            "id": 5993,
            "key": "wcfm_policy_product_options",
            "value": [
                ""
            ]
        }
    ],
    "_links": {
        "self": [
            {
                "href": "<site_base_url>/wp-json/wcfmmp/v1/products/311"
            }
        ],
        "collection": [
            {
                "href": "<site_base_url>/wp-json/wcfmmp/v1/products"
            }
        ]
    }
}
```

This API lets you retrieve and view a specific product by ID.

### HTTP Request

`GET <site_base_url>/wp-json/wcfmmp/v1/products/<id>`


## Get All Products

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/products/",
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


>JSON response example:

```json
[
  {
      "id": 311,
      "name": "Test Product",
      "slug": "test-product",
      "post_author": "2",
      "permalink": "<site_base_url>/product/test-product/",
      "date_created": "2018-12-13T11:38:00",
      "date_created_gmt": "2018-12-13T11:38:00",
      "date_modified": "2018-12-13T11:38:03",
      "date_modified_gmt": "2018-12-13T11:38:03",
      "type": "simple",
      "status": "publish",
      "featured": false,
      "catalog_visibility": "visible",
      "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
      "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
      "sku": "",
      "price": "20",
      "regular_price": "20",
      "sale_price": "",
      "date_on_sale_from": null,
      "date_on_sale_from_gmt": null,
      "date_on_sale_to": null,
      "date_on_sale_to_gmt": null,
      "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>20.00</span>",
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
      "low_stock_amount": "",
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
          36,
          31,
          33,
          35,
          34
      ],
      "upsell_ids": [],
      "cross_sell_ids": [],
      "parent_id": 0,
      "purchase_note": "",
      "categories": [
          {
              "id": 37,
              "name": "Accessories",
              "slug": "accessories"
          },
          {
              "id": 38,
              "name": "Hoodies",
              "slug": "hoodies"
          }
      ],
      "tags": [],
      "images": [
          {
              "id": 312,
              "date_created": "2018-12-13T11:38:01",
              "date_created_gmt": "2018-12-13T11:38:01",
              "date_modified": "2018-12-13T11:38:01",
              "date_modified_gmt": "2018-12-13T11:38:01",
              "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-17.jpg",
              "name": "T_2_front-17.jpg",
              "alt": "",
              "position": 0
          },
          {
              "id": 313,
              "date_created": "2018-12-13T11:38:02",
              "date_created_gmt": "2018-12-13T11:38:02",
              "date_modified": "2018-12-13T11:38:02",
              "date_modified_gmt": "2018-12-13T11:38:02",
              "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-18.jpg",
              "name": "T_2_front-18.jpg",
              "alt": "",
              "position": 1
          },
          {
              "id": 314,
              "date_created": "2018-12-13T11:38:03",
              "date_created_gmt": "2018-12-13T11:38:03",
              "date_modified": "2018-12-13T11:38:03",
              "date_modified_gmt": "2018-12-13T11:38:03",
              "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_back-1.jpg",
              "name": "T_2_back-1.jpg",
              "alt": "",
              "position": 2
          }
      ],
      "attributes": [],
      "default_attributes": [],
      "variations": [],
      "grouped_products": [],
      "menu_order": 0,
      "meta_data": [
          {
              "id": 5990,
              "key": "_catalog",
              "value": "no"
          },
          {
              "id": 5991,
              "key": "disable_add_to_cart",
              "value": "no"
          },
          {
              "id": 5992,
              "key": "disable_price",
              "value": "no"
          },
          {
              "id": 5993,
              "key": "wcfm_policy_product_options",
              "value": [
                  ""
              ]
          }
      ],
      "_links": {
          "self": [
              {
                  "href": "<site_base_url>/wp-json/wcfmmp/v1/products/311"
              }
          ],
          "collection": [
              {
                  "href": "<site_base_url>/wp-json/wcfmmp/v1/products"
              }
          ]
      }
  },
  {
      "id": 31,
      "name": "Beanie",
      "slug": "beanie",
      "post_author": "2",
      "permalink": "<site_base_url>/product/beanie/",
      "date_created": "2018-08-20T07:57:55",
      "date_created_gmt": "2018-08-20T07:57:55",
      "date_modified": "2018-08-20T07:57:55",
      "date_modified_gmt": "2018-08-20T07:57:55",
      "type": "simple",
      "status": "publish",
      "featured": false,
      "catalog_visibility": "visible",
      "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
      "short_description": "",
      "sku": "",
      "price": "18",
      "regular_price": "20",
      "sale_price": "18",
      "date_on_sale_from": null,
      "date_on_sale_from_gmt": null,
      "date_on_sale_to": null,
      "date_on_sale_to_gmt": null,
      "price_html": "<del><span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>20.00</span></del> <ins><span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>18.00</span></ins>",
      "on_sale": true,
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
      "low_stock_amount": "",
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
          34,
          32,
          33,
          311
      ],
      "upsell_ids": [],
      "cross_sell_ids": [],
      "parent_id": 0,
      "purchase_note": "",
      "categories": [
          {
              "id": 37,
              "name": "Accessories",
              "slug": "accessories"
          }
      ],
      "tags": [],
      "images": [
          {
              "id": 13,
              "date_created": "2018-08-20T07:57:54",
              "date_created_gmt": "2018-08-20T07:57:54",
              "date_modified": "2018-08-20T07:57:54",
              "date_modified_gmt": "2018-08-20T07:57:54",
              "src": "<site_base_url>/wp-content/uploads/2018/08/beanie.jpg",
              "name": "Beanie",
              "alt": "",
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
              "id": 75,
              "key": "_customize_changeset_uuid",
              "value": "c70ab6e1-48e3-43dd-875f-18b42284005f"
          },
          {
              "id": 494,
              "key": "_wcfm_product_views",
              "value": "1"
          }
      ],
      "_links": {
          "self": [
              {
                  "href": "<site_base_url>/wp-json/wcfmmp/v1/products/31"
              }
          ],
          "collection": [
              {
                  "href": "<site_base_url>/wp-json/wcfmmp/v1/products"
              }
          ]
      }
  }
]
```
This endpoint retrieves all Product for authorized vendor.

### HTTP Request

`GET <site_base_url>/wp-json/wcfmmp/v1/products/`


## Update a product

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/products/311",
  CURLOPT_RETURNTRANSFER => true,
  CURLOPT_ENCODING => "",
  CURLOPT_MAXREDIRS => 10,
  CURLOPT_TIMEOUT => 30,
  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
  CURLOPT_CUSTOMREQUEST => "PUT",
  CURLOPT_POSTFIELDS => "{\n  \"name\": \"Test Product Name Change\"\n}",
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

>JSON response example:

```json
{
    "id": 311,
    "name": "Test Product Name Change",
    "slug": "test-product",
    "post_author": "2",
    "permalink": "<site_base_url>/product/test-product/",
    "date_created": "2018-12-13T11:38:00",
    "date_created_gmt": "2018-12-13T11:38:00",
    "date_modified": "2018-12-13T11:38:03",
    "date_modified_gmt": "2018-12-13T11:38:03",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
    "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
    "sku": "",
    "price": "20",
    "regular_price": "20",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>20.00</span>",
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
    "low_stock_amount": "",
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
        36,
        31,
        33,
        35,
        34
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 37,
            "name": "Accessories",
            "slug": "accessories"
        },
        {
            "id": 38,
            "name": "Hoodies",
            "slug": "hoodies"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 312,
            "date_created": "2018-12-13T11:38:01",
            "date_created_gmt": "2018-12-13T11:38:01",
            "date_modified": "2018-12-13T11:38:01",
            "date_modified_gmt": "2018-12-13T11:38:01",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-17.jpg",
            "name": "T_2_front-17.jpg",
            "alt": "",
            "position": 0
        },
        {
            "id": 313,
            "date_created": "2018-12-13T11:38:02",
            "date_created_gmt": "2018-12-13T11:38:02",
            "date_modified": "2018-12-13T11:38:02",
            "date_modified_gmt": "2018-12-13T11:38:02",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-18.jpg",
            "name": "T_2_front-18.jpg",
            "alt": "",
            "position": 1
        },
        {
            "id": 314,
            "date_created": "2018-12-13T11:38:03",
            "date_created_gmt": "2018-12-13T11:38:03",
            "date_modified": "2018-12-13T11:38:03",
            "date_modified_gmt": "2018-12-13T11:38:03",
            "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_back-1.jpg",
            "name": "T_2_back-1.jpg",
            "alt": "",
            "position": 2
        }
    ],
    "attributes": [],
    "default_attributes": [],
    "variations": [],
    "grouped_products": [],
    "menu_order": 0,
    "meta_data": [
        {
            "id": 5990,
            "key": "_catalog",
            "value": "no"
        },
        {
            "id": 5991,
            "key": "disable_add_to_cart",
            "value": "no"
        },
        {
            "id": 5992,
            "key": "disable_price",
            "value": "no"
        },
        {
            "id": 5993,
            "key": "wcfm_policy_product_options",
            "value": [
                ""
            ]
        }
    ],
    "_links": {
        "self": [
            {
                "href": "<site_base_url>/wp-json/wcfmmp/v1/products/311"
            }
        ],
        "collection": [
            {
                "href": "<site_base_url>/wp-json/wcfmmp/v1/products"
            }
        ]
    }
}
```

This API lets you make changes to a product.

### HTTP Request

`PUT <site_base_url>/wp-json/wcfmmp/v1/products/<id>`

## Delete a product

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/products/311",
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

>JSON response example:

```json
{
  "id": 311,
  "name": "Test Product Name Change",
  "slug": "test-product",
  "post_author": "2",
  "permalink": "<site_base_url>/product/test-product/",
  "date_created": "2018-12-13T11:38:00",
  "date_created_gmt": "2018-12-13T11:38:00",
  "date_modified": "2018-12-13T11:38:03",
  "date_modified_gmt": "2018-12-13T11:38:03",
  "type": "simple",
  "status": "publish",
  "featured": false,
  "catalog_visibility": "visible",
  "description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
  "short_description": "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>\n",
  "sku": "",
  "price": "20",
  "regular_price": "20",
  "sale_price": "",
  "date_on_sale_from": null,
  "date_on_sale_from_gmt": null,
  "date_on_sale_to": null,
  "date_on_sale_to_gmt": null,
  "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#8377;</span>20.00</span>",
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
  "low_stock_amount": "",
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
      36,
      31,
      33,
      35,
      34
  ],
  "upsell_ids": [],
  "cross_sell_ids": [],
  "parent_id": 0,
  "purchase_note": "",
  "categories": [
      {
          "id": 37,
          "name": "Accessories",
          "slug": "accessories"
      },
      {
          "id": 38,
          "name": "Hoodies",
          "slug": "hoodies"
      }
  ],
  "tags": [],
  "images": [
      {
          "id": 312,
          "date_created": "2018-12-13T11:38:01",
          "date_created_gmt": "2018-12-13T11:38:01",
          "date_modified": "2018-12-13T11:38:01",
          "date_modified_gmt": "2018-12-13T11:38:01",
          "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-17.jpg",
          "name": "T_2_front-17.jpg",
          "alt": "",
          "position": 0
      },
      {
          "id": 313,
          "date_created": "2018-12-13T11:38:02",
          "date_created_gmt": "2018-12-13T11:38:02",
          "date_modified": "2018-12-13T11:38:02",
          "date_modified_gmt": "2018-12-13T11:38:02",
          "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_front-18.jpg",
          "name": "T_2_front-18.jpg",
          "alt": "",
          "position": 1
      },
      {
          "id": 314,
          "date_created": "2018-12-13T11:38:03",
          "date_created_gmt": "2018-12-13T11:38:03",
          "date_modified": "2018-12-13T11:38:03",
          "date_modified_gmt": "2018-12-13T11:38:03",
          "src": "<site_base_url>/wp-content/uploads/2018/12/T_2_back-1.jpg",
          "name": "T_2_back-1.jpg",
          "alt": "",
          "position": 2
      }
  ],
  "attributes": [],
  "default_attributes": [],
  "variations": [],
  "grouped_products": [],
  "menu_order": 0,
  "meta_data": [
      {
          "id": 5990,
          "key": "_catalog",
          "value": "no"
      },
      {
          "id": 5991,
          "key": "disable_add_to_cart",
          "value": "no"
      },
      {
          "id": 5992,
          "key": "disable_price",
          "value": "no"
      },
      {
          "id": 5993,
          "key": "wcfm_policy_product_options",
          "value": [
              ""
          ]
      }
  ],
  "_links": {
      "self": [
          {
              "href": "<site_base_url>/wp-json/wcfmmp/v1/products/311"
          }
      ],
      "collection": [
          {
              "href": "<site_base_url>/wp-json/wcfmmp/v1/products"
          }
      ]
  }
}
```

This endpoint helps you to delete a product.

### HTTP Request

`DELETE <site_base_url>/wp-json/wcfmmp/v1/products/<id>`


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
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/orders/274",
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

>JSON response example:

```json
[
    {
        "id": 274,
        "parent_id": 0,
        "status": "on-hold",
        "currency": "INR",
        "version": "3.5.1",
        "prices_include_tax": false,
        "date_created": "2018-12-07T09:08:53",
        "date_modified": "2018-12-07T09:08:58",
        "discount_total": "0",
        "discount_tax": "0",
        "shipping_total": "20.00",
        "shipping_tax": "0",
        "cart_tax": "0",
        "total": "654.00",
        "total_tax": "0",
        "customer_id": 1,
        "order_key": "wc_order_5c0a38a5cc476",
        "billing": {
            "first_name": "test",
            "last_name": "name",
            "company": "",
            "address_1": "TEST",
            "address_2": "111",
            "city": "Kolkata",
            "state": "WB",
            "postcode": "700001",
            "country": "IN",
            "email": "test@gmail.com",
            "phone": "21111111111"
        },
        "shipping": {
            "first_name": "test",
            "last_name": "name",
            "company": "",
            "address_1": "PAS Road",
            "address_2": "111",
            "city": "Kolkata",
            "state": "WB",
            "postcode": "700001",
            "country": "IN"
        },
        "payment_method": "cheque",
        "payment_method_title": "Check payments",
        "transaction_id": "",
        "customer_ip_address": "::1",
        "customer_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
        "created_via": "checkout",
        "customer_note": "",
        "date_completed": null,
        "date_paid": null,
        "cart_hash": "e053bc38a043cfc980292231c5b33318",
        "number": "274",
        "meta_data": [
            {
                "id": 5206,
                "key": "_wcfmmp_order_processed",
                "value": "yes"
            },
            {
                "id": 5210,
                "key": "_wcfm_new_order_notified",
                "value": "yes"
            }
        ],
        "line_items": [
            {
                "id": 5,
                "name": "MI AI",
                "product_id": 257,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "299",
                "subtotal_tax": "0",
                "total": "299",
                "total_tax": "0",
                "taxes": [],
                "meta_data": [
                    {
                        "id": 91,
                        "key": "_vendor_id",
                        "value": "2"
                    }
                ],
                "sku": "",
                "price": 299
            },
            {
                "id": 6,
                "name": "test prod",
                "product_id": 272,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "299",
                "subtotal_tax": "0",
                "total": "299",
                "total_tax": "0",
                "taxes": [],
                "meta_data": [
                    {
                        "id": 92,
                        "key": "_vendor_id",
                        "value": "2"
                    }
                ],
                "sku": "",
                "price": 299
            }
        ],
        "tax_lines": [],
        "shipping_lines": [],
        "fee_lines": [],
        "coupon_lines": [],
        "date_created_gmt": "2018-12-07T09:08:53",
        "date_modified_gmt": "2018-12-07T09:08:58",
        "date_completed_gmt": null,
        "date_paid_gmt": null
    }
]
```

This API lets you retrieve and view a specific order.

### HTTP Request

`GET <site_base_url>/wp-json/wcfmmp/v1/orders/<id>`



## Get all Orders

```php
<?php

$curl = curl_init();

curl_setopt_array($curl, array(
  CURLOPT_URL => "<site_base_url>/wp-json/wcfmmp/v1/orders/",
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

>JSON response example:

```json
[
  {
      "id": 274,
      "parent_id": 0,
      "status": "on-hold",
      "currency": "INR",
      "version": "3.5.1",
      "prices_include_tax": false,
      "date_created": "2018-12-07T09:08:53",
      "date_modified": "2018-12-07T09:08:58",
      "discount_total": "0",
      "discount_tax": "0",
      "shipping_total": "20.00",
      "shipping_tax": "0",
      "cart_tax": "0",
      "total": "654.00",
      "total_tax": "0",
      "customer_id": 1,
      "order_key": "wc_order_5c0a38a5cc476",
      "billing": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN",
          "email": "testname@gmail.com",
          "phone": "1111111111"
      },
      "shipping": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN"
      },
      "payment_method": "cheque",
      "payment_method_title": "Check payments",
      "transaction_id": "",
      "customer_ip_address": "::1",
      "customer_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
      "created_via": "checkout",
      "customer_note": "",
      "date_completed": null,
      "date_paid": null,
      "cart_hash": "e053bc38a043cfc980292231c5b33318",
      "number": "274",
      "meta_data": [
          {
              "id": 5206,
              "key": "_wcfmmp_order_processed",
              "value": "yes"
          },
          {
              "id": 5210,
              "key": "_wcfm_new_order_notified",
              "value": "yes"
          }
      ],
      "line_items": [
          {
              "id": 5,
              "name": "MI AI",
              "product_id": 257,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 91,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          },
          {
              "id": 6,
              "name": "new sadada",
              "product_id": 272,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 92,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          }
      ],
      "tax_lines": [],
      "shipping_lines": [],
      "fee_lines": [],
      "coupon_lines": [],
      "date_created_gmt": "2018-12-07T09:08:53",
      "date_modified_gmt": "2018-12-07T09:08:58",
      "date_completed_gmt": null,
      "date_paid_gmt": null,
      "vendor_order_details": {
          "ID": "4",
          "vendor_id": "2",
          "order_id": "274",
          "customer_id": "1",
          "payment_method": "cheque",
          "product_id": "257",
          "variation_id": "0",
          "quantity": "1",
          "product_price": "299",
          "purchase_price": "299",
          "item_id": "5",
          "item_type": "line_item",
          "item_sub_total": "299",
          "item_total": "299",
          "shipping": "0",
          "tax": "0",
          "shipping_tax_amount": "0",
          "commission_amount": "269.1",
          "discount_amount": "0",
          "discount_type": "",
          "other_amount": "0",
          "other_amount_type": "",
          "withdrawal_id": "0",
          "refunded_id": "0",
          "refunded_amount": "0",
          "withdraw_charges": "0",
          "total_commission": "269.1",
          "order_status": "on-hold",
          "shipping_status": "pending",
          "commission_status": "on-hold",
          "withdraw_status": "pending",
          "refund_status": "pending",
          "is_refunded": "0",
          "is_partially_refunded": "0",
          "is_withdrawable": "1",
          "is_auto_withdrawal": "0",
          "is_trashed": "0",
          "commission_paid_date": null,
          "created": "2018-12-07 14:38:54"
      }
  },
  {
      "id": 274,
      "parent_id": 0,
      "status": "on-hold",
      "currency": "INR",
      "version": "3.5.1",
      "prices_include_tax": false,
      "date_created": "2018-12-07T09:08:53",
      "date_modified": "2018-12-07T09:08:58",
      "discount_total": "0",
      "discount_tax": "0",
      "shipping_total": "20.00",
      "shipping_tax": "0",
      "cart_tax": "0",
      "total": "654.00",
      "total_tax": "0",
      "customer_id": 1,
      "order_key": "wc_order_5c0a38a5cc476",
      "billing": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN",
          "email": "testname@gmail.com",
          "phone": "1111111111"
      },
      "shipping": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN"
      },
      "payment_method": "cheque",
      "payment_method_title": "Check payments",
      "transaction_id": "",
      "customer_ip_address": "::1",
      "customer_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.110 Safari/537.36",
      "created_via": "checkout",
      "customer_note": "",
      "date_completed": null,
      "date_paid": null,
      "cart_hash": "e053bc38a043cfc980292231c5b33318",
      "number": "274",
      "meta_data": [
          {
              "id": 5206,
              "key": "_wcfmmp_order_processed",
              "value": "yes"
          },
          {
              "id": 5210,
              "key": "_wcfm_new_order_notified",
              "value": "yes"
          }
      ],
      "line_items": [
          {
              "id": 5,
              "name": "MI AI",
              "product_id": 257,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 91,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          },
          {
              "id": 6,
              "name": "new sadada",
              "product_id": 272,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 92,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          }
      ],
      "tax_lines": [],
      "shipping_lines": [],
      "fee_lines": [],
      "coupon_lines": [],
      "date_created_gmt": "2018-12-07T09:08:53",
      "date_modified_gmt": "2018-12-07T09:08:58",
      "date_completed_gmt": null,
      "date_paid_gmt": null,
      "vendor_order_details": {
          "ID": "5",
          "vendor_id": "2",
          "order_id": "274",
          "customer_id": "1",
          "payment_method": "cheque",
          "product_id": "272",
          "variation_id": "0",
          "quantity": "1",
          "product_price": "299",
          "purchase_price": "299",
          "item_id": "6",
          "item_type": "line_item",
          "item_sub_total": "299",
          "item_total": "299",
          "shipping": "0",
          "tax": "0",
          "shipping_tax_amount": "0",
          "commission_amount": "269.1",
          "discount_amount": "0",
          "discount_type": "",
          "other_amount": "0",
          "other_amount_type": "",
          "withdrawal_id": "0",
          "refunded_id": "0",
          "refunded_amount": "0",
          "withdraw_charges": "0",
          "total_commission": "269.1",
          "order_status": "on-hold",
          "shipping_status": "pending",
          "commission_status": "on-hold",
          "withdraw_status": "pending",
          "refund_status": "pending",
          "is_refunded": "0",
          "is_partially_refunded": "0",
          "is_withdrawable": "1",
          "is_auto_withdrawal": "0",
          "is_trashed": "0",
          "commission_paid_date": null,
          "created": "2018-12-07 14:38:54"
      }
  },
  {
      "id": 267,
      "parent_id": 0,
      "status": "on-hold",
      "currency": "INR",
      "version": "3.5.1",
      "prices_include_tax": false,
      "date_created": "2018-11-30T10:33:49",
      "date_modified": "2018-11-30T10:33:51",
      "discount_total": "0",
      "discount_tax": "0",
      "shipping_total": "10.00",
      "shipping_tax": "0",
      "cart_tax": "0",
      "total": "628.00",
      "total_tax": "0",
      "customer_id": 1,
      "order_key": "wc_order_5c01120d1cd6a",
      "billing": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN",
          "email": "testname@gmail.com",
          "phone": "11111111111"
      },
      "shipping": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN"
      },
      "payment_method": "cheque",
      "payment_method_title": "Check payments",
      "transaction_id": "",
      "customer_ip_address": "::1",
      "customer_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36",
      "created_via": "checkout",
      "customer_note": "",
      "date_completed": null,
      "date_paid": null,
      "cart_hash": "6fa21b29ee1b5a3716a5d3fef061014d",
      "number": "267",
      "meta_data": [
          {
              "id": 4912,
              "key": "_wcfmmp_order_processed",
              "value": "yes"
          },
          {
              "id": 4916,
              "key": "_wcfm_new_order_notified",
              "value": "yes"
          }
      ],
      "line_items": [
          {
              "id": 1,
              "name": "Polo",
              "product_id": 40,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "20",
              "subtotal_tax": "0",
              "total": "20",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 36,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 20
          },
          {
              "id": 2,
              "name": "MI AI",
              "product_id": 254,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 37,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          },
          {
              "id": 3,
              "name": "MI AI",
              "product_id": 255,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 38,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          }
      ],
      "tax_lines": [],
      "shipping_lines": [],
      "fee_lines": [],
      "coupon_lines": [],
      "date_created_gmt": "2018-11-30T10:33:49",
      "date_modified_gmt": "2018-11-30T10:33:51",
      "date_completed_gmt": null,
      "date_paid_gmt": null,
      "vendor_order_details": {
          "ID": "1",
          "vendor_id": "2",
          "order_id": "267",
          "customer_id": "1",
          "payment_method": "cheque",
          "product_id": "40",
          "variation_id": "0",
          "quantity": "1",
          "product_price": "20",
          "purchase_price": "20",
          "item_id": "1",
          "item_type": "line_item",
          "item_sub_total": "20",
          "item_total": "20",
          "shipping": "0",
          "tax": "0",
          "shipping_tax_amount": "0",
          "commission_amount": "18",
          "discount_amount": "0",
          "discount_type": "",
          "other_amount": "0",
          "other_amount_type": "",
          "withdrawal_id": "0",
          "refunded_id": "0",
          "refunded_amount": "0",
          "withdraw_charges": "0",
          "total_commission": "18",
          "order_status": "on-hold",
          "shipping_status": "pending",
          "commission_status": "on-hold",
          "withdraw_status": "pending",
          "refund_status": "pending",
          "is_refunded": "0",
          "is_partially_refunded": "0",
          "is_withdrawable": "1",
          "is_auto_withdrawal": "0",
          "is_trashed": "0",
          "commission_paid_date": null,
          "created": "2018-11-30 16:03:49"
      }
  },
  {
      "id": 267,
      "parent_id": 0,
      "status": "on-hold",
      "currency": "INR",
      "version": "3.5.1",
      "prices_include_tax": false,
      "date_created": "2018-11-30T10:33:49",
      "date_modified": "2018-11-30T10:33:51",
      "discount_total": "0",
      "discount_tax": "0",
      "shipping_total": "10.00",
      "shipping_tax": "0",
      "cart_tax": "0",
      "total": "628.00",
      "total_tax": "0",
      "customer_id": 1,
      "order_key": "wc_order_5c01120d1cd6a",
      "billing": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN",
          "email": "testname@gmail.com",
          "phone": "1111111111"
      },
      "shipping": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700003",
          "country": "IN"
      },
      "payment_method": "cheque",
      "payment_method_title": "Check payments",
      "transaction_id": "",
      "customer_ip_address": "::1",
      "customer_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36",
      "created_via": "checkout",
      "customer_note": "",
      "date_completed": null,
      "date_paid": null,
      "cart_hash": "6fa21b29ee1b5a3716a5d3fef061014d",
      "number": "267",
      "meta_data": [
          {
              "id": 4912,
              "key": "_wcfmmp_order_processed",
              "value": "yes"
          },
          {
              "id": 4916,
              "key": "_wcfm_new_order_notified",
              "value": "yes"
          }
      ],
      "line_items": [
          {
              "id": 1,
              "name": "Polo",
              "product_id": 40,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "20",
              "subtotal_tax": "0",
              "total": "20",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 36,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 20
          },
          {
              "id": 2,
              "name": "MI AT",
              "product_id": 254,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 37,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          },
          {
              "id": 3,
              "name": "MI AI",
              "product_id": 255,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 38,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          }
      ],
      "tax_lines": [],
      "shipping_lines": [],
      "fee_lines": [],
      "coupon_lines": [],
      "date_created_gmt": "2018-11-30T10:33:49",
      "date_modified_gmt": "2018-11-30T10:33:51",
      "date_completed_gmt": null,
      "date_paid_gmt": null,
      "vendor_order_details": {
          "ID": "2",
          "vendor_id": "2",
          "order_id": "267",
          "customer_id": "1",
          "payment_method": "cheque",
          "product_id": "254",
          "variation_id": "0",
          "quantity": "1",
          "product_price": "299",
          "purchase_price": "299",
          "item_id": "2",
          "item_type": "line_item",
          "item_sub_total": "299",
          "item_total": "299",
          "shipping": "0",
          "tax": "0",
          "shipping_tax_amount": "0",
          "commission_amount": "269.1",
          "discount_amount": "0",
          "discount_type": "",
          "other_amount": "0",
          "other_amount_type": "",
          "withdrawal_id": "0",
          "refunded_id": "0",
          "refunded_amount": "0",
          "withdraw_charges": "0",
          "total_commission": "269.1",
          "order_status": "on-hold",
          "shipping_status": "pending",
          "commission_status": "on-hold",
          "withdraw_status": "pending",
          "refund_status": "pending",
          "is_refunded": "0",
          "is_partially_refunded": "0",
          "is_withdrawable": "1",
          "is_auto_withdrawal": "0",
          "is_trashed": "0",
          "commission_paid_date": null,
          "created": "2018-11-30 16:03:49"
      }
  },
  {
      "id": 267,
      "parent_id": 0,
      "status": "on-hold",
      "currency": "INR",
      "version": "3.5.1",
      "prices_include_tax": false,
      "date_created": "2018-11-30T10:33:49",
      "date_modified": "2018-11-30T10:33:51",
      "discount_total": "0",
      "discount_tax": "0",
      "shipping_total": "10.00",
      "shipping_tax": "0",
      "cart_tax": "0",
      "total": "628.00",
      "total_tax": "0",
      "customer_id": 1,
      "order_key": "wc_order_5c01120d1cd6a",
      "billing": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN",
          "email": "testName@gmail.com",
          "phone": "1111111111"
      },
      "shipping": {
          "first_name": "Test",
          "last_name": "Name",
          "company": "",
          "address_1": "PAS Road",
          "address_2": "111",
          "city": "Kolkata",
          "state": "WB",
          "postcode": "700001",
          "country": "IN"
      },
      "payment_method": "cheque",
      "payment_method_title": "Check payments",
      "transaction_id": "",
      "customer_ip_address": "::1",
      "customer_user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.102 Safari/537.36",
      "created_via": "checkout",
      "customer_note": "",
      "date_completed": null,
      "date_paid": null,
      "cart_hash": "6fa21b29ee1b5a3716a5d3fef061014d",
      "number": "267",
      "meta_data": [
          {
              "id": 4912,
              "key": "_wcfmmp_order_processed",
              "value": "yes"
          },
          {
              "id": 4916,
              "key": "_wcfm_new_order_notified",
              "value": "yes"
          }
      ],
      "line_items": [
          {
              "id": 1,
              "name": "Polo",
              "product_id": 40,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "20",
              "subtotal_tax": "0",
              "total": "20",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 36,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 20
          },
          {
              "id": 2,
              "name": "MI AT",
              "product_id": 254,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 37,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          },
          {
              "id": 3,
              "name": "MI AI",
              "product_id": 255,
              "variation_id": 0,
              "quantity": 1,
              "tax_class": "",
              "subtotal": "299",
              "subtotal_tax": "0",
              "total": "299",
              "total_tax": "0",
              "taxes": [],
              "meta_data": [
                  {
                      "id": 38,
                      "key": "_vendor_id",
                      "value": "2"
                  }
              ],
              "sku": "",
              "price": 299
          }
      ],
      "tax_lines": [],
      "shipping_lines": [],
      "fee_lines": [],
      "coupon_lines": [],
      "date_created_gmt": "2018-11-30T10:33:49",
      "date_modified_gmt": "2018-11-30T10:33:51",
      "date_completed_gmt": null,
      "date_paid_gmt": null,
      "vendor_order_details": {
          "ID": "3",
          "vendor_id": "2",
          "order_id": "267",
          "customer_id": "1",
          "payment_method": "cheque",
          "product_id": "255",
          "variation_id": "0",
          "quantity": "1",
          "product_price": "299",
          "purchase_price": "299",
          "item_id": "3",
          "item_type": "line_item",
          "item_sub_total": "299",
          "item_total": "299",
          "shipping": "0",
          "tax": "0",
          "shipping_tax_amount": "0",
          "commission_amount": "269.1",
          "discount_amount": "0",
          "discount_type": "",
          "other_amount": "0",
          "other_amount_type": "",
          "withdrawal_id": "0",
          "refunded_id": "0",
          "refunded_amount": "0",
          "withdraw_charges": "0",
          "total_commission": "269.1",
          "order_status": "on-hold",
          "shipping_status": "pending",
          "commission_status": "on-hold",
          "withdraw_status": "pending",
          "refund_status": "pending",
          "is_refunded": "0",
          "is_partially_refunded": "0",
          "is_withdrawable": "1",
          "is_auto_withdrawal": "0",
          "is_trashed": "0",
          "commission_paid_date": null,
          "created": "2018-11-30 16:03:49"
      }
  }
]
```

This API helps you to view all the orders.

### HTTP Request

`GET <site_base_url>/wp-json/wcfmmp/v1/orders/`
