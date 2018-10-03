## GetLevel1

**Category:** User<br />
**Permissions:** GetLevel1, Trading<br />
**Call Type:** Synchronous

Provides a current Level 1 snapshot (best bid, best offer) of a specific instrument trading on an Order Management System.  The Level 1 snapshot does not allow the user to specify the level of market depth information on either side of the bid and ask.

### Request

```json
{
  "OMSId":1,
  "InstrumentId":1
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer.** The ID of the OMS on which the snapshot will be taken. |
| InstrumentId | **integer.** The ID of the instrument whose Level 1 market snapshot will be taken. |

### Response

> *productPairCode* is the same as *InstrumentId*. The two are synonymous and refer to the same object.

```json
{
  "exchangeId": 0,
  "productPairCode": 0,
  "bestBid": 0.0,
  "bestOffer": 0.0,
  "volume": 0.0,
  "lastTradedPx": 0.0,
  "lastTradedVolume": 0.0,
  "lastTradeTime": 0,
  "timeStamp": 0,
  "bidQty": 0.0,
  "askQty": 0.0,
  "bidOrderCt": 0,
  "askOrderCt": 0,
  "sessionOpen": 0.0,
  "sessionHigh": 0.0,
  "sessionLow": 0.0,
  "sessionClose": 0.0,
  "currentDayVolume": 0.0,
  "currentDayNumTrades": 0.0,
  "currentDayPxChange": 0.0,
  "rolling24HrVolume": 0.0,
  "rolling24NumTrades": 0.0,
  "rolling24HrPxChange": 0.0,
  "rolling24HrPxChangePercent": 0.0
} 
```

| Key                        | Value                                                        |
| -------------------------- | ------------------------------------------------------------ |
| exchangeId                 | **integer.** The ID of the exchange whose snapshot was taken. |
| productPairCode            | **integer.** The ID of the instrument (the product pair) whose prices, bids, asks, and volumes are being reported. |
| bestBid                    | **real.** The current best bid for the instrument (product pair). |
| bestOffer                  | **real.** The current best offer for the instrument (product pair). |
| volume                     | **real.** The unit volume of the instrument traded, either during a true session (with a market open and close), or in 24-hour markets, it is the period from UTC Midnight to UTC Midnight, regardless of the nominal location of the market. |
| lastTradedPX               | **real.** The last-traded price for the instrument.          |
| lastTradedVolume           | **real.** The last quantity that was traded. |
| lastTradeTime              | **real.** The last time that the instrument was traded.      |
| timeStamp                  | **real.** The date and time of this snapshot.                |
| bidQty                     | **real.** The quantity currently being bid.                  |
| askQty                     | **real.** The quantity currently being asked.                |
| bidOrderCt                 | **integer.** The count of bid orders.                        |
| askOrderCt                 | **integer.** The count of ask orders.                        |
| sessionOpen                | **real.** Opening price. In markets with openings and closings, this is the opening price for the current session; in 24-hour markets, it is the price as of UTC Midnight beginning the current day. |
| sessionHigh                | **real.** Highest price during the trading day, either during a true session (openings and closings) or UTC Midnight to UTC Midnight. |
| sessionLow                 | **real.** Lowest price during the trading day, either during a true session (openings and closings) or UTC Midnight to UTC Midnight. |
| sessionClose               | **real.** The closing price. In markets that open and close, this is the closing price for the current or most recent session; for 24-hour markets, it is the price as of the most recent UTC Midnight. |
| currentDayVolume           | **real.** The unit volume of the instrument that is the subject of the snapshot, either during a true session (openings and closings) or in 24-hour markets, during the period UTC Midnight to UTC Midnight. |
| currentDayNumTrades        | **integer.** The number of trades during the current day, either during a true session (openings and closings) or in a 24-hour market the period from UTC Midnight to UTC Midnight. |
| currentDayPxChange         | **real.** Change in price over the current session or from UTC Midnight to UTC Midnight. |
| rolling24HrVolume          | **real.** Unit volume of the instrument over the past 24 hours, regardless of time zone. This value recalculates continuously. |
| rolling24HrNumTrades       | **real.** Number of trades during the past 24 hours, regardless of time zone. This value recalculates continuously. |
| rolling24HrPxChange        | **real.** Price change during the past 24 hours, regardless of time zone. This value recalculates continuously. |
| rolling24HrPxChangePercent | **real.** Percent change in price during the past 24 hours.  |


