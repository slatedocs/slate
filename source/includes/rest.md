# REST

## REST Overview

Overview

## REST BOClientLogon

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

## REST Collateral Data

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

> The above command returns JSON structured like this:

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

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## REST Risk Symbol Update

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
  "ShortPostion": 0.0,
  "LongCash": 0.0,
  "ShortCash": 0.0,
  "TradingDisabled": 0,
  "ExecLongCash": 0.0,
  "ExecLongPositon": 0.0,
  "ExecShortCash": 0.0,
  "ExecShortPosition": 0.0,
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

| Field Name           | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value | Notes  |
| :------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :----: |
| **Data1**            |   char    |      1      |       0       |       X        |       w        |       w       | Header |
| **Data2**            |   char    |      1      |       1       |                |                |               | Header |
| **Data3**            |   short   |      2      |       2       |       X        |       34       |      34       | Header |
| **MessageType**      |   short   |      2      |       4       |       \*       |       w        |       w       | Note 6 |
| **ResponseType**     |   short   |      2      |       6       |       X        |                |       2       | Note 1 |
| **Account**          |    Int    |      4      |       8       |       X        |                |    100700     | Note 2 |
| **TradingSessionID** |    Int    |      4      |      12       |       X        |                |      506      | Note 3 |
| **SymbolEnum**       |   short   |      2      |      16       |                |                |       1       | Note 2 |
| **Key**              |    Int    |      2      |      18       |                |                |               | Note 4 |
| **MsgSeqNum**        |    Int    |      4      |      22       |       X        |                |    1005231    |        |
| **SendingTime**      | Uint64_t  |      4      |      26       |       X        |                |               | Note 6 |
|                      |           | TotalLength |      34       |                |                |               |        |

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## REST Instrument Data

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

| Field Name           | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**            |   char    |      1      |       0       |       X        |       Y        |       Y       |  Header  |
| **Data2**            |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**            |   short   |      2      |       2       |       X        |       62       |      62       |  Header  |
| **MessageType**      |   short   |      2      |       4       |                |                |               | Not used |
| **RejectReason**     |    Int    |      4      |       6       |       \*       |       Y        |       Y       |  Note 7  |
| **Account**          |    Int    |      4      |       8       |       X        |                |    100700     |  Note 1  |
| **RequestType**      |   short   |      2      |      12       |       X        |                |       2       |  Note 2  |
| **Key**              |    Int    |      4      |      14       |       X        |                |               |  Note 2  |
| **SymbolName**       |  char[]   |     24      |      18       |                |                |               |  Note 3  |
| **SymbolType**       |   short   |      2      |      42       |                |                |               |  Note 4  |
| **SymbolEnum**       |   short   |      2      |      44       |                |                |               |  Note 5  |
| **TradingSessionID** |    Int    |      4      |      46       |                |                |      506      |          |
| **SendingTime**      |   Long    |      8      |      50       |       X        |                |               |  Note 6  |
| **MsgSeqNum**        |    Int    |      4      |      58       |       X        |                |    1500201    |          |
|                      |           | TotalLength |      62       |                |                |               |          |

Note 1: TradingSessionID, UserName and Account number supplied by Black Ocean to the user.
Note 2: RequestType is an enum with the following values:

| Enum Name       | Enum Value(short int) |                         |
| :-------------- | :-------------------: | :---------------------: |
| **ALL**         |           1           | Request all instruments |
| **SYMBOL_ENUM** |           2           | Individual instruments  |

Note 3: Character string name representation an individual instrument if known, if not known the name will be provided in the BOInstrument response
Note 4: SymbolType is a short integer enum with the following possible values:

| Enum Name: Symbol Type | Enum Value | Enum Data Type: short |
| :--------------------- | :--------: | :-------------------: |
| **SPOT**               |     1      |                       |
| **FUTURES**            |     2      |                       |
| **DERIVATIVE**         |            |                       |

Note 5: Symbol Enum is a short integer with the following possible values:

| Enum Name: Symbol Enum | Enum Value |
| :--------------------- | :--------: |
| **BTCUSD**             |     1      |
| **USDUSDT**            |     2      |
| **FLYUSDT**            |     3      |
| **BTCUSDT**            |     4      |

Note 6: Sending times are in nanoseconds from the epoch, January 1, 1970
Note 7: If the request was rejected, the reject reason will be in the ﬁeld RejectReason, see section below for possible values

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## REST Order Entry

```json
{
  "msg1": "T",
  "MessageType": 1,
  "UpdateType": 2,
  "Account": 100700,
  "TraderID": "BOU7",
  "OrderType": 1,
  "OrderID": 14333181,
  "Price,": 35040.5,
  "Bit24OrderQty": 2,
  "Bit24Side": 1,
  "SendingTime": 1681931839281,
  "MsgSeqID": 500,
  "Key": 123456,
  "SymbolEnum": 4,
  "Symbol": "BTCUSDT",
  "TradingSessionID": 506,
  "TIF": 1
}
```

> The above command returns JSON structured like this:

```json
{
  "msg1": "T",
  "MessageType": 14,
  "UpdateType": 2,
  "Account": 100700,
  "OrderId": 14333181,
  "SymbolEnum": 4,
  "OrderType": 1,
  "Bit24Price": 35040.5,
  "Side": 1,
  "Bit24OrderQty": 2.0,
  "TIF": 1,
  "DisplaySize": 0.0,
  "RefreshSize": 0.0,
  "Bit24Symbol": "BTCUSDT",
  "TraderID": "BOU7",
  "SendingTime": 1624781419248402,
  "TradingSessionID": 506,
  "Key": 123456,
  "MsgSeqID": 500
}
```

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

### Application Messages
