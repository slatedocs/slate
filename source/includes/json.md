# JSON

## JSON Overview

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

## JSON Risk Symbol Update

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

| Field Name           | Data Type | Data Length | Required Field | Required Value | Example Value | Notes  |
| :------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :----: |
| **Msg1**             |   char    |      1      |       X        |       w        |       w       | Header |
| **Msg2**             |   char    |      1      |                |                |               | Header |
| **MsgLen**           |   short   |      2      |       X        |       34       |      34       | Header |
| **MessageType**      |   short   |      2      |       \*       |       w        |       w       | Note 6 |
| **ResponseType**     |   short   |      2      |       X        |                |       2       | Note 1 |
| **Account**          |    Int    |      4      |       X        |                |    100700     | Note 2 |
| **TradingSessionID** |    Int    |      4      |       X        |                |      506      | Note 3 |
| **SymbolEnum**       |   short   |      2      |                |                |       1       | Note 2 |
| **Key**              |    Int    |      2      |                |                |               | Note 4 |
| **MsgSeqNum**        |    Int    |      4      |       X        |                |    1005231    |        |
| **SendingTime**      | Uint64_t  |      4      |       X        |                |               | Note 6 |
|                      |           | TotalLength |                |                |               |        |

## JSON Instrument Data

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

| Field Name           | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**             |   char    |      1      |       X        |       Y        |       Y       |  Header  |
| **Msg2**             |   char    |      1      |                |                |               |  Header  |
| **MsgLen**           |   short   |      2      |       X        |       62       |      62       |  Header  |
| **MessageType**      |   short   |      2      |                |                |               | Not used |
| **RejectReason**     |    Int    |      4      |       \*       |       Y        |       Y       |  Note 7  |
| **Account**          |    Int    |      4      |       X        |                |    100700     |  Note 1  |
| **RequestType**      |   short   |      2      |       X        |                |       2       |  Note 2  |
| **Key**              |    Int    |      4      |       X        |                |               |  Note 2  |
| **SymbolName**       |  char[]   |     24      |                |                |               |  Note 3  |
| **SymbolType**       |   short   |      2      |                |                |               |  Note 4  |
| **SymbolEnum**       |   short   |      2      |                |                |               |  Note 5  |
| **TradingSessionID** |    Int    |      4      |                |                |      506      |          |
| **SendingTime**      |   Long    |      8      |       X        |                |               |  Note 6  |
| **MsgSeqNum**        |    Int    |      4      |       X        |                |    1500201    |          |
|                      |           | TotalLength |                |                |               |          |

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

## JSON Order Entry

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

### Application Messages

#### LIMIT

##### New LIMIT order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |                |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 3  |
| **OrderType**         |   short   |      2      |       X        |                |      LMT      |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing

##### New LIMIT Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      LMT      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |     42341     |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### **Cancel Replace LIMIT Order - Client Sending**

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      LMT       |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     | Note 10  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing

##### **Cancel Replace LIMIT Order - OES Response**

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      LMT      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: \*\*\*\*If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel LIMIT Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      LMT      |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing

##### Cancel LIMIT Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      LMT      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### MARKET

##### New MARKET order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      MKT      |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |                |                |               |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 4  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |                |                |               |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 5  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |                |                |               |          |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 5: Currently disabled for testing.

##### New MARKET Order - OES Response

The OES will respond to a MKT order only in the case it was rejected, MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |    REJECT     |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      MKT      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |                |                |               |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |               |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### OCO

##### New OCO order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      OCO      |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |                |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a OCO order on the book, OrdType ﬁeld should be set to OCO.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side fields are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

##### New OCO Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      OCO      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    428888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace OCO Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      OCO       |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a OCO order on the book, OrdType ﬁeld should be set to OCO.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side fields are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID are the price and size of the order being replaced.

##### Cancel Replace OCO Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |    REPLACE    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      OCO      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel OCO Order - **Client Sending**

User wishes to cancel replace the order sent in the previous section**.**

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      OCO      |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes are ignored on cancellations.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID are the price and order id of the order being cancelled.

##### Cancel OCO Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      OCO      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |   49200.00    |  Note 2  |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |       \*       |                |               |  Note 3  |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |  Note 4  |
| **RefreshSize**       |  double   |      8      |                |                |               |  Note 4  |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 5  |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### PEG

##### New PEG / PEG_HIDDEN Order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_NEW    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |                |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |      1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |                |          |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    79448888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT. Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

##### New PEG / PEG_HIDDEN Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   ORDER_ACK    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |          |
| **OrderType**         |   short   |      2      |       X        |                | PEG/PEG_HIDDEN |          |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51100.5     |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |                |          |
| **OrigOrderID**       |   long    |      8      |                |                |                |          |
| **BOCancelShares**    |  double   |      8      |                |                |                |          |
| **ExecID**            |   long    |      8      |                |                |                |          |
| **ExecShares**        |  double   |      8      |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |                |                |                |          |
| **DisplaySize**       |  double   |      8      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |                |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |                |          |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |          |

**Note 1:**

If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace PEG / PEG_HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID are the price and order id of the order being replaced.

##### Cancel Replace PEG / PEG_HIDDEN Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |     **\***     |    REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | PEG/PEG_HIDDEN |          |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |                |          |
| **BOCancelShares**    |  double   |      8      |                |                |                |          |
| **ExecID**            |   long    |      8      |                |                |                |          |
| **ExecShares**        |  double   |      8      |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |                |                |                |          |
| **DisplaySize**       |  double   |      8      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |                |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |          |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel PEG / PEG_HIDDEN Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID are the price and order id of the order being replaced.

##### Cancel PEG / PEG_HIDDEN Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = CANCELLED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |    CANCELED    |    CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |          |
| **OrderType**         |   short   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                |  Note 2  |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832152    |          |
| **BOCancelShares**    |  double   |      8      |                |                |                |          |
| **ExecID**            |   long    |      8      |                |                |                |          |
| **ExecShares**        |  double   |      8      |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |       \*       |                |                |  Note 3  |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |                |                |                |          |
| **DisplaySize**       |  double   |      8      |                |                |                |  Note 4  |
| **RefreshSize**       |  double   |      8      |                |                |                |  Note 4  |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |          |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 5  |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### HIDDEN

##### New HIDDEN Order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |    HIDDEN     |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

##### New HIDDEN Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |     HIDDEN     |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being cancelled.

##### **Cancel Replace HIDDEN Order - OES Response**

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |     HIDDEN     |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |    46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |                |                |                |          |
| **ExecID**            |   long    |      8      |                |                |                |          |
| **ExecShares**        |  double   |      8      |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |                |                |                |          |
| **Layers**            |   short   |      2      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE and the DISPLAYSIZE_ATTRIBUTE are available but the other attributes will be available soon. Please see the section above on attribute behavior. In order to set an attribute a user should do something like this: // function accepts the position in the array to set the value and the actual value BOTransaction.setAtrributes\(DISPLAYSIZE, ‘Y’\);

If the DISPLAYSIZE attribute is set, the DisplaySize and RefreshSize in the message must also be set, if either is not set to a valid value the message will be rejected. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being cancelled.

##### Cancel HIDDEN Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = CANCELLED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### ICEBERG

##### New ICEBERG Order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      ICE      |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      | Note 13  |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |       X        |                |               |  Note 9  |
| **SizeIncrement**     |  double   |      8      |       X        |                |               | Note 10  |
| **PriceIncrement**    |  double   |      8      |       X        |                |               | Note 11  |
| **PriceOffset**       |  double   |      8      |       X        |                |               | Note 12  |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Currently only GTC is available for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE is allowed for ICE orders.

Note 8: Currently disabled for testing.

Note 9: Maximum layers currently set to 10.

Note 10: SizeIncrement must be set. The SizeIncrement \* Layers is the total order size.

Note 11: PriceIncrement is the price spacing between layers.

Example:

- BOPrice = 50150.00
- PriceIncrement = 1
- PriceOffset = 0.0
- Side = BUY

The second order will be placed at 50149.50

Note 12: PriceOﬀset is the oﬀset from the top of the book, in increments of the price increment of the instrument. BTCUSD has a price increment of 0.50 so if the price oﬀset is set to 2, then the second order will be place +/- $1.00 from the top of the book.

Note 13: BOOrdQty is the product of the SizeIncrement \* Layers ﬁelds.

##### New ICEBERG Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      ICE      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51000.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace ICEBERG Order - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      ICE       |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       | Note 14  |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |    46832151    | Note 13  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |                |                |                |          |
| **Layers**            |   short   |      2      |       X        |                |                |  Note 9  |
| **SizeIncrement**     |  double   |      8      |       X        |                |                | Note 10  |
| **PriceIncrement**    |  double   |      8      |       X        |                |                | Note 11  |
| **PriceOffset**       |  double   |      8      |       X        |                |                | Note 12  |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5     | Note 13  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Currently only GTC is available for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE is allowed for ICE orders.

Note 8: Currently disabled for testing.

Note 9: Maximum layers currently set to 10.

Note 10: SizeIncrement must be set. The SizeIncrement \* Layers is the total order size.

Note 11: PriceIncrement is the price spacing between layers.

Example:

- BOPrice = 50150.00
- PriceIncrement = 1
- PriceOffset = 0.0
- Side = BUY

The second order will be placed at 50149.50

Note 12: PriceOﬀset is the oﬀset from the top of the book, in increments of the price increment of the instrument. BTCUSD has a price increment of 0.50 so if the price oﬀset is set to 2, then the second order will be place +/- $1.00 from the top of the book.

Note 13: BOOrdQty is the product of the SizeIncrement \* Layers ﬁelds.

##### Cancel Replace ICEBERG Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      ICE      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51000.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### **Cancel ICEBERG Order - Client Sending**

User wishes to cancel replace the order sent in the previous section. Please see the section titled ICE Orders.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   char    |      1      |                |                |                |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                | Not used |
| **Account**           |    Int    |      4      |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |      ICE       |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |    46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |                |                |                |          |
| **ExecFee**           |  double   |      8      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |       X        |                |                |          |
| **SizeIncrement**     |  double   |      8      |       X        |                |                |          |
| **PriceIncrement**    |  double   |      8      |       X        |                |                |          |
| **PriceOffset**       |  double   |      8      |       X        |                |                |          |
| **BOOrigPrice**       |  double   |      8      |       X        |                |                |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                |          |
| **TriggerType**       |   short   |      2      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above. Since in this example we would like to place a limit order on the book, OrdType ﬁeld should be set to LMT.

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Currently only GTC is available for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Currently only the HIDDEN_ATTRIBUTE is allowed for ICE orders. If the user sets the HIDDEN_ATTRIBUTE to ‘Y’, this order will be hidden.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being cancelled.

##### Cancel ICEBERG Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = CANCELLED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |      ICE      |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### STOP MARKET/STOP LIMIT

##### New STOP_MKT/STOP_LMT - Client Sending

| Field Name            | Data Type | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   char    |      1      |                |                |                    |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |     ORDER_NEW      |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |       X        |                |      46832151      |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |         1          |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |       X        |                |      50100.5       |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |        2.0         |          |
| **TIF**               |   short   |      2      |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |                |                |                    |          |
| **BOCancelShares**    |  double   |      8      |                |                |                    |          |
| **ExecID**            |   long    |      8      |                |                |                    |          |
| **ExecShares**        |  double   |      8      |                |                |                    |          |
| **RemainingQuantity** |  double   |      8      |                |                |                    |          |
| **ExecFee**           |  double   |      8      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |        1000        |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |                    |          |
| **RefreshSize**       |  double   |      8      |                |                |                    |          |
| **Layers**            |   short   |      2      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |                |                |                    |          |
| **ExecPrice**         |  double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |                |                |                    |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Currently only GTC is available for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

##### New STOP_MKT/STOP_LMT Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = CANCELLED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   char    |      1      |                |                |                    |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |     ORDER_ACK      |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |       X        |                |      46832151      |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |         1          |          |
| **OrderType**         |   short   |      2      |       X        |                | STOP_MKT/ STOP_LMT |          |
| **SymbolType**        |   short   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |       X        |                |      50100.5       |          |
| **BOSide**            |   short   |      2      |       X        |                |        BUY         |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |        2.0         |          |
| **TIF**               |   short   |      2      |       X        |                |        GTC         |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |                |                |                    |          |
| **BOCancelShares**    |  double   |      8      |                |                |                    |          |
| **ExecID**            |   long    |      8      |                |                |                    |          |
| **ExecShares**        |  double   |      8      |                |                |                    |          |
| **RemainingQuantity** |  double   |      8      |                |                |                    |          |
| **ExecFee**           |  double   |      8      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |                |                |                    |          |
| **DisplaySize**       |  double   |      8      |                |                |                    |          |
| **RefreshSize**       |  double   |      8      |                |                |                    |          |
| **Layers**            |   short   |      2      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |                |                |                    |          |
| **ExecPrice**         |  double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |      4248888       |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                    |          |

**Notes:**

If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace **STOP_MKT/STOP\_**LMT Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   char    |      1      |                |                |                    |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_REPLACE    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |       X        |                |      46832152      |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |         1          |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |       X        |                |      51102.5       |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |        3.0         |          |
| **TIF**               |   short   |      2      |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |                |                |      46832151      |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                    |          |
| **ExecID**            |   long    |      8      |       \*       |                |                    |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                    |          |
| **RemainingQuantity** |  double   |      8      |                |                |                    |          |
| **ExecFee**           |  double   |      8      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                    |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                    |          |
| **Layers**            |   short   |      2      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |                |                |      50100.5       |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                    |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being replaced.

##### Cancel Replace STOP_MKT/STOP_LMT Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   char    |      1      |                |                |                    |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |      REPLACED      |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |       X        |                |      46832152      |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |         1          |          |
| **OrderType**         |   short   |      2      |       X        |                | STOP_MKT/ STOP_LMT |          |
| **SymbolType**        |   short   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |       X        |                |      50100.5       |          |
| **BOSide**            |   short   |      2      |       X        |                |        BUY         |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |        3.0         |          |
| **TIF**               |   short   |      2      |       X        |                |        GTC         |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |                |                |                    |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                    |          |
| **ExecID**            |   long    |      8      |       \*       |                |                    |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                    |          |
| **RemainingQuantity** |  double   |      8      |                |                |                    |          |
| **ExecFee**           |  double   |      8      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |                |                |                    |          |
| **DisplaySize**       |  double   |      8      |                |                |                    |          |
| **RefreshSize**       |  double   |      8      |                |                |                    |          |
| **Layers**            |   short   |      2      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |                |                |      50100.5       |          |
| **ExecPrice**         |  double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |      4248888       |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                    |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel STOP_MKT/STOP_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   char    |      1      |                |                |                    |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |    ORDER_CANCEL    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |       X        |                |      46832153      |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |         1          |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |       X        |                |      51102.5       |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |        3.0         |          |
| **TIF**               |   short   |      2      |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |                |                |      46832152      |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                    |          |
| **ExecID**            |   long    |      8      |       \*       |                |                    |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                    |          |
| **RemainingQuantity** |  double   |      8      |                |                |                    |          |
| **ExecFee**           |  double   |      8      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                    |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                    |          |
| **Layers**            |   short   |      2      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |                |                |      50100.5       |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                    |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being replaced.

##### Cancel STOP_MKT/STOP_LMT Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value      |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :--------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T            |  Header  |
| **Msg2**              |   char    |      1      |                |                |                        |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238           |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |        CANCELED        |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                        | Not used |
| **Account**           |    Int    |      4      |       X        |                |         100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |        46832153        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1            |          |
| **OrderType**         |   short   |      2      |       X        |                |   STOP_MKT/ STOP_LMT   |          |
| **SymbolType**        |   short   |      2      |       X        |                |          SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        50100.5         |          |
| **BOSide**            |   short   |      2      |       X        |                |          BUY           |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0           |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC           |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                        |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |         BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |                |                |        46832152        |          |
| **BOCancelShares**    |  double   |      8      |                |                |                        |          |
| **ExecID**            |   long    |      8      |                |                |                        |          |
| **ExecShares**        |  double   |      8      |                |                |                        |          |
| **RemainingQuantity** |  double   |      8      |                |                |                        |          |
| **ExecFee**           |  double   |      8      |                |                |                        |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                        |          |
| **TraderID**          | char\[\]  |      6      |                |                |                        | Not used |
| **RejectReason**      |   short   |      2      |                |                |                        |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                | 184467440 737095515 30 |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506           |          |
| **Key**               |    Int    |      4      |                |                |                        |          |
| **DisplaySize**       |  double   |      8      |                |                |                        |          |
| **RefreshSize**       |  double   |      8      |                |                |                        |          |
| **Layers**            |   short   |      2      |                |                |                        |          |
| **SizeIncrement**     |  double   |      8      |                |                |                        |          |
| **PriceIncrement**    |  double   |      8      |                |                |                        |          |
| **PriceOffset**       |  double   |      8      |                |                |                        |          |
| **BOOrigPrice**       |  double   |      8      |                |                |        50100.5         |          |
| **ExecPrice**         |  double   |      8      |                |                |                        |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        4248888         |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                        |          |
| **TriggerType**       |   short   |      2      |                |                |                        |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                        |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### TRAILING STOP MARKET/TRAILING STOP LIMIT

##### New TSM/TSL Order - Client Sending

TSM order are trailing stop market orders. TSL orders are trailing stop limit orders.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51000.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Only GTC currently is a valid TIF value for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

##### New TSM/TSL Order - OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |    TSL/TSM    |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace TSM/TSL Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |   46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |                |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Only GTC currently is a valid TIF value for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being replaced.

##### Cancel Replace TSM/TSL Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |       X        |                |    TSL/TSM    |          |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |                |                |               |          |
| **ExecID**            |   long    |      8      |                |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel TSL/TSM Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   char    |      1      |                |                |               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   short   |      2      |                |                |               | Not used |
| **Account**           |    Int    |      4      |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |                |                |               |          |
| **ExecFee**           |  double   |      8      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |                |                |               |          |
| **Layers**            |   short   |      2      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |  double   |      8      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |               |          |
| **TriggerType**       |   short   |      2      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |                |                |               |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values:

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being replaced.

##### Cancel TSL/TSM Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = CANCELLED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value      |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :--------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T            |  Header  |
| **Msg2**              |   char    |      1      |                |                |                        |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238           |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |        CANCELED        |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                        | Not used |
| **Account**           |    Int    |      4      |       X        |                |         100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |        46832153        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1            |          |
| **OrderType**         |   short   |      2      |       X        |                |        TSL/TSM         |          |
| **SymbolType**        |   short   |      2      |       X        |                |          SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        50102.5         |          |
| **BOSide**            |   short   |      2      |       X        |                |          BUY           |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0           |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC           |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                        |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |         BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |        46832152        |          |
| **BOCancelShares**    |  double   |      8      |                |                |                        |          |
| **ExecID**            |   long    |      8      |                |                |                        |          |
| **ExecShares**        |  double   |      8      |                |                |                        |          |
| **RemainingQuantity** |  double   |      8      |                |                |                        |          |
| **ExecFee**           |  double   |      8      |                |                |                        |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                        |          |
| **TraderID**          | char\[\]  |      6      |                |                |                        | Not used |
| **RejectReason**      |   short   |      2      |                |                |                        |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                | 184467440 737095515 30 |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506           |          |
| **Key**               |    Int    |      4      |                |                |                        |          |
| **DisplaySize**       |  double   |      8      |                |                |                        |          |
| **RefreshSize**       |  double   |      8      |                |                |                        |          |
| **Layers**            |   short   |      2      |                |                |                        |          |
| **SizeIncrement**     |  double   |      8      |                |                |                        |          |
| **PriceIncrement**    |  double   |      8      |                |                |                        |          |
| **PriceOffset**       |  double   |      8      |                |                |                        |          |
| **BOOrigPrice**       |  double   |      8      |                |                |        50100.5         |          |
| **ExecPrice**         |  double   |      8      |                |                |                        |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        4248888         |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                        |          |
| **TriggerType**       |   short   |      2      |                |                |                        |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                        |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### SNIPER MARKET/SNIPER LIMIT

##### New SNIPER_MKT/SNIPER_LMT Order - Client Sending

Sniper orders allow a user to wait for a price to reach a certain price and then interact with the market at that previously set price.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   char    |      1      |                |                |                       |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |       ORDER_NEW       |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |       46832151        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1           |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        50100.5        |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |          2.0          |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |                |                |                       |          |
| **BOCancelShares**    |  double   |      8      |                |                |                       |          |
| **ExecID**            |   long    |      8      |                |                |                       |          |
| **ExecShares**        |  double   |      8      |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |                |                |                       |          |
| **ExecFee**           |  double   |      8      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |                |                |                       |          |
| **Layers**            |   short   |      2      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |                |                |                       |          |
| **ExecPrice**         |  double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                       |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Only GTC is currently a valid TIF for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

##### New SNIPER_MKT/SNIPER_LMT Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = ORDER_ACK if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   char    |      1      |                |                |                       |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |       ORDER_ACK       |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |       46832151        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1           |          |
| **OrderType**         |   short   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   short   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        50102.5        |          |
| **BOSide**            |   short   |      2      |       X        |                |          BUY          |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC          |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |                |                |                       |          |
| **BOCancelShares**    |  double   |      8      |                |                |                       |          |
| **ExecID**            |   long    |      8      |                |                |                       |          |
| **ExecShares**        |  double   |      8      |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |                |                |                       |          |
| **ExecFee**           |  double   |      8      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                       |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |                |                |                       |          |
| **DisplaySize**       |  double   |      8      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |                |                |                       |          |
| **Layers**            |   short   |      2      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |                |                |                       |          |
| **ExecPrice**         |  double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |                |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace SNIPER_MKT/SNIPER_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   char    |      1      |                |                |                       |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |    CANCEL_REPLACE     |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |       46832152        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1           |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        51101.5        |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |                |                |       46832151        |  Note 9  |
| **BOCancelShares**    |  double   |      8      |                |                |                       |          |
| **ExecID**            |   long    |      8      |                |                |                       |          |
| **ExecShares**        |  double   |      8      |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |                |                |                       |          |
| **ExecFee**           |  double   |      8      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |  double   |      8      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |                |                |                       |          |
| **Layers**            |   short   |      2      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |                |                |        50100.5        |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |                |                |                       |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Only GTC is currently a valid TIF for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being replaced.

##### Cancel Replace SNIPER_MKT/SNIPER_LMT Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   char    |      1      |                |                |                       |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |       REPLACED        |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |       46832152        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1           |          |
| **OrderType**         |   short   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   short   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        50100.5        |          |
| **BOSide**            |   short   |      2      |       X        |                |          BUY          |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC          |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |                |                |                       |          |
| **BOCancelShares**    |  double   |      8      |                |                |                       |          |
| **ExecID**            |   long    |      8      |                |                |                       |          |
| **ExecShares**        |  double   |      8      |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |                |                |                       |          |
| **ExecFee**           |  double   |      8      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                       |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |                |                |                       |          |
| **DisplaySize**       |  double   |      8      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |                |                |                       |          |
| **Layers**            |   short   |      2      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |                |                |        50100.5        |          |
| **ExecPrice**         |  double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel SNIPER_MKT/SNIPER_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   char    |      1      |                |                |                       |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                |    ORDER_CANCELED     |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |       46832153        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1           |  Note 2  |
| **OrderType**         |   short   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        51102.5        |  Note 4  |
| **BOSide**            |   short   |      2      |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |                |                |       46832151        |  Note 9  |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                       |          |
| **ExecID**            |   long    |      8      |       \*       |                |                       |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                       |          |
| **RemainingQuantity** |  double   |      8      |                |                |                       |          |
| **ExecFee**           |  double   |      8      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                       |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                       |          |
| **Layers**            |   short   |      2      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |                |                |        50100.5        |  Note 9  |
| **ExecPrice**         |  double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                       |  Note 7  |

**Notes:**

Note 1: Message types must be valid according to the values listed in the Message Type table above. Since in this example we would like to place a new order on the book, the MsgType ﬁeld must be set to ORDER_NEW.

Note 2: Please see previous sections for valid values for the symbol enum.

Note 3: Order types must be a valid value as deﬁned in the OrdType table above

Note 4: Price values must be be in a price increment according to the value the user received in the BOInstrument message - PriceIncrement ﬁeld. Example, BTCUSD, symbol enum 1, has a price increment of 0.5. If the user sends a price of 51000.40, this price is invalid since the cents portion of the price is not in a 0.5 increment. The correct price should have been 51000.50 or 51000.00 or 51001.00, all of these are valid values.

Note 5: The valid side ﬁelds are:

| Enum Name: SIDE | Enum Value |
| :-------------- | :--------- |
| **BUY**         | 1          |
| **SELL**        | 2          |

Note 6: TIF valid values: Only GTC is currently a valid TIF for this order type.

| Enum Name: TIF | Enum Value |
| :------------- | :--------- |
| **FOK**        | 1          |
| **GTC**        | 2          |
| **IOC**        | 3          |
| **POO**        | 4          |
| **RED**        | 5          |
| **DAY**        | 6          |

Note 7: Attributes allow an order to exhibit additional behavior. Not used on this order type.

Note 8: Currently disabled for testing.

Note 9: BOOrigPrice and OrigOrderID is the price and order id of the order being replaced.

##### Cancel SNIPER_MKT/SNIPER_LMT Order – OES Response

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = CANCELLED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   char    |      1      |                |                |                       |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       |       CANCELED        |  Note 1  |
| **Padding**           |   short   |      2      |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |       X        |                |       46832153        |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |           1           |          |
| **OrderType**         |   short   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   short   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |       X        |                |        51102.5        |          |
| **BOSide**            |   short   |      2      |       X        |                |          BUY          |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |       X        |                |          GTC          |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |       46832152        |          |
| **BOCancelShares**    |  double   |      8      |                |                |                       |          |
| **ExecID**            |   long    |      8      |                |                |                       |          |
| **ExecShares**        |  double   |      8      |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |                |                |                       |          |
| **ExecFee**           |  double   |      8      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                       |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |                |                |                       |          |
| **DisplaySize**       |  double   |      8      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |                |                |                       |          |
| **Layers**            |   short   |      2      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |                |                |        50100.5        |          |
| **ExecPrice**         |  double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### EXECUTION/EXECUTION PARTIAL

These two message types are generated when an incoming Quote interacts with a resting order \(order already on the book\). Upon receiving an Execution message, the order in the Market Data Order Book should be removed. Upon receiving an Execution Partial, the volume of the resting order should be updated to reﬂect the remaining order quantity.

| Field Name            | Data Type | Data Length | Required Field | Required Value |        Example Value        |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :-------------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |              T              |  Header  |
| **Msg2**              |   char    |      1      |                |                |                             |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |             238             |  Header  |
| **MessageType**       |   short   |      2      |       \*       |       \*       | EXECUTION/EXECUTION_PARTIAL |          |
| **Padding**           |   short   |      2      |                |                |                             | Not used |
| **Account**           |    Int    |      4      |       X        |                |           100700            |          |
| **OrderID**           |   long    |      8      |       X        |                |          46832153           |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |              1              |          |
| **OrderType**         |   short   |      2      |       X        |                |             LMT             |          |
| **SymbolType**        |   short   |      2      |       X        |                |            SPOT             |          |
| **BOPrice**           |  double   |      8      |       X        |                |           51102.5           |          |
| **BOSide**            |   short   |      2      |       X        |                |             BUY             |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |             3.0             |          |
| **TIF**               |   short   |      2      |       X        |                |             GTC             |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                             |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |           BTCUSD            |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |          46832152           |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                             |          |
| **ExecID**            |   long    |      8      |       \*       |                |                             |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                             |          |
| **RemainingQuantity** |  double   |      8      |                |                |                             |          |
| **ExecFee**           |  double   |      8      |                |                |                             |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                             |          |
| **TraderID**          | char\[\]  |      6      |                |                |          Not Used           | Not used |
| **RejectReason**      |   short   |      2      |                |                |                             |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                             |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |             506             |          |
| **Key**               |    Int    |      4      |       X        |                |            42341            |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                             |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                             |          |
| **Layers**            |   short   |      2      |                |                |                             |          |
| **SizeIncrement**     |  double   |      8      |                |                |                             |          |
| **PriceIncrement**    |  double   |      8      |                |                |                             |          |
| **PriceOffset**       |  double   |      8      |                |                |                             |          |
| **BOOrigPrice**       |  double   |      8      |                |                |           50100.5           | Note 10  |
| **ExecPrice**         |  double   |      8      |                |                |                             |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |           7948888           |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                             |          |
| **TriggerType**       |   short   |      2      |                |                |                             |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                             |  Note 7  |

#### QUOTE_FILL /PARTIAL

These two message types are generated when an incoming Quote interacts with a resting order \(order already on the book\). Upon receiving an Execution message, the order in the Market Data Order Book should be removed. Upon receiving an Execution Partial, the volume of the resting order should be updated to reﬂect the remaining order quantity.

| Field Name            | Data Type | Data Length | Required Field | Required Value |         Example Value         |  Notes   |
| :-------------------- | :-------: | :---------: | :------------: | :------------: | :---------------------------: | :------: |
| **Msg1**              |   char    |      1      |       X        |       T        |               T               |  Header  |
| **Msg2**              |   char    |      1      |                |                |                               |  Header  |
| **MsgLen**            |   short   |      2      |       X        |      238       |              238              |  Header  |
| **MessageType**       |   short   |      2      |       \*       |                | QUOTE_FILL/QUOTE_FILL_PARTIAL |          |
| **Padding**           |   short   |      2      |                |                |                               | Not used |
| **Account**           |    Int    |      4      |       X        |                |            100700             |          |
| **OrderID**           |   long    |      8      |       X        |                |           46832153            |          |
| **SymbolEnum**        |   short   |      2      |       X        |                |               1               |          |
| **OrderType**         |   short   |      2      |       X        |                |              LMT              |          |
| **SymbolType**        |   short   |      2      |       X        |                |             SPOT              |          |
| **BOPrice**           |  double   |      8      |       X        |                |            51102.5            |          |
| **BOSide**            |   short   |      2      |       X        |                |              BUY              |          |
| **BOOrderQty**        |  double   |      8      |       X        |                |              3.0              |          |
| **TIF**               |   short   |      2      |       X        |                |              GTC              |          |
| **StopLimitPrice**    |  double   |      8      |                |                |                               |          |
| **BOSymbol**          | char\[\]  |     12      |       X        |                |            BTCUSD             |          |
| **OrigOrderID**       |   long    |      8      |       X        |                |           46832152            |          |
| **BOCancelShares**    |  double   |      8      |       \*       |                |                               |          |
| **ExecID**            |   long    |      8      |       \*       |                |                               |          |
| **ExecShares**        |  double   |      8      |       \*       |                |                               |          |
| **RemainingQuantity** |  double   |      8      |                |                |                               |          |
| **ExecFee**           |  double   |      8      |                |                |                               |          |
| **ExpirationDate**    | char\[\]  |     12      |                |                |                               |          |
| **TraderID**          | char\[\]  |      6      |                |                |           Not Used            | Not used |
| **RejectReason**      |   short   |      2      |                |                |                               |          |
| **SendingTime**       | uint64_t  |      8      |       X        |                |                               |          |
| **TradingSessionID**  |    Int    |      4      |       X        |                |              506              |          |
| **Key**               |    Int    |      4      |       X        |                |             42341             |  Note 8  |
| **DisplaySize**       |  double   |      8      |       \*       |                |                               |          |
| **RefreshSize**       |  double   |      8      |       \*       |                |                               |          |
| **Layers**            |   short   |      2      |                |                |                               |          |
| **SizeIncrement**     |  double   |      8      |                |                |                               |          |
| **PriceIncrement**    |  double   |      8      |                |                |                               |          |
| **PriceOffset**       |  double   |      8      |                |                |                               |          |
| **BOOrigPrice**       |  double   |      8      |                |                |            50100.5            | Note 10  |
| **ExecPrice**         |  double   |      8      |                |                |                               |          |
| **MsgSeqNum**         |   long    |      8      |       X        |                |            7948888            |          |
| **TakeProfitPrice**   |  double   |      8      |                |                |                               |          |
| **TriggerType**       |   short   |      2      |                |                |                               |          |
| **Attributes**        | char\[\]  |     12      |       \*       |                |                               |  Note 7  |
