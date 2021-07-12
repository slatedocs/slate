# REST

## REST Overview
   All REST user messages are POST type requests.  Server responses are in JSON responses.  Please review the following sections for the required order entry message fields.

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
10)        MARGIN_EXECUTION = 10,  
11)        MARGIN_PARTIAL_EXECUTION = 11,
12)        REJECT = 12,
13)        ORDER_REJECT = 13,
14)        ORDER_ACK = 14,
15)        CANCELLED = 15,  
16)        REPLACED = 16,
17)        QUOTE_FILL = 17,
18)        QUOTE_FILL_PARTIAL = 18,
19)        MARGIN_REPLACED = 19,
20)        CANCEL_REPLACE_REJECT = , 
21)        INSTRUMENT = 21,
22)        INSTRUMENT_REQUEST = 22,
23)        RISK_REJECT = 23,
24)        TOB_MSG = 24,
25)        THREE_LAYER_MD_MSG = 25,  
26)        FIVE_LAYER_MD_MSG = 26,
27)        TEN_LAYER_MD_MSG = 27,
28)        TWENTY_LAYER_MD_MSG = 28,
29)        THIRTY_LAYER_MD_MSG = 29,
30)        EXEC_REPORT = 30,            
31)        COLLATERAL_DATA = 31,
32)        COLLATERAL_UPDATE_REQ = 32,
33)        RISK_USER_SYMBOL = 33,
34)        RISK_UPDATE_REQUEST = 34,
35)        OPEN_ORDER_REQUEST = 35,
36)        CLIENT_LOGON = 36,
37)        MD_SNAPSHOT = 37,
38)        MD_SUBSCRIBE = 38,

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


## REST BOClientLogon

### BOClientLogon -- Client Sending

`POST http://bo.market.com msg1=H&LogonType=1&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

> AES response

```json
{
  "msg1": "H",
  "LogonType": 1,
  "Account": 100700,
  "UserName": "BOU7",
  "TradingSessionID": 506,
  "PrimaryOESIP":"192.181.35.6:32060",
  "SecondaryOESIP":"192.182.35.6:32060",
  "PrimaryMDIP":"192.181.35.5:32060",
  "SecondaryMDIP":"192.181.35.5:32060",
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
4. If the logon to the AES was successful the user may log into the OES or MDS using the IP address and port provided in the AES response
5. Only one login session is permited for a unique account ID and UserName.
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
   Collateral data message will show the total value of BTC available.

POST HTTP: msg1=f&UpdateType=1&Account=100700&SymbolEnum=4&TradingSessionID=506&SendingTime=1681931839281&MsgSeqID=500&Key=123456

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

##### HTTP Request

`POST http://bo.market.com msg1=w&MessageType=w&Account=100700&UserName=BOU7&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## REST Risk Symbol Update
   The BORiskUpdateRequest is very similar to the CollateralData request except it is isolated to the values of equity being used in a particular instrument.  Example, the user might be trading BTCUSD and BTCUSDT.  While the Collateral data message will show the total value of BTC available, the RiskUserSymbol message will show the value of BTC being used for an individual instrument.  In this example if 5 BTC were being used in BTCUSD and 2 BTC were being used in BTCUSDT the collateral data message would show a total of 7 BTC currently in use.  But if the user requested an update for a particular symbol such as BTCUSD, the value of equity shown to being used would be 5.  This message also shows values related to a particular instrument such as executed positions, etc.

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

##### HTTP Request

`POST http://bo.market.com msg1=Y&MessageType=22&Account=100700&SymbolName=BTCUSDT&SymbolEnum=4&UserName=BOU7&TradingSessionID=506&SendingTime=1681931839281&MsgSeqID=500&Key=123456`

## REST Instrument Data

> The above command returns JSON structured like this:

```json
{
  "msg1": "Q",
  "MessageType": "21",
  "SymbolName": "USDUSDT",
  "SymbolEnum": 4,
  "SymbolType": 1,
  "PriceIncrement": 0.50,
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

##### HTTP Request

`POST http://bo.market.com msg1=T&MessageType=1&UpdateType=0&Account=100700&TraderID=BOU7&OrderType&OrderID=14333181&Price=35040.5&Bit24OrderQty=2&Bit24Side=1&SendingTime=1681931839281&MsgSeqID=500&SymbolEnum=4&Symbol=BTCUSDT&TradingSessionID=506&TIF=1`

## REST Order Entry

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
