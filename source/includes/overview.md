# Overview 
  Welcome to Black Ocean.  Black Ocean offers a diverse array of connection protocols and messaging protocols. 

## Connection Protocols

1)  REST (HTTP)
2)  Websockets
3)  TCP/IP

## Messaging Protocols

1)  REST
2)  JSON
3)  Google Protobuf's
4)  Black Ocean's Proprietary Binary Protocol

## Difference between messages through the various delivery protocols
   Once the data has been extracted from the socket buffer, the messages themselves have no differences.  JSON over TCP/IP is the same as JSON over websockets.  The only protocol with a real difference is REST but fortunately, there is only one delivery mechanism for it.  Therefore since every user has their own way of reading data from the socket buffer, we will not delve into that area.  Instead, this document is intended to explain how to parse the data which was received irregardless of the delivery mechanism be it TCP/IP or Websockets.

## Message Headers
   Most messages in the Black Ocean messaging protocols have a header preceeding the message.  Message headers increase throughput by preventing the processing of data until a full message is received.  The message headers also clearly define the message type received which adds efficiency in the processing of incoming data.  The different message headers will be explained in the appropriate Messaging Protocol Sections.  In Black Oceans messaging protocols, there are two ways to identify the message received, one from the afore mentioned header and the other is from the message itself.  The message types in the header are listed below:

### Char message types

1) BOClientLogon = 'H'
2) BORiskUpdateRequest = 'w'
3) BORiskUserSymbol = 'N'
4) BOInstrumentRequest = 'Y'
5) BOInstrument = 'Q'
6) BOOpenOrderRequest = 'e'
7) BOCollateralUpdateReq = 'f'
8) BOCollateralData = 'h'
9) BOTransaction = 'T'

# Symbol Enums

Symbol Enums are replacements for the character based instrument name to a short integer. Symbols Enums are included in almost all Black Ocean messages pertaining to orders, risk management and reporting. Symbol Enums are used to replace hashing functions necessary to ﬁnd either orders, instrument data or risk information normally associated with instruments in most other trading systems. It is essential they be included in the messages which require them. Failure to include them will result in a reject of the message and wrong symbol Enums will result in undeﬁned behavior. Amer the login is complete, the user can send a BOInstrumentRequest message to the OES (Order Entry Server) and will receive back a BOInstrument message which contains all information for each instrument including the symbol name and the symbol Enum for that symbol name. The BOInstrumentRequest and BOInstrument messages will be covered in detail in a subsequent section.

### Current Instruments supported and their corresponding Symbol Enums

| Instrument Name | Symbol Enum |
| --------------- | ----------- |
| BTCUSD          | 1           |
| USDUSDT         | 2           |
| FLYUSDT         | 3           |
| BTCUSDT         | 4           |

# Order Types

  Black Ocean offers the most complete set of order types in the crypto market including TRUE ICE orders.  ICE orders allow the user to place up to 10 orders at a specified price offset per layer and a specified size at that price layer which move as the market moves.  Black Ocean also offers Hidden orders, peg orders, hidden peg orders and display and refresh attributes for most order types.  The complete list of order types is as follows:

##  Current Order Types:

1)  LMT = 1,
2)  MKT = 2,
3)  STOP_MKT = 3,
4)  STOP_LMT = 4,
5)  PEG = 5,
6)  HIDDEN = 6,
7)  PEG_HIDDEN = 7,
8)  OCO = 8,
9)  ICE = 9,
10) SNIPER_MKT = 12,
11) SNIPER_LIMIT 13,
12) TSM = 14,               // TRAILING_STOP_MKT
13) TSL = 15                // TRAILING_STOP_LMT 

# Message Types

1)         ORDER_NEW = 1,
2)         CANCEL_REPLACE = 2,
3)         MARGIN_CANCEL_REPLACE = 3,
4)         MARGIN_EXECUTE = 4,
5)         ORDER_STATUS = 5,
6)         ORDER_CANCEL = 6,
7)         MARGIN_CANCEL = 7,
8)         EXECUTION = 8,
9)         EXECUTION_PARTIAL = 9,
10)         MARGIN_EXECUTION = 10,  
11)         MARGIN_PARTIAL_EXECUTION = 11,
12)         REJECT = 12,
13)         ORDER_REJECT = 13,
14)         ORDER_ACK = 14,
15)         CANCELLED = 15,  
16)         REPLACED = 16,
17)         QUOTE_FILL = 17,
18)         QUOTE_FILL_PARTIAL = 18,
19)         MARGIN_REPLACED = 19,
20)         CANCEL_REPLACE_REJECT = , 
21)         INSTRUMENT = 21,
22)         INSTRUMENT_REQUEST = 22,
23)         RISK_REJECT = 23,
24)         TOB_MSG = 24,
25)         THREE_LAYER_MD_MSG = 25,  
26)         FIVE_LAYER_MD_MSG = 26,
27)         TEN_LAYER_MD_MSG = 27,
28)         TWENTY_LAYER_MD_MSG = 28,
29)         THIRTY_LAYER_MD_MSG = 29,
30)         EXEC_REPORT = 30,            
31)         COLLATERAL_DATA = 31,
32)         COLLATERAL_UPDATE_REQ = 32,
33)         RISK_USER_SYMBOL = 33,
34)         RISK_UPDATE_REQUEST = 34,
35)         OPEN_ORDER_REQUEST = 35,
36)         CLIENT_LOGON = 36,
37)         MD_SNAPSHOT = 37,
38)         MD_SUBSCRIBE = 38,

## Required Fields by Message Type and Order Type
     The numerals in the Field Name row indicate the order type listed above.  To find out if a particular field is required find the field name in the left hand column and then find the numerical value corresponding to the order type listed in the preceeding section.
       Example:  To determine if the StopLimit price must be included in an OCO order, find the numerical value of the OCO order type in the section above (8) and then find StopLimitPrice in the left hand column and then go to the right to the header value of 8.  In this case, yes, StopLimitPrice is required when sending the message ORDER_NEW with the ORDER_TYPE = OCO (8).

Message Type:  ORDER_NEW

|   Field Name          |1  |2  |3  |4  |5  |6  |7  |8  |9  |12  |13  |14  |15  |
| :-------------------: |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:--:|:--:|:--:|:--:|
| **Msg1**              | x | x | x | x | x | x | x | x | x | x  | x  | x  | x  |   
| **Msg2**              |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **MsgLen**            | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **MessageType**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **Padding**           |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Account**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrderID**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **SymbolEnum**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrderType**         | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **SymbolType**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOPrice**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOSide**            | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOOrderQty**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TIF**               | x |   |   |   | x | x | x | x | x |  x |  x |    |    |
| **StopLimitPrice**    |   |   | x | x |   |   |   | x |   |    |    |  x | x  |
| **BOSymbol**          | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrigOrderID**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **BOCancelShares**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecID**            |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecShares**        |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **RemainingQuantity** |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecFee**           |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExpirationDate**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **TraderID**          |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **RejectReason**      |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **SendingTime**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TradingSessionID**  | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **Key**               | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **DisplaySize**       | 1 |   |   |   | 1 | 1 | 1 | 1 |   |    |    |    |    |
| **RefreshSize**       | 1 |   |   |   | 1 | 1 | 1 | 1 |   |    |    |    |    |
| **Layers**            |   |   |   |   |   |   |   |   | x |    |    |    |    |
| **SizeIncrement**     |   |   |   |   |   |   |   |   | x |    |    |    |    |
| **PriceIncrement**    |   |   |   |   |   |   |   |   | x |    |    |    |    |
| **PriceOffset**       |   |   |   |   |   |   |   |   | x |    |    |    |    |
| **BOOrigPrice**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecPrice**         |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **MsgSeqNum**         | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TakeProfitPrice**   |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **TriggerType**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Attributes**        | 1 |   |   |   | 1 | 1 | 1 | 1 |   |    |    |    |    |

Note 1:  Attributes currently are used to indicate Hidden or Display Refresh is to be used.  Currently only HIDDEN_TYPE and DISPLY_TYPE are in use.

         ATTRIBUTE_TYPES:

1)             RESERVED_TYPE,
2)             HIDDEN_TYPE = 1,
3)             DISPLY_TYPE = 2,
4)             SIZEINCREMENT_TYPE = 3,
5)             POST_TYPE = 4,
6)             PRICEINCREMENT_TYPE = 5,
7)             OFFSET_TYPE = 6,
8)             STOP_MKT_TYPE = 7,
9)             STOP_LMT_TYPE = 8,
10)            PEG_TYPE = 9,
11)            TSL_TYPE = 10,
12)            TSM_TYPE = 11,

Message Type:  CANCEL_REPLACE

|   Field Name          |1  |2  |3  |4  |5  |6  |7  |8  |9  |12  |13  |14  |15  |
| :-------------------: |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:--:|:--:|:--:|:--:|
| **Msg1**              | x | x | x | x | x | x | x | x | x | x  | x  | x  | x  |   
| **Msg2**              |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **MsgLen**            | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **MessageType**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **Padding**           |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Account**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrderID**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **SymbolEnum**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrderType**         | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **SymbolType**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOPrice**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOSide**            | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOOrderQty**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TIF**               | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **StopLimitPrice**    |   |   | x | x |   |   |   | x |   |    |    | x  | x  |
| **BOSymbol**          | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrigOrderID**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **BOCancelShares**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecID**            |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecShares**        |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **RemainingQuantity** |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecFee**           |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExpirationDate**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **TraderID**          |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **RejectReason**      |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **SendingTime**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TradingSessionID**  | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **Key**               | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **DisplaySize**       | 1 |   |   |   | 1 | 1 | 1 | 1 |   |    |    |    |    |
| **RefreshSize**       | 1 |   |   |   | 1 | 1 | 1 | 1 |   |    |    |    |    |
| **Layers**            |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **SizeIncrement**     |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **PriceIncrement**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **PriceOffset**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **BOOrigPrice**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecPrice**         |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **MsgSeqNum**         | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TakeProfitPrice**   |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **TriggerType**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Attributes**        | 1 |   |   |   | 1 | 1 | 1 | 1 |   |    |    |    |    |

Note 1:  Attributes currently are used to indicate Hidden or Display Refresh is to be used.  Currently only HIDDEN_TYPE and DISPLY_TYPE are in use.

         ATTRIBUTE_TYPES:

1)             RESERVED_TYPE,
2)             HIDDEN_TYPE = 1,
3)             DISPLY_TYPE = 2,
4)             SIZEINCREMENT_TYPE = 3,
5)             POST_TYPE = 4,
6)             PRICEINCREMENT_TYPE = 5,
7)             OFFSET_TYPE = 6,
8)             STOP_MKT_TYPE = 7,
9)             STOP_LMT_TYPE = 8,
10)            PEG_TYPE = 9,
11)            TSL_TYPE = 10,
12)            TSM_TYPE = 11,

Message Type:  ORDER_CANCEL

|   Field Name          |1  |2  |3  |4  |5  |6  |7  |8  |9  |12  |13  |14  |15  |
| :-------------------: |:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:--:|:--:|:--:|:--:|
| **Msg1**              | x | x | x | x | x | x | x | x | x | x  | x  | x  | x  |   
| **Msg2**              |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **MsgLen**            | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **MessageType**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **Padding**           |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Account**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrderID**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **SymbolEnum**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrderType**         | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **SymbolType**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOPrice**           | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOSide**            | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOOrderQty**        | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TIF**               | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **StopLimitPrice**    |   |   | x | x |   |   |   | x |   |    |    |  x | x  |
| **BOSymbol**          | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **OrigOrderID**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **BOCancelShares**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecID**            |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecShares**        |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **RemainingQuantity** |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExecFee**           |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **ExpirationDate**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **TraderID**          | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **RejectReason**      |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **SendingTime**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TradingSessionID**  | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **Key**               | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **DisplaySize**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **RefreshSize**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Layers**            |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **SizeIncrement**     |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **PriceIncrement**    |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **PriceOffset**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **BOOrigPrice**       | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **ExecPrice**         |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **MsgSeqNum**         | x | x | x | x | x | x | x | x | x |  x |  x |  x | x  |
| **TakeProfitPrice**   |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **TriggerType**       |   |   |   |   |   |   |   |   |   |    |    |    |    |
| **Attributes**        |   |   |   |   |   |   |   |   |   |    |    |    |    |

Note 1:  Attributes currently are used to indicate Hidden or Display Refresh is to be used.  Currently only HIDDEN_TYPE and DISPLY_TYPE are in use.

         ATTRIBUTE_TYPES:
         
1)             RESERVED_TYPE,
2)             HIDDEN_TYPE = 1,
3)             DISPLY_TYPE = 2,
4)             SIZEINCREMENT_TYPE = 3,
5)             POST_TYPE = 4,
6)             PRICEINCREMENT_TYPE = 5,
7)             OFFSET_TYPE = 6,
8)             STOP_MKT_TYPE = 7,
9)             STOP_LMT_TYPE = 8,
10)            PEG_TYPE = 9,
11)            TSL_TYPE = 10,
12)            TSM_TYPE = 11,
