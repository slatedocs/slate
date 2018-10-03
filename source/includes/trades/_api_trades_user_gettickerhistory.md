## GetTickerHistory

**Category:** User<br />
**Permissions:** Public<br />
**Call Type:** Synchronous

Requests a ticker history (high, low, open, close, volume, bid, ask, ID) of a specific instrument from a given date to the present. You will need to format the returned data per your requirements.

Because permission is Public, any user can retrieve the ticker history for any instrument on the OMS.

### Request

```json
{
	"InstrumentId": 1,
	"FromDate": // POSIX-format date and time
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| InstrumentId | **long integer.** The ID of a specific instrument. The current Order Management System is assumed. |
| FromDate     | **long integer.** Oldest date from which the ticker history will start, in POSIX format. The report moves toward the present from this point. |

### Response

> The response is an array of arrays of comma-separated, but unlabeled, numbers. This sample shows comments applied to identify the data being returned (comments are not part of the response):

```json
[
  [
    1501603632000, \\DateTime - UTC - Milliseconds since 1/1/1970 - POSIX format
    2700.33, \\High
    2687.01, \\Low
    2687.01, \\Open
    2687.01, \\Close
    24.86100992,  \\Volume
    0,  \\Inside Bid Price
    2870.95,  \\Inside Ask Price
    1 \\InstrumentId
  ],
  [1501604532000,2792.73,2667.95,2687.01,2700.81,242.61340767,0,2871,0],
]
```

The response returns an array of arrays dating from the *FromDate* value of the request. The data are returned oldest-date first. The data returned in the arrays are not labeled.


