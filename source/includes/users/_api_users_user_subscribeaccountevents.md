## SubscribeAccountEvents
**Category:** User<br />
**Permissions:** Operator, Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Subscribes the user to notifications about the status of account-level events: orders, trades, position updates, deposits, and withdrawals for a specific account on the Order Management System (OMS). The subscription reports all events associated with a given account; there is no filter at the call level to subscribe to some events and not others.

Account event information is supplied in comma-separated-value (CSV) format. For specific CSV formatting information, see the APEX Extract CSV Data Dictionary, available from Cubobit.

### Request

```json
{
  "AccountId":  1,
  "OMSId":  1 
}
```

| Key    | Value                                                        |
| --------- | ------------------------------------------------------------ |
| AccountId | **integer**. The ID of the account for the logged-in user.   |
| OMSId     | **integer**. The ID of the Order Management System to which the account belongs. |

### Response

```json
{
  "Subscribe":  true 
}
```


| Key    | Value                                                        |
| --------- | ------------------------------------------------------------ |
| Subscribe | **Boolean**. A successful subscription returns *true*; otherwise, *false*. |

### The Events

When you call **SubscribeAccountEvents**, you subscribe to all of the following list of events. The Order Management System may supply them at irregular intervals and in any order; software must listen for these events. The system sends each of these events in a message frame.

### AccountPositionEvent

>**AccountPositionEvent** The balance in your account changes.

```json
{
	"OMSId":4, //The OMSId. [Integer]
	"AccountId":4, // account id number. [Integer]
	"ProductSymbol":"BTC", //The Product Symbol for this balance message. [String]
	"ProductId":1, //The Product Id for this balance message. [Integer]
	"Amount":10499.1,  //The total balance in the account for the specified product. [Dec]
	"Hold": 2.1,  //The total amount of the balance that is on hold. Your available 						 //balance for trading and withdraw is (Amount - Hold). [Decimal]
	"PendingDeposits":0, //Total Deposits Pending for the specified product. [Decimal]
	"PendingWithdraws":0, //Total Withdrawals Pending for the specified product. [Decimal]
	"TotalDayDeposits":0, //The total 24-hour deposits for the specified product. UTC. [Dec]
	"TotalDayWithdraws":0 //The total 24-hour withdraws for the specified product. UTC [Dec]
}
```
**Trigger:** The balance in your account changes.

### CancelAllOrdersRejectEvent

>**CancelAllOrdersRejectEvent** All orders for your account are rejected.

```json
{
	"OMSId": 1, // OMS ID [Integer]
	"AccountId": 4, // ID of the account being tracked [Integer]
	"InstrumentId": 0, // ID of the instrument in the order [Long Integer]
	"Status": "Rejected", // Accepted/Rejected [String]
	"RejectReason": "Instrument not found." // Reason for rejection [String]
}
```
**Trigger:** All orders for your account are rejected.

### CancelOrderRejectEvent

>**CancelOrderRejectEvent** Your order is canceled.

```json
{
	"OMSId": 1, //OMS Id [Integer] Always 1
	"AccountId": 4, //Your Account ID. [Integer]
	"OrderId": 1, //The Order ID from your Cancel request. [64 Bit Integer]
	"OrderRevision": 0,	//The Revision of the Order, if any was found. [64 Bit Integer]
	"OrderType": "Unknown", // See "Order Types" in Introduction
	"InstrumentId": 1,	// The InstrumentId from your Cancel request. [Integer]
	"Status": "Rejected", //Always "Rejected" [String]
	"RejectReason": "Order Not Found" //A message describing the reason for the rejection. 			// [String]
}
```

**Trigger:** Your order is canceled.

### CancelReplaceOrderRejectEvent

>**CancelReplaceOrderRejectEvent** Your order is rejected even if a cancel-replace order was placed.

```json
{
	"OMSId": 1, // ID of the OMS [integer]
	"AccountId": 4, // ID of the account [integer]
	"OrderId": 9342, // The ID of the rejected order [integer]
	"ClientOrderId": 1234, // The client-supplied order ID [long integer]
	"LimitPrice": 99.1, // The limit price of the order.
	"OrderIdOCO": 0, // The ID of the other ordre to cancel if this is executed.
	"OrderType": "Limit", // See "Order Types" in Introduction.
	"PegPriceType": "Bid", // Where to peg the stop/trailing order.
	"OrderIdToReplace": 9333, // The ID of the order being cancelled and replaced.
	"InstrumentId": 1, // ID of the instrument traded in the order.
	"ReferencePrice": 99.1, // used internally.
	"Quantity": 1.0, // Quantity of the replacement order
	"Side": "Buy", // Side of the order: Buy, Sell, Short (future)
	"StopPrice":0, // The price at which to execute the new order.
	"TimeInForce":"GTC", // Period when new order can be executed.
	"Status":"Rejected", // Status of the order – always "rejected"
	"RejectReason":"Order Not Found" // Reason the order was rejected.
}
```

**Trigger:** Your order is rejected even if a cancel-replace order was placed.

### MarketStateUpdate

>**MarketStateUpdate** The market state is altered administratively.

```json
{
	"ExchangeId":1, // Exchange Id [Integer]
	"VenueAdapterId":1,  // Internal [Integer]
	"VenueInstrumentId":1, // Instrument Id on a specific venue [Integer]
	"Action":"ReOpen",
		// Market State Action [String] Values are 
		// "Pause", "Resume", "Halt", "ReOpen"
	"PreviousStatus":"Stopped", 
		// Previous Market Status for Instrument [String] Values are
		// "Running", "Paused", "Stopped", "Starting"
	"NewStatus":"Running",
		// Market Status for Instrument [String] Values are 
		// "Running", "Paused", "Stopped", "Starting"
	"ExchangeDateTime":"2016-04-21T21:48:22Z"
		// ISO 8601 format UTC time zone
}
```

**Trigger:** The market state is altered administratively.

### NewOrderRejectEvent

>**NewOrderRejectEvent** An order associated with your account is rejected.

```json
{
	"OMSId": 1, //OMS Id [Integer] Always 1
	"AccountId": 4, //Your Account Id [Integer]
	"ClientOrderId": 1234, //Your Client Order Id [64 Bit Integer]
	"Status": "Rejected", //Always "Rejected"
	"RejectReason": "No More Market" //A message describing the reason for the reject.
}
```

**Trigger:** An order associated with your account is rejected.


### OrderStateEvent

>**OrderStateEvent** The status changes for an order associated with your account.

```json
{
	"Side":"Sell",
		// The side of your order. [String] Values are "Sell", 
		// "Buy", "Short"
	"OrderId": 9849, //The Server-Assigned Order Id. [64-bit Integer]
	"Price": 97, //The Price of your order. [Decimal]
	"Quantity":1,
		// The Quantity (Remaining if partially or fully executed) of 
		// your order. [Decimal]
	"Instrument":1, // The InstrumentId your order is for. [Integer]
	"Account":4, // Your AccountId [Integer]
	"OrderType":"Limit",
		// The type of order. [String] Values are "Market", "Limit",
		// "StopMarket", "StopLimit", "TrailingStopMarket", and
		// "TrailingStopLimit"
	"ClientOrderId":0, // Your client order id. [64-bit Integer]
	"OrderState":"Working", // The current state of the order. [String]
			// Values are "Working", "Rejected", "FullyExecuted", "Canceled",
			// "Expired"
	"ReceiveTime":0, // Timestamp in POSIX format
	"OrigQuantity":1, // The original quantity of your order. [Decimal]
	"QuantityExecuted":0, // The total executed quantity. [Decimal]
	"AvgPrice":0, // Avergage executed price. [Decimal]
	"ChangeReason":"NewInputAccepted"
		// The reason for the order state change. [String] Values are 
		// "NewInputAccepted", "NewInputRejected", "OtherRejected",
		// "Expired", "Trade", SystemCanceled BelowMinimum", 
		// "SystemCanceled NoMoreMarket", "UserModified"
}
```

**Trigger:** The status changes for an order associated with your account.


### OrderTradeEvent

>**OrderTradeEvent** An order associated with your account results in a trade.

```json
{
	"OMSId":1, //OMS Id [Integer]
	"TradeId":213, //Trade Id [64-bit Integer]
	"OrderId":9848, //Order Id [64-bit Integer]
	"AccountId":4, //Your Account Id [Integer]
	"ClientOrderId":0, //Your client order id. [64-bit Integer]
	"InstrumentId":1, //Instrument Id [Integer]
	"Side":"Buy", //[String] Values are "Buy", "Sell", "Short" (future)
	"Quantity":0.01, //Quantity [Decimal]
	"Price":95,  //Price [Decimal]
	"Value":0.95,  //Value [Decimal]
	"TradeTime":635978008210426109,	// TimeStamp in Microsoft ticks format
	"ContraAcctId":3,
		// The Counterparty of the trade. The counterparty is always 
		// the clearing account. [Integer]
	"OrderTradeRevision":1, //Usually 1 
	"Direction":"NoChange" //"Uptick", "Downtick", "NoChange"
}
```

**Trigger:** An order associated with your account results in a trade.

### PendingDepositUpdate

>**PendingDepositUpdate** Deposit pending on your account.

```json
{
	"AccountId": 4, // Your account id number. [Integer]
	"AssetId": 1, // The ProductId of the pending deposit. [Integer]
	"TotalPendingDepositValue": 0.01 //The value of the pending deposit. [Decimal]
	"Requires2FA": false,
	"TwoFAType": "",
	"TwoFAToken": "",
}
```

**Trigger:** Deposit pending on your account.


