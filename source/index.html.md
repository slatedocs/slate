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


# API

## REST API ENDPOINT URL
https://api.falconx.io

# Requests
All requests and responses are application/json content type and follow typical HTTP response status codes for success and failure.

# Errors

Unless otherwise stated, errors to bad requests will respond with HTTP 4xx or status codes. The body will also contain a message parameter indicating the cause. Your language’s http library should be configured to provide message bodies for non-2xx requests so that you can read the message field from the body.

Common error codes

<table>
  <tr>
    <th>Status Code</th>
    <th>Reason</th>
  </tr>
  <tr>
    <td>
      400
    </td>
    <td>
      Bad Request – Invalid request format
    </td>
  </tr>
</table>
401	Unauthorized – Invalid API Key
403	Forbidden – You do not have access to the requested resource
404	Not Found
500	Internal Server Error – We had a problem with our server
