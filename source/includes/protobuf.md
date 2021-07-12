# Protobuf

## Protobuf Overview
Protobuf is a messaging protocol introduced and maintained by Google.  The implementation details are hidden from the user and is popular because the .proto files can be used to generate code for a multitude of languages with the guarantee that both the sender and receiver can process the resulting message.  The resulting messages are much smaller than other formats such as JSON for those interested in reducing bandwidth and reduced processing times due to the protocol being able to send and receive binary data in its native format.

Protobuf messages are identical in TCP/IP and in Websockets.  The sending of the messages is the same and the receiving of messages is the same therefore the descriptions of the following messages will work the same for TCP/IP and for Websockets.

## Protobuf Message Header
   One of the drawbacks of protobuf messages is there is no way to determine how much data was received before processing the message.  Nor is there a way to determine the type of message which was received after determining the data received was enough to create a full message.  In order to alleviate these problems, we send an 8 byte header with each message.  The first integer is the message type and the second integer is the message length.  In order to find the values of these two fields use the following method:

    // _size is the size of the data retrieved from the socket buffer
    if(_size > 8) {
      dataPtr = buffer.getData();
      google::protobuf::uint32 psize;
      google::protobuf::uint32 stype;
      google::protobuf::io::ArrayInputStream ais(dataPtr, 1000);
      CodedInputStream coded_input(&ais);
      coded_input.ReadVarint32(&stype);        //Decode the header and get the type
      coded_input.ReadVarint32(&psize);        //Decode the header and get the size

   As can be seen from the code, we don't even try to process the message if it is less than 8 bytes because we don't have a full header.  Once we find the size and we know the type of message, we can then determine if the _size is large enough to continue processing the data.

   ##  Current Order Types:

1.  LMT = 1,
2.  MKT = 2,
3.  STOP_MKT = 3,
4.  STOP_LMT = 4,
5.  PEG = 5,
6.  HIDDEN = 6,
7.  PEG_HIDDEN = 7,
8.  OCO = 8,
9.  ICE = 9,
10. SNIPER_MKT = 12,
11. SNIPER_LIMIT 13,
12. TSM = 14,               // TRAILING_STOP_MKT
13. TSL = 15                // TRAILING_STOP_LMT 

# Message Types

1.         ORDER_NEW = 1,
2.         CANCEL_REPLACE = 2,
3.         MARGIN_CANCEL_REPLACE = 3,
4.         MARGIN_EXECUTE = 4,
5.         ORDER_STATUS = 5,
6.         ORDER_CANCEL = 6,
7.         MARGIN_CANCEL = 7,
8.         EXECUTION = 8,
9.         EXECUTION_PARTIAL = 9,
10.         MARGIN_EXECUTION = 10,  
11.         MARGIN_PARTIAL_EXECUTION = 11,
12.         REJECT = 12,
13.         ORDER_REJECT = 13,
14.         ORDER_ACK = 14,
15.         CANCELLED = 15,  
16.         REPLACED = 16,
17.         QUOTE_FILL = 17,
18.         QUOTE_FILL_PARTIAL = 18,
19.         MARGIN_REPLACED = 19,
20.         CANCEL_REPLACE_REJECT = , 
21.         INSTRUMENT = 21,
22.         INSTRUMENT_REQUEST = 22,
23.         RISK_REJECT = 23,
24.         TOB_MSG = 24,
25.         THREE_LAYER_MD_MSG = 25,  
26.         FIVE_LAYER_MD_MSG = 26,
27.         TEN_LAYER_MD_MSG = 27,
28.         TWENTY_LAYER_MD_MSG = 28,
29.         THIRTY_LAYER_MD_MSG = 29,
30.         EXEC_REPORT = 30,            
31.         COLLATERAL_DATA = 31,
32.         COLLATERAL_UPDATE_REQ = 32,
33.         RISK_USER_SYMBOL = 33,
34.         RISK_UPDATE_REQUEST = 34,
35.         OPEN_ORDER_REQUEST = 35,
36.         CLIENT_LOGON = 36,
37.         MD_SNAPSHOT = 37,
38.         MD_SUBSCRIBE = 38,

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

1.             RESERVED_TYPE,
2.             HIDDEN_TYPE = 1,
3.             DISPLY_TYPE = 2,
4.             SIZEINCREMENT_TYPE = 3,
5.             POST_TYPE = 4,
6.             PRICEINCREMENT_TYPE = 5,
7.             OFFSET_TYPE = 6,
8.             STOP_MKT_TYPE = 7,
9.             STOP_LMT_TYPE = 8,
10.            PEG_TYPE = 9,
11.            TSL_TYPE = 10,
12.            TSM_TYPE = 11,

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

1.             RESERVED_TYPE,
2.             HIDDEN_TYPE = 1,
3.             DISPLY_TYPE = 2,
4.             SIZEINCREMENT_TYPE = 3,
5.             POST_TYPE = 4,
6.             PRICEINCREMENT_TYPE = 5,
7.             OFFSET_TYPE = 6,
8.             STOP_MKT_TYPE = 7,
9.             STOP_LMT_TYPE = 8,
10.            PEG_TYPE = 9,
11.            TSL_TYPE = 10,
12.            TSM_TYPE = 11,

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

1.             RESERVED_TYPE,
2.             HIDDEN_TYPE = 1,
3.             DISPLY_TYPE = 2,
4.             SIZEINCREMENT_TYPE = 3,
5.             POST_TYPE = 4,
6.             PRICEINCREMENT_TYPE = 5,
7.             OFFSET_TYPE = 6,
8.             STOP_MKT_TYPE = 7,
9.             STOP_LMT_TYPE = 8,
10.            PEG_TYPE = 9,
11.            TSL_TYPE = 10,
12.            TSM_TYPE = 11,
   
## Protobuf BOClientLogon

### BOClientLogon -- Client Sending

```proto

  BOMsg::BOClientLogon logon;
  logon.set_msg1("H");
  logon.set_logontype(1);
  logon.set_account(100700);
  logon.set_username("BOU7");
  logon.set_tradingsessionid(506);
  logon.set_sendingtime(1833818393838331);
  logon.set_msgseqid(500);
  logon.set_key(123456);

  // prep for sending message
  int siz = logon.ByteSizeLong() + 8;  // need an extra 8 bytes for the message header
  char pkt[siz];
  google::protobuf::io::ArrayOutputStream aos(&pkt, siz);
  CodedOutputStream coded_output(&aos);
  coded_output.WriteVarint32(type);
  coded_output.WriteVarint32(siz);
  logon.SerializeToCodedStream(&coded_output);
  // send message

```

> AES response

```proto

  BOMsg::BOClientLogon logon;
  logon.msg1();
  logon.logontype();
  logon.account();
  logon.username();
  logon.tradingsessionid();
  logon.primaryorderentryip();
  logon.secondaryorderentryip();
  logon.primarymarketdataip();
  logon.secondaryorderentryip();
  logon.sendingtime();
  logon.msgseqid();
  logon.loginstatus();
  logon.key();
  logon.rejectreason();

```

> OES response

```proto

  BOMsg::BOClientLogon logon;
  logon.msg1();
  logon.logontype();
  logon.account();
  logon.username();
  logon.tradingsessionid();
  logon.sendingtime();
  logon.msgseqid();
  logon.key();
  logon.loginstatus();
  logon.rejectreason();

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
2. The AES will respond with a BOClientLogon with logon status and if logon was successful the IP Address and Port of the OES and MDS \(Order Entry Server and Level Based Market Data Server\).
3.  After a successful logon to the AES the user will proceed to log into the OES and/or MDS using the IP and port information provided in the AES Response to the login.  Upon successful login to either or both of the OES and/or MDS the user may enter orders or subscribe to market data.
4. Only one login session is permited for a unique account ID and UserName.
5. Black Ocean requests that if they user is going to close the connection a BOClientLogon message should be sent with the LogonType set to 2 prior to closing the connection in order to allow the OES to close the connection gracefully.
6. BOClientLogon Example Message - Client Sending

| Field Name           | Data Type  | Required Field | Required Value | Example Value      |   Notes   |
| :------------------- | :--------: | :------------: | :------------: | :-----------------:| :-------: |
| **Msg1**             |   string   |       c/s      |       H        |       H            |  Header   |
| **LogonType**        |    Int     |       c/s      |                |       1            |   Note1   |
| **Account**          |    Int     |       c/s      |                |    253336          |   Note2   |
| **2FA**              | string\[\] |       c        |                |     1F6A           |   Note4   |
| **UserName**         | string\[\] |       c        |                |     BOU1           |   Note2   |
| **TradingSessionID** |    Int     |       s        |                |     506            |   Note2   |
| **PrimaryOESIP**     | string\[\] |       s        |                | 192.81.32.5:40025  |   Note3   |
| **SecondaryOESIP**   | string\[\] |       s        |                |                    |   Note3   |
| **PrimaryMDIP**      | string\[\] |       s        |                |                    | Note Used |
| **SecondaryIP**      | string\[\] |       s        |                |                    | Not Used  |
| **SendingTime**      |    Long    |       c/s      |                |                    |  Note 5   |
| **MsgSeqNum**        |    Int     |       c/s      |                |    1500201         |           |
| **Key**              |    Int     |       c        |                |    432451          |           |
| **LoginStatus**      |   string   |       s        |                |                    |           |
| **RejectReason**     |   string   |       s        |                |                    |           |
| **RiskMaster**       |   string   |                |                |                    |           |

#### Notes:

1. LogonType is an integer enum, values: Login = 1, Logout = 2
   - If the value is not one of the values above, a logout message will be sent and the connection closed.
2. Value assigned by Black Ocean. If this is a logout, the TradingSessionID must be supplied.
3. IP address and port of the OES and MDS will be sent in the server response BOClientLogon message.
4. Sending times are in nanoseconds from the epoch, January 1, 1970.

## Protobuf Collateral Data
   Collateral data is the equity maintained by the user.  In order to find out the current balance of any equity on account, the user should send a BOCollateralUpdateRequest with the symbol enum of the instrument in question.  Example, if the user was interested in finding out the equity balance of BTCUSDT then the user would set the symbol enum = 4.  A symbol enum value of 0 will result in the sending of all instruments where the user has an equity balance.

```proto

  BOMsg::BOCollateralUpdateRequest req;
  req.set_msg1("f");
  req.set_updatetype(2);
  req.set_account(100700);
  req.set_tradingsessionid(506);
  req.set_symbolenum(4);
  req.set_key(123456);
  req.set_msgseqid(500);
  req.set_sendingtime(1624821404362542113);
  // prep for sending message
  int siz = req.ByteSizeLong() + 8;  // need an extra 8 bytes for the message header
  char pkt[siz];
  google::protobuf::io::ArrayOutputStream aos(&pkt, siz);
  CodedOutputStream coded_output(&aos);
  int type = (int)'f';
  coded_output.WriteVarint32(type);
  coded_output.WriteVarint32(siz);
  req.SerializeToCodedStream(&coded_output);
  // send message

```

> OES response

```proto

  char* buf = msg.buf;                                   // incoming data from the socket reader
  google::protobuf::uint32 size;
  google::protobuf::uint32 stype;
  google::protobuf::io::ArrayInputStream ais(buf, 1000);
  CodedInputStream coded_input(&ais);
  coded_input.ReadVarint32(&stype);                      //Decode the HDR and get the type
  coded_input.ReadVarint32(&size);                       //Decode the HDR and get the size
  char msgtype = (char)stype;

  BOMsg::BOCollateralData data;
  data.ParseFromCodedStream(&coded_input);               // this must be done to fill in the message fields
  data.msg1();
  data.messagetype();
  data.username();
  data.account();
  data.symbolenum();
  data.equity();
  data.usdtequity();
  data.flyequity();
  data.usdequity();
  data.ethequity();
  data.tradingsessionid();
  data.lastseqnum();
  data.sendingtime();

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
   The BORiskUpdateRequest is very similar to the CollateralData request except it is isolated to the values of equity being used in a particular instrument.  Example, the user might be trading BTCUSD and BTCUSDT.  While the Collateral data message will show the total value of BTC available, the RiskUserSymbol message will show the value of BTC being used for an individual instrument.  In this example if 5 BTC were being used in BTCUSD and 2 BTC were being used in BTCUSDT the collateral data message would show a total of 7 BTC currently in use.  But if the user requested an update for a particular symbol such as BTCUSD, the value of equity shown to being used would be 5.  This message also shows values related to a particular instrument such as executed positions, etc.

```proto
{
  BOMsg::BORiskUpdateRequest req;
  req.set_msg1("w");
  req.set_updatetype(2);
  req.set_account(100700);
  req.set_tradingsessionid(506);
  req.set_symbolenum(4);
  req.set_key(123456);
  req.set_msgseqid(500);
  req.set_sendingtime(1624821404362542113);
  // prep for sending message
  int siz = req.ByteSizeLong() + 8;  // need an extra 8 bytes for the message header
  char pkt[siz];
  google::protobuf::io::ArrayOutputStream aos(&pkt, siz);
  CodedOutputStream coded_output(&aos);
  int type = (int)'f';
  coded_output.WriteVarint32(type);
  coded_output.WriteVarint32(siz);
  req.SerializeToCodedStream(&coded_output);
  // send message
}
```

> The above command returns a protobuf BORiskUserSymbol.

```proto

  char* buf = msg.buf;                                   // incoming data from the socket reader
  google::protobuf::uint32 size;
  google::protobuf::uint32 stype;
  google::protobuf::io::ArrayInputStream ais(buf, 1000);
  CodedInputStream coded_input(&ais);
  coded_input.ReadVarint32(&stype);                      //Decode the HDR and get the type
  coded_input.ReadVarint32(&size);                       //Decode the HDR and get the size
  char msgtype = (char)stype;

  
  Bit24Msg::Bit24RiskUserSymbol _res;
  _res.ParseFromCodedStream(&coded_input);               // this must be done to fill in the message fields
  _res.account();
  _res.symbolenum();
  _res.leverage();
  _res.longposition();
  _res.shortposition();
  _res.longcash();
  _res.shortcash();
  _res.executedlongcash();
  _res.executedlongposition();
  _res.executedshortcash();
  _res.executedshortposition();
  _res.btcequity();
  _res.usdtequity();
  _res.ethequity();
  _res.usdequity();
  _res.flyequity();
  _res.tradingsessionid();
  _res.lastseqnum();


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
   Each instrument in the system has associated values such as price increment, symbl enum, min size, max size, etc.  Price increment is especially important as the prices sent in each order must be sent with the correct price increments.  Example, BTCUSD trades with a price increment of 0.5.  Therefore, sending a price of 36000.89 would be rejected since .89 is not an increment of .50. 

   Symbol enums for each instrument must be correct.  Invalid symbol enums can result in rejected messages or undefined behavior.

```proto
{
  BOMsg::BOBInstrumentRequest req;
  req.set_msg1("Y");
  req.set_requesttype(1);
  req.set_account(100700);
  req.set_tradingsessionid(506);
  req.set_symbolenum(4);
  req.set_symboltype(1);
  req.set_symbol("BTCUSDT");
  req.set_key(123456);
  req.set_msgseqid(500);
  req.set_sendingtime(1624821404362542113);
  // prep for sending message
  int siz = req.ByteSizeLong() + 8;  // need an extra 8 bytes for the message header
  char pkt[siz];
  google::protobuf::io::ArrayOutputStream aos(&pkt, siz);
  CodedOutputStream coded_output(&aos);
  int type = (int)'f';
  coded_output.WriteVarint32(type);
  coded_output.WriteVarint32(siz);
  req.SerializeToCodedStream(&coded_output);
  // send message
}
```

> The above command returns a protobuf message which can be read like this:

```proto

  char* buf = msg.buf;                                   // incoming data from the socket reader
  google::protobuf::uint32 size;
  google::protobuf::uint32 stype;
  google::protobuf::io::ArrayInputStream ais(buf, 1000);
  CodedInputStream coded_input(&ais);
  coded_input.ReadVarint32(&stype);                      //Decode the HDR and get the type
  coded_input.ReadVarint32(&size);                       //Decode the HDR and get the size
  char msgtype = (char)stype;

  BOMsg::BOInstrument _data;
  _data.ParseFromCodedStream(&coded_input);              // this must be done to fill in the message fields
  short msgtype = _data.messagetype();
  std::string _symbol = _data.symbol().c_str();
  short se = _data.symbolenum();
  double pi = _data.priceincrement();
  double ms = _data.minsize();
  double mx = _data.maxsize();

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
