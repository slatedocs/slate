# Binary

## Binary Overview

Overview

### Messaging Overview

Each message in the API is preceded by a 4 byte header. This header conveys the following information:

- Message type. The ﬁrst byte of the header is always a character indicating the type of message to follow. Example: data[0] = ‘T’. The second byte is reserved to accommodate double character message types.
- Immediately following the 2 byte message type is a 2 byte short integer containing the total length of the message including the 4 byte message header. The length is a short integer (2 bytes) and is found in the 3rd and 4th bytes of the header.

| Field Name | Data type | Data Length | Buffer Offset | Example Value |
| ---------- | --------- | ----------- | ------------- | ------------- |
| Data1      | char      | 1           | 0             | 'H'           |
| Data2      | char      | 1           | 1             |
| Data3      | short     | 2           | 2             | 161           |

### Application Messages

Application messages contain the data necessary to perform the operations indicated by the message type. Application messages always contain the 4 byte header followed by the actual data message. The type of message which follows the header is always found in the 1st byte of the header as described above. The length of the message including the header is always found in the 3rd and 4th bytes of the header as described above.

1. Excel spreadsheets for each message in the API are included with the documentation. All spreadsheets include:
   1. Message Name
   2. Field Names
   3. Data type of each ﬁeld
   4. Buﬀer oﬀset of each ﬁeld in the message buﬀer for sending/receiving.
   5. Total length of the message
   6. Required ﬁelds for client and server
2. The following messages are included in the API
   1. BOClientLogon
   2. BOHeartbeat
   3. BOTestrequest
   4. BOInstrumentRequest
   5. BOInstrument
   6. BORiskUpdateRequest
   7. BORiskUserSymbol
   8. BOOpenOrderRequest
   9. BOInvalidMsg
   10. BOReject
   11. BOTransaction
   12. BOCollateralRequest
   13. BOCollateralUpdate

## Binary Websockets

### Session Management

#### BOClientLogon -- Client Sending

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

This endpoint retrieves all kittens.

##### HTTP Request

`POST http://bo.market.com msg1=H&LogonType=2&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

##### Query Parameters

DESCRIPTION

| Field Name       | Data Type | Required | Notes |
| ---------------- | --------- | -------- | ----- |
| Data1            | char      | X        |
| LogonType        | short     | X        |
| Account          | Int       | X        |
| UserName         | char[]    | X        |
| TradingSessionID | Int       | X        |
| SendingTime      | Long      | X        |
| MsgSeqNum        | Int       | X        |
| Key              | Int       | X        |

#### BOClientLogon/Logout -- Server Response

DESCRIPTION

| Field Name       | Data Type    | Data Length | Buffer Offset | Required Field | Required Value | Example Value     | Notes    |
| ---------------- | ------------ | ----------- | ------------- | -------------- | -------------- | ----------------- | -------- |
| Data1            | char         | 1           | 0             | X              | H              | H                 | Header   |
| Data2            | char         | 1           | 1             |                |                |                   | Header   |
| Data3            | short        | 2           | 2             | X              | 143            | 143               | Header   |
| LogonType        | short        | 2           | 4             |                |                | 1                 | Note 1   |
| Account          | Int          | 4           | 6             | \*             |                | 253336            | Note 2   |
| 2FA              | char[]       | 6           | 10            | X              |                | 1F6A              | Note 3   |
| UserName         | char[]       | 6           | 16            | X              |                | BOU1              | Note 2   |
| TradingSessionID | Int          | 4           | 22            | X              |                | 505               | Note 2   |
| PrimaryOESIP     | char[]       | 24          | 26            | \*             |                | 192.0.0.1:4300 5  | Note 4   |
| SecondaryOESIP   | char[]       | 24          | 50            | \*             |                | 113.50.1.1:430 05 | Note 4   |
| PrimaryMDIP      | char[]       | 24          | 74            |                |                |                   | Not Used |
| SecondaryIP      | char[]       | 24          | 98            |                |                |                   | Not Used |
| SendingTime      | Long         | 8           | 122           |                |                |                   | Note 5   |
| MsgSeqNum        | Int          | 4           | 130           | X              |                | 1500201           |
| Key              | Int          | 4           | 134           |                |                | 432451            |
| LoginStatus      | short        | 1           | 138           |                |                |                   | Not Used |
| RejectReason     | short        | 2           | 140           | \*             |                |                   | Note 6   |
| RiskMaster       | char         | 1           | 142           |                |                |                   | Note 7   |
|                  | Total Length | 143         |               |                |                |                   |

##### Notes:

1. LogonType is a short enum (see Client logon above for possible values)
2. TradingSessionID, UserName and Account number included in logon response but may or may not be included in logout messages.
3. Disabled for testing.
4. Not included in logout messages (LogonType = 2)
5. Sending times are in nanoseconds from the epoch, January 1, 1970.
6. If the login was rejected, the reject reason will be in the ﬁeld RejectReason
7. Not currently used, for future expansion.

### Application Messages

#### BOTransaction

BOTransaction message is used to enter new orders, cancel orders and cancel replace orders. The MES \(Matching Engine Server\) responds to these orders and conveys the results of new orders, cancellations, cancel replaces, partial executions and executions with the BOTransaction message. The message type in the BOTransaction should not be confused with the message type in the message header. The header message type will always be ‘T’ in byte 1 of the header. The sub message types in the table below will always be in byte 5 of the data buﬀer.

##### Message Types

| Enum Name: MessageType       | Enum Value | Notes  |
| :--------------------------- | :--------: | :----: |
| **ORDER_NEW**                |     1      |        |
| **CANCEL_REPLACE**           |     2      |        |
| **MARGIN_CANCEL_REPLACE**    |     3      | Note 1 |
| **MARGIN_EXECUTE**           |     4      | Note 2 |
| **ORDER_STATUS**             |     5      |        |
| **ORDER_CANCEL**             |     6      |        |
| **MARGIN_CANCEL**            |     7      | Note 1 |
| **EXECUTION**                |     8      |        |
| **EXECUTION_PARTIAL**        |     9      |        |
| **MARGIN_EXECUTION**         |     10     | Note 2 |
| **MARGIN_PARTIAL_EXECUTION** |     11     |        |
| **REJECT**                   |     12     | Note 3 |
| **ORDER_REJECT**             |     13     | Note 3 |
| **ORDER_ACK**                |     14     |        |
| **CANCELLED**                |     15     |        |
| **REPLACED**                 |     16     |        |
| **QUOTE_FILL**               |     17     | Note 4 |
| **QUOTE_FILL_PARTIAL**       |     18     |        |
| **MARGIN_REPLACED**          |     19     | Note 1 |
| **CANCEL_REPLACE_REJECT**    |     20     |        |

###### Notes:

Note 1: In some instances, the risk engine may ask the matching engine to cancel replace user orders to reduce the desired size to prevent exceeding the available equity.

Note 2: In the event the user exceeds their available equity the risk engine will reduce their position until the position is within the available equity.

Note 3: Orders may be rejected by the risk engine or the MES due to equity limits or TIF parameters or missing or wrong data in a message ﬁeld.

Note 4: QUOTE_FILL and QUOTE_FILL_PARTIAL are executions of user orders which have not been placed on the book \(orders placed on the book are commonly called resting orders\) and cross the top of book price and interact with a resting order.

##### Order Types

| Enum Name: OrdType | Enum Value |           Notes           |
| :----------------- | :--------: | :-----------------------: |
| **LMT**            |     1      |                           |
| **MKT**            |     2      |                           |
| **STOP_MKT**       |     3      |                           |
| **STOP_LMT**       |     4      | Not currently implemented |
| **PEG**            |     5      |                           |
| **HIDDEN**         |     6      |                           |
| **PEG_HIDDEN**     |     7      |                           |
| **OCO**            |     8      |                           |
| **ICE**            |     9      |                           |
| **OCO_ICE**        |     10     | Not currently implemented |
| **BRACKET**        |     11     | Not currently implemented |
| **SNIPER_MKT**     |     12     |                           |
| **SNIPER_LMT**     |     13     |                           |
| **TSM**            |     14     |                           |
| **TSL**            |     15     |                           |
| **TPSL_MARKET**    |     16     | Not currently implemented |
| **TPSL_LIMIT**     |     17     | Not currently implemented |

##### Attributes

Attributes can be assigned to various orders. Attributes are used to add additional functionality such as display/refresh attributes to aﬀect the volume and order displays at various stages of its execution cycle. The attribute ﬁeld is a character array consisting of 12 slots which can be used to set one of 12 different attributes. A value of ‘Y’ in the attribute array indicates this attribute is to be applied to the order in question. A value of ‘N’ indicates this attribute is to be ignored for the order in question.

| Attributes                |  Value  |        Notes         |
| :------------------------ | :-----: | :------------------: |
| **POPPED_TYPE**           | ‘Y’/’N’ |  Internal use only   |
| **HIDDEN_ATTRIBUTE**      | ‘Y’/’N’ |        Note 1        |
| **DISPLAYSIZE_ATTRIBUTE** | ‘Y’/’N’ |        Note 2        |
| **STOPMKT_ATTRIBUTE**     | ‘Y’/’N’ | Not currently in use |
| **STOPLMT_ATTRIBUTE**     | ‘Y’/’N’ | Not currently in use |
| **TSL_ATTRIBUTE**         | ‘Y’/’N’ | Not currently in use |
| **TSM_ATTRIBUTE**         | ‘Y’/’N’ | Not currently in use |
| **PEG_ATTRIBUTE**         | ‘Y’/’N’ | Not currently in use |
| **TPSL_ATTRIBUTE**        | ‘Y’/’N’ | Not currently in use |
| **STATIC_ATTRIBUTE**      | ‘Y’/’N’ | Not currently in use |
| **VALIDATED**             | ‘Y’/’N’ | Not currently in use |

###### Notes:

Note 1: The HIDDEN_ATTRIBUTE makes the order hidden on the book. It is not visible.

Note 2: DISPLAYSIZE_ATTRIBUTE instructs the Matching Engine to use the ﬁeld DisplaySize as the initial volume to display on the book. When this size has been exhausted, the order is popped oﬀ the queue and pushed to the back of the price level queue and the size in the RefreshSize ﬁeld of BOTransaction is used until the total volume of the order is exhausted. Amer each depletion of the refresh size, the order is once again popped oﬀ the price level queue and pushed to the back of the queue until such time as the total order quantity in the BOOrderQty ﬁeld is zero or the order is cancelled or cancel replaced.

##### Message Validation

All BOTransaction messages are validated to ensure the required ﬁelds based on the Order Type are present. Further validation is performed in the Risk Engine to ensure the values make sense for the order type. If the message fails either of the two validations, the RejectReason ﬁeld will hold the reason for the reject and the Message type will be set to REJECT and returned to the user.

##### Risk Checking

Black Ocean performs both pre-trade and post trade risk checking as well as constant risk checks for those order types which require it.

##### ICE Orders

Ice orders are intended to allow the user to place up to a maximum of 10 orders on the book at a predeﬁned size and a predeﬁned price oﬀset from the top of the book \(currently 10 layers but this may be increased in a future release\). Ice orders maintain a relationship to the top of the book based on the PriceOﬀset ﬁeld. Example, if the PriceOﬀset = 0.0, then at least one layer of the orders will be equal to the top of book price and the second layer will be above/below that order based on the price oﬀset value and so on according to the number of layers. As the top of book prices move away from the orders, a new order will be placed on the book according to the PriceOﬀset and an order at the bottom of the layer will be removed. As the price moves closer to the ﬁrst layer, the orders hold their positions in anticipation of being executed. As orders are moved, the server does not send cancel replace messages to identify the new layer of the ICE orders \(this would defeat the purpose of Black Ocean performing this for the user since the goal is to reduce both network traffic, programming complexity for the user and time delays in cancel/cancel replacing orders in the layers\). The order quantity ﬁeld BOOrderQty must be equal to the product of the Layers ﬁeld and the SizeIncrement ﬁeld.

**Example:**

SizeIncrement = 1.0

Layers = 9

BOOrdQty = SizeIncrement \* Layers = 9.00

#### Supported Order Types

| **O**rder Types                     |
| :---------------------------------- |
| **LMT - \(Limit\)**                 |
| **MKT - \(Market\)**                |
| **STOP_MKT - \(Stop Market\)**      |
| **PEG - \(Pegged\)**                |
| **HIDDEN - \(Hidden\)**             |
| **PEG_HIDDEN - \(Pegged Hidden\)**  |
| **OCO - \(One-Cancels-The-Other\)** |
| **ICE - \(Iceberg\)**               |
| **SNIPER_MKT - \(Sniper Market\)**  |
| **SNIPER_LMT - \(Sniper Limit\)**   |
| **TSM - \(Trailing Stop Market\)**  |
| **TSL - \(Trailing Stop Limit\)**   |

#### LIMIT

##### New LIMIT order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |                |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 3  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      LMT      |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      LMT      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |     42341     |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### **Cancel Replace LIMIT Order - Client Sending**

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      LMT       |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     | Note 10  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      LMT      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: \*\*\*\*If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel LIMIT Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      LMT      |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      LMT      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### MARKET

##### New MARKET order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      MKT      |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |                |                |               |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 4  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |                |                |               |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 5  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |                |                |               |          |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |    REJECT     |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      MKT      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |                |                |               |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |               |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### OCO

##### New OCO order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      OCO      |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |                |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      OCO      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    428888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace OCO Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      OCO       |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |    REPLACE    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      OCO      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel OCO Order - **Client Sending**

User wishes to cancel replace the order sent in the previous section**.**

The OES will respond to the order submitted in the previous example with a BOTransaction message with a MessageType = REPLACED if the message was accepted or MessageType = REJECT if the order was rejected.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      OCO      |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      OCO      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |   49200.00    |  Note 2  |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |       \*       |                |               |  Note 3  |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |  Note 4  |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |  Note 4  |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 5  |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### PEG

##### New PEG / PEG_HIDDEN Order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_NEW    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |      1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |                |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    79448888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   ORDER_ACK    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | PEG/PEG_HIDDEN |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51100.5     |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |                |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |                |                |                |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |                |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |          |

**Note 1:**

If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace PEG / PEG_HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |     **\***     |    REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | PEG/PEG_HIDDEN |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |                |                |                |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel PEG / PEG_HIDDEN Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |    CANCELED    |    CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | PEG/PEG_HIDDEN |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |  Note 2  |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832152    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |       \*       |                |                |  Note 3  |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |                |                |                |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                |  Note 4  |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                |  Note 4  |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 5  |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### HIDDEN

##### New HIDDEN Order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    HIDDEN     |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |     HIDDEN     |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel HIDDEN Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |     HIDDEN     |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |    46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                |          |
| **Layers**            |   short   |      2      |      166      |                |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    HIDDEN     |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### ICEBERG

##### New ICEBERG Order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      ICE      |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      | Note 13  |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |               |          |
| **Layers**            |   short   |      2      |      166      |       X        |                |               |  Note 9  |
| **SizeIncrement**     |  double   |      8      |      168      |       X        |                |               | Note 10  |
| **PriceIncrement**    |  double   |      8      |      176      |       X        |                |               | Note 11  |
| **PriceOffset**       |  double   |      8      |      184      |       X        |                |               | Note 12  |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      ICE      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51000.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace ICEBERG Order - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | CANCEL_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      ICE       |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       | Note 14  |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |    46832151    | Note 13  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                |          |
| **Layers**            |   short   |      2      |      166      |       X        |                |                |  Note 9  |
| **SizeIncrement**     |  double   |      8      |      168      |       X        |                |                | Note 10  |
| **PriceIncrement**    |  double   |      8      |      176      |       X        |                |                | Note 11  |
| **PriceOffset**       |  double   |      8      |      184      |       X        |                |                | Note 12  |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5     | Note 13  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      ICE      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51000.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### **Cancel ICEBERG Order - Client Sending**

User wishes to cancel replace the order sent in the previous section. Please see the section titled ICE Orders.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value  |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T        |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238       |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_CANCELED |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |     100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |    46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1        |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      ICE       |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |      SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5     |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY       |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0       |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC       |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |     BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |    46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506       |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341      |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                |          |
| **Layers**            |   short   |      2      |      166      |       X        |                |                |          |
| **SizeIncrement**     |  double   |      8      |      168      |       X        |                |                |          |
| **PriceIncrement**    |  double   |      8      |      176      |       X        |                |                |          |
| **PriceOffset**       |  double   |      8      |      184      |       X        |                |                |          |
| **BOOrigPrice**       |  double   |      8      |      192      |       X        |                |                |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888     |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   CANCELED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |      ICE      |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |   46832152    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::CANCELLED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### STOP MARKET/STOP LIMIT

##### New STOP_MKT/STOP_LMT - Client Sending

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :----------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |         T          |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                    |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |     ORDER_NEW      |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |      46832151      |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |         1          |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |      50100.5       |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |        2.0         |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                    |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                    |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                    |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                    |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |        1000        |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                    |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                    |          |
| **Layers**            |   short   |      2      |      166      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |                    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |      226      |                |                |                    |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :----------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |         T          |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                    |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |     ORDER_ACK      |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |      46832151      |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |         1          |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | STOP_MKT/ STOP_LMT |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |      50100.5       |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |        BUY         |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |        2.0         |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |        GTC         |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                    |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                    |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                    |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                    |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                    |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |      146      |                |                |                    |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                    |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                    |          |
| **Layers**            |   short   |      2      |      166      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |                    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |      4248888       |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                    |          |

**Notes:**

If the message was accepted MessageType = MessageType::ORDER_ACK. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace **STOP_MKT/STOP\_**LMT Order - Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :----------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |         T          |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                    |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_REPLACE    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |      46832152      |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |         1          |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |      51102.5       |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |        3.0         |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |      46832151      |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                    |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                    |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                    |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                    |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                    |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                    |          |
| **Layers**            |   short   |      2      |      166      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |      50100.5       |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                    |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :----------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |         T          |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                    |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |      REPLACED      |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |      46832152      |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |         1          |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | STOP_MKT/ STOP_LMT |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |      50100.5       |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |        BUY         |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |        3.0         |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |        GTC         |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                    |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                    |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                    |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                    |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                    |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |      146      |                |                |                    |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                    |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                    |          |
| **Layers**            |   short   |      2      |      166      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |      50100.5       |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |      4248888       |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                    |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel STOP_MKT/STOP_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |   Example Value    |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :----------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |         T          |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                    |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |        238         |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |    ORDER_CANCEL    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                    | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |       100700       |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |      46832153      |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |         1          |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | STOP_MKT/ STOP_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |        SPOT        |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |      51102.5       |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |        BUY         |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |        3.0         |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |        GTC         |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                    |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |       BTCUSD       |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |      46832152      |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                    |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                    |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                    |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                    |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                    |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                    |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                    | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                    |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                    |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |        506         |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |       42341        |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                    |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                    |          |
| **Layers**            |   short   |      2      |      166      |                |                |                    |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                    |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                    |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                    |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |      50100.5       |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                    |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |      7948888       |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                    |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                    |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                    |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value      |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :--------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T            |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                        |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238           |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |        CANCELED        |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                        | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |         100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |        46832153        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1            |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |   STOP_MKT/ STOP_LMT   |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |          SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        50100.5         |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY           |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0           |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC           |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                        |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |         BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |        46832152        |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                        |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                        |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                        |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                        |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                        |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                        |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                        | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                        |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                | 184467440 737095515 30 |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506           |          |
| **Key**               |    Int    |      4      |      146      |                |                |                        |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                        |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                        |          |
| **Layers**            |   short   |      2      |      166      |                |                |                        |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                        |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                        |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                        |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |        50100.5         |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                        |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        4248888         |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                        |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                        |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                        |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### TRAILING STOP MARKET/TRAILING STOP LIMIT

##### New TSM/TSL Order - Client Sending

TSM order are trailing stop market orders. TSL orders are trailing stop limit orders.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |   ORDER_NEW   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51000.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |     1000      |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   ORDER_ACK   |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832151    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    TSL/TSM    |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      2.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |               |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace TSM/TSL Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_REPLACE |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |   46832151    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |                |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |   REPLACED    |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832152    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    TSL/TSM    |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    50100.5    |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |               |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |               |          |
| **ExecID**            |   long    |      8      |      82       |                |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |                |                |               |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    4248888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |               |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel TSL/TSM Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value | Example Value |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-----------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |       T       |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |      238      |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | ORDER_CANCEL  |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |    100700     |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |   46832153    |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |       1       |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                |    TSL/TSM    |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |     SPOT      |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |    51102.5    |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |      BUY      |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |      3.0      |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |      GTC      |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |    BTCUSD     |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |   46832152    |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |               |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |               | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |      506      |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |     42341     |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |               |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |               |          |
| **Layers**            |   short   |      2      |      166      |                |                |               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |    50100.5    | Note 10  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |    7948888    |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |               |          |
| **Attributes**        | char\[\]  |     12      |      226      |                |                |               |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value      |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :--------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T            |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                        |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238           |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |        CANCELED        |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                        | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |         100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |        46832153        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1            |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |        TSL/TSM         |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |          SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        50102.5         |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY           |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0           |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC           |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                        |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |         BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |        46832152        |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                        |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                        |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                        |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                        |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                        |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                        |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                        | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                        |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                | 184467440 737095515 30 |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506           |          |
| **Key**               |    Int    |      4      |      146      |                |                |                        |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                        |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                        |          |
| **Layers**            |   short   |      2      |      166      |                |                |                        |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                        |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                        |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                        |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |        50100.5         |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                        |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        4248888         |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                        |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                        |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                        |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### SNIPER MARKET/SNIPER LIMIT

##### New SNIPER_MKT/SNIPER_LMT Order - Client Sending

Sniper orders allow a user to wait for a price to reach a certain price and then interact with the market at that previously set price.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T           |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                       |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |       ORDER_NEW       |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |       46832151        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1           |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        50100.5        |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          2.0          |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                       |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                       |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                       |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                       |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                       |          |
| **Layers**            |   short   |      2      |      166      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |                       |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                       |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T           |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                       |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |       ORDER_ACK       |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |       46832151        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1           |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        50102.5        |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY          |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC          |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                       |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                       |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                       |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                       |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                       |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |      146      |                |                |                       |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                       |          |
| **Layers**            |   short   |      2      |      166      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |                       |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |      226      |                |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel Replace SNIPER_MKT/SNIPER_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T           |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                       |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |    CANCEL_REPLACE     |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |       46832152        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1           |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        51101.5        |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |       46832151        |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                       |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                       |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                       |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                       |          |
| **Layers**            |   short   |      2      |      166      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |        50100.5        |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |      226      |                |                |                       |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T           |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                       |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |       REPLACED        |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |       46832152        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1           |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        50100.5        |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY          |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC          |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |                       |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                       |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                       |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                       |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                       |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |      146      |                |                |                       |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                       |          |
| **Layers**            |   short   |      2      |      166      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |        50100.5        |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

##### Cancel SNIPER_MKT/SNIPER_LMT Order – Client Sending

User wishes to cancel replace the order sent in the previous section.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T           |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                       |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                |    ORDER_CANCELED     |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |       46832153        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1           |  Note 2  |
| **OrderType**         |   short   |      2      |      22       |       X        |                | SNIPER_MKT/SNIPER_LMT |  Note 3  |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        51102.5        |  Note 4  |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY          |  Note 5  |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC          |  Note 6  |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |                |                |       46832151        |  Note 9  |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                       |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                       |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                       |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                       |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |         1000          |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |         42341         |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                       |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                       |          |
| **Layers**            |   short   |      2      |      166      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |        50100.5        |  Note 9  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        7948888        |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                       |  Note 7  |

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

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |     Example Value     |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |           T           |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                       |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |          238          |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       |       CANCELED        |  Note 1  |
| **Padding**           |   short   |      2      |       6       |                |                |                       | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |        100700         |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |       46832153        |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |           1           |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                | SNIPER_MKT/SNIPER_LMT |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |         SPOT          |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |        51102.5        |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |          BUY          |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |          3.0          |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |          GTC          |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                       |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |        BTCUSD         |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |       46832152        |          |
| **BOCancelShares**    |  double   |      8      |      74       |                |                |                       |          |
| **ExecID**            |   long    |      8      |      82       |                |                |                       |          |
| **ExecShares**        |  double   |      8      |      90       |                |                |                       |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                       |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                       |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                       |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |                       | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                       |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                       |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |          506          |          |
| **Key**               |    Int    |      4      |      146      |                |                |                       |          |
| **DisplaySize**       |  double   |      8      |      150      |                |                |                       |          |
| **RefreshSize**       |  double   |      8      |      158      |                |                |                       |          |
| **Layers**            |   short   |      2      |      166      |                |                |                       |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                       |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                       |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                       |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |        50100.5        |          |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                       |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |        4248888        |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                       |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                       |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                       |          |

**Notes:**

Note 1: If the message was accepted MessageType = MessageType::REPLACED. If the message was rejected the MessageType = MessageType::REJECT and the reject reason will be in the RejectReason ﬁeld of the message.

#### EXECUTION/EXECUTION PARTIAL

These two message types are generated when an incoming Quote interacts with a resting order \(order already on the book\). Upon receiving an Execution message, the order in the Market Data Order Book should be removed. Upon receiving an Execution Partial, the volume of the resting order should be updated to reﬂect the remaining order quantity.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |        Example Value        |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :-------------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |              T              |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                             |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |             238             |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |       \*       | EXECUTION/EXECUTION_PARTIAL |          |
| **Padding**           |   short   |      2      |       6       |                |                |                             | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |           100700            |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |          46832153           |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |              1              |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |             LMT             |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |            SPOT             |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |           51102.5           |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |             BUY             |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |             3.0             |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |             GTC             |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                             |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |           BTCUSD            |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |          46832152           |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                             |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                             |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                             |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                             |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                             |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                             |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |          Not Used           | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                             |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                             |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |             506             |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |            42341            |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                             |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                             |          |
| **Layers**            |   short   |      2      |      166      |                |                |                             |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                             |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                             |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                             |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |           50100.5           | Note 10  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                             |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |           7948888           |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                             |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                             |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                             |  Note 7  |

#### QUOTE_FILL /PARTIAL

These two message types are generated when an incoming Quote interacts with a resting order \(order already on the book\). Upon receiving an Execution message, the order in the Market Data Order Book should be removed. Upon receiving an Execution Partial, the volume of the resting order should be updated to reﬂect the remaining order quantity.

| Field Name            | Data Type | Data Length | Buffer Offset | Required Field | Required Value |         Example Value         |  Notes   |
| :-------------------- | :-------: | :---------: | :-----------: | :------------: | :------------: | :---------------------------: | :------: |
| **Data1**             |   char    |      1      |       0       |       X        |       T        |               T               |  Header  |
| **Data2**             |   char    |      1      |       1       |                |                |                               |  Header  |
| **Data3**             |   short   |      2      |       2       |       X        |      238       |              238              |  Header  |
| **MessageType**       |   short   |      2      |       4       |       \*       |                | QUOTE_FILL/QUOTE_FILL_PARTIAL |          |
| **Padding**           |   short   |      2      |       6       |                |                |                               | Not used |
| **Account**           |    Int    |      4      |       8       |       X        |                |            100700             |          |
| **OrderID**           |   long    |      8      |      12       |       X        |                |           46832153            |          |
| **SymbolEnum**        |   short   |      2      |      20       |       X        |                |               1               |          |
| **OrderType**         |   short   |      2      |      22       |       X        |                |              LMT              |          |
| **SymbolType**        |   short   |      2      |      24       |       X        |                |             SPOT              |          |
| **BOPrice**           |  double   |      8      |      26       |       X        |                |            51102.5            |          |
| **BOSide**            |   short   |      2      |      34       |       X        |                |              BUY              |          |
| **BOOrderQty**        |  double   |      8      |      36       |       X        |                |              3.0              |          |
| **TIF**               |   short   |      2      |      44       |       X        |                |              GTC              |          |
| **StopLimitPrice**    |  double   |      8      |      46       |                |                |                               |          |
| **BOSymbol**          | char\[\]  |     12      |      54       |       X        |                |            BTCUSD             |          |
| **OrigOrderID**       |   long    |      8      |      66       |       X        |                |           46832152            |          |
| **BOCancelShares**    |  double   |      8      |      74       |       \*       |                |                               |          |
| **ExecID**            |   long    |      8      |      82       |       \*       |                |                               |          |
| **ExecShares**        |  double   |      8      |      90       |       \*       |                |                               |          |
| **RemainingQuantity** |  double   |      8      |      98       |                |                |                               |          |
| **ExecFee**           |  double   |      8      |      106      |                |                |                               |          |
| **ExpirationDate**    | char\[\]  |     12      |      114      |                |                |                               |          |
| **TraderID**          | char\[\]  |      6      |      126      |                |                |           Not Used            | Not used |
| **RejectReason**      |   short   |      2      |      132      |                |                |                               |          |
| **SendingTime**       | uint64_t  |      8      |      134      |       X        |                |                               |          |
| **TradingSessionID**  |    Int    |      4      |      142      |       X        |                |              506              |          |
| **Key**               |    Int    |      4      |      146      |       X        |                |             42341             |  Note 8  |
| **DisplaySize**       |  double   |      8      |      150      |       \*       |                |                               |          |
| **RefreshSize**       |  double   |      8      |      158      |       \*       |                |                               |          |
| **Layers**            |   short   |      2      |      166      |                |                |                               |          |
| **SizeIncrement**     |  double   |      8      |      168      |                |                |                               |          |
| **PriceIncrement**    |  double   |      8      |      176      |                |                |                               |          |
| **PriceOffset**       |  double   |      8      |      184      |                |                |                               |          |
| **BOOrigPrice**       |  double   |      8      |      192      |                |                |            50100.5            | Note 10  |
| **ExecPrice**         |  double   |      8      |      200      |                |                |                               |          |
| **MsgSeqNum**         |   long    |      8      |      208      |       X        |                |            7948888            |          |
| **TakeProfitPrice**   |  double   |      8      |      216      |                |                |                               |          |
| **TriggerType**       |   short   |      2      |      224      |                |                |                               |          |
| **Attributes**        | char\[\]  |     12      |      226      |       \*       |                |                               |  Note 7  |
