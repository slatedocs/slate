<h1 id="ApiSection" class="section-header">API</h1>
The REST API has endpoints for account and order management as well as public market data.

REST API ENDPOINT URL

- Production - https://api.delta.exchange/v2
- Testnet - https://testnet-api.delta.exchange/v2

<h1 id="delta-exchange-api-v2-assets">Assets</h1>

Get Asset List

## Get list of all assets

<a id="opIdgetAssets"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/assets', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/assets \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/assets',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /assets`

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "symbol": "string",
      "precision": 0
    }
  ]
}
```

<h3 id="get-list-of-all-assets-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of all assets|Inline|

<h3 id="get-list-of-all-assets-responseschema">Response Schema</h3>

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-v2-indices">Indices</h1>

Get Indices List

## Get indices

<a id="opIdgetIndices"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/indices', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/indices \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/indices',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /indices`

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "symbol": "string",
      "constituent_exchanges": [
        {}
      ]
    }
  ]
}
```

<h3 id="get-indices-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of indices (Spot underlyings, Interest Rates indexes)|Inline|

<h3 id="get-indices-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-v2-products">Products</h1>

Get Product List

## Get live products

<a id="opIdgetProducts"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/products', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/products \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/products',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /products`

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "created_at": "string",
      "updated_at": "string",
      "settlement_time": "string",
      "notional_type": "vanilla",
      "impact_size": 0,
      "initial_margin": 0,
      "maintenance_margin": "string",
      "contract_value": "string",
      "contract_unit_currency": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "max_leverage_notional": "string",
      "default_leverage": "string",
      "initial_margin_scaling_factor": "string",
      "maintenance_margin_scaling_factor": "string",
      "taker_commission_rate": "string",
      "maker_commission_rate": "string",
      "liquidation_penalty_factor": "string",
      "contract_type": "string",
      "position_size_limit": 0,
      "basis_factor_max_limit": "string",
      "is_quanto": true,
      "funding_method": "string",
      "annualized_funding": "string",
      "price_band": "string",
      "underlying_asset": {
        "id": 0,
        "symbol": "string",
        "precision": 0
      },
      "quoting_asset": {
        "id": 0,
        "symbol": "string",
        "precision": 0
      },
      "settling_asset": {
        "id": 0,
        "symbol": "string",
        "precision": 0
      },
      "spot_index": {
        "id": 0,
        "symbol": "string",
        "constituent_exchanges": [
          {}
        ]
      }
    }
  ]
}
```

<h3 id="get-live-products-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of live products|Inline|

<h3 id="get-live-products-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|notional_type|vanilla|
|notional_type|inverse|
|trading_status|operational|
|trading_status|disrupted_cancel_only|
|trading_status|disrupted_post_only|

<aside class="success">
This operation does not require authentication.
</aside>

## Get tickers for products

<a id="opIdgetTickers"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/tickers', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/tickers \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/tickers',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tickers`

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "symbol": "string",
      "timestamp": 0,
      "open": 0,
      "high": 0,
      "low": 0,
      "close": 0,
      "volume": 0,
      "mark_price": "string",
      "spot_price": "string",
      "turnover": 0,
      "turnover_symbol": "string",
      "turnover_usd": 0
    }
  ]
}
```

<h3 id="get-tickers-for-products-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of live tickers for all products|Inline|

<h3 id="get-tickers-for-products-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication.
</aside>

## Get ticker for a product by symbol

<a id="opIdgetTicker"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/tickers/{symbol}', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/tickers/{symbol} \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/tickers/{symbol}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /tickers/{symbol}`

<h3 id="get-ticker-for-a-product-by-symbol-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|symbol|path|string|true|symbol of the ticker|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "symbol": "string",
    "timestamp": 0,
    "open": 0,
    "high": 0,
    "low": 0,
    "close": 0,
    "volume": 0,
    "mark_price": "string",
    "spot_price": "string",
    "turnover": 0,
    "turnover_symbol": "string",
    "turnover_usd": 0
  }
}
```

<h3 id="get-ticker-for-a-product-by-symbol-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of live tickers for all products|Inline|

<h3 id="get-ticker-for-a-product-by-symbol-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-v2-orders">Orders</h1>

Placing Orders, Cancelling Orders, Placing batch orders, Cancelling batch orders, Get Open orders, Change Orders Leverage

## Place Order

<a id="opIdplaceOrder"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.post('http://api.delta.exchange/v2/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST http://api.delta.exchange/v2/orders \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.post 'http://api.delta.exchange/v2/orders',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /orders`

> Body parameter

```json
{
  "product_id": 0,
  "limit_price": "string",
  "size": 0,
  "side": "buy",
  "order_type": "limit_order",
  "time_in_force": "gtc",
  "post_only": "true",
  "reduce_only": "true"
}
```

<h3 id="place-order-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateOrderRequest](#schemacreateorderrequest)|true|Order which needs to be created|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "id": 0,
    "user_id": 0,
    "size": 0,
    "unfilled_size": 0,
    "side": "buy",
    "order_type": "limit_order",
    "limit_price": "string",
    "stop_order_type": "stop_loss_order",
    "stop_price": "string",
    "close_on_trigger": "false",
    "state": "open",
    "created_at": "string",
    "product_id": 0
  }
}
```

<h3 id="place-order-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns back the order object with assigned id and latest state|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns [error](#place-order-error-description) if order could not be placed|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="place-order-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Cancel Order

<a id="opIdcancelOrder"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.delete('http://api.delta.exchange/v2/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X DELETE http://api.delta.exchange/v2/orders \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.delete 'http://api.delta.exchange/v2/orders',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /orders`

> Body parameter

```json
{
  "id": 0,
  "product_id": 0
}
```

<h3 id="cancel-order-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[DeleteOrderRequest](#schemadeleteorderrequest)|true|Order which needs to be cancelled|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "id": 0,
    "user_id": 0,
    "size": 0,
    "unfilled_size": 0,
    "side": "buy",
    "order_type": "limit_order",
    "limit_price": "string",
    "stop_order_type": "stop_loss_order",
    "stop_price": "string",
    "close_on_trigger": "false",
    "state": "open",
    "created_at": "string",
    "product_id": 0
  }
}
```

<h3 id="cancel-order-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns back the order object|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if order could not be cancelled|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="cancel-order-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Edit Order

<a id="opIdeditOrder"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.put('http://api.delta.exchange/v2/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X PUT http://api.delta.exchange/v2/orders \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.put 'http://api.delta.exchange/v2/orders',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /orders`

> Body parameter

```json
{
  "id": 0,
  "product_id": 0,
  "limit_price": "string",
  "size": 0
}
```

<h3 id="edit-order-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[EditOrderRequest](#schemaeditorderrequest)|true|Order which needs to be edited|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "id": 0,
    "user_id": 0,
    "size": 0,
    "unfilled_size": 0,
    "side": "buy",
    "order_type": "limit_order",
    "limit_price": "string",
    "stop_order_type": "stop_loss_order",
    "stop_price": "string",
    "close_on_trigger": "false",
    "state": "open",
    "created_at": "string",
    "product_id": 0
  }
}
```

<h3 id="edit-order-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns back the order object with assigned id and latest state|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns [error](#place-order-error-description) if order could not be placed|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="edit-order-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Get Active Orders

<a id="opIdgetOrders"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/orders \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/orders',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /orders`

<h3 id="get-active-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_ids|query|string|false|comma separated product ids|
|contract_types|query|string|false|comma separated product ids|
|order_types|query|string|false|comma separated order types|
|start_time|query|integer|false|from time in micro-seconds in epoc|
|end_time|query|integer|false|from time in micro-seconds in epoc|
|after|query|string|false|after cursor for pagination|
|before|query|string|false|before cursor for pagination|
|page_size|query|integer|false|number of records per page|

#### Enumerated Values

|Parameter|Value|
|---|---|
|contract_types|futures|
|contract_types|perpetual_futures|
|contract_types|call_options|
|contract_types|put_options|
|contract_types|interest_rate_swaps|
|contract_types|move_options|
|contract_types|spreads|
|order_types|market|
|order_types|limit|
|order_types|stop_market|
|order_types|stop_limit|
|order_types|all_stop|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "user_id": 0,
      "size": 0,
      "unfilled_size": 0,
      "side": "buy",
      "order_type": "limit_order",
      "limit_price": "string",
      "stop_order_type": "stop_loss_order",
      "stop_price": "string",
      "close_on_trigger": "false",
      "state": "open",
      "created_at": "string",
      "product_id": 0
    }
  ],
  "meta": {
    "after": "string",
    "before": "string"
  }
}
```

<h3 id="get-active-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of orders as per the query|Inline|

<h3 id="get-active-orders-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Cancel all open orders

<a id="opIdcancelAllOrders"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.delete('http://api.delta.exchange/v2/orders/all', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X DELETE http://api.delta.exchange/v2/orders/all \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.delete 'http://api.delta.exchange/v2/orders/all',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /orders/all`

> Body parameter

```json
{
  "product_id": 0,
  "cancel_limit_orders": "true",
  "cancel_stop_orders": "true"
}
```

<h3 id="cancel-all-open-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CancelAllFilterObject](#schemacancelallfilterobject)|false|Filters for selecting orders that needs to be cancelled|

> Example responses

> 200 Response

```json
{
  "success": true
}
```

<h3 id="cancel-all-open-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns back success response|[ApiSuccessResponse](#schemaapisuccessresponse)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if orders could not be cancelled|[ApiErrorResponse](#schemaapierrorresponse)|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Create batch orders

<a id="opIdbatchCreate"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.post('http://api.delta.exchange/v2/orders/batch', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST http://api.delta.exchange/v2/orders/batch \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.post 'http://api.delta.exchange/v2/orders/batch',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /orders/batch`

> Body parameter

```json
{
  "orders": [
    {
      "product_id": 0,
      "limit_price": "string",
      "size": 0,
      "side": "buy",
      "order_type": "limit_order",
      "time_in_force": "gtc",
      "post_only": "true",
      "reduce_only": "true"
    }
  ],
  "product_id": 0
}
```

<h3 id="create-batch-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|Does not support time_in_force flag for orders, All orders in batch create are assumed to be gtc orders. batch create does not support stop orders, it support only limit orders|
|» orders|body|[[CreateOrderRequest](#schemacreateorderrequest)]|false|[A create order object]|
|»» product_id|body|integer|true|none|
|»» limit_price|body|string|false|none|
|»» size|body|integer|false|none|
|»» side|body|string|false|side for which to place order|
|»» order_type|body|string|false|none|
|»» time_in_force|body|string|false|none|
|»» post_only|body|string|false|none|
|»» reduce_only|body|string|false|none|
|» product_id|body|integer|false|none|

#### Enumerated Values

|Parameter|Value|
|---|---|
|»» side|buy|
|»» side|sell|
|»» order_type|limit_order|
|»» order_type|market_order|
|»» time_in_force|gtc|
|»» time_in_force|ioc|
|»» time_in_force|fok|
|»» post_only|true|
|»» post_only|false|
|»» reduce_only|true|
|»» reduce_only|false|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "user_id": 0,
      "size": 0,
      "unfilled_size": 0,
      "side": "buy",
      "order_type": "limit_order",
      "limit_price": "string",
      "stop_order_type": "stop_loss_order",
      "stop_price": "string",
      "close_on_trigger": "false",
      "state": "open",
      "created_at": "string",
      "product_id": 0
    }
  ]
}
```

<h3 id="create-batch-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the orders placed|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|returns error if orders couldnt be placed|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="create-batch-orders-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Edit batch orders

<a id="opIdbatchEdit"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.put('http://api.delta.exchange/v2/orders/batch', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X PUT http://api.delta.exchange/v2/orders/batch \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.put 'http://api.delta.exchange/v2/orders/batch',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`PUT /orders/batch`

batch order edit 

> Body parameter

```json
{
  "orders": [
    {
      "id": 0,
      "product_id": 0,
      "limit_price": "string",
      "size": 0
    }
  ],
  "product_id": 0
}
```

<h3 id="edit-batch-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» orders|body|[[EditOrderRequest](#schemaeditorderrequest)]|false|[edit order object]|
|»» id|body|integer|false|none|
|»» product_id|body|integer|false|none|
|»» limit_price|body|string|false|none|
|»» size|body|integer|false|total size after editing order|
|» product_id|body|integer|false|none|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "user_id": 0,
      "size": 0,
      "unfilled_size": 0,
      "side": "buy",
      "order_type": "limit_order",
      "limit_price": "string",
      "stop_order_type": "stop_loss_order",
      "stop_price": "string",
      "close_on_trigger": "false",
      "state": "open",
      "created_at": "string",
      "product_id": 0
    }
  ]
}
```

<h3 id="edit-batch-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of edited orders|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|returns error if orders couldnt be edited|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="edit-batch-orders-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Delele batch orders

<a id="opIdbatchDelete"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.delete('http://api.delta.exchange/v2/orders/batch', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X DELETE http://api.delta.exchange/v2/orders/batch \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.delete 'http://api.delta.exchange/v2/orders/batch',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /orders/batch`

> Body parameter

```json
{
  "orders": [
    {
      "id": 0,
      "product_id": 0
    }
  ],
  "product_id": 0
}
```

<h3 id="delele-batch-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» orders|body|[[DeleteOrderRequest](#schemadeleteorderrequest)]|false|[A delete order object]|
|»» id|body|integer|false|none|
|»» product_id|body|integer|false|none|
|» product_id|body|integer|false|none|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "user_id": 0,
      "size": 0,
      "unfilled_size": 0,
      "side": "buy",
      "order_type": "limit_order",
      "limit_price": "string",
      "stop_order_type": "stop_loss_order",
      "stop_price": "string",
      "close_on_trigger": "false",
      "state": "open",
      "created_at": "string",
      "product_id": 0
    }
  ]
}
```

<h3 id="delele-batch-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the orders deleted|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|returns error if orders couldnt be deleted|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="delele-batch-orders-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Change order leverage

<a id="opIdchangeOrderLeverage"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': '*/*',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.post('http://api.delta.exchange/v2/orders/leverage', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST http://api.delta.exchange/v2/orders/leverage \
  -H 'Content-Type: application/json' \
  -H 'Accept: */*' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => '*/*',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.post 'http://api.delta.exchange/v2/orders/leverage',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /orders/leverage`

> Body parameter

```json
{
  "product_id": 0,
  "leverage": "string"
}
```

<h3 id="change-order-leverage-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» product_id|body|integer|true|none|
|» leverage|body|string|true|none|

> Example responses

> 200 Response

<h3 id="change-order-leverage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the OrderLeverage object|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if leverage couldnt be changed|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="change-order-leverage-responseschema">Response Schema</h3>

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Get order leverage

<a id="opIdgetOrderLeverage"></a>

> Code samples

```python
import requests
headers = {
  'Accept': '*/*',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/orders/leverage', params={
  'product_id': '0'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/orders/leverage?product_id=0 \
  -H 'Accept: */*' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => '*/*',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/orders/leverage',
  params: {
  'product_id' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /orders/leverage`

<h3 id="get-order-leverage-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_id|query|integer|true|none|

> Example responses

> 200 Response

<h3 id="get-order-leverage-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the OrderLeverage object|Inline|

<h3 id="get-order-leverage-responseschema">Response Schema</h3>

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-v2-positions">Positions</h1>

Get Open positions, Change Position Margin, Close Position

## Get open positions

<a id="opIdgetPositions"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/positions', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/positions \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/positions',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /positions`

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "user_id": 0,
      "size": 0,
      "entry_price": "string",
      "margin": "string",
      "liquidation_price": "string",
      "bankruptcy_price": "string",
      "adl_level": 0,
      "product_id": 0
    }
  ]
}
```

<h3 id="get-open-positions-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of all open positions|Inline|

<h3 id="get-open-positions-responseschema">Response Schema</h3>

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Add/Remove position margin

<a id="opIdchangePositionMargin"></a>

> Code samples

```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.post('http://api.delta.exchange/v2/positions/change_margin', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST http://api.delta.exchange/v2/positions/change_margin \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Content-Type' => 'application/json',
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.post 'http://api.delta.exchange/v2/positions/change_margin',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /positions/change_margin`

> Body parameter

```json
{
  "product_id": 0,
  "delta_margin": "string"
}
```

<h3 id="add/remove-position-margin-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» product_id|body|integer|true|none|
|» delta_margin|body|string|true|Delta in the position margin, positive in case of adding margin & negative in case of removing margin|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "user_id": 0,
    "size": 0,
    "entry_price": "string",
    "margin": "string",
    "liquidation_price": "string",
    "bankruptcy_price": "string",
    "adl_level": 0,
    "product_id": 0
  }
}
```

<h3 id="add/remove-position-margin-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the position object|Inline|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if position margin could not be changed|[ApiErrorResponse](#schemaapierrorresponse)|

<h3 id="add/remove-position-margin-responseschema">Response Schema</h3>

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-v2-trade-history">Trade History</h1>

Get Orders History, Get Fill History

## GET user fills by filters

<a id="opIdGETuserfillsbyfilters"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/fills', params={
  'start_time': '0',  'end_time': '0'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/fills?start_time=0&end_time=0 \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/fills',
  params: {
  'start_time' => 'integer',
'end_time' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /fills`

<h3 id="get-user-fills-by-filters-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_ids|query|string|false|none|
|contract_types|query|string|false|none|
|start_time|query|integer|true|Start time for the fills query|
|end_time|query|integer|true|End time for the fills query|
|before|query|string|false|from time in micro-seconds in epoc|
|page_size|query|integer|false|number of records per page|

#### Enumerated Values

|Parameter|Value|
|---|---|
|contract_types|futures|
|contract_types|perpetual_futures|
|contract_types|call_options|
|contract_types|put_options|
|contract_types|interest_rate_swaps|
|contract_types|move_options|
|contract_types|spreads|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "size": 0,
      "side": "buy",
      "price": "string",
      "role": "taker",
      "commission": "string",
      "created_at": "string",
      "product_id": 0
    }
  ],
  "meta": {
    "after": "string",
    "before": "string"
  }
}
```

<h3 id="get-user-fills-by-filters-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|fills|Inline|

<h3 id="get-user-fills-by-filters-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|role|taker|
|role|maker|

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-v2-orderbook">Orderbook</h1>

L2Orderbook

## Get L2 orderbook

<a id="opIdgetL2Orderbook"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/l2orderbook/{symbol}', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/l2orderbook/{symbol} \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/l2orderbook/{symbol}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /l2orderbook/{symbol}`

<h3 id="get-l2-orderbook-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|symbol|path|string|true|none|
|depth|query|integer|false|number of levels on each side|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "buy_book": [
      {
        "price": "string",
        "size": 0
      }
    ],
    "sell_book": [
      {
        "price": "string",
        "size": 0
      }
    ]
  }
}
```

<h3 id="get-l2-orderbook-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|L2 orderbook for the product|Inline|

<h3 id="get-l2-orderbook-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-v2-trades">Trades</h1>

Get Trades of a contract

## Get public trades

<a id="opIdgetTrades"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/trades/{symbol}', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/trades/{symbol} \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/trades/{symbol}',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /trades/{symbol}`

<h3 id="get-public-trades-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|symbol|path|string|true|none|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "trades": [
      {
        "side": "buy",
        "size": 0,
        "price": "string",
        "timestamp": 0
      }
    ]
  }
}
```

<h3 id="get-public-trades-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of recent trades of the product|Inline|

<h3 id="get-public-trades-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-v2-wallet">Wallet</h1>

Get balances, Get transaction history

## Get Wallet Balances

<a id="opIdgetBalances"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/wallet/balances', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/wallet/balances \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/wallet/balances',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /wallet/balances`

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "balance": "string",
      "order_margin": "string",
      "position_margin": "string",
      "commission": "string",
      "available_balance": "string",
      "asset": {
        "id": 0,
        "symbol": "string",
        "precision": 0
      }
    }
  ]
}
```

<h3 id="get-wallet-balances-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of wallets attached to the user account|Inline|

<h3 id="get-wallet-balances-responseschema">Response Schema</h3>

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Get Wallet transactions

<a id="opIdgetTransactions"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/wallet/transactions', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/wallet/transactions \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/wallet/transactions',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /wallet/transactions`

<h3 id="get-wallet-transactions-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|asset_id|query|integer|false|asset_id for which to get txns logs|
|end_time|query|integer|false|end time in micro-seconds in epoc|
|after|query|string|false|after cursor for pagination|
|before|query|string|false|before cursor for pagination|
|page_size|query|integer|false|number of records per page|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "amount": "string",
      "balance": "string",
      "transaction_type": "pnl",
      "meta_data": {},
      "product_id": 0,
      "asset_id": 0,
      "created_at": "string"
    }
  ],
  "meta": {
    "after": "string",
    "before": "string"
  }
}
```

<h3 id="get-wallet-transactions-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|list of transactions for that wallet|Inline|

<h3 id="get-wallet-transactions-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|transaction_type|pnl|
|transaction_type|deposit|
|transaction_type|withdrawal|
|transaction_type|commission|
|transaction_type|conversion|
|transaction_type|perpetual_futures_funding|
|transaction_type|withdrawal_cancellation|
|transaction_type|referral_bonus|
|transaction_type|commission_rebate|
|transaction_type|promo_credit|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Download Wallet transactions

<a id="opIddownloadTransactions"></a>

> Code samples

```python
import requests
headers = {
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/wallet/transactions/download', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/wallet/transactions/download \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/wallet/transactions/download',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /wallet/transactions/download`

<h3 id="download-wallet-transactions-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|asset_id|query|integer|false|asset_id for which to get txns logs|
|start_time|query|integer|false|Start time for the transaction query|
|end_time|query|integer|false|End time for the transaction query|

<h3 id="download-wallet-transactions-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|csv of transactions for that wallet|None|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-v2-ohlc-candles">OHLC Candles</h1>

## GET ohlc candles

<a id="opIdgetCandles"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/history/candles', params={
  'resolution': '1m',  'symbol': 'string',  'start': '0',  'end': '0'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/history/candles?resolution=1m&symbol=string&start=0&end=0 \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/history/candles',
  params: {
  'resolution' => 'string',
'symbol' => 'string',
'start' => 'integer',
'end' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /history/candles`

<h3 id="get-ohlc-candles-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|resolution|query|string|true|none|
|symbol|query|string|true|product symbol|
|start|query|integer|true|Start time|
|end|query|integer|true|End time|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resolution|1m|
|resolution|3m|
|resolution|5m|
|resolution|15m|
|resolution|30m|
|resolution|1h|
|resolution|2h|
|resolution|4h|
|resolution|6h|
|resolution|1d|
|resolution|7d|
|resolution|30d|
|resolution|1w|
|resolution|2w|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "time": 0,
      "open": 0,
      "high": 0,
      "low": 0,
      "close": 0,
      "volume": 0
    }
  ]
}
```

<h3 id="get-ohlc-candles-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|ohlc|Inline|

<h3 id="get-ohlc-candles-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication.
</aside>

## GET product history sparkline

<a id="opIdgetSparklines"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('http://api.delta.exchange/v2/history/sparklines', params={
  'symbols': 'string'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/history/sparklines?symbols=string \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'http://api.delta.exchange/v2/history/sparklines',
  params: {
  'symbols' => 'string'
}, headers: headers

p JSON.parse(result)

```

`GET /history/sparklines`

<h3 id="get-product-history-sparkline-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|symbols|query|string|true|comma separated product symbols|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": {
    "MARK:BTCUSD_31Oct": [
      [
        1594214051,
        0.00003826
      ],
      [
        1594214051,
        0.00003826
      ]
    ],
    "SPOT:BTCUSD_31Oct": [
      [
        1594215270,
        0.00003826
      ]
    ]
  }
}
```

<h3 id="get-product-history-sparkline-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|product history sparkline|Inline|

<h3 id="get-product-history-sparkline-responseschema">Response Schema</h3>

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-v2-tradehistory">TradeHistory</h1>

## Get order history (cancelled and closed)

<a id="opIdgetOrderHistory"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/orders/history', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/orders/history \
  -H 'Accept: application/json' \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json',
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/orders/history',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /orders/history`

<h3 id="get-order-history-(cancelled-and-closed)-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_ids|query|string|false|comma separated product ids|
|contract_types|query|string|false|comma separated product ids|
|order_types|query|string|false|comma separated order types|
|start_time|query|integer|false|from time in micro-seconds in epoc|
|end_time|query|integer|false|from time in micro-seconds in epoc|
|after|query|string|false|after cursor for pagination|
|before|query|string|false|before cursor for pagination|
|page_size|query|integer|false|number of records per page|

#### Enumerated Values

|Parameter|Value|
|---|---|
|contract_types|futures|
|contract_types|perpetual_futures|
|contract_types|call_options|
|contract_types|put_options|
|contract_types|interest_rate_swaps|
|contract_types|move_options|
|contract_types|spreads|
|order_types|market|
|order_types|limit|
|order_types|stop_market|
|order_types|stop_limit|
|order_types|all_stop|

> Example responses

> 200 Response

```json
{
  "success": true,
  "result": [
    {
      "id": 0,
      "user_id": 0,
      "size": 0,
      "unfilled_size": 0,
      "side": "buy",
      "order_type": "limit_order",
      "limit_price": "string",
      "stop_order_type": "stop_loss_order",
      "stop_price": "string",
      "close_on_trigger": "false",
      "state": "open",
      "created_at": "string",
      "product_id": 0
    }
  ],
  "meta": {
    "after": "string",
    "before": "string"
  }
}
```

<h3 id="get-order-history-(cancelled-and-closed)-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of closed and cancelled orders|Inline|

<h3 id="get-order-history-(cancelled-and-closed)-responseschema">Response Schema</h3>

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Download Wallet transactions

<a id="opIddownloadFillsHistory"></a>

> Code samples

```python
import requests
headers = {
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('http://api.delta.exchange/v2/fills/history/download/csv', params={
  'start_time': '0',  'end_time': '0'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET http://api.delta.exchange/v2/fills/history/download/csv?start_time=0&end_time=0 \
  -H 'api-key: ****' \
  -H 'signature: ****' \
  -H 'timestamp: ****'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'api-key' => '****',
  'signature' => '****',
  'timestamp' => '****'
}

result = RestClient.get 'http://api.delta.exchange/v2/fills/history/download/csv',
  params: {
  'start_time' => 'integer',
'end_time' => 'integer'
}, headers: headers

p JSON.parse(result)

```

`GET /fills/history/download/csv`

<h3 id="download-wallet-transactions-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_ids|query|string|false|none|
|contract_types|query|string|false|none|
|start_time|query|integer|true|Start time for the fills query|
|end_time|query|integer|true|End time for the fills query|

#### Enumerated Values

|Parameter|Value|
|---|---|
|contract_types|futures|
|contract_types|perpetual_futures|
|contract_types|call_options|
|contract_types|put_options|
|contract_types|interest_rate_swaps|
|contract_types|move_options|
|contract_types|spreads|

<h3 id="download-wallet-transactions-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|csv of fills for the filter query|None|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

# Schemas

<h2 id="tocSapisuccessresponse">ApiSuccessResponse</h2>

<a id="schemaapisuccessresponse"></a>

```json
{
  "success": true
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|success|boolean|false|none|none|

<h2 id="tocSapierrorresponse">ApiErrorResponse</h2>

<a id="schemaapierrorresponse"></a>

```json
{
  "success": false,
  "error": {}
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|success|boolean|false|none|none|
|error|object|false|none|none|

<h2 id="tocSindex">Index</h2>

<a id="schemaindex"></a>

```json
{
  "id": 0,
  "symbol": "string",
  "constituent_exchanges": [
    {}
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|none|none|
|symbol|string|false|none|none|
|constituent_exchanges|[object]|false|none|none|

<h2 id="tocSarrayofindices">ArrayOfIndices</h2>

<a id="schemaarrayofindices"></a>

```json
[
  {
    "id": 0,
    "symbol": "string",
    "constituent_exchanges": [
      {}
    ]
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Index](#schemaindex)]|false|none|none|

<h2 id="tocSasset">Asset</h2>

<a id="schemaasset"></a>

```json
{
  "id": 0,
  "symbol": "string",
  "precision": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|none|none|
|symbol|string|false|none|none|
|precision|integer|false|none|none|

<h2 id="tocSarrayofassets">ArrayOfAssets</h2>

<a id="schemaarrayofassets"></a>

```json
[
  {
    "id": 0,
    "symbol": "string",
    "precision": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Asset](#schemaasset)]|false|none|none|

<h2 id="tocSproduct">Product</h2>

<a id="schemaproduct"></a>

```json
{
  "id": 0,
  "symbol": "string",
  "description": "string",
  "created_at": "string",
  "updated_at": "string",
  "settlement_time": "string",
  "notional_type": "vanilla",
  "impact_size": 0,
  "initial_margin": 0,
  "maintenance_margin": "string",
  "contract_value": "string",
  "contract_unit_currency": "string",
  "tick_size": "string",
  "trading_status": "operational",
  "max_leverage_notional": "string",
  "default_leverage": "string",
  "initial_margin_scaling_factor": "string",
  "maintenance_margin_scaling_factor": "string",
  "taker_commission_rate": "string",
  "maker_commission_rate": "string",
  "liquidation_penalty_factor": "string",
  "contract_type": "string",
  "position_size_limit": 0,
  "basis_factor_max_limit": "string",
  "is_quanto": true,
  "funding_method": "string",
  "annualized_funding": "string",
  "price_band": "string",
  "underlying_asset": {
    "id": 0,
    "symbol": "string",
    "precision": 0
  },
  "quoting_asset": {
    "id": 0,
    "symbol": "string",
    "precision": 0
  },
  "settling_asset": {
    "id": 0,
    "symbol": "string",
    "precision": 0
  },
  "spot_index": {
    "id": 0,
    "symbol": "string",
    "constituent_exchanges": [
      {}
    ]
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|none|id of a product or a contract|
|symbol|string|false|none|symbol of a product or a contract e.g. LINKBTC, XRPUSDQ|
|description|string|false|none|description of a product or a contract|
|created_at|string|false|none|product/contract creation date and time|
|updated_at|string|false|none|product/contract update date and time|
|settlement_time|string|false|none|settlement Timestamp of futures contract|
|notional_type|string|false|none|whether notional is calculated using vanilla math or inverse math|
|impact_size|integer|false|none|size of a typical trade. Used in the computation of mark price|
|initial_margin|integer|false|none|The amount required to enter into a new position|
|maintenance_margin|string|false|none|The amount necessary when a loss on a futures position requires you to allocate more funds to return the margin to the initial margin level.|
|contract_value|string|false|none|The notional value of a futures contract is simply the spot price of the asset multiplied by the amount of the asset specified in the contract|
|contract_unit_currency|string|false|none|This is the unit of  1 contract, for vanilla futures, its underlying asset. for inverse, it is settling asset. for quanto, its settling asset / quoting asset|
|tick_size|string|false|none|The minimum gap between 2 consecutive prices.|
|trading_status|string|false|none|trading status of the contract e.g. 'operational','disrupted_cancel_only' or 'disrupted_post_only'|
|max_leverage_notional|string|false|none|maximum notional position size (in settling asset terms) that can be acquired at highest allowed leverage for a given contract.|
|default_leverage|string|false|none|default leverage|
|initial_margin_scaling_factor|string|false|none|none|
|maintenance_margin_scaling_factor|string|false|none|none|
|taker_commission_rate|string|false|none|rate at which commission fee will be calculated for a taker trade in given contract|
|maker_commission_rate|string|false|none|rate at which maker rebate will be calculated|
|liquidation_penalty_factor|string|false|none|Determines liquidation charge as per the following formula: liquidation_penalty_factor * minimum maintenance margin|
|contract_type|string|false|none|Type of contracts e.g. futures, perpetual futures,|
|position_size_limit|integer|false|none|Maximum size of contracts in a single order can be placed|
|basis_factor_max_limit|string|false|none|Maximum allowed value of annualized basis|
|is_quanto|boolean|false|none|Flag which denotes whether future contract is quanto or not|
|funding_method|string|false|none|Method used to calculate funding for given contract. e.g. Fixed or mark price|
|annualized_funding|string|false|none|Maximum allowed value of funding, expressed as annual rate.|
|price_band|string|false|none|he range around mark price in which trading is allowed. This number is in percentage.|
|underlying_asset|[Asset](#schemaasset)|false|none|none|
|quoting_asset|[Asset](#schemaasset)|false|none|none|
|settling_asset|[Asset](#schemaasset)|false|none|none|
|spot_index|[Index](#schemaindex)|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|notional_type|vanilla|
|notional_type|inverse|
|trading_status|operational|
|trading_status|disrupted_cancel_only|
|trading_status|disrupted_post_only|

<h2 id="tocSarrayofproducts">ArrayOfProducts</h2>

<a id="schemaarrayofproducts"></a>

```json
[
  {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "created_at": "string",
    "updated_at": "string",
    "settlement_time": "string",
    "notional_type": "vanilla",
    "impact_size": 0,
    "initial_margin": 0,
    "maintenance_margin": "string",
    "contract_value": "string",
    "contract_unit_currency": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "max_leverage_notional": "string",
    "default_leverage": "string",
    "initial_margin_scaling_factor": "string",
    "maintenance_margin_scaling_factor": "string",
    "taker_commission_rate": "string",
    "maker_commission_rate": "string",
    "liquidation_penalty_factor": "string",
    "contract_type": "string",
    "position_size_limit": 0,
    "basis_factor_max_limit": "string",
    "is_quanto": true,
    "funding_method": "string",
    "annualized_funding": "string",
    "price_band": "string",
    "underlying_asset": {
      "id": 0,
      "symbol": "string",
      "precision": 0
    },
    "quoting_asset": {
      "id": 0,
      "symbol": "string",
      "precision": 0
    },
    "settling_asset": {
      "id": 0,
      "symbol": "string",
      "precision": 0
    },
    "spot_index": {
      "id": 0,
      "symbol": "string",
      "constituent_exchanges": [
        {}
      ]
    }
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Product](#schemaproduct)]|false|none|none|

<h2 id="tocSorder">Order</h2>

<a id="schemaorder"></a>

```json
{
  "id": 0,
  "user_id": 0,
  "size": 0,
  "unfilled_size": 0,
  "side": "buy",
  "order_type": "limit_order",
  "limit_price": "string",
  "stop_order_type": "stop_loss_order",
  "stop_price": "string",
  "close_on_trigger": "false",
  "state": "open",
  "created_at": "string",
  "product_id": 0
}

```

*An Order object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|user_id|integer|false|none|none|
|size|integer|false|none|none|
|unfilled_size|integer|false|none|none|
|side|string|false|none|side for which to place order|
|order_type|string|false|none|none|
|limit_price|string|false|none|none|
|stop_order_type|string|false|none|none|
|stop_price|string|false|none|none|
|close_on_trigger|string|false|none|none|
|state|string|false|none|Order Status|
|created_at|string|false|none|none|
|product_id|integer|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|stop_order_type|stop_loss_order|
|close_on_trigger|false|
|close_on_trigger|true|
|state|open|
|state|pending|
|state|closed|
|state|cancelled|

<h2 id="tocSarrayoforders">ArrayOfOrders</h2>

<a id="schemaarrayoforders"></a>

```json
[
  {
    "id": 0,
    "user_id": 0,
    "size": 0,
    "unfilled_size": 0,
    "side": "buy",
    "order_type": "limit_order",
    "limit_price": "string",
    "stop_order_type": "stop_loss_order",
    "stop_price": "string",
    "close_on_trigger": "false",
    "state": "open",
    "created_at": "string",
    "product_id": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Order](#schemaorder)]|false|none|[An Order object]|

<h2 id="tocScreateorderrequest">CreateOrderRequest</h2>

<a id="schemacreateorderrequest"></a>

```json
{
  "product_id": 0,
  "limit_price": "string",
  "size": 0,
  "side": "buy",
  "order_type": "limit_order",
  "time_in_force": "gtc",
  "post_only": "true",
  "reduce_only": "true"
}

```

*A create order object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|product_id|integer|true|none|none|
|limit_price|string|false|none|none|
|size|integer|false|none|none|
|side|string|false|none|side for which to place order|
|order_type|string|false|none|none|
|time_in_force|string|false|none|none|
|post_only|string|false|none|none|
|reduce_only|string|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|order_type|limit_order|
|order_type|market_order|
|time_in_force|gtc|
|time_in_force|ioc|
|time_in_force|fok|
|post_only|true|
|post_only|false|
|reduce_only|true|
|reduce_only|false|

<h2 id="tocSarrayofcreateorderrequest">ArrayOfCreateOrderRequest</h2>

<a id="schemaarrayofcreateorderrequest"></a>

```json
[
  {
    "product_id": 0,
    "limit_price": "string",
    "size": 0,
    "side": "buy",
    "order_type": "limit_order",
    "time_in_force": "gtc",
    "post_only": "true",
    "reduce_only": "true"
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[CreateOrderRequest](#schemacreateorderrequest)]|false|none|[A create order object]|

<h2 id="tocSeditorderrequest">EditOrderRequest</h2>

<a id="schemaeditorderrequest"></a>

```json
{
  "id": 0,
  "product_id": 0,
  "limit_price": "string",
  "size": 0
}

```

*edit order object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|product_id|integer|false|none|none|
|limit_price|string|false|none|none|
|size|integer|false|none|total size after editing order|

<h2 id="tocSarrayofeditorderrequest">ArrayOfEditOrderRequest</h2>

<a id="schemaarrayofeditorderrequest"></a>

```json
[
  {
    "id": 0,
    "product_id": 0,
    "limit_price": "string",
    "size": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[EditOrderRequest](#schemaeditorderrequest)]|false|none|[edit order object]|

<h2 id="tocSdeleteorderrequest">DeleteOrderRequest</h2>

<a id="schemadeleteorderrequest"></a>

```json
{
  "id": 0,
  "product_id": 0
}

```

*A delete order object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|product_id|integer|false|none|none|

<h2 id="tocScancelallfilterobject">CancelAllFilterObject</h2>

<a id="schemacancelallfilterobject"></a>

```json
{
  "product_id": 0,
  "cancel_limit_orders": "true",
  "cancel_stop_orders": "true"
}

```

*Cancel all request filter object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|product_id|integer|false|none|cancel all orders for particular product, cancels orders for all products if not provided|
|cancel_limit_orders|string|false|none|set as true to cancel open limit orders|
|cancel_stop_orders|string|false|none|set as true to cancel stop orders|

#### Enumerated Values

|Property|Value|
|---|---|
|cancel_limit_orders|true|
|cancel_limit_orders|false|
|cancel_stop_orders|true|
|cancel_stop_orders|false|

<h2 id="tocSarrayofdeleteorderrequest">ArrayOfDeleteOrderRequest</h2>

<a id="schemaarrayofdeleteorderrequest"></a>

```json
[
  {
    "id": 0,
    "product_id": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[DeleteOrderRequest](#schemadeleteorderrequest)]|false|none|[A delete order object]|

<h2 id="tocSposition">Position</h2>

<a id="schemaposition"></a>

```json
{
  "user_id": 0,
  "size": 0,
  "entry_price": "string",
  "margin": "string",
  "liquidation_price": "string",
  "bankruptcy_price": "string",
  "adl_level": 0,
  "product_id": 0
}

```

*A position object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|user_id|integer|false|none|none|
|size|integer|false|none|Position size, negative for short and positive for long|
|entry_price|string|false|none|none|
|margin|string|false|none|none|
|liquidation_price|string|false|none|none|
|bankruptcy_price|string|false|none|none|
|adl_level|integer|false|none|none|
|product_id|integer|false|none|none|

<h2 id="tocSarrayofpositions">ArrayOfPositions</h2>

<a id="schemaarrayofpositions"></a>

```json
[
  {
    "user_id": 0,
    "size": 0,
    "entry_price": "string",
    "margin": "string",
    "liquidation_price": "string",
    "bankruptcy_price": "string",
    "adl_level": 0,
    "product_id": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Position](#schemaposition)]|false|none|[A position object]|

<h2 id="tocSfill">Fill</h2>

<a id="schemafill"></a>

```json
{
  "id": 0,
  "size": 0,
  "side": "buy",
  "price": "string",
  "role": "taker",
  "commission": "string",
  "created_at": "string",
  "product_id": 0
}

```

*A fill object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|size|integer|false|none|none|
|side|string|false|none|none|
|price|string|false|none|Price at which the fill happened, BigDecimal sent as string|
|role|string|false|none|none|
|commission|string|false|none|Commission paid on this fill, negative value means commission was earned because of maker role|
|created_at|string|false|none|none|
|product_id|integer|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|
|role|taker|
|role|maker|

<h2 id="tocSarrayoffills">ArrayOfFills</h2>

<a id="schemaarrayoffills"></a>

```json
[
  {
    "id": 0,
    "size": 0,
    "side": "buy",
    "price": "string",
    "role": "taker",
    "commission": "string",
    "created_at": "string",
    "product_id": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Fill](#schemafill)]|false|none|[A fill object]|

<h2 id="tocSorderleverage">OrderLeverage</h2>

<a id="schemaorderleverage"></a>

```json
{
  "leverage": "string",
  "order_margin": "string",
  "product_id": 0
}

```

*Order Leverage for a product*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|leverage|string|false|none|Leverage of all open orders for this product|
|order_margin|string|false|none|Margin blocked in open orders for this product|
|product_id|integer|false|none|none|

<h2 id="tocSl2orderbook">L2Orderbook</h2>

<a id="schemal2orderbook"></a>

```json
{
  "buy_book": [
    {
      "price": "string",
      "size": 0
    }
  ],
  "sell_book": [
    {
      "price": "string",
      "size": 0
    }
  ]
}

```

*L2 orderbook*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|buy_book|[object]|false|none|none|
|» price|string|false|none|none|
|» size|integer|false|none|none|
|sell_book|[object]|false|none|none|
|» price|string|false|none|none|
|» size|integer|false|none|none|

<h2 id="tocStrades">Trades</h2>

<a id="schematrades"></a>

```json
{
  "trades": [
    {
      "side": "buy",
      "size": 0,
      "price": "string",
      "timestamp": 0
    }
  ]
}

```

*trades of a symbol*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|trades|[object]|false|none|none|
|» side|string|false|none|none|
|» size|integer|false|none|none|
|» price|string|false|none|none|
|» timestamp|integer|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|side|buy|
|side|sell|

<h2 id="tocSwallet">Wallet</h2>

<a id="schemawallet"></a>

```json
{
  "balance": "string",
  "order_margin": "string",
  "position_margin": "string",
  "commission": "string",
  "available_balance": "string",
  "asset": {
    "id": 0,
    "symbol": "string",
    "precision": 0
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|balance|string|false|none|Total wallet balance|
|order_margin|string|false|none|Margin blocked in open orders|
|position_margin|string|false|none|Margin blocked in open positions|
|commission|string|false|none|Commissions blocked in open orders and open positions|
|available_balance|string|false|none|Amount available for withdrawals|
|asset|[Asset](#schemaasset)|false|none|none|

<h2 id="tocSarrayofwallets">ArrayOfWallets</h2>

<a id="schemaarrayofwallets"></a>

```json
[
  {
    "balance": "string",
    "order_margin": "string",
    "position_margin": "string",
    "commission": "string",
    "available_balance": "string",
    "asset": {
      "id": 0,
      "symbol": "string",
      "precision": 0
    }
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Wallet](#schemawallet)]|false|none|none|

<h2 id="tocStransaction">Transaction</h2>

<a id="schematransaction"></a>

```json
{
  "id": 0,
  "amount": "string",
  "balance": "string",
  "transaction_type": "pnl",
  "meta_data": {},
  "product_id": 0,
  "asset_id": 0,
  "created_at": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|amount|string|false|none|amount credited/debited in this transaction (+ for credited, - for debited)|
|balance|string|false|none|net wallet balance after this transaction|
|transaction_type|string|false|none|none|
|meta_data|object|false|none|none|
|product_id|integer|false|none|none|
|asset_id|integer|false|none|none|
|created_at|string|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|transaction_type|pnl|
|transaction_type|deposit|
|transaction_type|withdrawal|
|transaction_type|commission|
|transaction_type|conversion|
|transaction_type|perpetual_futures_funding|
|transaction_type|withdrawal_cancellation|
|transaction_type|referral_bonus|
|transaction_type|commission_rebate|
|transaction_type|promo_credit|

<h2 id="tocSarrayoftransactions">ArrayOfTransactions</h2>

<a id="schemaarrayoftransactions"></a>

```json
[
  {
    "id": 0,
    "amount": "string",
    "balance": "string",
    "transaction_type": "pnl",
    "meta_data": {},
    "product_id": 0,
    "asset_id": 0,
    "created_at": "string"
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Transaction](#schematransaction)]|false|none|none|

<h2 id="tocSticker">Ticker</h2>

<a id="schematicker"></a>

```json
{
  "symbol": "string",
  "timestamp": 0,
  "open": 0,
  "high": 0,
  "low": 0,
  "close": 0,
  "volume": 0,
  "mark_price": "string",
  "spot_price": "string",
  "turnover": 0,
  "turnover_symbol": "string",
  "turnover_usd": 0
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|symbol|string|false|none|none|
|timestamp|integer|false|none|none|
|open|number|false|none|none|
|high|number|false|none|none|
|low|number|false|none|none|
|close|number|false|none|none|
|volume|integer|false|none|none|
|mark_price|string|false|none|none|
|spot_price|string|false|none|none|
|turnover|number|false|none|none|
|turnover_symbol|string|false|none|none|
|turnover_usd|number|false|none|none|

<h2 id="tocSarrayoftickers">ArrayOfTickers</h2>

<a id="schemaarrayoftickers"></a>

```json
[
  {
    "symbol": "string",
    "timestamp": 0,
    "open": 0,
    "high": 0,
    "low": 0,
    "close": 0,
    "volume": 0,
    "mark_price": "string",
    "spot_price": "string",
    "turnover": 0,
    "turnover_symbol": "string",
    "turnover_usd": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Ticker](#schematicker)]|false|none|none|

<h2 id="tocSpaginationmeta">PaginationMeta</h2>

<a id="schemapaginationmeta"></a>

```json
{
  "after": "string",
  "before": "string"
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|after|string|false|none|none|
|before|string|false|none|none|

<h2 id="tocSohlcdata">OHLCData</h2>

<a id="schemaohlcdata"></a>

```json
{
  "time": 0,
  "open": 0,
  "high": 0,
  "low": 0,
  "close": 0,
  "volume": 0
}

```

*A ohlc object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|time|integer|false|none|none|
|open|number(float)|false|none|none|
|high|number|false|none|none|
|low|number|false|none|none|
|close|number|false|none|none|
|volume|number|false|none|none|

<h2 id="tocSarrayofohlcdata">ArrayOfOHLCData</h2>

<a id="schemaarrayofohlcdata"></a>

```json
[
  {
    "time": 0,
    "open": 0,
    "high": 0,
    "low": 0,
    "close": 0,
    "volume": 0
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[OHLCData](#schemaohlcdata)]|false|none|[A ohlc object]|

<h2 id="tocSsparklinedata">SparklineData</h2>

<a id="schemasparklinedata"></a>

```json
{
  "MARK:BTCUSD_31Oct": [
    [
      1594214051,
      0.00003826
    ],
    [
      1594214051,
      0.00003826
    ]
  ],
  "SPOT:BTCUSD_31Oct": [
    [
      1594215270,
      0.00003826
    ]
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|**additionalProperties**|[integer]|false|none|array of timestamp and closing value|

