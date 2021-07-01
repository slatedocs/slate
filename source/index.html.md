---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true
---

# Overview

## Messaging Overview

Each message in the API is preceded by a 4 byte header. This header conveys the following information:

- Message type. The ﬁrst byte of the header is always a character indicating the type of message to follow. Example: data[0] = ‘T’. The second byte is reserved to accommodate double character message types.
- Immediately following the 2 byte message type is a 2 byte short integer containing the total length of the message including the 4 byte message header. The length is a short integer (2 bytes) and is found in the 3rd and 4th bytes of the header.

| Field Name | Data type | Data Length | Buffer Offset | Example Value |
| ---------- | --------- | ----------- | ------------- | ------------- |
| Data1      | char      | 1           | 0             | 'H'           |
| Data2      | char      | 1           | 1             |
| Data3      | short     | 2           | 2             | 161           |

## Application Messages

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

# Symbol Enums

Symbol Enums are replacements for the character based instrument name to a short integer. Symbols Enums are included in almost all Black Ocean messages pertaining to orders, risk management and reporting. Symbol Enums are used to replace hashing functions necessary to ﬁnd either orders, instrument data or risk information normally associated with instruments in most other trading systems. It is essential they be included in the messages which require them. Failure to include them will result in a reject of the message and wrong symbol Enums will result in undeﬁned behavior. Amer the login is complete, the user can send a BOInstrumentRequest message to the OES (Order Entry Server) and will receive back a BOInstrument message which contains all information for each instrument including the symbol name and the symbol Enum for that symbol name. The BOInstrumentRequest and BOInstrument messages will be covered in detail in a subsequent section.

## Current Instruments supported and their corresponding Symbol Enums

| Instrument Name | Symbol Enum |
| --------------- | ----------- |
| BTCUSD          | 1           |
| USDUSDT         | 2           |
| FLYUSDT         | 3           |
| BTCUSDT         | 4           |

# Reject Codes

| Error Code | Description                                          |
| ---------- | ---------------------------------------------------- |
| 1          | ORDER_NOT_FOUND                                      |
| 2          | USER_NOT_FOUND                                       |
| 3          | ACCOUNT_NOT_FOUND                                    |
| 4          | INVALID_KEY                                          |
| 5          | ACCOUNT_DISABLED                                     |
| 6          | TRADING_SESSION_INVALID                              |
| 7          | RISK_ACCOUNT_NOT_FOUND                               |
| 8          | RISK_SYMBOL_NOT_FOUND                                |
| 9          | MES_NOT_AVAILABLE_TRADING_DISABLED                   |
| 10         | OES_NOT_AVAILABLE_TRADING_DISABLED                   |
| 11         | MDS_NOT_AVAILABLE_TRADING_DISABLED                   |
| 12         | MSG_TYPE_INVALID                                     |
| 13         | ORD_TYPE_INVALID                                     |
| 14         | PRICE_INVALID                                        |
| 15         | SIZE_INVALID                                         |
| 16         | STOP_PRICE_INVALID                                   |
| 17         | STOP_SIZE_INVALID                                    |
| 18         | ORDER_SIDE_INVALID                                   |
| 19         | ACCOUNT_INVALID                                      |
| 20         | ORDERID_INVALID                                      |
| 21         | SENDING_TIME_INVALID                                 |
| 22         | ORIG_PRICE_INVALID                                   |
| 23         | ORIG_SIZE_INVALID                                    |
| 24         | ICE_SIZEINCREMENT_TIMES_LAYERS_NOT_EQUAL_ORDQTY      |
| 25         | ORIG_ORDER_ID_INVALID                                |
| 26         | SYMBOL_ENUM_INVALID                                  |
| 27         | SIZE_INCREMENT_INVALID                               |
| 28         | PRICE_OFFSET_INVALID                                 |
| 29         | PRICE_INCREMENT_INVALID                              |
| 30         | EXCEEDED_MAX_LAYERS                                  |
| 31         | DISPLAY_SIZE_INVALID                                 |
| 32         | REFRESH_SIZE_INVALID                                 |
| 33         | INVALID_SECURITY_KEY                                 |
| 34         | USER_ALREADY_LOGGED_IN                               |
| 35         | INVALID_FIELD_VALUE                                  |
| 36         | PERCENTAGE_MOVE_EXCEEDED_COOLING_OFF_PERIOD_IN_FORCE |
| 37         | INSTRUMET_WOULD_CAUSE_MARGIN_TO_BE_EXCEEDED          |
| 38         | INSTRUMENT_MARGIN_EXCEEDED                           |
| 39         | MARGIN_BUY_ORDER_CANCELLATION_IN_PROGRESS            |
| 40         | MARGIN_SELL_ORDER_CANCELLATION_IN_PROGRESS           |
| 41         | MARGIN_LONG_POSITION_LIQUIDATION_IN_PROGRESS         |
| 42         | MARGIN_SHORT_POSITION_LIQUIDATION_IN_PROGRESS        |
| 43         | OUTSTANDING_OPEN_REQUESTS_EXCEEDED                   |
| 44         | NO_RISK_DATA                                         |
| 45         | DUPLICATE_ORDER_ID                                   |
| 46         | EXCEEDS_OPEN_ORDER_REQUESTS                          |
| 47         | NOT_ENOUGH_EQUITY_TO_COMPLETE                        |
| 48         | MATCHING_ENGINE_REJECTED                             |
| 49         | NONE                                                 |
| 50         | ACCEPTED                                             |
| 51         | KEY_INVALID                                          |
| 52         | MSG_SEQ_NUM_INVALID                                  |
| 53         | USER_ALREADY_LGGGED_IN                               |
| 54         | ORIG_ORDER_NOT_FOUND                                 |
| 55         | INVALID_LOGON_TYPE                                   |
| 56         | CANT_EXECUTE_AGAINST_EXCHANGE_ORDER                  |
| 57         | NO_MARKET_MAKER_VOLUME                               |

# REST

# JSON

## Websockets

### Session Management

### Application Messages

## TCP/IP

### Session Management

### Application Messages

# Protobuf

## Websockets

### Session Management

### Application Messages

## TCP/IP

### Session Management

### Application Messages

# Binary

## Websockets

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

## TCP/IP

### Session Management

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

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/slatedocs/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require("kittn");

let api = kittn.authorize("meowmeowmeow");
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require("kittn");

let api = kittn.authorize("meowmeowmeow");
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

| Parameter    | Default | Description                                                                      |
| ------------ | ------- | -------------------------------------------------------------------------------- |
| include_cats | false   | If set to true, the result will also include cats.                               |
| available    | true    | If set to false, the result will include kittens that have already been adopted. |

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require("kittn");

let api = kittn.authorize("meowmeowmeow");
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

| Parameter | Description                      |
| --------- | -------------------------------- |
| ID        | The ID of the kitten to retrieve |

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -X DELETE \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require("kittn");

let api = kittn.authorize("meowmeowmeow");
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted": ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

| Parameter | Description                    |
| --------- | ------------------------------ |
| ID        | The ID of the kitten to delete |
