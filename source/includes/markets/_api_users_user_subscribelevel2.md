## SubscribeLevel2

**Category:** User<br />
**Permissions:** Operator, Trading, Level2MarketData<br />
**Call Type:** Synchronous

Retrieves the latest Level 2 Ticker information and then subscribes the user to Level 2 market data event updates for one specific instrument. Level 2 allows the user to specify the level of market depth information on either side of the bid and ask. The **SubscribeLevel2** call responds with the Level 2 response shown below. The OMS then periodically sends *Level2UpdateEvent* information in the same format as this response until you send the **UnsubscribeLevel2** call.

<aside class="notice"><strong>Note:</strong> <em>Depth</em> in this call is "depth of market," the number of buyers and sellers at greater or lesser prices in the order book for the instrument.</aside>

### Request

```json
{
	"OMSId":  1,
	"InstrumentId": 0
	"Depth":  10 
}
```

>or

```json
{
	"OMSId":  1,
	"Symbol": "BTCUSD"
	"Depth":  10 
}
```

| Key       | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer.** The ID of the Order Management System on which the instrument trades. |
| InstrumentId | **integer.** The ID of the instrument you’re tracking. *Conditionally optional.* |
| Symbol       | **string.** The symbol of the instrument you’re tracking. *Conditionally optional.* |
| Depth        | **integer.** The depth of the order book. The example request returns 10 price levels on each side of the market. |

### Response

```json
{
	"MDUpdateID": 0,
	"Accounts": 0,
	"ActionDateTime": 635872032000000000,
	"ActionType": {
		"Options": [
			"New",
			"Update",
			"Delete"
		]}
	"LastTradePrice": 0,
	"Orders": 0,
	"Price": 0,
	"ProductPairCode": 0,
	"Quantity": 0,
	"Side": 0,
}
```
The response is a single object (for one specific instrument). The *Level2UpdateEvent* sends the same data as an array of events, but is sent by the OMS when trades occur. Typical event information is sent unlabeled. It looks like this:

[{0: 1, 1: 1, 2: 1534865075981, 3: 0, 4: 6415.01, 5: 1, 6: 6399.79, 7: 1, 8: 1.49364749, 9: 0}]



| Key          | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| MDUpdateID (key 0)      | **integer**. Market Data Update ID. This sequential ID identifies the order in which the update was created. |
| Accounts (key 1)       | **integer**. The number of accounts that have orders at this price level. |
| ActionDateTime (key 2)  | **string**. *ActionDateTime* identifies the time and date that the snapshot was taken or the event occurred. |
| ActionType (key 3)      | **string**. L2 information provides price data. This value shows whether this data is new, an update, or a deletion. One of:<br />New<br />Update<br />Delete |
| LastTradePrice (key 4)  | **real**. The price at which the instrument was last traded. |
| Orders (key 5)          | **integer**. The number of orders at this price point. Whether it is a *Buy* or *Sell* order is shown by *Side*, below. |
| Price (key 6)          | **real**. Bid or Ask price for the *Quantity* (see *Quantity* below). |
| ProductPairCode (key 7) | **integer**. *ProductPairCode* is the same number and used for the same purpose as *InstrumentID*. The two are completely equivalent in value. InstrumentId 47 = ProductPairCode 47. |
| Quantity (key 8)        | **real**. Quantity available at a given Bid or Ask price (see *Price* above). |
| Side (key 9)           | **integer**. One of:<br />0 Buy<br />1 Sell<br />2 Short (reserved for future use)<br />3 Unknown (error condition) |


