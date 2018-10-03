## GetOpenTradeReports

**Category:** User<br />
**Permissions:** Operator, Trading, AccountReadOnly<br/>
**Call Type:** Synchronous

Retrieves an array of open trade information for the account named in *AccountId*. 

Users with Trading or AccountReadOnly permission must be associated with the named account; users with Operator permission can retrieve open trade reports on any account.

### Request

```json
{ 
  "OMSId": 1,
  "AccountId": 1
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| OMSId     | **integer.** The ID of the Order Management System on which the account operates. |
| AccountId | **integer.** The ID of the account whose open trade information will be returned. |

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
    },
]
```

The response is an array of open order information. Note the capitalization changes from the request.

| Key             | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| omsId           | **integer.** The ID of the Order Management System on which the account operates. |
| side            | **integer.** A number representing the side of the open trade. One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (an error condition)<br />**TK** is short still unsupported? |
| orderId         | **long integer.** The ID of the open trade.                  |
| price           | **real.** The price of the open trade.                       |
| quantity        | **real.** The quantity traded in the open trade.             |
| displayQuantity | **real.** The quantity available to buy or sell that is publicly displayed to the market. To return a *displayQuantity* value, an order must be a limit order with a reserve. |
| instrument      | **integer.** The ID of the instrument being traded in the open trade. All instruments comprise two products, for example USD and BitCoin. |
| account         | **integer.** The ID of the account to which the open trade belongs. |
| orderType       | **integer.** An integer representing the type of order. One of:<br />0 Unknown (an error condition; all orders should have a type)<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade |
| clientOrderId   | **long integer.** A client-assigned ID for the order (like a purchase-order number). The *clientOrderId* defaults to 0 if not assigned by the client. |
| orderState      | **integer.** A number representing the current condition of the order. One of:<br />0 Working<br />1 Rejected<br />2 Canceled<br />3 Expired<br />4 Fully Executed |


