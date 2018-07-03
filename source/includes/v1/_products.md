# Products #
WCMp Products API allows you to get all the products of a vendor or insert a vendor's product and even update a product with a vendor assigned to it <a target="_blank" href="https://woocommerce.github.io/woocommerce-rest-api-docs/#products">(extends WooCommerce Products API)</a>.

## List all products by vendor ##
To retrieve all the products by a vendor, make a HTTP GET request to WooCommerce's Product API with a `vendor` parameter passed to it.

### Accepted Parameters ###

| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `vendor`             | Vendor ID of the vendor whose products are to be listed.                    										|
| `include_vendor`     | Array of vendor IDs whose products are to be listed.																|
| `exclude_vendor`     | Array of vendor IDs whose products are to be excluded from the list.												|

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wc/v2/products/?vendor=[vendor_id]</h6>
  </div>
</div>

```shell
curl -X GET https://example.com/wp-json/wc/v2/products?vendor=13 \
	-u consumer_key:consumer_secret
```

> Response:

```json
[
    {
        "id": 484,
        "name": "abc",
        "slug": "",
        "permalink": "http://example.com/?post_type=product&p=484",
        "date_created": "2018-06-27T11:45:45",
        "date_created_gmt": "2018-06-27T11:45:45",
        "date_modified": "2018-06-27T11:45:49",
        "date_modified_gmt": "2018-06-27T11:45:49",
        "type": "simple",
        "status": "draft",
        "featured": false,
        "catalog_visibility": "visible",
        "description": "",
        "short_description": "",
        "sku": "",
        "price": "",
        "regular_price": "",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "price_html": "",
        "on_sale": false,
        "purchasable": false,
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
        "shipping_class": "debleena5-13",
        "shipping_class_id": 85,
        "reviews_allowed": true,
        "average_rating": "0.00",
        "rating_count": 0,
        "related_ids": [
            435,
            418,
            479
        ],
        "upsell_ids": [],
        "cross_sell_ids": [],
        "parent_id": 479,
        "purchase_note": "",
        "categories": [
            {
                "id": 64,
                "name": "Uncategorised",
                "slug": "uncategorised"
            }
        ],
        "tags": [],
        "images": [
            {
                "id": 0,
                "date_created": "2018-06-27T12:39:30",
                "date_created_gmt": "2018-06-27T12:39:30",
                "date_modified": "2018-06-27T12:39:30",
                "date_modified_gmt": "2018-06-27T12:39:30",
                "src": "http://example.com/wp-content/plugins/woocommerce/assets/images/placeholder.png",
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
                "id": 11366,
                "key": "_wcmp_child_product",
                "value": "1"
            }
        ],
        "vendor": "13",
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wc/v2/products/484"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wc/v2/products"
                }
            ],
            "up": [
                {
                    "href": "http://example.com/wp-json/wc/v2/products/479"
                }
            ]
        }
    },
    {
        "id": 483,
        "name": "abc",
        "slug": "",
        "permalink": "http://example.com/?post_type=product&p=483",
        "date_created": "2018-06-27T10:55:19",
        "date_created_gmt": "2018-06-27T10:55:19",
        "date_modified": "2018-06-27T10:55:23",
        "date_modified_gmt": "2018-06-27T10:55:23",
        "type": "simple",
        "status": "draft",
        "featured": false,
        "catalog_visibility": "visible",
        "description": "",
        "short_description": "",
        "sku": "",
        "price": "",
        "regular_price": "",
        "sale_price": "",
        "date_on_sale_from": null,
        "date_on_sale_from_gmt": null,
        "date_on_sale_to": null,
        "date_on_sale_to_gmt": null,
        "price_html": "",
        "on_sale": false,
        "purchasable": false,
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
        "shipping_class": "debleena5-13",
        "shipping_class_id": 85,
        "reviews_allowed": true,
        "average_rating": "0.00",
        "rating_count": 0,
        "related_ids": [
            479,
            418,
            435
        ],
        "upsell_ids": [],
        "cross_sell_ids": [],
        "parent_id": 479,
        "purchase_note": "",
        "categories": [
            {
                "id": 64,
                "name": "Uncategorised",
                "slug": "uncategorised"
            }
        ],
        "tags": [],
        "images": [
            {
                "id": 0,
                "date_created": "2018-06-27T12:39:30",
                "date_created_gmt": "2018-06-27T12:39:30",
                "date_modified": "2018-06-27T12:39:30",
                "date_modified_gmt": "2018-06-27T12:39:30",
                "src": "http://example.com/wp-content/plugins/woocommerce/assets/images/placeholder.png",
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
                "id": 11332,
                "key": "_wcmp_child_product",
                "value": "1"
            }
        ],
        "vendor": "13",
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wc/v2/products/483"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wc/v2/products"
                }
            ],
            "up": [
                {
                    "href": "http://example.com/wp-json/wc/v2/products/479"
                }
            ]
        }
    }
]
```

## List a specific product by a vendor ##
Using this you can list a single product of a specific vendor.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wc/v2/products/[product_id]?vendor=[vendor_id]</h6>
  </div>
</div>


```shell
curl -X POST https://example.com/wp-json/wc/v2/products/485/?vendor=13 \
	-u consumer_key:consumer_secret
```

> Response:

```
Response data received is same as above except for the fact, only the specific product is retrieved.

```

## Create a vendor's product ##
Using this you can add a product to a vendor.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-post">POST</i>
    <h6>/wp-json/wc/v2/products/</h6>
  </div>
</div>


```shell
curl -X POST https://example.com/wp-json/wc/v2/products \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "name": "Premium Quality",
  "type": "simple",
  "regular_price": "21.99",
  "description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.",
  "short_description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.",
  "images": [
    {
      "src": "http://example.com/wp-content/uploads/sites/56/2013/06/T_2_front.jpg",
      "position": 0
    },
    {
      "src": "http://example.com/wp-content/uploads/sites/56/2013/06/T_2_back.jpg",
      "position": 1
    }
  ],
  "vendor": 13
}'
```
### Debugging ###

| Error Code                    					| Debugging                                                 			            |
|-------------------------------------------------	|------------------------------------------------------------------------------ 	|
| `404` `woocommerce_rest_product_invalid_vendor_id`| Provided `id` does not belong to a registered vendor.  Enter a valid vendor ID.	|

## Assign a new vendor to a product ##
Update your existing product with a new vendor or assign a vendor to an existing vendor-less product.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-post">POST</i>
    <h6>/wp-json/wc/v2/products/[product_id]/</h6>
  </div>
</div>

```shell
curl -X POST https://example.com/wp-json/wc/v2/products/485 \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "vendor": 14
}'
```

> Response:

```json
{
    "id": 485,
    "name": "Pro 3",
    "slug": "pro-3",
    "permalink": "http://example.com/product/pro-3/",
    "date_created": "2018-06-27T12:15:35",
    "date_created_gmt": "2018-06-27T12:15:35",
    "date_modified": "2018-06-28T05:31:06",
    "date_modified_gmt": "2018-06-28T05:31:06",
    "type": "simple",
    "status": "publish",
    "featured": false,
    "catalog_visibility": "visible",
    "description": "",
    "short_description": "",
    "sku": "",
    "price": "100",
    "regular_price": "100",
    "sale_price": "",
    "date_on_sale_from": null,
    "date_on_sale_from_gmt": null,
    "date_on_sale_to": null,
    "date_on_sale_to_gmt": null,
    "price_html": "<span class=\"woocommerce-Price-amount amount\"><span class=\"woocommerce-Price-currencySymbol\">&#36;</span>90.91</span>",
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
    "average_rating": "0",
    "rating_count": 0,
    "related_ids": [
        439,
        422
    ],
    "upsell_ids": [],
    "cross_sell_ids": [],
    "parent_id": 0,
    "purchase_note": "",
    "categories": [
        {
            "id": 64,
            "name": "Uncategorised",
            "slug": "uncategorised"
        }
    ],
    "tags": [],
    "images": [
        {
            "id": 0,
            "date_created": "2018-06-28T05:31:07",
            "date_created_gmt": "2018-06-28T05:31:07",
            "date_modified": "2018-06-28T05:31:07",
            "date_modified_gmt": "2018-06-28T05:31:07",
            "src": "http://example.com/wp-content/plugins/woocommerce/assets/images/placeholder.png",
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
            "id": 11400,
            "key": "_commission_per_product",
            "value": ""
        },
        {
            "id": 11401,
            "key": "_wcmp_cancallation_policy",
            "value": ""
        },
        {
            "id": 11402,
            "key": "_wcmp_refund_policy",
            "value": ""
        },
        {
            "id": 11403,
            "key": "_wcmp_shipping_policy",
            "value": ""
        }
    ],
    "vendor": "14",
    "_links": {
        "self": [
            {
                "href": "http://example.com/wp-json/wc/v2/products/485"
            }
        ],
        "collection": [
            {
                "href": "http://example.com/wp-json/wc/v2/products"
            }
        ]
    }
}
```