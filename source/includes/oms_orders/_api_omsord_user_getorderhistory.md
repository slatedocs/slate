## GetOrderHistory

**Category:** User<br />
**Permissions:** Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Returns a complete list of all orders, both open and executed, for a specific account on the specified Order Management System. The account named in the request must be associated with the calling user.

### Request

```json
{
  "OMSId":  1,
  "AccountId":  1 
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OMSId     | **integer**. The ID of the Order Management System where the orders were placed. |
| AccountId | **integer**. The ID of the account whose orders will be returned |

### Response

```json
[
  {
    "omsId":0,
    "side":0,
    "orderId":0,
    "price":0.0,
    "quantity":0.0,
    "displayQuantity":0.0,
    "instrument":0,
    "account":0,
    "orderType":0,
    "clientOrderId":0,
    "orderState":0
  }
]
```

The response returns an array of 1 or more json objects.

| String           | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| omsId            | **integer.** The ID of the Order Management System from which the order history is returned. |
| side             | **integer.** The side of the order. One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (error condition). |
| orderId          | **long integer**. The ID of this order.                      |
| price            | **real**. Price of the order.                                |
| quantity         | **real**. Quantity of the order.                             |
| displayQuantity  | **real**. The quantity available to buy or sell that is publicly displayed to the market. To display a *displayQuantity* value, an order must be a Limit order with a reserve. |
| instrument       | **integer**. The ID of the instrument being ordered.         |
| account          | **integer**. The ID of the account ordering the instrument.  |
| orderType        | **integer.** Type of order. One of:<br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade<br /> |
| clientOrderId    | **long integer**. A user-assigned ID for the order (like a purchase-order number assigned by a company). *clientOrderId* defaults to 0. |
| orderState       | **integer.**  One of:<br />0 Unknown<br />1 Working<br />2 Rejected<br />3 Canceled<br />4 Expired<br />5 FullyExecuted |



