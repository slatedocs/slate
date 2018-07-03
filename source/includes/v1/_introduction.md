# Introduction #

WC Marketplace 3.1+ have been fully integrated with WordPress REST API. This will now let developers interact with sites remotely by sending and receiving JSON objects. When a data is sent out or a HTTP(S) request is made to the API from external applications, the response will be returned in JSON, thereby allowing WCMp data to be created, read, updated or deleted.

WCMp REST API has been introduced extending <a target="_blank" href="https://developer.wordpress.org/rest-api/">WordPress REST API</a> and <a target="_blank" href="https://woocommerce.github.io/woocommerce-rest-api-docs">WooCommerce REST API</a>.

## Prerequisites ##

<aside class="notice">
  <strong>Note:</strong> There is absolutely no need to install any extra plugin to access the latest WCMp REST API feature.
</aside>
To use __WCMp REST API__ make sure you are using:

* WC Marketplace 3.1+.
* WooCommerce 3.0+.
* WordPress 4.7+.
* Pretty permalinks in `Settings > Permalinks` so that the custom endpoints are supported. __Default permalinks will not work.__
* You may access the API over either HTTP or HTTPS.

<aside class="notice">
  <strong>Note:</strong> Before you proceed, go through <a target="_blank" href="https://woocommerce.github.io/woocommerce-rest-api-docs">WooCommerce REST API</a> for proper understanding of WCMp and WooCommerce REST API.
</aside>

## JSONP ##

JSONP is a method for sending JSON data without worrying about cross-domain issues. The JSON data is wrapped up in a callback function as a parameter inside it, but obviously keeping in mind the function exists on the client.

WP REST API supports JSONP by default about which you may read it <a target="_blank" href="https://developer.wordpress.org/rest-api/using-the-rest-api/global-parameters/#_jsonp">here</a>.

A syntactical representation of a JSONP request is provided below:
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wcmp/v1/.../?_jsonp=callback</h6>
  </div>
</div>

```shell
curl https://example.com/wp-json/wcmp/v1/vendors/14?_jsonp=vendorDetails \
  -u consumer_key:consumer_secret
```

> Response:

```json
/**/vendorDetails({"id":14,"login":"alex","first_name":"Alex","last_name":"Sarnal","nice_name":"alex","display_name":"alex","email":"alex@example.com","url":"","registered":"2018-05-31 13:29:05","status":"0","roles":["dc_vendor"],"allcaps":{"read":true,"manage_product":true,"edit_posts":true,"delete_posts":false,"view_woocommerce_reports":true,"assign_product_terms":true,"upload_files":true,"read_product":true,"read_shop_coupon":true,"edit_product":true,"delete_product":true,"edit_products":true,"delete_products":true,"publish_products":true,"edit_published_products":true,"delete_published_products":true,"edit_shop_coupon":true,"edit_shop_coupons":true,"delete_shop_coupon":true,"delete_shop_coupons":true,"publish_shop_coupons":true,"edit_published_shop_coupons":true,"delete_published_shop_coupons":true,"vendor_import_capability":true,"vendor_export_capability":true,"dc_vendor":true},"timezone_string":"","gmt_offset":"","shop":{"url":"http:\/\/example.com\/vendor\/alex\/","title":"alex","slug":"alex","description":"","image":"","banner":""},"address":{"address_1":"","address_2":"","city":"","state":"","country":"","postcode":"","phone":""},"social":{"facebook":"","twitter":"","google_plus":"","linkdin":"","youtube":"","instagram":""},"payment":{"payment_mode":"mangopay_gateway","bank_account_type":"current","bank_name":"","bank_account_number":"","bank_address":"","account_holder_name":"","aba_routing_number":"","destination_currency":"","iban":"","paypal_email":""},"message_to_buyers":"","review":0,"_links":{"self":[{"href":"http:\/\/example.com\/wp-json\/wcmp\/v1\/vendors\/14"}],"collection":[{"href":"http:\/\/example.com\/wp-json\/wcmp\/v1\/vendors"}]}})
```

## Starting Out ##

Generate API credentials (Consumer Key & Consumer Secret) following instructions listed in <a target="_blank" href="http://docs.woocommerce.com/document/woocommerce-rest-api/">http://docs.woocommerce.com/document/woocommerce-rest-api/</a> or you may also want to read through <a target="_blank" href="https://woocommerce.github.io/woocommerce-rest-api-docs/#authentication">https://woocommerce.github.io/woocommerce-rest-api-docs/#authentication</a> to authenticate with the WP REST API.

We do not create a different credential set, rather we use WooCommerce's API credentials thereby you need to authenticate only once.

## HTTP Methods ##

Use HTTP methods to map CRUD (create, retrieve, update, delete) operations to HTTP requests. Depending on your task, you can use any of the four methods listed below:

| HTTP methods  | Operations                    | Syntax                                                                                                                                            |
| ------------- | ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------        |
| `GET`         | Retrieve / List information   | <div class="wcmp-api-endpoint"><div class="wcmp-endpoint-data"><i class="label label-get">GET</i><h6>/wp-json/wcmp/v1/.../</h6></div></div>       |
| `POST`        | Create an item                | <div class="wcmp-api-endpoint"><div class="wcmp-endpoint-data"><i class="label label-post">POST</i><h6>/wp-json/wcmp/v1/.../</h6></div></div>     |
| `PUT`         | Update a pre-existing item    | <div class="wcmp-api-endpoint"><div class="wcmp-endpoint-data"><i class="label label-put">PUT</i><h6>/wp-json/wcmp/v1/.../</h6></div></div>       |
| `DELETE`      | Remove an item                | <div class="wcmp-api-endpoint"><div class="wcmp-endpoint-data"><i class="label label-delete">DELETE</i><h6>/wp-json/wcmp/v1/.../</h6></div></div> |

## Sending a HTTP Request ##

A syntactical representation of a HTTP request is provided below:
<div class="wcmp-api-endpoint">
  <div class="wcmp-endpoint-data">
    <i class="label label-get">GET</i>
    <h6>/wp-json/wcmp/v1</h6>
  </div>
</div>


```shell
curl https://example.com/wp-json/wcmp/v1/
```

> Response:

```json
{
    "namespace": "wcmp/v1",
    "routes": {
        "/wcmp/v1": {
            "namespace": "wcmp/v1",
            "methods": [
                "GET"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "namespace": {
                            "required": false,
                            "default": "wcmp/v1"
                        },
                        "context": {
                            "required": false,
                            "default": "view"
                        }
                    }
                }
            ],
            "_links": {
                "self": "http://example.com/wp-json/wcmp/v1"
            }
        },
        "/wcmp/v1/vendors": {
            "namespace": "wcmp/v1",
            "methods": [
                "GET",
                "POST"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "context": {
                            "required": false,
                            "enum": [
                                "view",
                                "edit"
                            ],
                            "description": "Scope under which the request is made; determines fields present in response.",
                            "type": "string"
                        },
                        "page": {
                            "required": false,
                            "default": 1,
                            "description": "Current page of the collection.",
                            "type": "integer"
                        },
                        "per_page": {
                            "required": false,
                            "default": 10,
                            "description": "Maximum number of items to be returned in result set.",
                            "type": "integer"
                        },
                        "search": {
                            "required": false,
                            "description": "Limit results to those matching a string.",
                            "type": "string"
                        }
                    }
                },
                {
                    "methods": [
                        "POST"
                    ],
                    "args": []
                }
            ],
            "_links": {
                "self": "http://example.com/wp-json/wcmp/v1/vendors"
            }
        },
        "/wcmp/v1/vendors/(?P<id>[\\d]+)": {
            "namespace": "wcmp/v1",
            "methods": [
                "GET",
                "POST",
                "PUT",
                "PATCH",
                "DELETE"
            ],
            "endpoints": [
                {
                    "methods": [
                        "GET"
                    ],
                    "args": {
                        "id": {
                            "required": false,
                            "description": "Unique identifier for the resource.",
                            "type": "integer"
                        },
                        "context": {
                            "required": false,
                            "default": "view",
                            "enum": [
                                "view",
                                "edit"
                            ],
                            "description": "Scope under which the request is made; determines fields present in response.",
                            "type": "string"
                        }
                    }
                },
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": {
                        "id": {
                            "required": false,
                            "description": "Unique identifier for the resource.",
                            "type": "integer"
                        }
                    }
                },
                {
                    "methods": [
                        "DELETE"
                    ],
                    "args": {
                        "id": {
                            "required": false,
                            "description": "Unique identifier for the resource.",
                            "type": "integer"
                        }
                    }
                }
            ]
        },
        "/wcmp/v1/vendors/batch": {
            "namespace": "wcmp/v1",
            "methods": [
                "POST",
                "PUT",
                "PATCH"
            ],
            "endpoints": [
                {
                    "methods": [
                        "POST",
                        "PUT",
                        "PATCH"
                    ],
                    "args": []
                }
            ],
            "_links": {
                "self": "http://example.com/wp-json/wcmp/v1/vendors/batch"
            }
        }
    },
    "_links": {
        "up": [
            {
                "href": "http://example.com/wp-json/"
            }
        ]
    }
}
```

## Pagination ##

WP REST API supports pagination therefore you can also paginate results returned by WCMp REST API in the same way WordPress does. If a request returns multiple items it will be paginated to 10 items automatically. However, you can change the default behaviour by specifying the `?per_page` parameter. The syntax for the same would be:

`GET /vendors?per_page=15`

To change the number of pages that shall be displayed with the result, you can alter the `?page` parameter:

`GET /vendors?page=2`

In order to skip a certain number of results before starting output you can specify a number ( to be skipped ) using the `?offset` parameter:

`GET /vendors?offset=5`


## Generic Errors ##

Some rare times you might encounter errors when accessing the REST API. There are three possible types:

| Error Code                    | Error Type                                                    |
|------------------------------ |-------------------------------------------------------------- |
| `400 Bad Request`             | Invalid request, e.g. using an unsupported HTTP method        |
| `401 Unauthorized`            | Authentication or permission error, e.g. incorrect API keys   |
| `404 Not Found`               | Requests to resources that don't exist or are missing         |
| `500 Internal Server Error`   | Server error                                                  |

> WCMp REST API 401 error example:

```json
{
  "code": "wcmp_rest_cannot_create",
  "message": "Sorry, you cannot create vendors.",
  "data": {
    "status": 401
  }
}
```

> WCMp REST API 404 error example:

```json
{
  "code": "woocommerce_rest_shop_coupon_invalid_id",
  "message": "Invalid coupon ID.",
  "data": {
    "status": 404
  }
}
```

Errors, as well returns a response object in JSON format which contains a `code`, `message` and `data` attribute.