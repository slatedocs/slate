## Protobuf Order Entry
   Please review the tables at the bottom of this section to determine the fields which must be supplied for a particular message type and order type.

```proto

   Bit24Msg::Bit24Transaction _t;
      _t.set_messagetype(FIX::N_BIT10::MESSAGE_TYPE::ORDER_NEW);
      _t.set_symbolenum(4);
      _t.set_account(100700);
      _t.set_traderid("BOU7");
      _t.set_ordertype(1);
      _t.set_orderid(orderID_++);
      _t.set_tradingsessionid(506);
      _t.set_side(1);
      _t.set_tif(2);
      _t.set_key(123456);
      _t.set_bit24price(price);
      _t.set_bit24orderqty(0.25);
      _t.set_sendingtime(std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::time_point_cast<std::chrono::nanoseconds>(std::chrono::high_resolution_clock::now()).time_since_epoch()).count());
      _t.set_msgseqid(500);
      int siz = _t.ByteSizeLong() + 8;
      char pkt[siz];
      int type = (int)'T';
      google::protobuf::io::ArrayOutputStream aos(&pkt, siz);
      CodedOutputStream coded_output(&aos);
      coded_output.WriteVarint32(type);
      coded_output.WriteVarint32(siz);
      _t.SerializeToCodedStream(&coded_output);
      // send the message


```

> The above command returns a protobuf message, to read this message do this:

```proto

Bit24Msg::Bit24Transaction _tp;

_tp.ParseFromCodedStream(&coded_input);
_tp.attribute();
_tp.ordertype();
_tp.orderid();
_tp.tradingsessionid();
_tp.bit24price();
_tp.bit24originalprice();
_tp.origorderid();
_tp.side();
_tp.bit24orderqty();
_tp.tif();
_tp.traderid();
_tp.account();
_tp.symbolenum();
_tp.bit24symbol();
_tp.sendingtime();
_tp.msgseqid();
_tp.bit24cancelshares();
_tp.displaysize();
_tp.refreshsize();
_tp.sizeincrement();
_tp.priceoffset();
_tp.priceincrement();
_tp.layers();
_tp.takeprofitprice();
_tp.stoplimitprice();
_tp.limitcross();
_tp.key();
_tp.tif();

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
###  Current Order Types:
        LMT = 1,
        MKT = 2,
        STOP_MKT = 3,
        STOP_LMT = 4,
        PEG = 5,
        HIDDEN = 6,
        PEG_HIDDEN = 7,
        OCO = 8,
        ICE = 9,
        SNIPER_MKT = 12,
        SNIPER_LIMIT 13,
        TSM = 14,               // TRAILING_STOP_MKT
        TSL = 15                // TRAILING_STOP_LMT 

### Message Types
        ORDER_NEW = 1,
        CANCEL_REPLACE = 2,
        MARGIN_CANCEL_REPLACE = 3,
        MARGIN_EXECUTE = 4,
        ORDER_STATUS = 5,
        ORDER_CANCEL = 6,
        MARGIN_CANCEL = 7,
        EXECUTION = 8,
        EXECUTION_PARTIAL = 9,
        MARGIN_EXECUTION = 10,  
        MARGIN_PARTIAL_EXECUTION = 11,
        REJECT = 12,
        ORDER_REJECT = 13,
        ORDER_ACK = 14,
        CANCELLED = 15,  
        REPLACED = 16,
        QUOTE_FILL = 17,
        QUOTE_FILL_PARTIAL = 18,
        MARGIN_REPLACED = 19,
        CANCEL_REPLACE_REJECT = , 
        INSTRUMENT = 21,
        INSTRUMENT_REQUEST = 22,
        RISK_REJECT = 23,
        TOB_MSG = 24,
        THREE_LAYER_MD_MSG = 25,  
        FIVE_LAYER_MD_MSG = 26,
        TEN_LAYER_MD_MSG = 27,
        TWENTY_LAYER_MD_MSG = 28,
        THIRTY_LAYER_MD_MSG = 29,
        EXEC_REPORT = 30,            
        COLLATERAL_DATA = 31,
        COLLATERAL_UPDATE_REQ = 32,
        RISK_USER_SYMBOL = 33,
        RISK_UPDATE_REQUEST = 34,
        OPEN_ORDER_REQUEST = 35,
        CLIENT_LOGON = 36,
        MD_SNAPSHOT = 37,
        MD_SUBSCRIBE = 38,

### Required Fields by Message Type and Order Type
     The numerals in the Field Name row indicate the order type listed above.  To find out if a particular field is required find the field name in the left hand column and then find the numerical value corresponding to the order type listed in the preceeding section.
       Example:  To determine if the StopLimit price must be included in an OCO order, find the numerical value of the OCO order type in the section above (the value is 8) and then find StopLimitPrice in the left hand column and then go to the right to the header value of 8.  In this case, yes, StopLimitPrice is required when sending the message ORDER_NEW with the ORDER_TYPE = OCO (8).

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
             RESERVED_TYPE,
             HIDDEN_TYPE = 1,
             DISPLY_TYPE = 2,
             SIZEINCREMENT_TYPE = 3,
             POST_TYPE = 4,
             PRICEINCREMENT_TYPE = 5,
             OFFSET_TYPE = 6,
             STOP_MKT_TYPE = 7,
             STOP_LMT_TYPE = 8,
             PEG_TYPE = 9,
             TSL_TYPE = 10,
             TSM_TYPE = 11,

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
             RESERVED_TYPE,
             HIDDEN_TYPE = 1,
             DISPLY_TYPE = 2,
             SIZEINCREMENT_TYPE = 3,
             POST_TYPE = 4,
             PRICEINCREMENT_TYPE = 5,
             OFFSET_TYPE = 6,
             STOP_MKT_TYPE = 7,
             STOP_LMT_TYPE = 8,
             PEG_TYPE = 9,
             TSL_TYPE = 10,
             TSM_TYPE = 11,

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
             RESERVED_TYPE,
             HIDDEN_TYPE = 1,
             DISPLY_TYPE = 2,
             SIZEINCREMENT_TYPE = 3,
             POST_TYPE = 4,
             PRICEINCREMENT_TYPE = 5,
             OFFSET_TYPE = 6,
             STOP_MKT_TYPE = 7,
             STOP_LMT_TYPE = 8,
             PEG_TYPE = 9,
             TSL_TYPE = 10,
             TSM_TYPE = 11,

