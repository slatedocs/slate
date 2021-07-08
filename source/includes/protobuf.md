# Protobuf

## Protobuf Overview

Overview

## Protobuf BOClientLogon

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

| Field Name           | Data Type  | Data Length | Required Field | Required Value | Example Value |   Notes   |
| :------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :-------: |
| **Msg1**             |   string   |      1      |       X        |       H        |       H       |  Header   |
| **LogonType**        |   string   |      2      |       X        |                |       1       |   Note1   |
| **Account**          |    Int     |      4      |       X        |                |    253336     |   Note2   |
| **2FA**              | string\[\] |      6      |       X        |                |     1F6A      |   Note4   |
| **UserName**         | string\[\] |      6      |       X        |                |     BOU1      |   Note2   |
| **TradingSessionID** |    Int     |      4      |       \*       |                |               |   Note2   |
| **PrimaryOESIP**     | string\[\] |     24      |       \*       |                |               |   Note3   |
| **SecondaryOESIP**   | string\[\] |     24      |       \*       |                |               |   Note3   |
| **PrimaryMDIP**      | string\[\] |     24      |                |                |               | Note Used |
| **SecondaryIP**      | string\[\] |     24      |                |                |               | Not Used  |
| **SendingTime**      |    Long    |      8      |                |                |               |  Note 5   |
| **MsgSeqNum**        |    Int     |      4      |                |                |    1500201    |           |
| **Key**              |    Int     |      4      |                |                |    432451     |           |
| **LoginStatus**      |   string   |      1      |                |                |               |           |
| **RejectReason**     |   string   |      2      |                |                |               |           |
| **RiskMaster**       |   string   |      1      |                |                |               |           |

#### Notes:

1. LogonType is a string enum, values: `Login 1`, `Logout 2`
   - If the value is not one of the values above, a logout message will be sent and the connection closed.
2. Value assigned by Black Ocean. If this is a logout, the TradingSessionID must be supplied.
3. IP address and port of the OES will be sent in the server response BOClientLogon message.
4. Sending times are in nanoseconds from the epoch, January 1, 1970.

## Protobuf Collateral Data

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
  double stringPosition = 9;
  string SymbolDisabled = 10;
  double ExecutedLongCash = 11;
  double ExecutedLongPosition = 12;
  double ExecutedstringCash = 13;
  double ExecutedstringPosition = 14;
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
| **MsgType**          |    string    |      1      |       X        |       f        |       f       | Header |
| **MsgType**          |    string    |      1      |                |                |               |        |
| **Length**           |    string    |      2      |       X        |                |               |        |
| **MessageType**      |    string    |      2      |       X        |                |               |        |
| **UpdateType**       |    string    |      2      |       X        |                |               |        |
| **Account**          |     int      |      4      |       X        |                |               |        |
| **TradingSessionID** |     int      |      4      |       X        |                |               |        |
| **SymbolEnum**       |    string    |      2      |       X        |                |               |        |
| **Key**              |     int      |      4      |       X        |                |               |        |
| **MsgSeqNum**        |     int      |      4      |       X        |                |               |        |
| **SendingTime**      |   uint64_t   |      8      |       X        |                |               |        |
|                      | Total Length |     34      |                |                |               |        |

## Protobuf Risk Symbol Update

```json
{
  "msg1": "w",
  "MessageType": "w",
  "Account": 100700,
  "SymbolEnum": 4,
  "TradingSessionID": 506,
  "Key": 123456,
  "MsgSeqID": 500,
  "SendingTime": 1624821406361022055
}
```

> The above command returns JSON structured like this:

```json
{
  "MessageType": "N",
  "Account": 100700,
  "SymbolEnum": 1,
  "Leverage": 25.0,
  "LongPosition": 0.0,
  "stringPostion": 0.0,
  "LongCash": 0.0,
  "stringCash": 0.0,
  "TradingDisabled": 0,
  "ExecLongCash": 0.0,
  "ExecLongPositon": 0.0,
  "ExecstringCash": 0.0,
  "ExecstringPosition": 0.0,
  "BTCEquity": 100.0,
  "USDTEquity": 10000000.0,
  "ETHEquity": 0.0,
  "USDEquity": 10000000.0,
  "FLYEquity": 0.0,
  "TradingSessionID": 506,
  "LastSeqNum": 200,
  "UpdateType": 2
}
```

```proto
message Bit24RiskUserSymbol {
  string msg1 = 1;
  string msg2 = 2;
  int32 MessageType = 3;
  string UserName = 4;
  int32 Account = 5;
  int32 SymbolEnum = 6;
  double Leverage = 7;
  double LongPosition = 8;
  double stringPosition = 9;
  double LongCash = 10;
  double stringCash = 11;
  string SymbolDisabled = 12;
  double ExecutedLongCash = 13;
  double ExecutedLongPosition = 14;
  double ExecutedstringCash = 15;
  double ExecutedstringPosition = 16;
  double BTCEquity = 17;
  double USDTEquity = 18;
  double ETHEquity = 19;
  double USDEquity = 20;
  double FLYEquity = 21;
  int32 TradingSessionID = 22;
  int64 LastSeqNum = 23;
  uint64 SendingTime = 24;
}
```

| Field Name           | Data Type | Data Length | Required Field | Required Value | Example Value | Notes  |
| :------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :----: |
| **Msg1**             |  string   |      1      |       X        |       w        |       w       | Header |
| **Msg2**             |  string   |      1      |                |                |               | Header |
| **MsgLen**           |  string   |      2      |       X        |       34       |      34       | Header |
| **MessageType**      |  string   |      2      |       \*       |       w        |       w       | Note 6 |
| **ResponseType**     |  string   |      2      |       X        |                |       2       | Note 1 |
| **Account**          |    Int    |      4      |       X        |                |    100700     | Note 2 |
| **TradingSessionID** |    Int    |      4      |       X        |                |      506      | Note 3 |
| **SymbolEnum**       |  string   |      2      |                |                |       1       | Note 2 |
| **Key**              |    Int    |      2      |                |                |               | Note 4 |
| **MsgSeqNum**        |    Int    |      4      |       X        |                |    1005231    |        |
| **SendingTime**      | Uint64_t  |      4      |       X        |                |               | Note 6 |
|                      |           | TotalLength |                |                |               |        |

## Protobuf Instrument Data

```json
{
  "msg1": "Y",
  "MessageType": 22,
  "Account": 100700,
  "SymbolName": "BTCUSD",
  "UserName": "BOU7",
  "SymbolEnum": 4,
  "TradingSessionID": 506,
  "Key": 123456,
  "MsgSeqID": 500,
  "SendingTime": 1624859180169634284
}
```

> The above command returns JSON structured like this:

```json
{
  "msg1": "Q",
  "MessageType": "21",
  "SymbolName": "USDUSDT",
  "SymbolEnum": 4,
  "SymbolType": 1,
  "PriceIncrement": 0.01,
  "MaxSize": 5000.0,
  "MinSize": 0.00001,
  "SendingTime": 1624863069122199720,
  "LastSeqNum": 505
}
```

```proto
message Bit24InstrumentRequest {
  string msg1 = 1;
  string msg2 = 2;
  int32 MsgLen = 3;
  int32 MessageType = 4;
  int32 Account = 5;
  int32 RequestType = 6;
  int32 Key = 7;
  string Symbol = 8;
  int32 SymbolType = 9;
  int32 SymbolEnum = 10;
  string TraderID = 11;
  int32 TradingSessionID = 12;
  uint64 SendingTime = 13;
  int32 LastSeqNum = 14;
}
```

| Field Name           | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**             |  string   |      1      |       X        |       Y        |       Y       |  Header  |
| **Msg2**             |  string   |      1      |                |                |               |  Header  |
| **MsgLen**           |  string   |      2      |       X        |       62       |      62       |  Header  |
| **MessageType**      |  string   |      2      |                |                |               | Not used |
| **RejectReason**     |    Int    |      4      |       \*       |       Y        |       Y       |  Note 7  |
| **Account**          |    Int    |      4      |       X        |                |    100700     |  Note 1  |
| **RequestType**      |  string   |      2      |       X        |                |       2       |  Note 2  |
| **Key**              |    Int    |      4      |       X        |                |               |  Note 2  |
| **SymbolName**       | string[]  |     24      |                |                |               |  Note 3  |
| **SymbolType**       |  string   |      2      |                |                |               |  Note 4  |
| **SymbolEnum**       |  string   |      2      |                |                |               |  Note 5  |
| **TradingSessionID** |    Int    |      4      |                |                |      506      |          |
| **SendingTime**      |   Long    |      8      |       X        |                |               |  Note 6  |
| **MsgSeqNum**        |    Int    |      4      |       X        |                |    1500201    |          |
|                      |           | TotalLength |                |                |               |          |

Note 1: TradingSessionID, UserName and Account number supplied by Black Ocean to the user.
Note 2: RequestType is an enum with the following values:

| Enum Name       | Enum Value(string int) |                         |
| :-------------- | :--------------------: | :---------------------: |
| **ALL**         |           1            | Request all instruments |
| **SYMBOL_ENUM** |           2            | Individual instruments  |

Note 3: stringacter string name representation an individual instrument if known, if not known the name will be provided in the BOInstrument response
Note 4: SymbolType is a string integer enum with the following possible values:

| Enum Name: Symbol Type | Enum Value | Enum Data Type: string |
| :--------------------- | :--------: | :--------------------: |
| **SPOT**               |     1      |                        |
| **FUTURES**            |     2      |                        |
| **DERIVATIVE**         |            |                        |

Note 5: Symbol Enum is a string integer with the following possible values:

| Enum Name: Symbol Enum | Enum Value |
| :--------------------- | :--------: |
| **BTCUSD**             |     1      |
| **USDUSDT**            |     2      |
| **FLYUSDT**            |     3      |
| **BTCUSDT**            |     4      |

Note 6: Sending times are in nanoseconds from the epoch, January 1, 1970
Note 7: If the request was rejected, the reject reason will be in the ﬁeld RejectReason, see section below for possible values
