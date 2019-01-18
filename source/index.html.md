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
            "order_number": "132888510095-1544596974003",
            "order_date": null,
            "create_date": null,
            "modify_date": "2019-01-07T23:02:55.490Z",
            "payment_date": "2019-01-04T00:31:13.000+00:00",
            "order_status": "shipped",
            "customer_username": "Jeff Bean",
            "customer_email": null,
            "shipTo": {
                "name": "Jeff Bean",
                "street1": "562 Wylie Rd SE Ste 4",
                "street2": null,
                "city": "Marietta",
                "state": "GA",
                "postal_code": "30067-7880",
                "country": "US"
            },
            "items": [
                {
                    "order_item_id": "5c33da5a07b6203f81000884",
                    "sku": "S11STJPOHQBI3",
                    "create_date": null,
                    "name": "Nikon 70-200mm f/2.8G ED-IF AF-S VR Zoom Nikkor Lens-needs work",
                    "weight": {
                        "value": null,
                        "units": "ounces"
                    },
                    "modify_date": null,
                    "quantity": 1,
                    "tax_amount": 0,
                    "unit_price": 186,
                    "shipping_amount": 0,
                    "warehouse_location": null,
                    "product_id": "",
                    "fulfillment_sku": "S11STJPOHQBI3"
                }
            ],
            "store_id": "5c1902f207b620090a000026",
            "order_total": 1,
            "amount_paid": 186,
            "customer_notes": null,
            "tag_ids": [],
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
&created_date_start={created_date_start}
&created_date_end={created_date_end}
&updated_date_start={updated_date_start}
&updated_date_end={updated_date_end}
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
  --url 'http://localhost:3000/api/orders?buyer_name={buyer_name}%0A&order_number={order_number}%0A&order_status={order_status}%0A&purchased_at_start={purchased_at_start}%0A&purchased_at_end={purchased_at_start}%0A&store_id={store_id}%0A&sort={sort_by}%0A&direction={sort_direction}%0A&page={page}%0A&page_size={page_size}&created_date_start={created_date_start}%0A&created_date_end={created_date_end}%0A&updated_date_start={updated_date_start}%0A&updated_date_end={updated_date_end}%0A' \
  -H 'token: YOUR-TOKEN' \
```
### URL Parameters

Name | Data Type | Description
-------------- | -------------- | --------------
buyer_name | String | Returns orders that match the specified name. Example: smith.
created_date_start | String | Returns orders that were created after the specified date Example: 2015-01-01 00:00:00.
created_date_end | String | Returns orders that were created before the specified date Example: 2015-01-08 00:00:00.
updated_date_start | String | Returns orders that were modified after the specified date Example: 2015-01-01 00:00:00.
updated_date_end | String | Returns orders that were modified before the specified date Example: 2015-01-08 00:00:00.
order_number | String | Filter by order number, performs a "starts with" search. Example: 12345.
order_status | String | Filter by order status. If left empty, orders of all statuses are returned. Example: shipped
purchased_at_start | String | Returns orders that were paid after the specified date Example: 2015-01-01
purchased_at_end | String | Returns orders that were paid before the specified date Example: 2015-01-08
store_id | Number | Filters orders to a single store. Call List Stores to obtain a list of store Ids. Example: 12345.
sort | String | Sort the responses by a set value. The response will be sorted based off the ascending dates (oldest to most current.) If left empty, the response will be sorted by ascending order_id. Example: Order_date
direction | String | Sets the direction of the sort order. Example: ASC.
page | String | Page number Default: 1.
page_size | number | Requested page size. Default: 250.
