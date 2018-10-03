## GetL2Snapshot

**Category:** User<br />
**Permissions:** Public<br />
**Call Type:** Synchronous

Provides a current Level 2 snapshot of a specific instrument trading on an Order Management System to a user-determined market depth.  The Level 2 snapshot allows the user to specify the level of market depth information on either side of the bid and ask.

<aside class="notice">Depth in this call is "depth of market," the number of buyers and sellers at greater or lesser prices in the order book for the instrument.</aside>

### Request

```json
{
  "OMSId": 1,
  "InstrumentId": 1,
  "Depth": 100 
}
```

| Key       | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer**. The ID of the Order Management System where the instrument is traded. |
| InstrumentId | **integer**. The ID of the instrument that is the subject of the snapshot. |
| Depth        | **integer**. Depth of the market — the number of buyers and sellers at greater or lesser prices in the order book for the instrument. Defaults to 100. |

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
      ]
  "LastTradePrice": 0,
  "Orders": 0,
  "Price": 0,
  "ProductPairCode": 0,
  "Quantity": 0,
  "Side": 0,
}
```
The response is a single object for one specific instrument. The *Level2UpdateEvent* contains the same data, but is sent by the OMS when trades occur. To receive *Level2UpdateEvents*, a user must subscribe to *Level2UpdateEvents*.

| Key          | Value                                                        |
| --------------- | ------------------------------------------------------------ |
| MDUpdateID      | **integer**. Market Data Update ID. This sequential ID identifies the order in which the update was created. |
| Accounts        | **integer**. The number of accounts that have orders at this price level. |
| ActionDateTime  | **string**. *ActionDateTime* identifies the time and date that the snapshot was taken or the event occurred, in POSIX format X 1000 (milliseconds since 1 January 1970). |
| ActionType      | **string**. L2 information provides price data. This value shows whether this data is new, an update, or a deletion. One of: New, Update, Delete |
| LastTradePrice  | **real**. The price at which the instrument was last traded. |
| Orders          | **integer**. The number of orders at this price point. Whether it is a Buy or Sell order is shown by *Side*, below. |
| Price           | **real**. Bid or Ask price for the Quantity (see *Quantity* below). |
| ProductPairCode | **integer**. *ProductPairCode* is the same value and used for the same purpose as *InstrumentID*. The two are completely equivalent. *InstrumentId* 47 = *ProductPairCode* 47. |
| Quantity        | **real**. Quantity available at a given Bid or Ask price (see *Price* above). |
| Side            | **integer**. One of: 0 Buy, 1 Sell, 2 Short (reserved for future use), 3 Unknown (error condition) |

