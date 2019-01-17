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
```

> The above command returns JSON structured like this:

```json
{
    "orders": [
        {
            "order_number": "",
            "order_date": null,
            "create_date": null,
            "modify_date": "2019-01-07T23:02:55.533Z",
            "payment_date": "2018-12-14T00:10:56.000+00:00",
            "order_status": "shipped",
            "customer_username": "ellis driver",
            "customer_email": null,
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
                    "order_item_id": {
                        "$oid": ""
                    },
                    "sku": "",
                    "create_date": null,
                    "name": "",
                    "weight": {
                        "value": null,
                        "units": "ounces"
                    },
                    "modify_date": null,
                    "quantity": 1,
                    "tax_amount": 0,
                    "unit_price": 0.0,
                    "shipping_amount": 0,
                    "warehouse_location": null,
                    "product_id": null,
                    "fulfillment_sku": ""
                }
            ],
            "store_id": {
                "$oid": ""
            },
            "order_total": 1,
            "amount_paid": 0.0,
            "customer_notes": null,
            "tag_ids": [],
            "externally_fulfilled": false,
            "externally_fulfilled_by": null
        }
    ]
}
```
 

> Make sure to replace `YOUR-TOKEN` with your API key token.

Returns back all the orders for the client object associated with the specified API Token.  Default page size is 250.
 
`Token: YOUR-TOKEN`

## Get All Orders with parameters

Returns back a list of orders that match the specified criteria. All of the available filters are optional. They do not need to be included in the URL. If you do include them, here's what the URL may look like:

TODO FOR MAYANK

URL format with filters:

TODO FOR MAYANK

MAYANK LOOK AT THIS LINK FOR REFERENCE: Look at https://shipstation.docs.apiary.io/#reference/orders/hold-order-until/list-orders-with-parameters for reference
