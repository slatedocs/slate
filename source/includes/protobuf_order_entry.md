## Protobuf Order Entry

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

```proto
message Bit24Transaction {
  string msg1 = 1;
  string msg2 = 2;
  int32 MessageType = 3;
  int32 UpdateType = 4;
  int32 Account = 5;
  int64 OrderId = 6;
  int32 SymbolEnum = 7;
  int32 OrderType = 8;
  int32 SymbolType = 9;
  double Bit24Price = 10;
  int32 Side = 11;
  double Bit24OrderQty = 12;
  int32 TIF = 13;
  double StopLimitPrice = 14;
  string Bit24Symbol = 15;
  int64 OrigOrderId = 16;
  double Bit24CancelShares = 17;
  int64 ExecID = 18;
  double ExecShares = 19;
  double RemainingQty = 20;
  double LimitCross = 21;
  string ExpirationDate = 22;
  string TraderID = 23;
  int32 RejectReason = 24;
  uint64 SendingTime = 25;
  int32 TradingSessionID = 26;
  int32 Key = 27;
  double DisplaySize = 28;
  double RefreshSize = 29;
  int32 Layers = 30;
  double SizeIncrement = 31;
  double PriceIncrement = 32;
  double PriceOffset = 33;
  double Bit24OriginalPrice = 34;
  double ExecPrice = 35;
  int64 MsgSeqID = 36;
  double TakeProfitPrice = 37;
  int32 TriggerType = 38;
  string Attributes = 39;
}
```

### Application Messages

#### LIMIT

##### New LIMIT order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |                |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 3  |
| **OrderType**         |   string   |      2      |       X        |                |      LMT      |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      LMT      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |     42341     |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### **Cancel Replace LIMIT Order - Client Sending**

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      LMT       |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     | Note 10  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      LMT      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: \*\*\*\*If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel LIMIT Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      LMT      |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   CANCELED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      LMT      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |   46832152    |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### MARKET

##### New MARKET order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      MKT      |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |                |                |               |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 4  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |                |                |               |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 5  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |                |                |               |          |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |    REJECT     |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      MKT      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |                |                |               |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |               |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### OCO

##### New OCO order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      OCO      |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |                |                |    50100.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      OCO      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    428888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace OCO Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      OCO       |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |    REPLACE    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      OCO      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel OCO Order - **Client Sending**

User wishes to cancel replace the order sent in the previous section**.**

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      OCO      |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   CANCELED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      OCO      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |   49200.00    |  Note 2  |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |   46832152    |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |       \*       |                |               |  Note 3  |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |  Note 4  |
| **RefreshSize**       |   double   |      8      |                |                |               |  Note 4  |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 5  |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### PEG

##### New PEG / PEG_HIDDEN Order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_NEW    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51100.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |                |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |      1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |                |          |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    79448888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   ORDER_ACK    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |          |
| **OrderType**         |   string   |      2      |       X        |                | PEG/PEG_HIDDEN |          |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51100.5     |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |                |          |
| **OrigOrderID**       |    long    |      8      |                |                |                |          |
| **BOCancelShares**    |   double   |      8      |                |                |                |          |
| **ExecID**            |    long    |      8      |                |                |                |          |
| **ExecShares**        |   double   |      8      |                |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |                |                |                |          |
| **DisplaySize**       |   double   |      8      |                |                |                |          |
| **RefreshSize**       |   double   |      8      |                |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |                |          |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |          |

**Note 1:**

If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace PEG / PEG_HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |     **\***     |    REPLACED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | PEG/PEG_HIDDEN |          |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |                |          |
| **BOCancelShares**    |   double   |      8      |                |                |                |          |
| **ExecID**            |    long    |      8      |                |                |                |          |
| **ExecShares**        |   double   |      8      |                |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |                |                |                |          |
| **DisplaySize**       |   double   |      8      |                |                |                |          |
| **RefreshSize**       |   double   |      8      |                |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |          |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel PEG / PEG_HIDDEN Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832152    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |    CANCELED    |    CANCELED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |          |
| **OrderType**         |   string   |      2      |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                |  Note 2  |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832152    |          |
| **BOCancelShares**    |   double   |      8      |                |                |                |          |
| **ExecID**            |    long    |      8      |                |                |                |          |
| **ExecShares**        |   double   |      8      |                |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |       \*       |                |                |  Note 3  |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |                |                |                |          |
| **DisplaySize**       |   double   |      8      |                |                |                |  Note 4  |
| **RefreshSize**       |   double   |      8      |                |                |                |  Note 4  |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |          |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 5  |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### HIDDEN

##### New HIDDEN Order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |    HIDDEN     |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       | ORDER_CANCELED |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |     HIDDEN     |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |     HIDDEN     |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |    46832152    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |                |                |                |          |
| **ExecID**            |    long    |      8      |                |                |                |          |
| **ExecShares**        |   double   |      8      |                |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |                |          |
| **RefreshSize**       |   double   |      8      |                |                |                |          |
| **Layers**            |   string   |      2      |                |                |                |          |
| **SizeIncrement**     |   double   |      8      |                |                |                |          |
| **PriceIncrement**    |   double   |      8      |                |                |                |          |
| **PriceOffset**       |   double   |      8      |                |                |                |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   CANCELED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |   46832152    |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### ICEBERG

##### New ICEBERG Order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      ICE      |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      | Note 13  |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |               |          |
| **Layers**            |   string   |      2      |       X        |                |               |  Note 9  |
| **SizeIncrement**     |   double   |      8      |       X        |                |               | Note 10  |
| **PriceIncrement**    |   double   |      8      |       X        |                |               | Note 11  |
| **PriceOffset**       |   double   |      8      |       X        |                |               | Note 12  |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      ICE      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51000.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace ICEBERG Order - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      ICE       |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       | Note 14  |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |    46832151    | Note 13  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |                |          |
| **RefreshSize**       |   double   |      8      |                |                |                |          |
| **Layers**            |   string   |      2      |       X        |                |                |  Note 9  |
| **SizeIncrement**     |   double   |      8      |       X        |                |                | Note 10  |
| **PriceIncrement**    |   double   |      8      |       X        |                |                | Note 11  |
| **PriceOffset**       |   double   |      8      |       X        |                |                | Note 12  |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5     | Note 13  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      ICE      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51000.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### **Cancel ICEBERG Order - Client Sending**

User wishes to cancel replace the order sent in the previous section. Please see the section titled ICE Orders.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T        |  Header  |
| **Msg2**              |   string   |      1      |                |                |                |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238       |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                | Not used |
| **Account**           |    Int     |      4      |       X        |                |     100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |    46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1        |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |      ICE       |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |      SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0       |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |    46832152    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                |          |
| **ExecID**            |    long    |      8      |       \*       |                |                |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                |          |
| **RemainingQuantity** |   double   |      8      |                |                |                |          |
| **ExecFee**           |   double   |      8      |                |                |                |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                |          |
| **TraderID**          | string\[\] |      6      |                |                |                | Not used |
| **RejectReason**      |   string   |      2      |                |                |                |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506       |          |
| **Key**               |    Int     |      4      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                |          |
| **Layers**            |   string   |      2      |       X        |                |                |          |
| **SizeIncrement**     |   double   |      8      |       X        |                |                |          |
| **PriceIncrement**    |   double   |      8      |       X        |                |                |          |
| **PriceOffset**       |   double   |      8      |       X        |                |                |          |
| **BOOrigPrice**       |   double   |      8      |       X        |                |                |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                |          |
| **TriggerType**       |   string   |      2      |                |                |                |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   CANCELED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |      ICE      |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |   46832152    |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### STOP MARKET/STOP LIMIT

##### New STOP_MKT/STOP_LMT - Client Sending

| Field Name            | Data Type  | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   string   |      1      |                |                |                    |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |     ORDER_NEW      |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                    | Not used |
| **Account**           |    Int     |      4      |       X        |                |       100700       |          |
| **OrderID**           |    long    |      8      |       X        |                |      46832151      |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |         1          |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |   double   |      8      |       X        |                |      50100.5       |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |        2.0         |          |
| **TIF**               |   string   |      2      |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                    |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |    long    |      8      |                |                |                    |          |
| **BOCancelShares**    |   double   |      8      |                |                |                    |          |
| **ExecID**            |    long    |      8      |                |                |                    |          |
| **ExecShares**        |   double   |      8      |                |                |                    |          |
| **RemainingQuantity** |   double   |      8      |                |                |                    |          |
| **ExecFee**           |   double   |      8      |                |                |                    |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                    |          |
| **TraderID**          | string\[\] |      6      |                |                |                    | Not used |
| **RejectReason**      |   string   |      2      |                |                |                    |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |        1000        |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |        506         |          |
| **Key**               |    Int     |      4      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |                    |          |
| **RefreshSize**       |   double   |      8      |                |                |                    |          |
| **Layers**            |   string   |      2      |                |                |                    |          |
| **SizeIncrement**     |   double   |      8      |                |                |                    |          |
| **PriceIncrement**    |   double   |      8      |                |                |                    |          |
| **PriceOffset**       |   double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |   double   |      8      |                |                |                    |          |
| **ExecPrice**         |   double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                    |          |
| **TriggerType**       |   string   |      2      |                |                |                    |          |
| **Attributes**        | string\[\] |     12      |                |                |                    |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   string   |      1      |                |                |                    |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |     ORDER_ACK      |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                    | Not used |
| **Account**           |    Int     |      4      |       X        |                |       100700       |          |
| **OrderID**           |    long    |      8      |       X        |                |      46832151      |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |         1          |          |
| **OrderType**         |   string   |      2      |       X        |                | STOP_MKT/ STOP_LMT |          |
| **SymbolType**        |   string   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |   double   |      8      |       X        |                |      50100.5       |          |
| **BOSide**            |   string   |      2      |       X        |                |        BUY         |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |        2.0         |          |
| **TIF**               |   string   |      2      |       X        |                |        GTC         |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                    |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |    long    |      8      |                |                |                    |          |
| **BOCancelShares**    |   double   |      8      |                |                |                    |          |
| **ExecID**            |    long    |      8      |                |                |                    |          |
| **ExecShares**        |   double   |      8      |                |                |                    |          |
| **RemainingQuantity** |   double   |      8      |                |                |                    |          |
| **ExecFee**           |   double   |      8      |                |                |                    |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                    |          |
| **TraderID**          | string\[\] |      6      |                |                |                    | Not used |
| **RejectReason**      |   string   |      2      |                |                |                    |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |        506         |          |
| **Key**               |    Int     |      4      |                |                |                    |          |
| **DisplaySize**       |   double   |      8      |                |                |                    |          |
| **RefreshSize**       |   double   |      8      |                |                |                    |          |
| **Layers**            |   string   |      2      |                |                |                    |          |
| **SizeIncrement**     |   double   |      8      |                |                |                    |          |
| **PriceIncrement**    |   double   |      8      |                |                |                    |          |
| **PriceOffset**       |   double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |   double   |      8      |                |                |                    |          |
| **ExecPrice**         |   double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |      4248888       |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                    |          |
| **TriggerType**       |   string   |      2      |                |                |                    |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                    |          |

**Notes:**

If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace **STOP_MKT/STOP\_**LMT Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   string   |      1      |                |                |                    |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_REPLACE    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                    | Not used |
| **Account**           |    Int     |      4      |       X        |                |       100700       |          |
| **OrderID**           |    long    |      8      |       X        |                |      46832152      |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |         1          |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |   double   |      8      |       X        |                |      51102.5       |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |        3.0         |          |
| **TIF**               |   string   |      2      |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                    |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |    long    |      8      |                |                |      46832151      |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                    |          |
| **ExecID**            |    long    |      8      |       \*       |                |                    |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                    |          |
| **RemainingQuantity** |   double   |      8      |                |                |                    |          |
| **ExecFee**           |   double   |      8      |                |                |                    |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                    |          |
| **TraderID**          | string\[\] |      6      |                |                |                    | Not used |
| **RejectReason**      |   string   |      2      |                |                |                    |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |        506         |          |
| **Key**               |    Int     |      4      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                    |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                    |          |
| **Layers**            |   string   |      2      |                |                |                    |          |
| **SizeIncrement**     |   double   |      8      |                |                |                    |          |
| **PriceIncrement**    |   double   |      8      |                |                |                    |          |
| **PriceOffset**       |   double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |   double   |      8      |                |                |      50100.5       |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                    |          |
| **TriggerType**       |   string   |      2      |                |                |                    |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                    |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   string   |      1      |                |                |                    |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |      REPLACED      |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                    | Not used |
| **Account**           |    Int     |      4      |       X        |                |       100700       |          |
| **OrderID**           |    long    |      8      |       X        |                |      46832152      |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |         1          |          |
| **OrderType**         |   string   |      2      |       X        |                | STOP_MKT/ STOP_LMT |          |
| **SymbolType**        |   string   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |   double   |      8      |       X        |                |      50100.5       |          |
| **BOSide**            |   string   |      2      |       X        |                |        BUY         |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |        3.0         |          |
| **TIF**               |   string   |      2      |       X        |                |        GTC         |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                    |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |    long    |      8      |                |                |                    |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                    |          |
| **ExecID**            |    long    |      8      |       \*       |                |                    |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                    |          |
| **RemainingQuantity** |   double   |      8      |                |                |                    |          |
| **ExecFee**           |   double   |      8      |                |                |                    |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                    |          |
| **TraderID**          | string\[\] |      6      |                |                |                    | Not used |
| **RejectReason**      |   string   |      2      |                |                |                    |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |        506         |          |
| **Key**               |    Int     |      4      |                |                |                    |          |
| **DisplaySize**       |   double   |      8      |                |                |                    |          |
| **RefreshSize**       |   double   |      8      |                |                |                    |          |
| **Layers**            |   string   |      2      |                |                |                    |          |
| **SizeIncrement**     |   double   |      8      |                |                |                    |          |
| **PriceIncrement**    |   double   |      8      |                |                |                    |          |
| **PriceOffset**       |   double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |   double   |      8      |                |                |      50100.5       |          |
| **ExecPrice**         |   double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |      4248888       |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                    |          |
| **TriggerType**       |   string   |      2      |                |                |                    |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                    |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel STOP_MKT/STOP_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :----------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |         T          |  Header  |
| **Msg2**              |   string   |      1      |                |                |                    |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |        238         |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |    ORDER_CANCEL    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                    | Not used |
| **Account**           |    Int     |      4      |       X        |                |       100700       |          |
| **OrderID**           |    long    |      8      |       X        |                |      46832153      |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |         1          |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |        SPOT        |          |
| **BOPrice**           |   double   |      8      |       X        |                |      51102.5       |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |        3.0         |          |
| **TIF**               |   string   |      2      |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                    |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |    long    |      8      |                |                |      46832152      |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                    |          |
| **ExecID**            |    long    |      8      |       \*       |                |                    |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                    |          |
| **RemainingQuantity** |   double   |      8      |                |                |                    |          |
| **ExecFee**           |   double   |      8      |                |                |                    |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                    |          |
| **TraderID**          | string\[\] |      6      |                |                |                    | Not used |
| **RejectReason**      |   string   |      2      |                |                |                    |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                    |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |        506         |          |
| **Key**               |    Int     |      4      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                    |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                    |          |
| **Layers**            |   string   |      2      |                |                |                    |          |
| **SizeIncrement**     |   double   |      8      |                |                |                    |          |
| **PriceIncrement**    |   double   |      8      |                |                |                    |          |
| **PriceOffset**       |   double   |      8      |                |                |                    |          |
| **BOOrigPrice**       |   double   |      8      |                |                |      50100.5       |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                    |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                    |          |
| **TriggerType**       |   string   |      2      |                |                |                    |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                    |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value      |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :--------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T            |  Header  |
| **Msg2**              |   string   |      1      |                |                |                        |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238           |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |        CANCELED        |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                        | Not used |
| **Account**           |    Int     |      4      |       X        |                |         100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |        46832153        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1            |          |
| **OrderType**         |   string   |      2      |       X        |                |   STOP_MKT/ STOP_LMT   |          |
| **SymbolType**        |   string   |      2      |       X        |                |          SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        50100.5         |          |
| **BOSide**            |   string   |      2      |       X        |                |          BUY           |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0           |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC           |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                        |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |         BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |                |                |        46832152        |          |
| **BOCancelShares**    |   double   |      8      |                |                |                        |          |
| **ExecID**            |    long    |      8      |                |                |                        |          |
| **ExecShares**        |   double   |      8      |                |                |                        |          |
| **RemainingQuantity** |   double   |      8      |                |                |                        |          |
| **ExecFee**           |   double   |      8      |                |                |                        |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                        |          |
| **TraderID**          | string\[\] |      6      |                |                |                        | Not used |
| **RejectReason**      |   string   |      2      |                |                |                        |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                | 184467440 737095515 30 |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506           |          |
| **Key**               |    Int     |      4      |                |                |                        |          |
| **DisplaySize**       |   double   |      8      |                |                |                        |          |
| **RefreshSize**       |   double   |      8      |                |                |                        |          |
| **Layers**            |   string   |      2      |                |                |                        |          |
| **SizeIncrement**     |   double   |      8      |                |                |                        |          |
| **PriceIncrement**    |   double   |      8      |                |                |                        |          |
| **PriceOffset**       |   double   |      8      |                |                |                        |          |
| **BOOrigPrice**       |   double   |      8      |                |                |        50100.5         |          |
| **ExecPrice**         |   double   |      8      |                |                |                        |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        4248888         |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                        |          |
| **TriggerType**       |   string   |      2      |                |                |                        |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                        |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### TRAILING STOP MARKET/TRAILING STOP LIMIT

##### New TSM/TSL Order - Client Sending

TSM order are trailing stop market orders. TSL orders are trailing stop limit orders.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51000.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832151    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |    TSL/TSM    |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      2.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |               |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace TSM/TSL Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_REPLACE |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |   46832151    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |                |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832152    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |          |
| **OrderType**         |   string   |      2      |       X        |                |    TSL/TSM    |          |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    50100.5    |          |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |          |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |               |          |
| **BOCancelShares**    |   double   |      8      |                |                |               |          |
| **ExecID**            |    long    |      8      |                |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |                |                |               |          |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    |          |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel TSL/TSM Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-----------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |       T       |  Header  |
| **Msg2**              |   string   |      1      |                |                |               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |      238      |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   string   |      2      |                |                |               | Not used |
| **Account**           |    Int     |      4      |       X        |                |    100700     |          |
| **OrderID**           |    long    |      8      |       X        |                |   46832153    |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |       1       |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |     SPOT      |          |
| **BOPrice**           |   double   |      8      |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |      3.0      |          |
| **TIF**               |   string   |      2      |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |    long    |      8      |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |               |          |
| **ExecID**            |    long    |      8      |       \*       |                |               |          |
| **ExecShares**        |   double   |      8      |                |                |               |          |
| **RemainingQuantity** |   double   |      8      |                |                |               |          |
| **ExecFee**           |   double   |      8      |                |                |               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |               |          |
| **TraderID**          | string\[\] |      6      |                |                |               | Not used |
| **RejectReason**      |   string   |      2      |                |                |               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |      506      |          |
| **Key**               |    Int     |      4      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |               |          |
| **RefreshSize**       |   double   |      8      |                |                |               |          |
| **Layers**            |   string   |      2      |                |                |               |          |
| **SizeIncrement**     |   double   |      8      |                |                |               |          |
| **PriceIncrement**    |   double   |      8      |                |                |               |          |
| **PriceOffset**       |   double   |      8      |                |                |               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |   double   |      8      |                |                |               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |               |          |
| **TriggerType**       |   string   |      2      |                |                |               |          |
| **Attributes**        | string\[\] |     12      |                |                |               |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value      |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :--------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T            |  Header  |
| **Msg2**              |   string   |      1      |                |                |                        |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238           |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |        CANCELED        |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                        | Not used |
| **Account**           |    Int     |      4      |       X        |                |         100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |        46832153        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1            |          |
| **OrderType**         |   string   |      2      |       X        |                |        TSL/TSM         |          |
| **SymbolType**        |   string   |      2      |       X        |                |          SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        50102.5         |          |
| **BOSide**            |   string   |      2      |       X        |                |          BUY           |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0           |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC           |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                        |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |         BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |        46832152        |          |
| **BOCancelShares**    |   double   |      8      |                |                |                        |          |
| **ExecID**            |    long    |      8      |                |                |                        |          |
| **ExecShares**        |   double   |      8      |                |                |                        |          |
| **RemainingQuantity** |   double   |      8      |                |                |                        |          |
| **ExecFee**           |   double   |      8      |                |                |                        |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                        |          |
| **TraderID**          | string\[\] |      6      |                |                |                        | Not used |
| **RejectReason**      |   string   |      2      |                |                |                        |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                | 184467440 737095515 30 |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506           |          |
| **Key**               |    Int     |      4      |                |                |                        |          |
| **DisplaySize**       |   double   |      8      |                |                |                        |          |
| **RefreshSize**       |   double   |      8      |                |                |                        |          |
| **Layers**            |   string   |      2      |                |                |                        |          |
| **SizeIncrement**     |   double   |      8      |                |                |                        |          |
| **PriceIncrement**    |   double   |      8      |                |                |                        |          |
| **PriceOffset**       |   double   |      8      |                |                |                        |          |
| **BOOrigPrice**       |   double   |      8      |                |                |        50100.5         |          |
| **ExecPrice**         |   double   |      8      |                |                |                        |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        4248888         |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                        |          |
| **TriggerType**       |   string   |      2      |                |                |                        |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                        |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### SNIPER MARKET/SNIPER LIMIT

##### New SNIPER_MKT/SNIPER_LMT Order - Client Sending

Sniper orders allow a user to wait for a price to reach a certain price and then interact with the market at that previously set price.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   string   |      1      |                |                |                       |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |       ORDER_NEW       |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                       | Not used |
| **Account**           |    Int     |      4      |       X        |                |        100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |       46832151        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1           |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        50100.5        |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |          2.0          |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                       |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |                |                |                       |          |
| **BOCancelShares**    |   double   |      8      |                |                |                       |          |
| **ExecID**            |    long    |      8      |                |                |                       |          |
| **ExecShares**        |   double   |      8      |                |                |                       |          |
| **RemainingQuantity** |   double   |      8      |                |                |                       |          |
| **ExecFee**           |   double   |      8      |                |                |                       |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                       |          |
| **TraderID**          | string\[\] |      6      |                |                |                       | Not used |
| **RejectReason**      |   string   |      2      |                |                |                       |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506          |          |
| **Key**               |    Int     |      4      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |                       |          |
| **RefreshSize**       |   double   |      8      |                |                |                       |          |
| **Layers**            |   string   |      2      |                |                |                       |          |
| **SizeIncrement**     |   double   |      8      |                |                |                       |          |
| **PriceIncrement**    |   double   |      8      |                |                |                       |          |
| **PriceOffset**       |   double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |   double   |      8      |                |                |                       |          |
| **ExecPrice**         |   double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                       |          |
| **TriggerType**       |   string   |      2      |                |                |                       |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                       |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   string   |      1      |                |                |                       |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |       ORDER_ACK       |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                       | Not used |
| **Account**           |    Int     |      4      |       X        |                |        100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |       46832151        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1           |          |
| **OrderType**         |   string   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   string   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        50102.5        |          |
| **BOSide**            |   string   |      2      |       X        |                |          BUY          |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC          |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                       |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |                |                |                       |          |
| **BOCancelShares**    |   double   |      8      |                |                |                       |          |
| **ExecID**            |    long    |      8      |                |                |                       |          |
| **ExecShares**        |   double   |      8      |                |                |                       |          |
| **RemainingQuantity** |   double   |      8      |                |                |                       |          |
| **ExecFee**           |   double   |      8      |                |                |                       |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                       |          |
| **TraderID**          | string\[\] |      6      |                |                |                       | Not used |
| **RejectReason**      |   string   |      2      |                |                |                       |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                       |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506          |          |
| **Key**               |    Int     |      4      |                |                |                       |          |
| **DisplaySize**       |   double   |      8      |                |                |                       |          |
| **RefreshSize**       |   double   |      8      |                |                |                       |          |
| **Layers**            |   string   |      2      |                |                |                       |          |
| **SizeIncrement**     |   double   |      8      |                |                |                       |          |
| **PriceIncrement**    |   double   |      8      |                |                |                       |          |
| **PriceOffset**       |   double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |   double   |      8      |                |                |                       |          |
| **ExecPrice**         |   double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                       |          |
| **TriggerType**       |   string   |      2      |                |                |                       |          |
| **Attributes**        | string\[\] |     12      |                |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace SNIPER_MKT/SNIPER_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   string   |      1      |                |                |                       |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |    CANCEL_REPLACE     |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                       | Not used |
| **Account**           |    Int     |      4      |       X        |                |        100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |       46832152        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1           |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        51101.5        |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                       |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |                |                |       46832151        |  Note 9  |
| **BOCancelShares**    |   double   |      8      |                |                |                       |          |
| **ExecID**            |    long    |      8      |                |                |                       |          |
| **ExecShares**        |   double   |      8      |                |                |                       |          |
| **RemainingQuantity** |   double   |      8      |                |                |                       |          |
| **ExecFee**           |   double   |      8      |                |                |                       |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                       |          |
| **TraderID**          | string\[\] |      6      |                |                |                       | Not used |
| **RejectReason**      |   string   |      2      |                |                |                       |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506          |          |
| **Key**               |    Int     |      4      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |   double   |      8      |                |                |                       |          |
| **RefreshSize**       |   double   |      8      |                |                |                       |          |
| **Layers**            |   string   |      2      |                |                |                       |          |
| **SizeIncrement**     |   double   |      8      |                |                |                       |          |
| **PriceIncrement**    |   double   |      8      |                |                |                       |          |
| **PriceOffset**       |   double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |   double   |      8      |                |                |        50100.5        |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                       |          |
| **TriggerType**       |   string   |      2      |                |                |                       |          |
| **Attributes**        | string\[\] |     12      |                |                |                       |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   string   |      1      |                |                |                       |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |       REPLACED        |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                       | Not used |
| **Account**           |    Int     |      4      |       X        |                |        100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |       46832152        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1           |          |
| **OrderType**         |   string   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   string   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        50100.5        |          |
| **BOSide**            |   string   |      2      |       X        |                |          BUY          |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC          |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                       |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |                |                |                       |          |
| **BOCancelShares**    |   double   |      8      |                |                |                       |          |
| **ExecID**            |    long    |      8      |                |                |                       |          |
| **ExecShares**        |   double   |      8      |                |                |                       |          |
| **RemainingQuantity** |   double   |      8      |                |                |                       |          |
| **ExecFee**           |   double   |      8      |                |                |                       |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                       |          |
| **TraderID**          | string\[\] |      6      |                |                |                       | Not used |
| **RejectReason**      |   string   |      2      |                |                |                       |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                       |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506          |          |
| **Key**               |    Int     |      4      |                |                |                       |          |
| **DisplaySize**       |   double   |      8      |                |                |                       |          |
| **RefreshSize**       |   double   |      8      |                |                |                       |          |
| **Layers**            |   string   |      2      |                |                |                       |          |
| **SizeIncrement**     |   double   |      8      |                |                |                       |          |
| **PriceIncrement**    |   double   |      8      |                |                |                       |          |
| **PriceOffset**       |   double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |   double   |      8      |                |                |        50100.5        |          |
| **ExecPrice**         |   double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                       |          |
| **TriggerType**       |   string   |      2      |                |                |                       |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel SNIPER_MKT/SNIPER_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   string   |      1      |                |                |                       |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                |    ORDER_CANCELED     |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                       | Not used |
| **Account**           |    Int     |      4      |       X        |                |        100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |       46832153        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1           |  Note 2  |
| **OrderType**         |   string   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   string   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        51102.5        |  Note 4  |
| **BOSide**            |   string   |      2      |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |   double   |      8      |                |                |                       |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |                |                |       46832151        |  Note 9  |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                       |          |
| **ExecID**            |    long    |      8      |       \*       |                |                       |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                       |          |
| **RemainingQuantity** |   double   |      8      |                |                |                       |          |
| **ExecFee**           |   double   |      8      |                |                |                       |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                       |          |
| **TraderID**          | string\[\] |      6      |                |                |                       | Not used |
| **RejectReason**      |   string   |      2      |                |                |                       |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506          |          |
| **Key**               |    Int     |      4      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                       |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                       |          |
| **Layers**            |   string   |      2      |                |                |                       |          |
| **SizeIncrement**     |   double   |      8      |                |                |                       |          |
| **PriceIncrement**    |   double   |      8      |                |                |                       |          |
| **PriceOffset**       |   double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |   double   |      8      |                |                |        50100.5        |  Note 9  |
| **ExecPrice**         |   double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                       |          |
| **TriggerType**       |   string   |      2      |                |                |                       |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                       |  Note 7  |

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

| Field Name            | Data Type  | Data Length | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |           T           |  Header  |
| **Msg2**              |   string   |      1      |                |                |                       |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |          238          |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       |       CANCELED        |  Note 1  |
| **Padding**           |   string   |      2      |                |                |                       | Not used |
| **Account**           |    Int     |      4      |       X        |                |        100700         |          |
| **OrderID**           |    long    |      8      |       X        |                |       46832153        |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |           1           |          |
| **OrderType**         |   string   |      2      |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   string   |      2      |       X        |                |         SPOT          |          |
| **BOPrice**           |   double   |      8      |       X        |                |        51102.5        |          |
| **BOSide**            |   string   |      2      |       X        |                |          BUY          |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |          3.0          |          |
| **TIF**               |   string   |      2      |       X        |                |          GTC          |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                       |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |       46832152        |          |
| **BOCancelShares**    |   double   |      8      |                |                |                       |          |
| **ExecID**            |    long    |      8      |                |                |                       |          |
| **ExecShares**        |   double   |      8      |                |                |                       |          |
| **RemainingQuantity** |   double   |      8      |                |                |                       |          |
| **ExecFee**           |   double   |      8      |                |                |                       |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                       |          |
| **TraderID**          | string\[\] |      6      |                |                |                       | Not used |
| **RejectReason**      |   string   |      2      |                |                |                       |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                       |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |          506          |          |
| **Key**               |    Int     |      4      |                |                |                       |          |
| **DisplaySize**       |   double   |      8      |                |                |                       |          |
| **RefreshSize**       |   double   |      8      |                |                |                       |          |
| **Layers**            |   string   |      2      |                |                |                       |          |
| **SizeIncrement**     |   double   |      8      |                |                |                       |          |
| **PriceIncrement**    |   double   |      8      |                |                |                       |          |
| **PriceOffset**       |   double   |      8      |                |                |                       |          |
| **BOOrigPrice**       |   double   |      8      |                |                |        50100.5        |          |
| **ExecPrice**         |   double   |      8      |                |                |                       |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                       |          |
| **TriggerType**       |   string   |      2      |                |                |                       |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### EXECUTION/EXECUTION PARTIAL

These two message types are generated when an incoming Quote interacts with a resting order \(order already on the book\). Upon receiving an Execution message, the order in the Market Data Order Book should be removed. Upon receiving an Execution Partial, the volume of the resting order should be updated to reﬂect the remaining order quantity.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |        Example Value        |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :-------------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |              T              |  Header  |
| **Msg2**              |   string   |      1      |                |                |                             |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |             238             |  Header  |
| **MessageType**       |   string   |      2      |       \*       |       \*       | EXECUTION/EXECUTION_PARTIAL |          |
| **Padding**           |   string   |      2      |                |                |                             | Not used |
| **Account**           |    Int     |      4      |       X        |                |           100700            |          |
| **OrderID**           |    long    |      8      |       X        |                |          46832153           |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |              1              |          |
| **OrderType**         |   string   |      2      |       X        |                |             LMT             |          |
| **SymbolType**        |   string   |      2      |       X        |                |            SPOT             |          |
| **BOPrice**           |   double   |      8      |       X        |                |           51102.5           |          |
| **BOSide**            |   string   |      2      |       X        |                |             BUY             |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |             3.0             |          |
| **TIF**               |   string   |      2      |       X        |                |             GTC             |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                             |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |           BTCUSD            |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |          46832152           |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                             |          |
| **ExecID**            |    long    |      8      |       \*       |                |                             |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                             |          |
| **RemainingQuantity** |   double   |      8      |                |                |                             |          |
| **ExecFee**           |   double   |      8      |                |                |                             |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                             |          |
| **TraderID**          | string\[\] |      6      |                |                |          Not Used           | Not used |
| **RejectReason**      |   string   |      2      |                |                |                             |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                             |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |             506             |          |
| **Key**               |    Int     |      4      |       X        |                |            42341            |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                             |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                             |          |
| **Layers**            |   string   |      2      |                |                |                             |          |
| **SizeIncrement**     |   double   |      8      |                |                |                             |          |
| **PriceIncrement**    |   double   |      8      |                |                |                             |          |
| **PriceOffset**       |   double   |      8      |                |                |                             |          |
| **BOOrigPrice**       |   double   |      8      |                |                |           50100.5           | Note 10  |
| **ExecPrice**         |   double   |      8      |                |                |                             |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |           7948888           |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                             |          |
| **TriggerType**       |   string   |      2      |                |                |                             |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                             |  Note 7  |

#### QUOTE_FILL /PARTIAL

These two message types are generated when an incoming Quote interacts with a resting order \(order already on the book\). Upon receiving an Execution message, the order in the Market Data Order Book should be removed. Upon receiving an Execution Partial, the volume of the resting order should be updated to reﬂect the remaining order quantity.

| Field Name            | Data Type  | Data Length | Required Field | Required Value |         Example Value         |  Notes   |
| :-------------------- | :--------: | :---------: | :------------: | :------------: | :---------------------------: | :------: |
| **Msg1**              |   string   |      1      |       X        |       T        |               T               |  Header  |
| **Msg2**              |   string   |      1      |                |                |                               |  Header  |
| **MsgLen**            |   string   |      2      |       X        |      238       |              238              |  Header  |
| **MessageType**       |   string   |      2      |       \*       |                | QUOTE_FILL/QUOTE_FILL_PARTIAL |          |
| **Padding**           |   string   |      2      |                |                |                               | Not used |
| **Account**           |    Int     |      4      |       X        |                |            100700             |          |
| **OrderID**           |    long    |      8      |       X        |                |           46832153            |          |
| **SymbolEnum**        |   string   |      2      |       X        |                |               1               |          |
| **OrderType**         |   string   |      2      |       X        |                |              LMT              |          |
| **SymbolType**        |   string   |      2      |       X        |                |             SPOT              |          |
| **BOPrice**           |   double   |      8      |       X        |                |            51102.5            |          |
| **BOSide**            |   string   |      2      |       X        |                |              BUY              |          |
| **BOOrderQty**        |   double   |      8      |       X        |                |              3.0              |          |
| **TIF**               |   string   |      2      |       X        |                |              GTC              |          |
| **StopLimitPrice**    |   double   |      8      |                |                |                               |          |
| **BOSymbol**          | string\[\] |     12      |       X        |                |            BTCUSD             |          |
| **OrigOrderID**       |    long    |      8      |       X        |                |           46832152            |          |
| **BOCancelShares**    |   double   |      8      |       \*       |                |                               |          |
| **ExecID**            |    long    |      8      |       \*       |                |                               |          |
| **ExecShares**        |   double   |      8      |       \*       |                |                               |          |
| **RemainingQuantity** |   double   |      8      |                |                |                               |          |
| **ExecFee**           |   double   |      8      |                |                |                               |          |
| **ExpirationDate**    | string\[\] |     12      |                |                |                               |          |
| **TraderID**          | string\[\] |      6      |                |                |           Not Used            | Not used |
| **RejectReason**      |   string   |      2      |                |                |                               |          |
| **SendingTime**       |  uint64_t  |      8      |       X        |                |                               |          |
| **TradingSessionID**  |    Int     |      4      |       X        |                |              506              |          |
| **Key**               |    Int     |      4      |       X        |                |             42341             |  Note 8  |
| **DisplaySize**       |   double   |      8      |       \*       |                |                               |          |
| **RefreshSize**       |   double   |      8      |       \*       |                |                               |          |
| **Layers**            |   string   |      2      |                |                |                               |          |
| **SizeIncrement**     |   double   |      8      |                |                |                               |          |
| **PriceIncrement**    |   double   |      8      |                |                |                               |          |
| **PriceOffset**       |   double   |      8      |                |                |                               |          |
| **BOOrigPrice**       |   double   |      8      |                |                |            50100.5            | Note 10  |
| **ExecPrice**         |   double   |      8      |                |                |                               |          |
| **MsgSeqNum**         |    long    |      8      |       X        |                |            7948888            |          |
| **TakeProfitPrice**   |   double   |      8      |                |                |                               |          |
| **TriggerType**       |   string   |      2      |                |                |                               |          |
| **Attributes**        | string\[\] |     12      |       \*       |                |                               |  Note 7  |
