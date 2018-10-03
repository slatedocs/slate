## GetEarliestTickTime

**Category:** User<br />**Permissions:** Operator, Level1MarketData<br />**Call Type:** Synchronous

Gets the earliest ticker time of the trading day.

Users with Level1MarketData permission can obtain the earliest tick time only for an instrument they have permission to trade; users with Operator permission can get earliest tick time for any instrument.

### Request

```json
{
    "InstrumentId": 1,
    "OMSId": 1
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| InstrumentId | **integer.** The ID of an instrument on the Order Management System for which the earliest ticker time is being requested. |
| OMSId        | **integer** The ID of the Order Management System that will return the earliest ticker time of the day. |

### Response

```json
[
    1501603632000 \\DateTime - UTC - Milliseconds since 1/1/1970 
]
```

Despite the array, the response returns a single value.

| Key           | Value                                                        |
| ------------- | ------------------------------------------------------------ |
| 1501603632000 | **long integer** Time of the earliest ticker tick, in POSIX format. |


