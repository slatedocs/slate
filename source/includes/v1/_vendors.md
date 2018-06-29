# Vendors #
WCMp vendors API allows you to create, view, update, and delete individual, or a batch of vendors remotely through another application.

## Accepted Parameters ##

| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `id`                 | Unique identifier for the resource. Generated automatically in POST request.                    					|
| `login`       	   | Username of the vendor. <i class="label label-info">mandatory</i>													|
| `first_name`   	   | Vendor's first name.                           																	|
| `last_name`		   | Vendor's last name.  																								|
| `nice_name`  		   | The sanitized version of vendor's username.                  														|
| `display_name`       | The name to be displayed publicly.												                            		|
| `email`         	   | The email address for the customer. <i class="label label-info">mandatory</i>                              		|
| `url`          	   | Vendor's website address.                                                                                  		|
| `password`           | Vendor's account password.                                                                                 		|
| `roles`              | Assigned user role. Automatically set to `dc_vendor`.                                              				|
| `timezone_string`    | Vendor's timezone. Example: Asia/Kolkata. <i class="label label-info">Either `timezone_string` or `gmt_offset`</i>	|
| `gmt_offset` 		   | Vendor's timezone. Example: 5.5 ( if the vendor is in a timezone: say UTC+5:30, then gmt_offset is calculated as a fraction and changed to 5.5, or, if the vendor is in a timezone say UTC+6:00, then gmt_offset will be 6 ).                               		 		 |
| `shop`       		   | Array of shop details. [Read More](#accepted-parameters-vendor-shop-details).                     					|
| `address`        	   | Array of vendor's shop address. [Read More](#accepted-parameters-vendor-shop-address).	      	            		|
| `social`         	   | Array of vendor's social links. [Read More](#accepted-parameters-vendor-social-links).                   		    |
| `payment`            | Array of vendor's payment details. [Read More](#accepted-parameters-vendor-payment-details).        		   		|
| `message_to_buyers`  | A message that the vendor wants to display to their customers. 					                         		|


### Accepted Parameters - Vendor Shop Details ###

| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `description`        | Vendor's shop description.													                    					|


### Accepted Parameters - Vendor Shop Address ###


| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `address_1`          | Vendor's Address Line 1.                    																		|
| `address_2`          | Vendor's Address Line 2.																							|
| `city`   	   		   | Vendor's city.                           																			|
| `state`		   	   | Vendor's state.  																									|
| `country`  		   | Vendor's country.                  																				|
| `postcode`       	   | Vendor's ZIP/Postcode.												                            					|
| `phone`       	   | Vendor's phone.												                            						|


### Accepted Parameters - Vendor Social Links ###


| Attribute            | Description                                                                                                		|
| -------------------- | ---------------------------------------------------------------------------------------------------------- 		|
| `facebook`           | Vendor's Facebook Profile Address.                    																|
| `twitter`            | Vendor's Twitter Profile Address.																					|
| `google_plus`   	   | Vendor's Google Plus Profile Address.                  															|
| `linkdin`		   	   | Vendor's LinkedIn Profile Address.  																				|
| `youtube`  		   | Vendor's YouTube Profile Address.                  																|
| `instagram`  		   | Vendor's Instagram Profile Address.                  																|

### Accepted Parameters - Vendor Payment Details ###


| Attribute            		| Description                                                                                                		|
| -----------------------	| ---------------------------------------------------------------------------------------------------------- 		|
| `payment_mode`       		| Mode of vendor's payment : Direct Bank Transfer (`direct_bank`) or PayPal (`paypal_payout` or `paypal_masspay` ). |
| `bank_account_type`  		| If payment is `direct_bank`: then vendor's sccount type: `current` or `savings`.									|
| `bank_name`   	   		| Vendor's Google Plus Profile Address.                  															|
| `bank_account_number`		| Vendor's LinkedIn Profile Address.  																				|
| `bank_address`  	   		| Vendor's YouTube Profile Address.                  																|
| `account_holder_name`		| Vendor's Instagram Profile Address.                  																|
| `aba_routing_number` 		| Vendor's Instagram Profile Address.                  																|
| `destination_currency`  	| Vendor's Instagram Profile Address.                  																|
| `iban`  		   			| Vendor's Instagram Profile Address.                  																|
| `paypal_email`  		   	| Vendor's Instagram Profile Address.                  																|


## Create a Vendor ##

A new vendor can be created by calling the WCMp vendors API and using the `POST` method.
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-post">POST</i>
    <h6>/wp-json/wcmp/v1/vendors</h6>
  </div>
</div>

A vendor will be registered on your site and is ready to sell upon successful API call.

```shell
curl -X POST https://example.com/wp-json/wcmp/v1/vendors \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "login": "ria",
  "first_name": "Ria",
  "last_name": "Cooper",
  "nice_name": "ria",
  "display_name": "Ria",
  "email": "ria@example.com",
  "url": "https://example.com"
}'
```
> Response:

```json
{
    "id": 19,
    "login": "ria",
    "first_name": "Ria",
    "last_name": "Cooper",
    "nice_name": "ria",
    "display_name": "Ria",
    "email": "ria@example.com",
    "url": "",
    "registered": "2018-06-27 06:17:18",
    "status": "0",
    "roles": [
        "dc_vendor"
    ],
    "allcaps": {
        "read": true,
        "manage_product": true,
        "edit_posts": true,
        "delete_posts": false,
        "view_woocommerce_reports": true,
        "assign_product_terms": true,
        "upload_files": true,
        "read_product": true,
        "read_shop_coupon": true,
        "edit_product": true,
        "delete_product": true,
        "edit_products": true,
        "delete_products": true,
        "publish_products": true,
        "edit_published_products": true,
        "delete_published_products": true,
        "edit_shop_coupon": true,
        "edit_shop_coupons": true,
        "delete_shop_coupon": true,
        "delete_shop_coupons": true,
        "publish_shop_coupons": true,
        "edit_published_shop_coupons": true,
        "delete_published_shop_coupons": true,
        "vendor_import_capability": true,
        "vendor_export_capability": true,
        "dc_vendor": true
    },
    "timezone_string": "",
    "gmt_offset": "",
    "shop": {
        "url": "http://example.com/vendor/ria/",
        "title": "ria",
        "slug": "ria",
        "description": "",
        "image": "",
        "banner": ""
    },
    "address": {
        "address_1": "",
        "address_2": "",
        "city": "",
        "state": "",
        "country": "",
        "postcode": "",
        "phone": ""
    },
    "social": {
        "facebook": "",
        "twitter": "",
        "google_plus": "",
        "linkdin": "",
        "youtube": "",
        "instagram": ""
    },
    "payment": {
        "payment_mode": "",
        "bank_account_type": "",
        "bank_name": "",
        "bank_account_number": "",
        "bank_address": "",
        "account_holder_name": "",
        "aba_routing_number": "",
        "destination_currency": "",
        "iban": "",
        "paypal_email": ""
    },
    "message_to_buyers": "",
    "review": 0,
    "_links": {
        "self": [
            {
                "href": "http://example.com/wp-json/wcmp/v1/vendors/19"
            }
        ],
        "collection": [
            {
                "href": "http://example.com/wp-json/wcmp/v1/vendors"
            }
        ]
    }
}
```

### Debugging ###

| Error Code                    		  | Debugging                                                 		|
|---------------------------------------  |-------------------------------------------------------------- 	|
| `400` `wcmp_rest_dc_vendor_exists`      | A resource is already registerred with the `id` you've provided   |
| `400` `wcmp_rest_dc_vendor_login_empty` | You've missed filling out the username in the `login` field   	|
| `400` `wcmp_rest_dc_vendor_email_empty` | You've missed filling out the email in the `email` field         	|

> WCMp REST API 400 error example:

```json
{
  "code": "wcmp_rest_dc_vendor_login_empty",
  "message": "dc_vendor login required.",
  "data": {
    "status": 400
  }
}
```

## Get all Vendors ##

List all the vendors registered on your site by calling the WCMp vendors API and using the `GET` method.
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wcmp/v1/vendors</h6>
  </div>
</div>

```shell
curl https://example.com/wp-json/wcmp/v1/vendors \
    -u consumer_key:consumer_secret
```

> Response:

```json
[
    {
        "id": 17,
        "login": "james",
        "first_name": "James",
        "last_name": "Goody",
        "nice_name": "james",
        "display_name": "Jaina",
        "email": "james@example.com",
        "url": "https://example.com",
        "registered": "2018-06-26 07:47:23",
        "status": "0",
        "roles": [
            "dc_vendor"
        ],
        "allcaps": {
            "read": true,
            "manage_product": true,
            "edit_posts": true,
            "delete_posts": false,
            "view_woocommerce_reports": true,
            "assign_product_terms": true,
            "upload_files": true,
            "read_product": true,
            "read_shop_coupon": true,
            "edit_product": true,
            "delete_product": true,
            "edit_products": true,
            "delete_products": true,
            "publish_products": true,
            "edit_published_products": true,
            "delete_published_products": true,
            "edit_shop_coupon": true,
            "edit_shop_coupons": true,
            "delete_shop_coupon": true,
            "delete_shop_coupons": true,
            "publish_shop_coupons": true,
            "edit_published_shop_coupons": true,
            "delete_published_shop_coupons": true,
            "vendor_import_capability": true,
            "vendor_export_capability": true,
            "dc_vendor": true
        },
        "timezone_string": "",
        "gmt_offset": "",
        "shop": {
            "url": "http://example.com/vendor/james/",
            "title": "james",
            "slug": "james",
            "description": "",
            "image": "",
            "banner": ""
        },
        "address": {
            "address_1": "56  Mounthoolie Lane",
            "address_2": "",
            "city": "SUTTON BASSETT",
            "state": "Northamptonshire",
            "country": "GB",
            "postcode": "LE16 7EL",
            "phone": "917-729-7017"
        },
        "social": {
            "facebook": "",
            "twitter": "",
            "google_plus": "",
            "linkdin": "",
            "youtube": "",
            "instagram": ""
        },
        "payment": {
            "payment_mode": "",
            "bank_account_type": "",
            "bank_name": "",
            "bank_account_number": "",
            "bank_address": "",
            "account_holder_name": "",
            "aba_routing_number": "",
            "destination_currency": "",
            "iban": "",
            "paypal_email": ""
        },
        "message_to_buyers": "",
        "review": 0,
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wcmp/v1/vendors/17"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wcmp/v1/vendors"
                }
            ]
        }
    },
    {
        "id": 19,
        "login": "ria",
        "first_name": "Ria",
        "last_name": "Cooper",
        "nice_name": "ria",
        "display_name": "ria",
        "email": "ria@example.com",
        "url": "",
        "registered": "2018-06-27 06:17:18",
        "status": "0",
        "roles": [
            "dc_vendor"
        ],
        "allcaps": {
            "read": true,
            "manage_product": true,
            "edit_posts": true,
            "delete_posts": false,
            "view_woocommerce_reports": true,
            "assign_product_terms": true,
            "upload_files": true,
            "read_product": true,
            "read_shop_coupon": true,
            "edit_product": true,
            "delete_product": true,
            "edit_products": true,
            "delete_products": true,
            "publish_products": true,
            "edit_published_products": true,
            "delete_published_products": true,
            "edit_shop_coupon": true,
            "edit_shop_coupons": true,
            "delete_shop_coupon": true,
            "delete_shop_coupons": true,
            "publish_shop_coupons": true,
            "edit_published_shop_coupons": true,
            "delete_published_shop_coupons": true,
            "vendor_import_capability": true,
            "vendor_export_capability": true,
            "dc_vendor": true
        },
        "timezone_string": "",
        "gmt_offset": "",
        "shop": {
            "url": "http://example.com/vendor/ria/",
            "title": "ria",
            "slug": "ria",
            "description": "",
            "image": "",
            "banner": ""
        },
        "address": {
            "address_1": "",
            "address_2": "",
            "city": "",
            "state": "",
            "country": "",
            "postcode": "",
            "phone": ""
        },
        "social": {
            "facebook": "",
            "twitter": "",
            "google_plus": "",
            "linkdin": "",
            "youtube": "",
            "instagram": ""
        },
        "payment": {
            "payment_mode": "",
            "bank_account_type": "",
            "bank_name": "",
            "bank_account_number": "",
            "bank_address": "",
            "account_holder_name": "",
            "aba_routing_number": "",
            "destination_currency": "",
            "iban": "",
            "paypal_email": ""
        },
        "message_to_buyers": "",
        "review": 0,
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wcmp/v1/vendors/19"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wcmp/v1/vendors"
                }
            ]
        }
    }
]
```

## Retrieve a Specific Vendor ##

Get a specific vendor's details by calling the WCMp vendors API and using the `GET` method.
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wcmp/v1/vendors/[id]</h6>
  </div>
</div>

```shell
curl https://example.com/wp-json/wcmp/v1/vendors/19 \
	-u consumer_key:consumer_secret
```

> Response:

```json
[
    {
        "id": 19,
        "login": "ria",
        "first_name": "Ria",
        "last_name": "Cooper",
        "nice_name": "ria",
        "display_name": "ria",
        "email": "ria@example.com",
        "url": "",
        "registered": "2018-06-27 06:17:18",
        "status": "0",
        "roles": [
            "dc_vendor"
        ],
        "allcaps": {
            "read": true,
            "manage_product": true,
            "edit_posts": true,
            "delete_posts": false,
            "view_woocommerce_reports": true,
            "assign_product_terms": true,
            "upload_files": true,
            "read_product": true,
            "read_shop_coupon": true,
            "edit_product": true,
            "delete_product": true,
            "edit_products": true,
            "delete_products": true,
            "publish_products": true,
            "edit_published_products": true,
            "delete_published_products": true,
            "edit_shop_coupon": true,
            "edit_shop_coupons": true,
            "delete_shop_coupon": true,
            "delete_shop_coupons": true,
            "publish_shop_coupons": true,
            "edit_published_shop_coupons": true,
            "delete_published_shop_coupons": true,
            "vendor_import_capability": true,
            "vendor_export_capability": true,
            "dc_vendor": true
        },
        "timezone_string": "",
        "gmt_offset": "",
        "shop": {
            "url": "http://example.com/vendor/ria/",
            "title": "ria",
            "slug": "ria",
            "description": "",
            "image": "",
            "banner": ""
        },
        "address": {
            "address_1": "",
            "address_2": "",
            "city": "",
            "state": "",
            "country": "",
            "postcode": "",
            "phone": ""
        },
        "social": {
            "facebook": "",
            "twitter": "",
            "google_plus": "",
            "linkdin": "",
            "youtube": "",
            "instagram": ""
        },
        "payment": {
            "payment_mode": "",
            "bank_account_type": "",
            "bank_name": "",
            "bank_account_number": "",
            "bank_address": "",
            "account_holder_name": "",
            "aba_routing_number": "",
            "destination_currency": "",
            "iban": "",
            "paypal_email": ""
        },
        "message_to_buyers": "",
        "review": 0,
        "_links": {
            "self": [
                {
                    "href": "http://example.com/wp-json/wcmp/v1/vendors/19"
                }
            ],
            "collection": [
                {
                    "href": "http://example.com/wp-json/wcmp/v1/vendors"
                }
            ]
        }
    }
]
```
### Debugging ###

| Error Code                    					| Debugging                                                 			|
|-------------------------------------------------	|------------------------------------------------------------------- 	|
| `400` `wcmp_rest_is_not_a_dc_vendor` 				| A resource `id` entered does not match with the registered vendors   	|


## Update a Vendor ##

Alter and save vendor's details by calling the WCMp vendors API and using the `PUT` method.
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">PUT</i>
    <h6>/wp-json/wcmp/v1/vendors/[id]</h6>
  </div>
</div>

```shell
curl -X PUT https://example.com/wp-json/wcmp/v1/vendors/19 \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "url": "https://wc-marketplace.com",
  "message_to_buyers": "Changing values using PUT method",
  "address": {
	    "address_1": "1 ABC Lane",
	    "address_2": "Example Street",
	    "city": "New York City",
	    "state": "New York",
	    "country": "NY",
	    "postcode": "1234",
	    "phone": "11111111"
   },
}'
```

> Response:

```json
{
    "id": 19,
    "login": "ria",
    "first_name": "",
    "last_name": "",
    "nice_name": "ria",
    "display_name": "ria",
    "email": "",
    "url": "https://wc-marketplace.com",
    "registered": "2018-06-27 06:17:18",
    "status": "0",
    "roles": [
        "dc_vendor"
    ],
    "allcaps": {
        "read": true,
        "manage_product": true,
        "edit_posts": true,
        "delete_posts": false,
        "view_woocommerce_reports": true,
        "assign_product_terms": true,
        "upload_files": true,
        "read_product": true,
        "read_shop_coupon": true,
        "edit_product": true,
        "delete_product": true,
        "edit_products": true,
        "delete_products": true,
        "publish_products": true,
        "edit_published_products": true,
        "delete_published_products": true,
        "edit_shop_coupon": true,
        "edit_shop_coupons": true,
        "delete_shop_coupon": true,
        "delete_shop_coupons": true,
        "publish_shop_coupons": true,
        "edit_published_shop_coupons": true,
        "delete_published_shop_coupons": true,
        "vendor_import_capability": true,
        "vendor_export_capability": true,
        "dc_vendor": true
    },
    "timezone_string": "",
    "gmt_offset": "",
    "shop": {
        "url": "http://example.com/vendor/ria/",
        "title": "ria",
        "slug": "ria",
        "description": "",
        "image": "",
        "banner": ""
    },
    "address": {
        "address_1": "1 ABC Lane",
        "address_2": "Example Street",
        "city": "New York City",
        "state": "New York",
        "country": "NY",
        "postcode": "1234",
        "phone": "11111111"
    },
    "social": {
        "facebook": "",
        "twitter": "",
        "google_plus": "",
        "linkdin": "",
        "youtube": "",
        "instagram": ""
    },
    "payment": {
        "payment_mode": "",
        "bank_account_type": "",
        "bank_name": "",
        "bank_account_number": "",
        "bank_address": "",
        "account_holder_name": "",
        "aba_routing_number": "",
        "destination_currency": "",
        "iban": "",
        "paypal_email": ""
    },
    "message_to_buyers": "Changing values using PUT method",
    "review": 0,
    "_links": {
        "self": [
            {
                "href": "http://example.com/wp-json/wcmp/v1/vendors/19"
            }
        ],
        "collection": [
            {
                "href": "http://example.com/wp-json/wcmp/v1/vendors"
            }
        ]
    }
}
```
### Debugging ###

| Error Code                    					| Debugging                                                 			|
|-------------------------------------------------	|------------------------------------------------------------------- 	|
| `400` `wcmp_rest_dc_vendor_insufficient_param`    | A resource `id` is invalid or have not been entered  					|
| `400` `wcmp_rest_is_not_a_dc_vendor` 				| A resource `id` entered does not match with the registered vendors   	|


## Delete a Vendor ##

Remove a vendor by calling the WCMp vendors API and using the `DELETE` method.
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">DELETE</i>
    <h6>/wp-json/wcmp/v1/vendors/[id]</h6>
  </div>
</div>

```shell
curl -X DELETE https://example.com/wp-json/wcmp/v1/vendors/19 \
	-u consumer_key:consumer_secret'
```

> Response:

```json
{
    "deleted": true,
    "previous": {
        "id": 19,
        "login": "ria",
        "first_name": "",
        "last_name": "",
        "nice_name": "ria",
        "display_name": "ria",
        "email": "",
        "url": "https://wc-marketplace.com",
        "registered": "2018-06-27 06:17:18",
        "status": "0",
        "roles": [
            "dc_vendor"
        ],
        "allcaps": {
            "read": true,
            "manage_product": true,
            "edit_posts": true,
            "delete_posts": false,
            "view_woocommerce_reports": true,
            "assign_product_terms": true,
            "upload_files": true,
            "read_product": true,
            "read_shop_coupon": true,
            "edit_product": true,
            "delete_product": true,
            "edit_products": true,
            "delete_products": true,
            "publish_products": true,
            "edit_published_products": true,
            "delete_published_products": true,
            "edit_shop_coupon": true,
            "edit_shop_coupons": true,
            "delete_shop_coupon": true,
            "delete_shop_coupons": true,
            "publish_shop_coupons": true,
            "edit_published_shop_coupons": true,
            "delete_published_shop_coupons": true,
            "vendor_import_capability": true,
            "vendor_export_capability": true,
            "dc_vendor": true
        },
        "timezone_string": "",
        "gmt_offset": "",
        "shop": {
            "url": "http://example.com/vendor/ria/",
            "title": "ria",
            "slug": "ria",
            "description": "",
            "image": "",
            "banner": ""
        },
        "address": {
            "address_1": "1 ABC Lane",
            "address_2": "Example Street",
            "city": "New York City",
            "state": "New York",
            "country": "NY",
            "postcode": "1234",
            "phone": "11111111"
        },
        "social": {
            "facebook": "",
            "twitter": "",
            "google_plus": "",
            "linkdin": "",
            "youtube": "",
            "instagram": ""
        },
        "payment": {
            "payment_mode": "",
            "bank_account_type": "",
            "bank_name": "",
            "bank_account_number": "",
            "bank_address": "",
            "account_holder_name": "",
            "aba_routing_number": "",
            "destination_currency": "",
            "iban": "",
            "paypal_email": ""
        },
        "message_to_buyers": "Changing values using PUT method",
        "review": 0
    }
}
```

### Debugging ###

| Error Code                    					| Debugging                                                 			|
|-------------------------------------------------	|------------------------------------------------------------------- 	|
| `400` `wcmp_rest_dc_vendor_insufficient_param`    | A resource `id` is invalid or have not been entered  					|
| `400` `wcmp_rest_is_not_a_dc_vendor` 				| A resource `id` entered does not match with the registered vendors   	|

## Batch update Vendors ##

Using this API with `POST` helps you to batch create, update and delete multiple vendors.

<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">POST</i>
    <h6>/wp-json/wcmp/v1/vendors/batch</h6>
  </div>
</div>

```shell
curl -X POST https://example.com/wp-json/wcmp/v21/vendors/batch \
	-u consumer_key:consumer_secret \
	-H "Content-Type: application/json" \
	-d '{
  "create": [
    {
      "email": "john.doe2@example.com",
      "first_name": "John",
      "last_name": "Doe",
      "login": "john.doe2",
      "address": {
        "address_1": "2 XYZ Lane",
        "address_2": "Example Street",
        "city": "New York City",
        "state": "New York",
        "country": "NY",
        "postcode": "9876",
        "phone": "9999999"
      },
      "social": {
        "facebook": "https:facebook.com",
      }
    },
    {
      "email": "joan.francis@example.com",
      "first_name": "Joãn",
      "last_name": "Francis",
      "login": "joan.francis",
      "message_to_buyers": "Add this messgae for buyers to see",
    }
  ],
  "update": [
    {
      "id": 16,
      "url": "https://dualcube.com"
    }
  ],
  "delete": [
    17
  ]
}'
```
> Response:

```json
{
    "create": [
        {
            "id": 20,
            "login": "john.doe2",
            "first_name": "John",
            "last_name": "Doe",
            "nice_name": "john-doe2",
            "display_name": "John Doe",
            "email": "john.doe2@example.com",
            "url": "",
            "registered": "2018-06-27 10:13:20",
            "status": "0",
            "roles": [
                "dc_vendor"
            ],
            "allcaps": {
                "read": true,
                "manage_product": true,
                "edit_posts": true,
                "delete_posts": false,
                "view_woocommerce_reports": true,
                "assign_product_terms": true,
                "upload_files": true,
                "read_product": true,
                "read_shop_coupon": true,
                "edit_product": true,
                "delete_product": true,
                "edit_products": true,
                "delete_products": true,
                "publish_products": true,
                "edit_published_products": true,
                "delete_published_products": true,
                "edit_shop_coupon": true,
                "edit_shop_coupons": true,
                "delete_shop_coupon": true,
                "delete_shop_coupons": true,
                "publish_shop_coupons": true,
                "edit_published_shop_coupons": true,
                "delete_published_shop_coupons": true,
                "vendor_import_capability": true,
                "vendor_export_capability": true,
                "dc_vendor": true
            },
            "timezone_string": "",
            "gmt_offset": "",
            "shop": {
                "url": "http://localhost/v3/vendor/john-doe2/",
                "title": "john.doe2",
                "slug": "john-doe2",
                "description": "",
                "image": "",
                "banner": ""
            },
            "address": {
                "address_1": "2 XYZ Lane",
                "address_2": "Example Street",
                "city": "New York City",
                "state": "New York",
                "country": "NY",
                "postcode": "9876",
                "phone": "9999999"
            },
            "social": {
                "facebook": "https:facebook.com",
                "twitter": "",
                "google_plus": "",
                "linkdin": "",
                "youtube": "",
                "instagram": ""
            },
            "payment": {
                "payment_mode": "",
                "bank_account_type": "",
                "bank_name": "",
                "bank_account_number": "",
                "bank_address": "",
                "account_holder_name": "",
                "aba_routing_number": "",
                "destination_currency": "",
                "iban": "",
                "paypal_email": ""
            },
            "message_to_buyers": "",
            "review": 0,
            "_links": {
                "self": [
                    {
                        "href": "http://localhost/v3/wp-json/wcmp/v1/vendors/20"
                    }
                ],
                "collection": [
                    {
                        "href": "http://localhost/v3/wp-json/wcmp/v1/vendors"
                    }
                ]
            }
        },
        {
            "id": 21,
            "login": "joan.francis",
            "first_name": "Joãn",
            "last_name": "Francis",
            "nice_name": "joan-francis",
            "display_name": "Joãn Francis",
            "email": "joan.francis@example.com",
            "url": "",
            "registered": "2018-06-27 10:13:21",
            "status": "0",
            "roles": [
                "dc_vendor"
            ],
            "allcaps": {
                "read": true,
                "manage_product": true,
                "edit_posts": true,
                "delete_posts": false,
                "view_woocommerce_reports": true,
                "assign_product_terms": true,
                "upload_files": true,
                "read_product": true,
                "read_shop_coupon": true,
                "edit_product": true,
                "delete_product": true,
                "edit_products": true,
                "delete_products": true,
                "publish_products": true,
                "edit_published_products": true,
                "delete_published_products": true,
                "edit_shop_coupon": true,
                "edit_shop_coupons": true,
                "delete_shop_coupon": true,
                "delete_shop_coupons": true,
                "publish_shop_coupons": true,
                "edit_published_shop_coupons": true,
                "delete_published_shop_coupons": true,
                "vendor_import_capability": true,
                "vendor_export_capability": true,
                "dc_vendor": true
            },
            "timezone_string": "",
            "gmt_offset": "",
            "shop": {
                "url": "http://localhost/v3/vendor/joan-francis/",
                "title": "joan.francis",
                "slug": "joan-francis",
                "description": "",
                "image": "",
                "banner": ""
            },
            "address": {
                "address_1": "",
                "address_2": "",
                "city": "",
                "state": "",
                "country": "",
                "postcode": "",
                "phone": ""
            },
            "social": {
                "facebook": "",
                "twitter": "",
                "google_plus": "",
                "linkdin": "",
                "youtube": "",
                "instagram": ""
            },
            "payment": {
                "payment_mode": "",
                "bank_account_type": "",
                "bank_name": "",
                "bank_account_number": "",
                "bank_address": "",
                "account_holder_name": "",
                "aba_routing_number": "",
                "destination_currency": "",
                "iban": "",
                "paypal_email": ""
            },
            "message_to_buyers": "Add this messgae for buyers to see",
            "review": 0,
            "_links": {
                "self": [
                    {
                        "href": "http://localhost/v3/wp-json/wcmp/v1/vendors/21"
                    }
                ],
                "collection": [
                    {
                        "href": "http://localhost/v3/wp-json/wcmp/v1/vendors"
                    }
                ]
            }
        }
    ],
    "update": [
        {
            "id": 16,
            "login": "raina",
            "first_name": "",
            "last_name": "",
            "nice_name": "raina",
            "display_name": "raina",
            "email": "",
            "url": "https://dualcube.com",
            "registered": "2018-06-26 07:40:10",
            "status": "0",
            "roles": [
                "dc_vendor"
            ],
            "allcaps": {
                "read": true,
                "manage_product": true,
                "edit_posts": true,
                "delete_posts": false,
                "view_woocommerce_reports": true,
                "assign_product_terms": true,
                "upload_files": true,
                "read_product": true,
                "read_shop_coupon": true,
                "edit_product": true,
                "delete_product": true,
                "edit_products": true,
                "delete_products": true,
                "publish_products": true,
                "edit_published_products": true,
                "delete_published_products": true,
                "edit_shop_coupon": true,
                "edit_shop_coupons": true,
                "delete_shop_coupon": true,
                "delete_shop_coupons": true,
                "publish_shop_coupons": true,
                "edit_published_shop_coupons": true,
                "delete_published_shop_coupons": true,
                "vendor_import_capability": true,
                "vendor_export_capability": true,
                "dc_vendor": true
            },
            "timezone_string": "",
            "gmt_offset": "",
            "shop": {
                "url": "http://localhost/v3/vendor/raina/",
                "title": "raina",
                "slug": "raina",
                "description": "",
                "image": "",
                "banner": ""
            },
            "address": {
                "address_1": "56  Mounthoolie Lane",
                "address_2": "",
                "city": "SUTTON BASSETT",
                "state": "Northamptonshire",
                "country": "GB",
                "postcode": "LE16 7EL",
                "phone": "917-729-7017"
            },
            "social": {
                "facebook": "",
                "twitter": "",
                "google_plus": "",
                "linkdin": "",
                "youtube": "",
                "instagram": ""
            },
            "payment": {
                "payment_mode": "",
                "bank_account_type": "",
                "bank_name": "",
                "bank_account_number": "",
                "bank_address": "",
                "account_holder_name": "",
                "aba_routing_number": "",
                "destination_currency": "",
                "iban": "",
                "paypal_email": ""
            },
            "message_to_buyers": "",
            "review": 0,
            "_links": {
                "self": [
                    {
                        "href": "http://localhost/v3/wp-json/wcmp/v1/vendors/16"
                    }
                ],
                "collection": [
                    {
                        "href": "http://localhost/v3/wp-json/wcmp/v1/vendors"
                    }
                ]
            }
        }
    ],
    "delete": [
        {
            "deleted": true,
            "previous": {
                "id": 17,
                "login": "james",
                "first_name": "James",
                "last_name": "Goody",
                "nice_name": "james",
                "display_name": "Jaina",
                "email": "james@example.com",
                "url": "https://example.com",
                "registered": "2018-06-26 07:47:23",
                "status": "0",
                "roles": [
                    "dc_vendor"
                ],
                "allcaps": {
                    "read": true,
                    "manage_product": true,
                    "edit_posts": true,
                    "delete_posts": false,
                    "view_woocommerce_reports": true,
                    "assign_product_terms": true,
                    "upload_files": true,
                    "read_product": true,
                    "read_shop_coupon": true,
                    "edit_product": true,
                    "delete_product": true,
                    "edit_products": true,
                    "delete_products": true,
                    "publish_products": true,
                    "edit_published_products": true,
                    "delete_published_products": true,
                    "edit_shop_coupon": true,
                    "edit_shop_coupons": true,
                    "delete_shop_coupon": true,
                    "delete_shop_coupons": true,
                    "publish_shop_coupons": true,
                    "edit_published_shop_coupons": true,
                    "delete_published_shop_coupons": true,
                    "vendor_import_capability": true,
                    "vendor_export_capability": true,
                    "dc_vendor": true
                },
                "timezone_string": "",
                "gmt_offset": "",
                "shop": {
                    "url": "http://localhost/v3/vendor/james/",
                    "title": "james",
                    "slug": "james",
                    "description": "",
                    "image": "",
                    "banner": ""
                },
                "address": {
                    "address_1": "56  Mounthoolie Lane",
                    "address_2": "",
                    "city": "SUTTON BASSETT",
                    "state": "Northamptonshire",
                    "country": "GB",
                    "postcode": "LE16 7EL",
                    "phone": "917-729-7017"
                },
                "social": {
                    "facebook": "",
                    "twitter": "",
                    "google_plus": "",
                    "linkdin": "",
                    "youtube": "",
                    "instagram": ""
                },
                "payment": {
                    "payment_mode": "",
                    "bank_account_type": "",
                    "bank_name": "",
                    "bank_account_number": "",
                    "bank_address": "",
                    "account_holder_name": "",
                    "aba_routing_number": "",
                    "destination_currency": "",
                    "iban": "",
                    "paypal_email": ""
                },
                "message_to_buyers": "",
                "review": 0
            }
        }
    ]
}

```