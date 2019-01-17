---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - Sellerchamp


includes:
  - errors

search: true
---

# Get Orders

> To get your all orders:


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

Get your all order record.
 
`Token: YOUR-TOKEN`

