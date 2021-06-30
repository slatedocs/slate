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

# Binary

## Websockets

### Session Management

#### BOClientLogon -- Client Sending

```json
{"msg1":"H","LogonType":1,"Account":100700,"UserName":""BOU7"","TradingSessionID":506,"SendingTime":1624785162815971526,"MsgSeqID":110434,"Key":123456,"LoginStatus":1,"RejectReason":50,"RiskMaster":"N"}
```

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

# Protobuf

## Websockets

### Session Management

### Application Messages

## TCP/IP

### Session Management

### Application Messages

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
