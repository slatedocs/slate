## UnsubscribeTrades

**Category:** User<br />
**Permissions:** Operator, Trading, Level1MarketData<br />
**Call Type:** Synchronous

Unsubscribes the user from a Trades Market Data Feed

### Request

```json
{
	"OMSId": 1,
	"InstrumentId": 1
}
```

| Key       | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| OMSId        | **integer.** The ID of the Order Management System on which the user has subscribed to a trades market data feed. |
| InstrumentId | **long integer.** The ID of the instrument being tracked by the trades market data feed. |

### Response

```json
{
	"result": true,
	"errormsg": null,
	"errorcode":0,
	"detail": null
}
```

| Key    | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean.** A successful receipt of the unsubscribe request returns *true*; and unsuccessful receipt (an error condition) returns *false*. |
| errormsg  | **string.** A successful receipt of the unsubscribe request returns *null*; the *errormsg* parameter for an unsuccessful request returns one of the following messages:<br />Not Authorized (errorcode 20)<br />Invalid Request (errorcode 100)<br />Operation Failed (errorcode 101)<br />Server Error (errorcode 102)<br />Resource Not Found (errorcode 104) |
| errorcode | **integer.** A successful receipt of the unsubscribe request returns 0. An unsuccessful receipt returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string.** Message text that the system may send. Usually *null*. |


