## GetOrderHistoryByOrderId

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Retrieves the full order history of a specific order by its order ID, including any changes.

A user with Trading permission can retrieve an order history only for the user's accounts and instruments; a user with Operator permission can retrieve all accounts and instruments.

### Request

```json
{
  "omsId":0,
  "orderId":0
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| omsId        | **integer.** The ID of the Order Management System where the account's order history resides. |
| orderId      | **long integer.** The ID of the of the order whose history you want to return. |

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
The response is an array of changes to and partial completions of an order.

| Key             | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| omsId           | **integer.** The ID of the Order Management System handling the order. |
| side            | **integer.** A number that represents the side of the transaction associated with the account and the order. One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (an error condition) |
| price           | **real.** The unit price of the order. For example, in an order for 3 BitCoin at $6000 USD each, the price is $6000, not $18,000. |
| quantity        | **real.** The unit number of items in the order. For example, in an order for 3 BitCoin at $6000 each, quantity would be 3.0. |
| displayQuantity | **real.** The quantity available to buy or sell that is publicly displayed to the market. To display a *displayQuantity* value, and order must be a Limit order with a reserve. |
| instrument      | **integer.** The ID of the instrument being traded in the order. |
| account         | **integer.** The ID of the account to which the order belongs. |
| orderType       | **integer.** A number representing the nature of the order. One of:<br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade |
| clientOrderId   | **long integer.** A user-assigned ID for the order (like a purchase order number assigned by the client). The value of *clientOrderId* defaults to 0. |
| orderState      | **integer.** A number representing the current state of the order in the market. One of:<br />0 Unknown<br />1 Working<br />2 Rejected<br />3 Canceled<br />4 Expired<br />5 FullyExecuted |


