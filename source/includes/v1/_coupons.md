# Coupons #
WCMp Coupons API allows you to get all the coupons of a vendor or insert a vendor's coupon and even update a coupon with a vendor assigned to it <a target="_blank" href="https://developer.wordpress.org/rest-api/">WordPress REST API</a> and <a target="_blank" href="https://woocommerce.github.io/woocommerce-rest-api-docs/#coupons">(extends WooCommerce Coupons API)</a>.

## List all coupons by vendor ##
To retrieve all the coupons by a vendor, make a HTTP GET request to WooCommerce's Coupon API with a `vendor` parameter passed to it.

### Accepted Parameters ###

| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `vendor`             | Vendor ID of the vendor whose coupons are to be listed.                    										|
| `include_vendor`     | Array of vendor IDs whose coupons are to be listed.																|
| `exclude_vendor`     | Array of vendor IDs whose coupons are to be excluded from the list.												|

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wc/v2/coupons/?vendor=[vendor_id]</h6>
  </div>
</div>

```shell
curl -X POST https://example.com/wp-json/wc/v2/coupons/?vendor=13 \
	-u consumer_key:consumer_secret
```

> Response:

```json
[
    {
        "id": 490,
        "code": "50off",
        "amount": "50.00",
        "date_created": "2018-06-28T06:20:39",
        "date_created_gmt": "2018-06-28T06:20:39",
        "date_modified": "2018-06-28T06:20:39",
        "date_modified_gmt": "2018-06-28T06:20:39",
        "discount_type": "fixed_product",
        "description": "Curabitur molestie posuere purus, eget venenatis quam ornare quis. Aenean pharetra magna quam, ac efficitur sapien ornare sed. Sed in lobortis nisi. ",
        "date_expires": "2018-08-29T00:00:00",
        "date_expires_gmt": "2018-08-29T00:00:00",
        "usage_count": 0,
        "individual_use": true,
        "product_ids": [],
        "excluded_product_ids": [],
        "usage_limit": null,
        "usage_limit_per_user": 2,
        "limit_usage_to_x_items": null,
        "free_shipping": false,
        "product_categories": [],
        "excluded_product_categories": [],
        "exclude_sale_items": true,
        "minimum_amount": "500.00",
        "maximum_amount": "0.00",
        "email_restrictions": [],
        "used_by": [],
        "meta_data": [],
        "vendor": "13",
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wc/v2/coupons/490"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wc/v2/coupons"
                }
            ]
        }
    },
    {
        "id": 489,
        "code": "wcmp coupon",
        "amount": "10.00",
        "date_created": "2018-06-28T06:18:49",
        "date_created_gmt": "2018-06-28T06:18:49",
        "date_modified": "2018-06-28T06:18:49",
        "date_modified_gmt": "2018-06-28T06:18:49",
        "discount_type": "fixed_product",
        "description": "Curabitur molestie posuere purus, eget venenatis quam ornare quis. Aenean pharetra magna quam, ac efficitur sapien ornare sed. Sed in lobortis nisi. ",
        "date_expires": "2018-07-13T00:00:00",
        "date_expires_gmt": "2018-07-13T00:00:00",
        "usage_count": 0,
        "individual_use": true,
        "product_ids": [],
        "excluded_product_ids": [],
        "usage_limit": null,
        "usage_limit_per_user": 1,
        "limit_usage_to_x_items": null,
        "free_shipping": false,
        "product_categories": [],
        "excluded_product_categories": [],
        "exclude_sale_items": true,
        "minimum_amount": "150.00",
        "maximum_amount": "0.00",
        "email_restrictions": [],
        "used_by": [],
        "meta_data": [],
        "vendor": "13",
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wc/v2/coupons/489"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wc/v2/coupons"
                }
            ]
        }
    }
]
```

## List a specific coupon by a vendor ##
Using this you can list a single coupon of a specific vendor.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wc/v2/coupons/[coupon_id]?vendor=[vendor_id]</h6>
  </div>
</div>


```shell
curl -X GET https://example.com/wp-json/wc/v2/coupons/485/?vendor=13 \
	-u consumer_key:consumer_secret
```

> Response:

```html
Response data received is same as above except for the fact, only the specific coupon is retrieved.

```

## Create a vendor's coupon ##
Using this you can add a coupon to a vendor.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-post">POST</i>
    <h6>/wp-json/wc/v2/coupons/</h6>
  </div>
</div>


```shell
curl -X POST https://example.com/wp-json/wc/v2/coupons \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "code": "50off",
  "discount_type": "fixed_product",
  "amount": "50",
  "individual_use": true,
  "exclude_sale_items": true,
  "minimum_amount": "500.00",
  "vendor": 13
}'
```
### Debugging ###

| Error Code                    					    | Debugging                                                 			            |
|------------------------------------------------------ |------------------------------------------------------------------------------	    |
| `404` `woocommerce_rest_shop_coupon_invalid_vendor_id`| Provided `id` does not belong to a registered vendor. Enter a valid vendor ID.	|

## Assign a new vendor to a coupon ##
Update your existing coupon with a new vendor or assign a vendor to an existing vendor-less coupon.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-post">POST</i>
    <h6>/wp-json/wc/v2/coupons/[coupon_id]/</h6>
  </div>
</div>

```shell
curl -X POST https://example.com/wp-json/wc/v2/coupons/490 \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "vendor": 14
}'
```

> Response:

```json
{
    "id": 490,
    "code": "50off",
    "amount": "50.00",
    "date_created": "2018-06-28T06:20:39",
    "date_created_gmt": "2018-06-28T06:20:39",
    "date_modified": "2018-06-28T06:20:39",
    "date_modified_gmt": "2018-06-28T06:20:39",
    "discount_type": "fixed_product",
    "description": "Curabitur molestie posuere purus, eget venenatis quam ornare quis. Aenean pharetra magna quam, ac efficitur sapien ornare sed. Sed in lobortis nisi. ",
    "date_expires": "2018-08-29T00:00:00",
    "date_expires_gmt": "2018-08-29T00:00:00",
    "usage_count": 0,
    "individual_use": true,
    "product_ids": [],
    "excluded_product_ids": [],
    "usage_limit": null,
    "usage_limit_per_user": 2,
    "limit_usage_to_x_items": null,
    "free_shipping": false,
    "product_categories": [],
    "excluded_product_categories": [],
    "exclude_sale_items": true,
    "minimum_amount": "500.00",
    "maximum_amount": "0.00",
    "email_restrictions": [],
    "used_by": [],
    "meta_data": [],
    "vendor": "14",
    "_links": {
        "self": [
            {
                "href": "http://example.com/wp-json/wc/v2/coupons/490"
            }
        ],
        "collection": [
            {
                "href": "http://example.com/wp-json/wc/v2/coupons"
            }
        ]
    }
}
```