## The Ordering flow

> 1 . Create the Order
`POST /orders`

```json
{
  "order": {
    "company_id": 123,
    "shipping_address_id": 1001,
    "billing_address_id": 1001,
    "status": "active",
    "issued_at": "21-02-2014",
    "order_line_items": [
      { "variant_id": 14, "quantity": 1 }
      { "variant_id": 15, "quantity": 2 }
    ]
  }
}
```

2 . Invoice the order
`POST /orders/[:order_id]/actions/invoice`

3 . Pay the order
`POST /orders/[:order_id]/actions/pay`

4 . Create a Package for Shipping
`POST /orders/[:order_id]/actions/pack`

5 . Ship the package
`POST /orders/[:order_id]/actions/fulfil`

TradeGecko will automatically manage the Order's fulfillment, invoice, payment and packed statuses
throughout the process
