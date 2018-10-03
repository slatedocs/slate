## SubscribeTicker

**Category:** User<br />
**Permissions:** Operator, Trading, Level 1MarketData<br />
**Call Type:** Synchronous

Subscribes a user to a Ticker Market Data Feed for a specific instrument and interval. **SubscribeTicker** sends a response object as described below, and then periodically returns a *TickerDataUpdateEvent* that matches the content of the response object.

### Request
```json
{
	"OMSId": 1,
	"InstrumentId": 1,
	"Interval": 60,
	"IncludeLastCount": 100 
}
```

| Key           | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| OMSId            | **integer.** The ID of the Order Management System           |
| InstrumentId     | **long integer.** The ID of the instrument whose information you want to track. |
| Interval         | **integer.** Specifies in seconds how frequently to obtain ticker updates. Default is 60 — one minute. |
| IncludeLastCount | **integer.** The limit of records returned in the ticker history. The default is 100. |

### Response
```json

[
  [1501603632000, \\DateTime - UTC - Milliseconds since 1/1/1970
   2700.33, \\High 
   2701.2687.01, \\Low
   2687.01, \\Open
   2687.01, \\Close
   24.86100992, \\Volume
   0, \\Inside Bid Price
   2870.95, \\Inside Ask Price
   1], \\InstrumentId
  
  [1501604532000,2792.73,2667.95,2687.01,2700.81,242.61340767,0,2871,0]
    ]
```

The response returns an array of objects , each object an unlabeled, comma-delimited array of numbers. The Open price and Close price are those at the beginning of the tick — the Interval time subscribed to in the request. For 24-hour exchanges, the trading day runs from UTC midnight to UTC midnight; highs, lows, opens, closes, and volumes consider that midnight-to-midnight period to be the trading day. The data order is:

- date/time UTC in milliseconds since 1/1/1970
- high
- low
- open
- close
- volume
- inside bid price
- inside ask price
- instrument ID

A typical response might look like this: 
`[[1510719222970.21,6943.51,6890.27,6898.41,6891.16,0,6890.98,6891.98,1,1510718681956.34]],`

