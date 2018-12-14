---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - python

search: true
---

# General

Welcome to the FalconX trading API.

## Matching Engine

FalconX operates a continuous first-come, first-serve order book. Orders are executed in price-time priority as received by the matching engine.


## Self-Trade Prevention
Self-trading is not allowed on FalconX. Two orders from the same user will not fill one another. When placing an order, you can specify the self-trade prevention behavior.

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

## Order Lifecycle
Valid orders sent to the matching engine are confirmed immediately and are in the received state. If an order executes against another order immediately, the order is considered done. An order can execute in part or whole. Any part of the order not filled immediately, will be considered open. Orders will stay in the open state until canceled or subsequently filled by new orders. Orders that are no longer eligible for matching (filled or canceled) are in the done state.

## Fees

To be decided


# API

### REST API ENDPOINT URL
`https://api.falconx.io`

## Requests
All requests and responses are application/json content type and follow typical HTTP response status codes for success and failure.

## Errors

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
  <tr>
    <td>401</td>
	  <td>Unauthorized – Invalid API Key</td>
  </tr>
  <tr>
    <td>403</td>
	  <td>Forbidden – You do not have access to the requested resource</td>
  </tr>
  <tr>
    <td>404</td>
	  <td>Not Found</td>
  </tr>
  <tr>
    <td>500</td>
	  <td>Internal Server Error – We had a problem with our server</td>
  </tr>
</table>

## Success
A successful response is indicated by HTTP status code 200 and may contain an optional body. If the response has a body it will be documented under each resource below.

# Authentication

``` python
# Requires python-requests. Install with pip:
#
#   pip install requests
#
# or, with easy-install:
#
#   easy_install requests

import json, hmac, hashlib, time, requests, base64
from requests.auth import AuthBase

# Create custom authentication for Exchange
class FXExchangeAuth(AuthBase):
    def __init__(self, api_key, secret_key, passphrase):
        self.api_key = api_key
        self.secret_key = secret_key
        self.passphrase = passphrase

    def __call__(self, request):
        timestamp = str(time.time())
        message = timestamp + request.method + request.path_url + (request.body or '')
        hmac_key = base64.b64decode(self.secret_key)
        signature = hmac.new(hmac_key, message.encode(), hashlib.sha256)
        signature_b64 = base64.b64encode(signature.digest())
 
        request.headers.update({
            'FX-ACCESS-SIGN': signature_b64,
            'FX-ACCESS-TIMESTAMP': timestamp,
            'FX-ACCESS-KEY': self.api_key,
            'FX-ACCESS-PASSPHRASE': self.passphrase,
            'Content-Type': 'application/json'
        })
        return request


api_url = 'https://api.falconx.io/'
auth = FXExchangeAuth(API_KEY, API_SECRET, API_PASS)

# Place an order
order = {
    'size': 1.0,
    'price': 1.0,
    'side': 'buy',
    'product_id': 'BTC-USD',
}
r = requests.post(api_url + 'orders', json=order, auth=auth)
print r.json()
# {"id": "0428b97b-bec1-429e-a94c-59992926778d"}

```

## Generating an API Key
Before being able to sign any requests, you must create an API key via the FalconX website. Upon creating a key you will have 3 pieces of information which you must remember:

* Key
* Secret
* Passphrase
The Key and Secret will be randomly generated and provided by FalconX; the Passphrase will be provided by you to further secure your API access. FalconX stores the salted hash of your passphrase for verification, but cannot recover the passphrase if you forget it.

## Creating a Request
All REST requests must contain the following headers:

* **FX-ACCESS-KEY** The api key as a string.
* **FX-ACCESS-SIGN** The base64-encoded signature (see Signing a Message).
* **FX-ACCESS-TIMESTAMP** A timestamp for your request.
* **FX-ACCESS-PASSPHRASE** The passphrase you specified when creating the API key.
All request bodies should have content type application/json and be valid JSON.

## Signing a Message
The **FX-ACCESS-SIGN** header is generated by creating a sha256 HMAC using the base64-decoded secret key on the prehash string **timestamp + method + requestPath + body** (where + represents string concatenation) and base64-encode the output. The timestamp value is the same as the **FX-ACCESS-TIMESTAMP** header.

The **body** is the request body string or omitted if there is no request body (typically for GET requests).

The **method** should be UPPER CASE.

Remember to first base64-decode the alphanumeric secret string (resulting in 64 bytes) before using it as the key for HMAC. Also, base64-encode the digest output before sending in the header.


## Selecting a Timestamp
The **FX-ACCESS-TIMESTAMP** header MUST be number of seconds since Unix Epoch in UTC. Decimal values are allowed.

Your timestamp must be within 30 seconds of the api service time or your request will be considered expired and rejected. We recommend using the [time](#time) endpoint to query for the API server time if you believe there many be time skew between your server and the API servers.

# Orders

## Place a New Order

You can place two types of orders: limit and market. Orders can only be placed if your account has sufficient funds. Once an order is placed, your account funds will be put on hold for the duration of the order. How much and which funds are put on hold depends on the order type and parameters specified. See the Holds details below.

#### HTTP REQUEST

`POST /orders`

### COMMON PARAMETERS

These parameters are common to all order types. Depending on the order type, additional parameters will be required (see below).

<table>
  <tr>
    <th>Param</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>type</td>
    <td>limit or market</td>
  </tr>
  <tr>
    <td>side</td>
	  <td>buy or sell</td>
  </tr>
</table>

### LIMIT ORDER PARAMETERS
<table>
  <tr>
    <th>Param</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>price</td>
	  <td>Price</td>
  </tr>
  <tr>
    <td>size</td>
	  <td>Amount to buy or sell</td>
  </tr>
</table>

### MARKET ORDER PARAMETERS
<table>
  <tr>
    <th>Param</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>size</td>
    <td>Desired amount</td>
  </tr>
  <tr>
    <td>funds</td>
	  <td>[optional]* Desired amount of quote currency to use</td>
  </tr>
</table>

### PRODUCT ID
The product_id must match a valid product. The products list is available via the /products endpoint.

### TYPE
When placing an order, you can specify the order type. The order type you specify will influence which other order parameters are required as well as how your order will be executed by the matching engine. If type is not specified, the order will default to a limit order.

limit orders are both the default and basic order type. A limit order requires specifying a price and size. The size is the number of bitcoin to buy or sell, and the price is the price per bitcoin. The limit order will be filled at the price specified or better. A sell order can be filled at the specified price per bitcoin or a higher price per bitcoin and a buy order can be filled at the specified price or a lower price depending on market conditions. If market conditions cannot fill the limit order immediately, then the limit order will become part of the open order book until filled by another incoming order or canceled by the user.

market orders differ from limit orders in that they provide no pricing guarantees. They however do provide a way to buy or sell specific amounts of bitcoin or fiat without having to specify the price. Market orders execute immediately and no part of the market order will go on the open order book. Market orders are always considered takers and incur taker fees. When placing a market order you can specify funds and/or size. Funds will limit how much of your quote currency account balance is used and size will limit the bitcoin amount transacted.

### PRICE
The price must be specified in quote_increment product units. The quote increment is the smallest unit of price. For the BTC-USD product, the quote increment is 0.01 or 1 penny. Prices less than 1 penny will not be accepted, and no fractional penny prices will be accepted. Not required for market orders.

### SIZE
The size must be greater than the base_min_size for the product and no larger than the base_max_size. The size can be in any increment of the base currency (BTC for the BTC-USD product), which includes satoshi units. size indicates the amount of BTC (or base currency) to buy or sell.

### FUNDS
The funds field is optionally used for market orders. When specified it indicates how much of the product quote currency to buy or sell. For example, a market buy for BTC-USD with funds specified as 150.00 will spend 150 USD to buy BTC (including any fees). If the funds field is not specified for a market buy order, size must be specified and Coinbase Pro will use available funds in your account to buy bitcoin.

A market sell order can also specify the funds. If funds is specified, it will limit the sell to the amount of funds specified. You can use funds with sell orders to limit the amount of quote currency funds received.


### HOLDS
For limit buy orders, we will hold price x size x (1 + fee-percent) USD. For sell orders, we will hold the number of Bitcoin you wish to sell. Actual fees are assessed at time of trade. If you cancel a partially filled or unfilled order, any remaining funds will be released from hold.

For market buy orders where funds is specified, the funds amount will be put on hold. If only size is specified, all of your account balance (in the quote account) will be put on hold for the duration of the market order (usually a trivially short time). For a sell order, the size in BTC will be put on hold. If size is not specified (and only funds is specified), your entire BTC balance will be on hold for the duration of the market order.


### ORDER LIFECYCLE
The HTTP Request will respond when an order is either rejected (insufficient funds, invalid parameters, etc) or received (accepted by the matching engine). A 200 response indicates that the order was received and is active. Active orders may execute immediately (depending on price and market conditions) either partially or fully. A partial execution will put the remaining size of the order in the open state. An order that is filled completely, will go into the done state.

Users listening to streaming market data are encouraged to use the client_oid field to identify their received messages in the feed. The REST response with a server order_id may come after the received message in the public data feed.

### RESPONSE
A successful order will be assigned an order id. A successful order is defined as one that has been accepted by the matching engine.




## Cancel an Order
Cancel a previously placed order.

If the order had no matches during its lifetime its record may be purged. This means the order details will not be available with **GET /orders/&lt;order-id&gt;**.

### HTTP REQUEST
`DELETE /orders/<order-id>`

### CANCEL REJECT
If the order could not be canceled (already filled or previously canceled, etc), then an error response will indicate the reason in the message field.

## Cancel all
With best effort, cancel all open orders. The response is a list of ids of the canceled orders.

### HTTP REQUEST

`DELETE /orders`

### QUERY PARAMETERS
<table>
  <tr>
    <th>Param</th>
    <th>Default</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>product_id</td>
    <td>[optional]</td>
    <td>Only cancel orders open for a specific product</td>
  </tr>
</table>

## List Orders

List your current open orders. Only open or un-settled orders are returned. As soon as an order is no longer open and settled, it will no longer appear in the default request.

### HTTP REQUEST
`GET /orders`

### QUERY PARAMETERS
<table>
  <tr>
    <th>Param</th>
    <th>Default</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>status</td>
    <td>[open, pending, active]</td>
    <td>Limit list of orders to these statuses. Passing all returns orders of all statuses.</td>
  </tr>
  <tr>
    <td>product_id</td>
    <td>[optional]</td>
    <td>Only list orders for a specific product</td>
  </tr>
</table>

To specify multiple statuses, use the status query argument multiple times: /orders?status=done&status=pending.


### ORDER STATUS AND SETTLEMENT
Orders which are no longer resting on the order book, will be marked with the done status. There is a small window between an order being done and settled. An order is settled when all of the fills have settled and the remaining holds (if any) have been removed.

### POLLING
For high-volume trading it is strongly recommended that you maintain your own list of open orders and use one of the streaming market data feeds to keep it updated. You should poll the open orders endpoint once when you start trading to obtain the current state of any open orders.



## Get an Order
Get a single order by order id.

### HTTP REQUEST
`GET /orders/<order-id>`

If the order is canceled the response may have status code 404 if the order had no matches.


# Deposits

## Fetch deposit address.

`GET /deposit_address`

<table>
  <tr>
    <th>Param</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>symbol</td>
    <td>The asset to deposit</td>
  </tr>
</table>

# Withdraws

## Submit a withdraw request.

`POST /withdraw`

<table>
  <tr>
    <th>Param</th>
	  <th>Description</th>
  </tr>
  <tr>
    <td>symbol</td>
    <td>The asset to withdraw</td>
  </tr>
  <tr>
    <td>address</td>
    <td>The address to withdraw to</td>
  </tr>
  <tr>
    <td>tag</td>
    <td>Address tag for coins like XRP</td>
  </tr>
  <tr>
    <td>amount</td>
    <td>Amount to withdraw</td>
  </tr>
</table>
