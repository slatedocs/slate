# Cancelling Orders
## `DELETE /api/orders/{id}`
> [ DELETE /api/orders/{id} ]

```shell
  curl "https://www.sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6"
  -X DELETE
  -u "sendleAPI:42RRTjYz5Z4hZrm8XY3t4Vxt"
  -H "Content-Type: application/json"
```

> 200 Response

```json
  {
    "order_id":"f5233746-71d4-4b05-bf63-56f4abaed5f6",
    "state":"Cancelled",
    "order_url":"https://sendle.com/api/orders/f5233746-71d4-4b05-bf63-56f4abaed5f6",
    "customer_reference":"SupBdayPressie",
    "cancelled_at":"2015-10-15 00:56:51 UTC",
    "cancellation_message":"Cancelled by S6LRX64PV8MABbBbzu6DoBHD during picking up"
  }
```


As long as an order has not been consigned with the courier, an order is cancellable. The value to review is:

| | |
|--:|:--|
**is_cancellable** | If `true`, the order can be cancelled.

If a booking has already been submitted to the courier for pickup, a failure response (422) will be returned. `is_cancellable` is found in the `scheduling` section of the `JSON` along with delivery estimates. For an example of where `is_cancellable` can be seen, check the [View an Order](#view-an-order) section.

<aside class='warning'>After <code>is_cancellable</code> becomes false, only Sendle Support is still be able to cancel the consignment, but the process is completely manual.</aside>
