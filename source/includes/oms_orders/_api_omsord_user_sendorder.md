## SendOrder

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Asynchronous

Creates an order. 

Anyone submitting an order should also subscribe to the various market data and event feeds, or call **GeOpenOrders** or **GetOrderStatus** to monitor the status of the order. If the order is not in a state to be executed, **GetOpenOrders** will not return it.

A user with Trading permission can create an order only for those accounts and instruments with which the user is associated; a user with Operator permissions can create an order for any account and instrument.

<aside class="notice"><strong>Note:</strong> Call Type is asynchronous.</aside>

### Request

```json
 {
     "InstrumentId": 1,
     "OMSId": 1,
     "AccountId": 1,
     "TimeInForce": 1,
     "ClientOrderId": 1,
     "OrderIdOCO": 0,
     "TimeInOrder":0,
     "UseDisplayQuantity":false,
     "Side": 0,
     "quantity": 1,
     "OrderType": 2,
     "PegPriceType": 3,
     "LimitPrice": 8800
 }
```

| Key                | Value                                                        |
| ------------------ | ------------------------------------------------------------ |
| InstrumentId       | **integer.** The ID of the instrument being traded.          |
| OMSId              | **integer.** The ID of the Order Management System where the instrument is being traded. |
| AccountId          | **integer.** The ID of the account placing the order.        |
| TimeInForce        | **integer.** An integer that represents the period during which the new order is executable. One of:<br />0 Unknown (error condition)<br />1 GTC (good 'til canceled, the default)<br />2 OPG (execute as close to opening price as possible)<br />3 IOC (immediate or canceled)<br />4 FOK (fill-or-kill &mdash; fill immediately or kill immediately)<br />5 GTX (good 'til executed)<br />6 GTD (good 'til date) |
| ClientOrderId      | **long integer.** A user-assigned ID for the order (like a purchase-order number assigned by a company). This ID is useful for recognizing future states related to this order. *ClientOrderId* defaults to 0. |
| OrderIdOCO         | **long integer.** The order ID if One Cancels the Other — If this order is order A, *OrderIdOCO* refers to the order ID of an order B (which is *not* the order being created by this call). If order B executes, then order A created by this call is canceled. You can also set up order B to watch order A in the same way, but that may require an update to order B to make it watch this one, which could have implications for priority in the order book. See **CancelReplaceOrder** and **ModifyOrder.** |
| UseDisplayQuantity | **Boolean.** If you enter a Limit order with a reserve, you must set *UseDisplayQuantity* to *true*. |
| Side               | **integer.** A number representing on of the following potential sides of a trade. One of:<br />0 Buy<br />1 Sell<br />2 Short<br />3 unknown (an error condition) |
| Quantity           | **real.** The quantity of the instrument being ordered.      |
| OrderType          | **integer.** A number representing the nature of the order. One of:<br />0 Unknown<br />1 Market<br />2 Limit<br />3 StopMarket<br />4 StopLimit<br />5 TrailingStopMarket<br />6 TrailingStopLimit<br />7 BlockTrade. |
| PegPriceType       | **integer.** When entering a stop/trailing order, set *PegPriceType* to an integer that corresponds to the type of price that pegs the stop:<br />1 Last<br />2 Bid<br />3 Ask<br />4 Midpoint |
| LimitPrice         | **real.** The price at which to execute the order, if the order is a Limit order. |

### Response

```json
{
  "status":"Accepted",
  "errormsg":"",
  "OrderId": 123 // Server order id
}
```

| Key      | Value                                                        |
| -------- | ------------------------------------------------------------ |
| status   | **string**. If the order is accepted by the system, it returns "Accepted," if not it returns "Rejected."<br />Accepted<br />Rejected |
| errormsg | **string**. Any error message the server returns.            |
| OrderId  | **long integer**. The ID assigned to the order by the server. This allows you to track the order. |


