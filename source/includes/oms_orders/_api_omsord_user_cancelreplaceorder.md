## CancelReplaceOrder

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

**CancelReplaceOrder** is a single API call that both cancels an existing order and replaces it with a new order. Canceling one order and replacing it with another also cancels the order’s priority in the order book. You can use **ModifyOrder** to preserve priority in the book; but **ModifyOrder** only allows a reduction in order quantity.

<aside class="warning"><strong>Warning:</strong> <strong>CancelReplaceOrder</strong> sacrifices the order's priority in the order book.</aside>

### Request

```json
{
    "omsId":0,
    "orderIdToReplace":0,
    "clientOrdId":0,
    "orderType":0,
    "side":0,
    "accountId":0,
    "instrumentId":0,
    "useDisplayQuantity":false,
    "displayQuantity":0.0,
    "limitPrice":0.0,
    "stopPrice":0.0,
    "referencePrice":0.0,
    "pegPriceType":0,
    "timeInForce":0,
    "orderIdOCO":0,
    "quantity":0.0
}
```

| Key                | Value                                                        |
| ------------------ | ------------------------------------------------------------ |
| omsId              | **integer**. The ID of the Order Management System on which the order is being canceled and replaced by another order. |
| orderIdToReplace   | **long integer**. The ID of the order to replace with this order. |
| clientOrderId      | **long integer**. A user-assigned ID for the new, replacement order (like a purchase-order number assigned by a company). This ID is useful for recognizing future states related to this order. If unspecified, *ClientOrderId* defaults to 0. |
| orderType          | **integer.** An integer representing the type of the replacement order: <br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade |
| side               | **integer.** An integer representing the side of the replacement order:<br />0 Buy<br />1 Sell<br />2 Short<br />3 Unknown (error condition) |
| accountId          | **integer**. The ID of the account under which the original order was placed and the new order will be placed. |
| instrumentId       | **integer**. The ID of the instrument being traded.          |
| useDisplayQuantity | **Boolean.** The display quantity is the quantity of a product shown to the market to buy or sell. A larger quantity may be wanted or available, but it may disadvantageous to display it when buying or selling. The display quantity is set when placing an order (using **SendOrder** or **CancelReplaceOrder** for instance). If you enter a Limit order with reserve, you must set *useDisplayQuantity* to *true*. |
| displayQuantity    | **real.** The quantity of a product that is available to buy or sell that is publicly displayed to the market. |
| limitPrice         | **real.** The price at which to execute the new order, if the new order is a limit order. |
| stopPrice          | **real.** The price at which to execute the new order, if the order is a stop order. |
| referencePrice     | **real.** The reference price of the instrument in the order. |
| pegPriceType       | **integer.** An integer that represents the type of price you set in  a stop/trailing order to "peg the stop."<br />0 Unknown (error condition)<br />1 Last<br />2 Bid<br />3 Ask<br />4 Midpoint |
| timeInForce        | **integer.** An integer that represents the period during which the new order is executable. One of:<br />0 Unknown (error condition)<br />1 GTC (good 'til canceled, the default)<br />2 OPG (execute as close to opening price as possible)<br />3 IOC (immediate or canceled)<br />4 FOK (fill or kill &mdash; fill the order immediately, or cancel it immediately)<br />5 GTX (good 'til executed)<br />6 GTD (good 'til date) |
| orderIdOCO         | **integer.** One Cancels the Other — If the order being canceled in this call is order A, and the order replacing order A in this call is order B, then *OrderIdOCO* refers to an order C that is currently open. If order C executes, then order B is canceled. You can also set up order C to watch order B in this way, but that will require an update to order C. |
| quantity           | **real.** The amount of the order (either buy or sell).      |

### Response

```json
{
  "replacementOrderId": 1234,
  "replacementClOrdId": 1561,
  "origOrderId": 5678,
  "origClOrdId": 91011,
}
```

The response returns the new replacement order ID and echoes back any replacement client ID you have supplied, along with the original order ID and the original client order ID.

| Key                | Value                                                        |
| ------------------ | ------------------------------------------------------------ |
| replacementOrderId | **integer.** The order ID assigned to the replacement order by the server. |
| replacementClOrdId | **long integer.** Echoes the contents of the *clientOrderId* value from the request. |
| origOrderId        | **integer.** Echoes *orderIdToReplace*, which is the original order you are replacing. |
| origClOrdId        | **long integer.** Provides the client order ID of the original order (not specified in the requesting call). |


