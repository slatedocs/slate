---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

includes:
  - errors

search: true
---

# Introduction

Welcome to the SellerChamp API! You can use our API to access SellerChamp API endpoints, to pull back orders, products, inventory, marketplace prices and more.

You can view code examples in the dark area to the right.

# Authentication

An API Token must be called with every request.  To obtain your API Token contact us at support@sellerchamp.com

# Orders

## Get All Orders w/o parameters

```shell
# With shell, you can just pass the correct header with each request
curl -X GET \
  https://staging.sellerchamp.com/api/orders \
  -H 'token: YOUR-TOKEN' \

 Make sure to replace `YOUR-TOKEN` with your API key token.
```

Returns back all the orders for the client object associated with the specified API Token.  Default page size is 250.

`Token: YOUR-TOKEN`

> The above command returns JSON structured like this:

```json
{
    "orders": [
        {
            "order_number": "132886362059-1538935630003",
            "created_at": null,
            "updated_at": "2019-01-07T23:02:55.533Z",
            "purchased_at": "2018-12-14T00:10:56.000+00:00",
            "order_status": "shipped",
            "buyer_username": "ellis driver",
            "buyer_email": null,
            "ship_to": {
                "name": "ellis driver",
                "street1": "1623 NC Highway 86 N",
                "street2": null,
                "city": "hillsborough",
                "state": "NC",
                "postal_code": "27278-7516",
                "country": "US"
            },
            "items": [
                {
                    "order_item_id": "5c33da5a07b6203f81000887",
                    "sku": "S11LPJMI1BZZT",
                    "created_at": null,
                    "title": "Premium Rainbow Color Embroidery Floss - Cross Stitch Threads - Friendship Bra..",
                    "weight": {
                        "value": 0,
                        "units": "ounces"
                    },
                    "updated_at": null,
                    "quantity": 1,
                    "tax_amount": 0,
                    "unit_price": 12.54,
                    "shipping_amount": 0,
                    "warehouse_location": null,
                    "product_id": "",
                    "fulfillment_sku": "S11LPJMI1BZZT"
                }
            ],
            "store_id": "5c1902f207b620090a000026",
            "items_count": 1,
            "amount_paid": 12.54,
            "buyer_notes": null,
            "externally_fulfilled": false,
            "externally_fulfilled_by": ""
        }
    ]
}
```

## Get All Orders with parameters

Returns back a list of orders that match the specified criteria. All of the available filters are optional. They do not need to be included in the URL. If you do include them, here's what the URL may look like:

Url format with filters:

/orders?buyer_name={buyer_name}
&created_at_start={created_at_start}
&created_at_end={created_at_end}
&updated_at_start={updated_at_start}
&updated_at_end={updated_at_end}
&order_number={order_number}
&order_status={order_status}
&purchased_at_start={purchased_at_start}
&purchased_at_end={purchased_at_start}
&store_id={store_id}
&sort={sort_by}
&direction={sort_direction}
&page={page}
&page_size={page_size}


```shell
curl --request GET \
  --url 'https://staging.sellerchamp.com/api/orders?buyer_name={buyer_name}%0A&order_number={order_number}%0A&order_status={order_status}%0A&purchased_at_start={purchased_at_start}%0A&purchased_at_end={purchased_at_start}%0A&store_id={store_id}%0A&sort={sort_by}%0A&direction={sort_direction}%0A&page={page}%0A&page_size={page_size}&created_at_start={created_at_start}%0A&created_at_end={created_at_end}%0A&updated_at_start={updated_at_start}%0A&updated_at_end={updated_at_end}%0A' \
  -H 'token: YOUR-TOKEN' \
```
### URL Parameters

Name | Data Type | Description
-------------- | -------------- | --------------
buyer_name | String | Returns orders that match the specified name. Example: smith.
created_at_start | String | Returns orders that were created after the specified date Example: 2015-01-01 00:00:00.
created_at_end | String | Returns orders that were created before the specified date Example: 2015-01-08 00:00:00.
updated_at_start | String | Returns orders that were modified after the specified date Example: 2015-01-01 00:00:00.
updated_at_end | String | Returns orders that were modified before the specified date Example: 2015-01-08 00:00:00.
order_number | String | Filter by order number, performs a "starts with" search. Example: 12345.
order_status | String | Filter by order status. If left empty, orders of all statuses are returned. Example: shipped
purchased_at_start | String | Returns orders that were paid after the specified date Example: 2015-01-01
purchased_at_end | String | Returns orders that were paid before the specified date Example: 2015-01-08
store_id | Number | Filters orders to a single store. Call List Stores to obtain a list of store Ids. Example: 12345.
sort | String | Sort the responses by a set value. The response will be sorted based off the ascending dates (oldest to most current.) If left empty, the response will be sorted by ascending order_id. Example: Order_date
direction | String | Sets the direction of the sort order. Example: ASC.
page | String | Page number Default: 1.
page_size | number | Requested page size. Default: 250.

# Manifest

## Create Manifest with parameters

Returns back a list of orders that match the specified criteria. All of the available filters are optional. They do not need to be included in the URL. If you do include them, here's what the URL may look like:

Url format with filters:

/manifests?name={name}
&marketplace_account_id={marketplace_account_id}
&supplier_id={supplier_id}
&ship_from_address_id={ship_from_address_id}
&template_id={template_id}

```shell
curl --request POST \
  --url 'https://staging.sellerchamp.com/api/manifests?name={name}&marketplace_account_id={marketplace_account_id}&template_id={template_id}&supplier_id={supplier_id}&ship_from_address_id={ship_from_address_id}' \
  --header 'Content-Type: application/json' \
  --header 'Postman-Token: 503de8bf-31f1-4698-b892-3b40ff28261c' \
  --header 'cache-control: no-cache,no-cache' \
  --header 'token: YOUR-TOKEN' \
  --data '{"product_listings_attributes" : [{"asin" : "{asin}", "quantity" : "{quantity}", "item_condition" : "{item_condition}", "upc" : "{upc}", "sku" : "{sku}", "title" : "{title}", "retail_price" : "{retail_price}", "item_location" : "{item_location}", "item_category" : "{item_category}", "item_remarks" : "{item_remarks}", "brand" : "{brand}", "description" : "{description}", "features" : "{features}", "details_html" : "{details_html}", "item_specifics" : "{item_specifics}", "mpn" : "{mpn}", "listing_format" : "{listing_format}", "color" : "{color}", "manufacturer" : "{manufacturer}", "model" : "{model}", "part_number" : "{part_number}", "listing_duration" : "{listing_duration}", "store_category_external_id" : "{store_category_external_id}","store_category_2_external_id" : "{store_category_2_external_id}", "weight_in_pounds" : "{weight_in_pounds}", "package_dimensions_length" : "{package_dimensions_length}", "package_dimensions_width" : "{package_dimensions_width}", "package_dimensions_height" : "{package_dimensions_height}", "item_dimensions_length" : "{item_dimensions_length}", "item_dimensions_width" : "{item_dimensions_width}", "item_dimensions_height" : "{item_dimensions_height}", "handling_time" : "{handling_time}", "shipping_charge_type" : "{shipping_charge_type}", "global_shipping" : "{global_shipping}", "free_shipping" : "{free_shipping}", "shipping_service_code" : "{shipping_service_code}", "shipping_service_cost" : "{shipping_service_cost}", "extra_shipping_service_cost" : "{extra_shipping_service_cost}", "domestic_rate_table" : "{domestic_rate_table}", "international_shipping_service_code" : "{international_shipping_service_code}", "international_shipping_service_cost" : "{international_shipping_service_cost}", "extra_international_shipping_service_cost" : "{extra_international_shipping_service_cost}", "international_ship_to_locations" : "{international_ship_to_locations}", "international_rate_table" : "{international_rate_table}", "return_item_within" : "{return_item_within}", "refund_policy_value" : "{refund_policy_value}", "return_shipping_paid_by_value" : "{return_shipping_paid_by_value}", "qunatity_in_case" : "{qunatity_in_case}", "cost_price" : "{cost_price}", "expiration_date" : "{expiration_date}", "fnsku" : "{fnsku}", "image_urls" : [], "external_ids" : []}, {...}]}\n\n'
```
### URL Parameters

Manifest Parameters

Name | Data Type(Required) | Description
-------------- | -------------- | --------------
name | String(Required) | Name of the Manifest. Example: 04-17-2019.
supplier_id | String(Optional) | Supplier ID. Example: BSON::ObjectId('59e0f41007b6205968000016').
ship_from_address_id | String(Optional) | ID of ship from address Example: BSON::ObjectId('59e0d31f07b6204cc8000000').
marketplace_account_id | String(Required) | ID of Marketplace Account. Example: BSON::ObjectId('5c1902f207b620090a000026').
template_id | String(Optional) | Template ID. Example: BSON::ObjectId('5c1902f207b620090a00003e')

ProductListing Parameters should be in array for multiple listing creations.

Name | Data Type(Required) | Description
-------------- | -------------- | --------------
asin | String(Required) | Listing ASIN. Example: B07G22S48Q.
quantity | Integer(Optional) | Quantity of the listing. Example: 2.
item_condition | String(Optional) | Example: [like_new, very_good, good, acceptable, refurbished, salvage] any one.
upc | String(Optional) | Example: 883929635085
sku | String(Optional) | SKU of the listing. Example: AB883929635085.
title | String(Required) | Title of the listing. Example: DCU Justice League: Throne of Atlantis Commemorative Edition (BD) [Blu-ray].
retail_price | Float(Optional) | Retail Price of the listing. Example: 9.99
color | String(Optional) | Example: Navy
manufacturer | String(Optional) | Example: Charmed
model | String(Optional) | Example: P3Q-00001
part_number | String(Optional) | Example: LE
listing_duration | String(Optional) | Example: gtc
item_location | String(Optional) | Listing Location.
item_category | String(Optional) | item_category if ebay marketplace. Example: DVDs &amp; Blu-ray Discs.
item_remarks | String(Optional) | Example: Item will come in original packaging and includes all accessories.  Item has been tested and is in full working condition.  Comes with a 30-day warranty..
brand | String(Optional) | Example: Warner Manufacturing
description | String(Optional) | Description of the listing
features | String(Optional) | Features of the product
details_html | Float(Optional) | Example: <ul><li>Item Weight: 0.0 pounds</li><li>Shipping Weight: 0.0 pounds</li><li>Domestic Shipping: Item can be shipped within U.S.</li></ul>
item_specifics | String(Optional) | Example: [{"name"=>"Brand", "value"=>"Update International", "source"=>"ItemSpecific"}, {"name"=>"UPC", "value"=>"793842123296", "source"=>"ItemSpecific"}]
mpn | String | Example: 90000032507
listing_format | String(Optional) | Example: fixed_price
store_category_external_id | Float(Optional) | Example: 64789836013
store_category_2_external_id | String(Optional) | Example: 64789836013
weight_in_pounds | Float(Optional) | Example: 0.0
package_dimensions_length | Float(Optional) | Example: 0.0
package_dimensions_width | Float(Optional) | Example: 0.0
package_dimensions_height | Float(Optional) | Example: 0.0
item_dimensions_length | Float(Optional) | Example: 0.0
item_dimensions_width | Float(Optional) | Example: 0.0
item_dimensions_height | Float(Optional) | Example: 0.0
handling_time | Integer(Optional) | Example: 1
shipping_charge_type | String(Optional) | Example: flat
global_shipping | Boolean(Optional) | Example: True
free_shipping | Boolean(Optional) | Example: True
shipping_service_code | String(Optional) | Example: ShippingMethodExpress
shipping_service_cost | Float(Optional) | Example: 0.46
extra_shipping_service_cost | String(Optional) | Example: 0.3
domestic_rate_table | Boolean(Optional) | Example: False
international_shipping_service_code | String(Optional) | Example: US_IntlEconomyShippingFromGC
international_shipping_service_cost | Float(Optional) | Example: 0.6
extra_international_shipping_service_cost | Float(Optional) | Example: 0.3
international_ship_to_locations | Array(Optional) | Example: ["CN", "CA"]
international_rate_table | Boolean(Optional) | Example: False
return_item_within | Integer(Optional) | Example: 7 days
refund_policy_value | Float(Optional) | Example: Money Back
return_shipping_paid_by_value | String(Optional) | Example: Seller
cost_price | Float(Optional) | Example: 0.0
expiration_date | Date(Optional) | Example: 2019-04-27
fnsku | String(Optional) | Example: 0060011831
image_urls | Array(Optional) | Array of image urls
external_ids | String(Optional) | Example: ["B07G22S48Q", "883929635085"]

> The above command returns JSON structured like this:

```json
{
    "manifest": {
        "id": "5cb6dbe14d003d0ea900001d",
        "name": "04-17-2019",
        "supplier_id": "",
        "ship_from_address_id": "59e0d31f07b6204cc8000000",
        "created_at": "2019-04-17T07:55:14.030Z",
        "updated_at": "2019-04-17T07:55:14.030Z",
        "status": "created",
        "last_valid_status": "created",
        "status_message": null,
        "processing": null,
        "number": 444,
        "order_number": null,
        "phase": 1,
        "client_paid": false,
        "seller_fulfilled": true,
        "image_source": "stock",
        "label_prep": "merchant",
        "print_all_fba_labels": false,
        "print_fba_labels": "needed",
        "print_all_item_labels": false,
        "convert_images": null,
        "performing_action": null,
        "sku_prefix": "",
        "auto_location_enabled": false,
        "auto_location_prefix": "",
        "skip_box_content": false,
        "auto_create_shipments": false,
        "auto_print_exp_dates": true,
        "prefill_product_data": true,
        "product_listings_count": 0,
        "item_present_option": "inc_quantity",
        "multiple_matches_pick_strategy": "none",
        "manifest_folder_id": "",
        "processing_company_id": "",
        "marketplace_account_type": "EbayAccount",
        "marketplace_account_id": "5c1902f207b620090a000026",
        "client_id": "59dd22f507b6201961000000",
        "contact_id": "",
        "template_type": "EbayTemplate",
        "template_id": "5c1902f207b620090a00003e",
        "manifest_xls_file_name": null,
        "manifest_xls_content_type": null,
        "manifest_xls_file_size": null,
        "manifest_xls_updated_at": null,
        "manifest_xls_fingerprint": null,
        "version": null,
        "modifier_id": "",
        "_keywords": ["04", "2019", "17"]
    }
}
```
