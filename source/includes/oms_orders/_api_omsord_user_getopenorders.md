## GetOpenOrders

**Category:** User<br />
**Permissions:** Operator, Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Returns an array of 0 or more orders that have not yet been filled (open orders) for a single account on a specific Order Management System. The call returns an empty array if an account has no open orders.

A user with Trading or AccountReadOnly permission must be associated with the account named by AccountId; a user with Operator permissoin can get open orders for any account.

### Request

```json
{
  "OMSId": 1
  "AccountId":4,
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OMSId     | **integer.** The ID of the Order Management System to which the user belongs. A user will belong only to one OMS. |
| AccountId | **integer.** The ID of the authenticated user’s account.     |

### Response

```json
[
    {"omsId":0,
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
    },
]
```

The call **GetOpenOrders** returns an array containing both buy-side and a sell-side open orders for the named account. The call returns an empty array if there are no open orders for the account.

| Key                               | Value                                                        |
| --------------------------------- | ------------------------------------------------------------ |
| omsId                             | **integer.** The ID of the Order Management System where the open orders have been placed. |
| side                              | **integer.** A number describing the open order. <br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (error condition) |
| orderId                           | **long integer.** The ID of the open order. The *OrderID* is unique in each Order Management System. |
| price                             | **real.** The price at which the buy or sell has been ordered. |
| quantity                          | **real.** The quantity to be bought or sold in the order.    |
| displayQuantity                   | **real.** The quantity available to buy or sell that is publicly displayed to the market. To display a *displayQuantity* value, an order must be a Limit order with a reserve. |
| instrument                        | **integer.** ID of the instrument being traded. See **GetInstruments** can supply the instrument IDs that are available. |
| account                           | **integer.** The ID of the account that placed the order.    |
| orderType                         | **integer.** An integer describing the type of order this is. One of:<br />0 Unknown (an error condition)<br />1 Market order<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade |
| clientOrderId                     | **long integer.** A user-assigned ID for the order (like a purchase-order number assigned by a company). *clientOrderId* defaults to 0. |
| orderState                        | **integer.** A number describing the current condition of the order. There are six order states:<br />0 Unknown (an error condition)<br />1 Working<br />2 Rejected<br />3 Canceled<br />4 Expired<br />5 FullyExecuted |

