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
  http://staging.sellerchamp.com/api/orders \
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
            "shipTo": {
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
  --url 'http://localhost:3000/api/orders?buyer_name={buyer_name}%0A&order_number={order_number}%0A&order_status={order_status}%0A&purchased_at_start={purchased_at_start}%0A&purchased_at_end={purchased_at_start}%0A&store_id={store_id}%0A&sort={sort_by}%0A&direction={sort_direction}%0A&page={page}%0A&page_size={page_size}&created_at_start={created_at_start}%0A&created_at_end={created_at_end}%0A&updated_at_start={updated_at_start}%0A&updated_at_end={updated_at_end}%0A' \
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
