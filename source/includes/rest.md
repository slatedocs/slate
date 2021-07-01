# REST

## REST Overview

Overview

## BOClientLogon

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

> The above command returns JSON structured like this:

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
5. Black Ocean requests that if they user is going to close the connec\)on a BOClientLogon message should be sent with the LogonType set to 2 prior to closing the connection in order to allow the OES to close the connec\)on gracefully.
6. BOClientLogon Example Message - Client Sending

| Field Name           | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |   Notes   |
| :------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :-------: |
| **Data1**            |   char    |      1      |       0       |       X        |       H        |       H       |  Header   |
| **Data2**            |   char    |      1      |       1       |                |                |               |  Header   |
| **Data3**            |   short   |      2      |       2       |       X        |      143       |      143      |  Header   |
| **LogonType**        |   short   |      2      |       4       |       X        |                |       1       |   Note1   |
| **Account**          |    Int    |      4      |       6       |       X        |                |    253336     |   Note2   |
| **2FA**              | char\[\]  |      6      |      10       |       X        |                |     1F6A      |   Note4   |
| **UserName**         | char\[\]  |      6      |      16       |       X        |                |     BOU1      |   Note2   |
| **TradingSessionID** |    Int    |      4      |      22       |       \*       |                |               |   Note2   |
| **PrimaryOESIP**     | char\[\]  |     24      |      26       |       \*       |                |               |   Note3   |
| **SecondaryOESIP**   | char\[\]  |     24      |      50       |       \*       |                |               |   Note3   |
| **PrimaryMDIP**      | char\[\]  |     24      |      74       |                |                |               | Note Used |
| **SecondaryIP**      | char\[\]  |     24      |      98       |                |                |               | Not Used  |
| **SendingTime**      |   Long    |      8      |      122      |                |                |               |  Note 5   |
| **MsgSeqNum**        |    Int    |      4      |      130      |                |                |    1500201    |           |
| **Key**              |    Int    |      4      |      134      |                |                |    432451     |           |
| **LoginStatus**      |   short   |      1      |      138      |                |                |               |           |
| **RejectReason**     |   short   |      2      |      140      |                |                |               |           |
| **RiskMaster**       |   char    |      1      |      142      |                |                |               |           |

#### Notes:

1. LogonType is a short enum, values: `Login 1`, `Logout 2`
   - If the value is not one of the values above, a logout message will be sent and the connection closed.
2. Value assigned by Black Ocean. If this is a logout, the TradingSessionID must be supplied.
3. IP address and port of the OES will be sent in the server response BOClientLogon message.
4. 2FA is disabled for the testing phase.
5. Sending times are in nanoseconds from the epoch, January 1, 1970.

### BOClientLogon/Logout -- Server Response

1. Upon Receipt of a client logon, the server will respond with a BOClientLogon message.
2. The status of the logon will be in the LoginStatus ﬁeld, a value of 1 indicates the logon was successful, a value of 2 indicates the login failed and the server will then close the connection. The reason for the unsuccessful login will be in the RejectReason ﬁeld. Possible values for the reject will be detailed in a section below.
3. The IP address and port of the OES \(Order Entry Server\) will be supplied in the message in order to allow the user to make the connection to the OES. Login to the OES will be covered in a subsequent section.
4. The server may initiate logout messages in the following circumstances:
   1. Matching Engine switching to secondary server \(if it is deemed operationally more eﬃcient in the event of a loss of the primary Matching Engine, the OES may switch to the secondary OES where the new primary Matching Engine is located\).
   2. Malformed messages which cannot be processed.
   3. Black Ocean initiated shutdown of the OES
5. In the event the OES becomes unavailable, the user should reconnect to the secondary OES for which the IP Address and Port is supplied in the message.
6. In the event the client sends a logout message, the server will not respond with a logout message but will instead proceed to close the connection.

| Field Name           | Data Type |   Data Length    | Buffer Offset | Required Field | Required Value |   Example Value   |  Notes   |
| :------------------- | :-------: | :--------------: | :-----------: | :------------: | :------------: | :---------------: | :------: |
| **Data1**            |   char    |        1         |       0       |       X        |       H        |         H         |  Header  |
| **Data2**            |   char    |        1         |       1       |                |                |                   |  Header  |
| **Data3**            |   short   |        2         |       2       |       X        |      143       |        143        |  Header  |
| **LogonType**        |   short   |        2         |       4       |                |                |         1         |  Note 1  |
| **Account**          |    Int    |        4         |       6       |       \*       |                |      253336       |  Note 2  |
| **2FA**              | char\[\]  |        6         |      10       |       X        |                |       1F6A        |  Note 3  |
| **UserName**         | char\[\]  |        6         |      16       |       X        |                |       BOU1        |  Note 2  |
| **TradingSessionID** |    Int    |        4         |      22       |       X        |                |        505        |  Note 2  |
| **PrimaryOESIP**     | char\[\]  |        24        |      26       |       \*       |                | 192.0.0.1:4300 5  |  Note 4  |
| **SecondaryOESIP**   | char\[\]  |        24        |      50       |       \*       |                | 113.50.1.1:430 05 |  Note 4  |
| **PrimaryMDIP**      | char\[\]  |        24        |      74       |                |                |                   | Not Used |
| **SecondaryIP**      | char\[\]  |        24        |      98       |                |                |                   | Not Used |
| **SendingTime**      |   Long    |        8         |      122      |                |                |                   |  Note 5  |
| **MsgSeqNum**        |    Int    |        4         |      130      |       X        |                |      1500201      |          |
| **Key**              |    Int    |        4         |      134      |                |                |      432451       |          |
| **LoginStatus**      |   short   |        1         |      138      |                |                |                   | Not Used |
| **RejectReason**     |   short   |        2         |      140      |       \*       |                |                   |  Note 6  |
| **RiskMaster**       |   char    |        1         |      142      |                |                |                   |  Note 7  |
|                      |           | **Total Length** |    **143**    |                |                |                   |          |

#### Notes:

1. LogonType is a short enum \(see Client logon above for possible values\)
2. TradingSessionID, UserName and Account number included in logon response but may or may not be included in logout messages.
3. Disabled for testing.
4. Not included in logout messages \(LogonType = 2\)
5. Sending times are in nanoseconds from the epoch, January 1, 1970.
6. If the login was rejected, the reject reason will be in the ﬁeld RejectReason
7. Not currently used, for future expansion.

## Collateral Data

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

## Risk Symbol Update

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

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## Instrument Data

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

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## Order Entry

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
