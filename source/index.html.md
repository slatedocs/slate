---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - python

includes:
  - errors

search: true
---

# Introduction

Welcome to the FalconX trading API.

# Matching Engine

FalconX operates a continuous first-come, first-serve order book. Orders are executed in price-time priority as received by the matching engine.


## Self-Trade Prevention
Self-trading is not allowed on Coinbase Pro. Two orders from the same user will not fill one another. When placing an order, you can specify the self-trade prevention behavior.

### DECREMENT AND CANCEL
The default behavior is decrement and cancel. When two orders from the same user cross, the smaller order will be canceled and the larger order size will be decremented by the smaller order size. If the two orders are the same size, both will be canceled.

### CANCEL OLDEST
Cancel the older (resting) order in full. The new order continues to execute.

### CANCEL NEWEST
Cancel the newer (taking) order in full. The old resting order remains on the order book.

### CANCEL BOTH
Immediately cancel both orders.

### NOTES FOR MARKET ORDERS
When a market order using dc self-trade prevention encounters an open limit order, the behavior depends on which fields for the market order message were specified. If funds and size are specified for a buy order, then size for the market order will be decremented internally within the matching engine and funds will remain unchanged. The intent is to offset your target size without limiting your buying power. If size is not specified, then funds will be decremented. For a market sell, the size will be decremented when encountering existing limit orders.

# Order Lifecycle
Valid orders sent to the matching engine are confirmed immediately and are in the received state. If an order executes against another order immediately, the order is considered done. An order can execute in part or whole. Any part of the order not filled immediately, will be considered open. Orders will stay in the open state until canceled or subsequently filled by new orders. Orders that are no longer eligible for matching (filled or canceled) are in the done state.

# Fees

To be decided


# Authentication

> To authorize, use this code:

```python
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Overview

## Get All Kittens

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

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
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
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

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

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
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

