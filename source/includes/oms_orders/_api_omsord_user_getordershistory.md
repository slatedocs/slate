## GetOrdersHistory

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Retrieves an array of multiple orders (hence, **GetOrdersHistory** with plural *Orders*) for the specified account, order ID, user, instrument, or time stamp. The history starts at index *i*, where *i* is an integer identifying a specific order (the most recent order has an index of 0). “Depth” is the count of trades to report backwards from *startIndex*. All values in the call other than *OMSId* are optional.

For example, if *depth* = 200 and *startIndex* = 0, the history returns 200 orders into the past starting with the most recent (0) order. If *depth* = 200 and *startIndex* = 100, the history returns 200 orders into the past starting at 100 orders in the past.

The owner of the trading venue determines how long to retain order history before archiving.

A user with Trading permission can retrieve a history only for accounts with which the user is associated; a user with Operator permission can retrieve a history for any user or account.

<aside class="notice"><strong>Note:</strong> In this call, "Depth" refers to the count of trades to report, not the depth of the order book.</aside>

### Request

```json
{
    "omsId":0,
    "accountId":0,
    "clientOrderId":0,
    "originalOrderId":0,
    "originalClientOrderId":0,
    "userId":0,
    "instrumentId":0,
    "startTimestamp":0,
    "endTimestamp":0,
    "depth":100,
    "startIndex":0
}
```

All values other than *OMSId* are optional. If account ID is not supplied, the Exchange assumes the default account of the user issuing the call.

| Key                   | Value                                                        |
| --------------------- | ------------------------------------------------------------ |
| omsId                 | **Integer**. The ID of the Order Management System on which the orders took place. *Required*. If no other values are specified, the call returns the orders associated with the default account for the logged-in user on this Order Management System. |
| accountId             | **Integer**. The account ID that made the trades. A user with Trading permission must be associated with this account, although other users also can be associated with the account. If no account ID is supplied, the system assumes the default account for the logged-in user. |
| clientOrderId         | **long integer**. A user-assigned ID for the order (like a purchase-order number assigned by a company). *clientOrderId* defaults to 0. |
| originalOrderId       | **long integer**. The original ID of the order. If specified, the call returns changed orders associated with this order ID. |
| originalClientOrderId | **long integer**. If the order has been changed, shows the original client order ID, a value that the client can create (much like a purchase order). |
| userId                | **integer**. The ID of the user whose account orders will be returned. If not specified, the call returns the orders of the logged-in user. |
| instrumentId          | **long integer**. The ID of the instrument named in the order. If not specified, the call returns orders for all instruments traded by this account. |
| startTimestamp        | **long integer**. Date and time at which to begin the orders history, in POSIX format. |
| endTimestamp          | **long integer**. Date and time at which to end the orders report, in POSIX format. |
| depth                 | **integer**. In this case, the count of orders to return, counting from the *StartIndex*. If not specified, returns all orders between *BeginTimeStamp* and *EndTimeStamp*, beginning at *StartIndex* and working backwards. |
| startIndex            | **integer**. The starting index into the order history, from 0 (the most recent trade) and moving backwards in time. If not specified, defaults to 0. |

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

The response returns an array of json objects, each describing an order.

| Key              | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| omsId            | **integer.** The ID of the Order Management System on which the order was placed. |
| side             | **string**. The side of the transaction that this order represents. One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (error condition) |
| orderId          | **long integer**. The ID of this order.                      |
| price            | **real.** The price of the order.                            |
| quantity         | **real**. The quantity of the order.                         |
| displayQuantity  | **real**. The quantity available to buy or sell that is publicly displayed to the market. To display a *displayQuantity* value, an order must be a Limit order with a reserve. |
| instrument       | **integer**. The ID of the instrument being ordered.         |
| account          | **integer**. The ID of the account ordering the instrument.  |
| orderType        | **integer.** A number representing the nature of the order. One of:<br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade |
| clientOrderId    | **long integer**. A user-assigned ID for the order (like a purchase-order number assigned by a company). The value of *clientOrderId* defaults to 0. |
| orderState       | **integer.** A number representing the current state of the order.  One of:<br />0 Unknown<br />1 Working<br />2 Rejected<br />3 Canceled<br />4 Expired<br />5 FullyExecuted |

