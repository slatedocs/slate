# Protobuf

## Protobuf Overview

Overview

## JSON BOClientLogon

### BOClientLogon -- Client Sending

```json
{
  "msg1": "H",
  "LogonType": 1,
  "Account": 100700,
  "UserName": "BOU7",
  "TradingSessionID": 506,
  "SendingTime": 18343447,
  "MsgSeqID": 110434,
  "Key": 123456,
  "RiskMaster": "N"
}
```

> AES response

```json
{
  "msg1": "H",
  "LogonType": 1,
  "Account": 100700,
  "UserName": "BOU7",
  "TradingSessionID": 506,
  "SendingTime": 1624785162815971526,
  "MsgSeqID": 110434,
  "Key": 123456,
  "LoginStatus": 1,
  "RejectReason": 50,
  "RiskMaster": "N"
}
```

> OES response

```json
{
  "msg1": "H",
  "LogonType": 1,
  "Account": 100700,
  "UserName": "BOU7",
  "TradingSessionID": 506,
  "SendingTime": 1624785162815971526,
  "MsgSeqID": 110434,
  "Key": 123456,
  "LoginStatus": 1,
  "RejectReason": 50,
  "RiskMaster": "N"
}
```

```proto
message Bit24ClientLogon {
  string msg1 = 1;
  string msg2 = 2;
  int32 MsgLen = 3;
  int32 LogonType = 4;
  int32 Account = 5;
  string UserName = 6;
  int32 TradingSessionID = 7;
  string PrimaryOrderEntryIP = 8;
  string SecondaryOrderEntryIP = 9;
  string PrimaryMarketDataIP = 10;
  string SecondaryMarketDataIP = 11;
  uint64 SendingTime = 12;
  int64 MsgSeqID = 13;
  int32 Key = 14;
  int32 LoginStatus = 15;
  int32 RejectReason = 16;
  string RiskMaster = 17;
}
```

1. The BOClientLogon message must be sent to the AES in order to initiate the logon process \(please contact BO Representative for IP address and port\).
2. Please refer to the BOClientLogon with logon status and if logon was successful the IP Address and Port of the OES \(Order Entry Server\).
3. The AES will respond with a BOClientLogon with logon status and if logon was successful the IP Address and Port of the OES \(Order Entry Server\).
4. Only one login session is permited for a unique account ID and UserName.
5. Black Ocean requests that if they user is going to close the connection a BOClientLogon message should be sent with the LogonType set to 2 prior to closing the connection in order to allow the OES to close the connection gracefully.
6. BOClientLogon Example Message - Client Sending

| Field Name           | Data Type | Data Length | Required Field | Required Value | Example Value |   Notes   |
| :------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :-------: |
| **Msg1**             |   char    |      1      |       X        |       H        |       H       |  Header   |
| **LogonType**        |   short   |      2      |       X        |                |       1       |   Note1   |
| **Account**          |    Int    |      4      |       X        |                |    253336     |   Note2   |
| **2FA**              | char\[\]  |      6      |       X        |                |     1F6A      |   Note4   |
| **UserName**         | char\[\]  |      6      |       X        |                |     BOU1      |   Note2   |
| **TradingSessionID** |    Int    |      4      |       \*       |                |               |   Note2   |
| **PrimaryOESIP**     | char\[\]  |     24      |       \*       |                |               |   Note3   |
| **SecondaryOESIP**   | char\[\]  |     24      |       \*       |                |               |   Note3   |
| **PrimaryMDIP**      | char\[\]  |     24      |                |                |               | Note Used |
| **SecondaryIP**      | char\[\]  |     24      |                |                |               | Not Used  |
| **SendingTime**      |   Long    |      8      |                |                |               |  Note 5   |
| **MsgSeqNum**        |    Int    |      4      |                |                |    1500201    |           |
| **Key**              |    Int    |      4      |                |                |    432451     |           |
| **LoginStatus**      |   short   |      1      |                |                |               |           |
| **RejectReason**     |   short   |      2      |                |                |               |           |
| **RiskMaster**       |   char    |      1      |                |                |               |           |

#### Notes:

1. LogonType is a short enum, values: `Login 1`, `Logout 2`
   - If the value is not one of the values above, a logout message will be sent and the connection closed.
2. Value assigned by Black Ocean. If this is a logout, the TradingSessionID must be supplied.
3. IP address and port of the OES will be sent in the server response BOClientLogon message.
4. Sending times are in nanoseconds from the epoch, January 1, 1970.

## JSON Collateral Data

```json
{
  "msg1": "f",
  "UpdateType": 2,
  "Account": 100700,
  "TradingSessionID": 506,
  "SymbolEnum": 4,
  "Key": 123456,
  "MsgSeqID": 500,
  "SendingTime": 1624821404362542113
}
```

> AES response

```json
{
  "msg1": "h",
  "MessageType": 31,
  "UserName": "BOU7",
  "Account": 100700,
  "SymbolEnum": 11021,
  "BTCEquity": 100.0,
  "USDTEquity": 10000000.0,
  "FLYEquity": 50000000.0,
  "USDEquity": 10000000.0,
  "ETHEquity": 2000.0,
  "TradingSessionID": 506,
  "LastSeqNum": 20101010,
  "SendingTime": 1624821404365664367
}
```

> OES response

```json
{
  "msg1": "h",
  "MessageType": 31,
  "UserName": "BOU7",
  "Account": 100700,
  "SymbolEnum": 11021,
  "BTCEquity": 100.0,
  "USDTEquity": 10000000.0,
  "FLYEquity": 50000000.0,
  "USDEquity": 10000000.0,
  "ETHEquity": 2000.0,
  "TradingSessionID": 506,
  "LastSeqNum": 20101010,
  "SendingTime": 1624821404365664367
}
```

```proto
message Bit24CollateralData {
  string msg1 = 1;
  string msg2 = 2;
  int32 MessageType = 3;
  string UserName = 4;
  int32 Account = 5;
  int32 SymbolEnum = 6;
  double Leverage = 7;
  double LongPosition = 8;
  double ShortPosition = 9;
  string SymbolDisabled = 10;
  double ExecutedLongCash = 11;
  double ExecutedLongPosition = 12;
  double ExecutedShortCash = 13;
  double ExecutedShortPosition = 14;
  double BTCEquity = 15;
  double USDTEquity = 16;
  double ETHEquity = 17;
  double USDEquity = 18;
  double FLYEquity = 19;
  int32 TradingSessionID = 20;
  int64 LastSeqNum = 21;
  uint64 SendingTime = 22;
}
```

| Field Name           |  Data Type   | Data Length | Required Field | Required Value | Example Value | Notes  |
| :------------------- | :----------: | :---------: | :------------: | :------------: | :-----------: | :----: |
| **MsgType**          |     char     |      1      |       X        |       f        |       f       | Header |
| **MsgType**          |     char     |      1      |                |                |               |        |
| **Length**           |    short     |      2      |       X        |                |               |        |
| **MessageType**      |    short     |      2      |       X        |                |               |        |
| **UpdateType**       |    short     |      2      |       X        |                |               |        |
| **Account**          |     int      |      4      |       X        |                |               |        |
| **TradingSessionID** |     int      |      4      |       X        |                |               |        |
| **SymbolEnum**       |    short     |      2      |       X        |                |               |        |
| **Key**              |     int      |      4      |       X        |                |               |        |
| **MsgSeqNum**        |     int      |      4      |       X        |                |               |        |
| **SendingTime**      |   uint64_t   |      8      |       X        |                |               |        |
|                      | Total Length |     34      |                |                |               |        |
