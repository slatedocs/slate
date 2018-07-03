# Orders #
WCMp Orders API allows you to list all the orders of a vendor <a target="_blank" href="https://woocommerce.github.io/woocommerce-rest-api-docs/#orders">(extends WooCommerce Orders API)</a>. 

## List all orders by vendor ##
To retrieve all the orders by a vendor, make a HTTP GET request to WooCommerce's Orders API with a `vendor` parameter passed to it.

### Accepted Parameters ###

| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `vendor`             | Vendor ID of the vendor whose orders are to be listed.                    										|
| `include_vendor`     | Array of vendor IDs whose orders are to be listed.																|
| `exclude_vendor`     | Array of vendor IDs whose orders are to be excluded from the list.												|

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wc/v2/orders/?vendor=[vendor_id]</h6>
  </div>
</div>

```shell
curl -X GET https://example.com/wp-json/wc/v2/orders?vendor=13 \
	-u consumer_key:consumer_secret
```

> Response:

```json
[
    {
        "id": 480,
        "parent_id": 0,
        "number": "480",
        "order_key": "wc_order_5b32210b5888a",
        "created_via": "checkout",
        "version": "3.4.2",
        "status": "processing",
        "currency": "USD",
        "date_created": "2018-06-26T11:18:35",
        "date_created_gmt": "2018-06-26T11:18:35",
        "date_modified": "2018-06-26T11:18:39",
        "date_modified_gmt": "2018-06-26T11:18:39",
        "discount_total": "0.00",
        "discount_tax": "0.00",
        "shipping_total": "0.00",
        "shipping_tax": "0.00",
        "cart_tax": "9.09",
        "total": "100.00",
        "total_tax": "9.09",
        "prices_include_tax": true,
        "customer_id": 18,
        "customer_ip_address": "::1",
        "customer_user_agent": "mozilla/5.0 (x11; linux x86_64) applewebkit/537.36 (khtml, like gecko) ubuntu chromium/62.0.3202.75 chrome/62.0.3202.75 safari/537.36",
        "customer_note": "",
        "billing": {
            "first_name": "Customer",
            "last_name": "Test",
            "company": "",
            "address_1": "1, Happy Street",
            "address_2": "",
            "city": "New York City",
            "state": "CA",
            "postcode": "10001",
            "country": "US",
            "email": "test@hm.com",
            "phone": "9876543210"
        },
        "shipping": {
            "first_name": "Customer",
            "last_name": "Test",
            "company": "",
            "address_1": "1, Happy Street",
            "address_2": "",
            "city": "New York City",
            "state": "CA",
            "postcode": "10001",
            "country": "US"
        },
        "payment_method": "cod",
        "payment_method_title": "Cash on delivery",
        "transaction_id": "",
        "date_paid": null,
        "date_paid_gmt": null,
        "date_completed": null,
        "date_completed_gmt": null,
        "cart_hash": "d16e86a2720e474fde669e38611608a3",
        "meta_data": [
            {
                "id": 11251,
                "key": "_wcmp_order_processed",
                "value": "1"
            },
            {
                "id": 11261,
                "key": "_commission_ids",
                "value": [
                    481
                ]
            },
            {
                "id": 11262,
                "key": "_commissions_processed",
                "value": "yes"
            }
        ],
        "line_items": [
            {
                "id": 101,
                "name": "Pro 1",
                "product_id": 418,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "90.91",
                "subtotal_tax": "9.09",
                "total": "90.91",
                "total_tax": "9.09",
                "taxes": [
                    {
                        "id": 1,
                        "total": "9.090909",
                        "subtotal": "9.090909"
                    }
                ],
                "meta_data": [
                    {
                        "id": 857,
                        "key": "Sold By",
                        "value": "debleena5"
                    },
                    {
                        "id": 858,
                        "key": "_vendor_id",
                        "value": "13"
                    }
                ],
                "sku": "pro-001",
                "price": 90.909091
            }
        ],
        "tax_lines": [
            {
                "id": 103,
                "rate_code": "TAX-1",
                "rate_id": 1,
                "label": "Tax",
                "compound": false,
                "tax_total": "9.09",
                "shipping_tax_total": "0.00",
                "meta_data": []
            }
        ],
        "shipping_lines": [
            {
                "id": 102,
                "method_title": "Flat rate",
                "method_id": "flat_rate",
                "instance_id": "3",
                "total": "0.00",
                "total_tax": "0.00",
                "taxes": [],
                "meta_data": [
                    {
                        "id": 864,
                        "key": "Items",
                        "value": "Pro 1 &times; 1"
                    },
                    {
                        "id": 865,
                        "key": "vendor_id",
                        "value": "13"
                    },
                    {
                        "id": 866,
                        "key": "package_qty",
                        "value": "1"
                    }
                ]
            }
        ],
        "fee_lines": [],
        "coupon_lines": [],
        "refunds": [],
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wc/v2/orders/480"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wc/v2/orders"
                }
            ],
            "customer": [
                {
                    "href": "http://example.com/wp-json/wc/v2/customers/18"
                }
            ]
        }
    },
    {
        "id": 464,
        "parent_id": 0,
        "number": "464",
        "order_key": "wc_order_5b2232bfaf898",
        "created_via": "checkout",
        "version": "3.4.2",
        "status": "on-hold",
        "currency": "USD",
        "date_created": "2018-06-14T09:17:51",
        "date_created_gmt": "2018-06-14T09:17:51",
        "date_modified": "2018-06-14T09:17:55",
        "date_modified_gmt": "2018-06-14T09:17:55",
        "discount_total": "0.00",
        "discount_tax": "0.00",
        "shipping_total": "0.00",
        "shipping_tax": "0.00",
        "cart_tax": "9.09",
        "total": "100.00",
        "total_tax": "9.09",
        "prices_include_tax": true,
        "customer_id": 5,
        "customer_ip_address": "127.0.0.1",
        "customer_user_agent": "mozilla/5.0 (x11; ubuntu; linux x86_64; rv:56.0) gecko/20100101 firefox/56.0",
        "customer_note": "",
        "billing": {
            "first_name": "Jimmy",
            "last_name": "Parker",
            "company": "ABC Text",
            "address_1": "Thatcham Business Village, Colthrop Way",
            "address_2": "",
            "city": "Thatcham",
            "state": "England",
            "postcode": "RG19 4LW",
            "country": "GB",
            "email": "customer@fm.cm",
            "phone": "987654670"
        },
        "shipping": {
            "first_name": "Jimmy",
            "last_name": "Parker",
            "company": "ABC Text",
            "address_1": "Thatcham Business Village, Colthrop Way",
            "address_2": "",
            "city": "Thatcham",
            "state": "England",
            "postcode": "RG19 4LW",
            "country": "GB"
        },
        "payment_method": "bacs",
        "payment_method_title": "Direct bank transfer",
        "transaction_id": "",
        "date_paid": null,
        "date_paid_gmt": null,
        "date_completed": null,
        "date_completed_gmt": null,
        "cart_hash": "d16e86a2720e474fde669e38611608a3",
        "meta_data": [
            {
                "id": 10938,
                "key": "_wcmp_order_processed",
                "value": "1"
            }
        ],
        "line_items": [
            {
                "id": 80,
                "name": "Pro 1",
                "product_id": 418,
                "variation_id": 0,
                "quantity": 1,
                "tax_class": "",
                "subtotal": "90.91",
                "subtotal_tax": "9.09",
                "total": "90.91",
                "total_tax": "9.09",
                "taxes": [
                    {
                        "id": 1,
                        "total": "9.090909",
                        "subtotal": "9.090909"
                    }
                ],
                "meta_data": [
                    {
                        "id": 699,
                        "key": "Sold By",
                        "value": "debleena5"
                    },
                    {
                        "id": 700,
                        "key": "_vendor_id",
                        "value": "13"
                    }
                ],
                "sku": "pro-001",
                "price": 90.909091
            }
        ],
        "tax_lines": [
            {
                "id": 82,
                "rate_code": "TAX-1",
                "rate_id": 1,
                "label": "Tax",
                "compound": false,
                "tax_total": "9.09",
                "shipping_tax_total": "0.00",
                "meta_data": []
            }
        ],
        "shipping_lines": [
            {
                "id": 81,
                "method_title": "Free shipping",
                "method_id": "free_shipping",
                "instance_id": "1",
                "total": "0.00",
                "total_tax": "0.00",
                "taxes": [],
                "meta_data": [
                    {
                        "id": 706,
                        "key": "Items",
                        "value": "Pro 1 &times; 1"
                    },
                    {
                        "id": 707,
                        "key": "vendor_id",
                        "value": "13"
                    },
                    {
                        "id": 708,
                        "key": "package_qty",
                        "value": "1"
                    }
                ]
            }
        ],
        "fee_lines": [],
        "coupon_lines": [],
        "refunds": [],
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wc/v2/orders/464"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wc/v2/orders"
                }
            ],
            "customer": [
                {
                    "href": "http://example.com/wp-json/wc/v2/customers/5"
                }
            ]
        }
    }
]
```

## List a specific order by a vendor ##
Using this you can list a single order of a specific vendor.

### HTTP request ###

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wc/v2/orders/[order_id]?vendor=[vendor_id]</h6>
  </div>
</div>


```shell
curl -X POST https://example.com/wp-json/wc/v2/orders/485/?vendor=13 \
	-u consumer_key:consumer_secret
```

> Response:

```
Response data received is same as above except for the fact, only the specific order is retrieved.

```