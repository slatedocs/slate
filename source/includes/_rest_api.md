<h1 id="ApiSection" class="section-header">API</h1>
The REST API has endpoints for account and order management as well as public market data.

REST API ENDPOINT URL

- Production - https://api.delta.exchange
- Testnet - https://testnet-api.delta.exchange

<h1 id="delta-exchange-api-products">Products</h1>

Get Product List, 24hr Ticker

## Get live products

<a id="opIdgetProducts"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://api.delta.exchange/products', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/products \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'https://api.delta.exchange/products',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /products`

> Example responses

> 200 Response

```json
[
  {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
]
```

<h3 id="get-live-products-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of live products|[ArrayOfProducts](#schemaarrayofproducts)|

<aside class="success">
This operation does not require authentication.
</aside>

## Get 24hr ticker

<a id="opIdget24hrTicker"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://api.delta.exchange/products/ticker/24hr', params={
  'symbol': 'string'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/products/ticker/24hr?symbol=string \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'https://api.delta.exchange/products/ticker/24hr',
  params: {
  'symbol' => 'string'
}, headers: headers

p JSON.parse(result)

```

`GET /products/ticker/24hr`

<h3 id="get-24hr-ticker-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|symbol|query|string|true|product symbol|

> Example responses

> 200 Response

```json
{
  "symbol": "string",
  "timestamp": 0,
  "open": 0,
  "high": 0,
  "low": 0,
  "close": 0,
  "volume": 0
}
```

<h3 id="get-24hr-ticker-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Ticker Date|[24hrTicker](#schema24hrticker)|

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-orders">Orders</h1>

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

r = requests.post('https://api.delta.exchange/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST https://api.delta.exchange/orders \
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

result = RestClient.post 'https://api.delta.exchange/orders',
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
  "time_in_force": "gtc"
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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}
```

<h3 id="place-order-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns back the order object with assigned id and latest state|[Order](#schemaorder)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if order could not be placed|Inline|

<h3 id="place-order-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|InsufficientMargin|
|error|OrderSizeExceededAvailable|
|error|OrderExceedsSizeLimit|
|error|OrderLeverageNotSet|
|error|InvalidProduct|
|error|ImmediateLiquidationOrder|
|error|LowerthanBankruptcy|
|error|SelfMatchingPostOnlyMode|
|error|ImmediateExecutionPostOnlyOrder|

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

r = requests.delete('https://api.delta.exchange/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X DELETE https://api.delta.exchange/orders \
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

result = RestClient.delete 'https://api.delta.exchange/orders',
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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}
```

<h3 id="cancel-order-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|Returns back the order object|[Order](#schemaorder)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if order could not be cancelled|Inline|

<h3 id="cancel-order-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|ALREADY_FILLED|
|error|InvalidOrder|
|error|InvalidProduct|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Get Orders

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

r = requests.get('https://api.delta.exchange/orders', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/orders \
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

result = RestClient.get 'https://api.delta.exchange/orders',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /orders`

<h3 id="get-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_id|query|integer|false|get orders for a particular product id|
|state|query|string|false|get orders with a particular state|
|stop_order_type|query|string|false|get stop orders with stop_order_type|
|page_num|query|integer|false|page number for pagination|
|page_size|query|integer|false|page size for pagination|

#### Enumerated Values

|Parameter|Value|
|---|---|
|state|open|
|state|closed|
|state|cancelled|
|stop_order_type|stop_loss_order|

> Example responses

> 200 Response

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
  }
]
```

<h3 id="get-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of orders as per the query|[ArrayOfOrders](#schemaarrayoforders)|

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

r = requests.post('https://api.delta.exchange/orders/batch', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST https://api.delta.exchange/orders/batch \
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

result = RestClient.post 'https://api.delta.exchange/orders/batch',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /orders/batch`

> Body parameter

```json
[
  {
    "product_id": 0,
    "limit_price": "string",
    "size": 0,
    "side": "buy",
    "order_type": "limit_order",
    "time_in_force": "gtc"
  }
]
```

<h3 id="create-batch-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ArrayOfCreateOrderRequest](#schemaarrayofcreateorderrequest)|true|none|

> Example responses

> 200 Response

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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}
```

<h3 id="create-batch-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the orders placed|[Order](#schemaorder)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|returns error if orders couldnt be placed|Inline|

<h3 id="create-batch-orders-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|InsufficientMargin|
|error|OrderSizeExceededAvailable|
|error|OrderExceedsSizeLimit|
|error|OrderLeverageNotSet|
|error|InvalidProduct|
|error|ImmediateLiquidationOrder|
|error|LowerthanBankruptcy|

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

r = requests.delete('https://api.delta.exchange/orders/batch', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X DELETE https://api.delta.exchange/orders/batch \
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

result = RestClient.delete 'https://api.delta.exchange/orders/batch',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`DELETE /orders/batch`

> Body parameter

```json
[
  {
    "id": 0,
    "product_id": 0
  }
]
```

<h3 id="delele-batch-orders-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ArrayOfDeleteOrderRequest](#schemaarrayofdeleteorderrequest)|true|none|

> Example responses

> 200 Response

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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}
```

<h3 id="delele-batch-orders-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the orders deleted|[Order](#schemaorder)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|returns error if orders couldnt be deleted|Inline|

<h3 id="delele-batch-orders-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|ALREADY_FILLED|
|error|InvalidOrder|
|error|InvalidProduct|

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

r = requests.post('https://api.delta.exchange/orders/leverage', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST https://api.delta.exchange/orders/leverage \
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

result = RestClient.post 'https://api.delta.exchange/orders/leverage',
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
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the OrderLeverage object|[OrderLeverage](#schemaorderleverage)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if leverage couldnt be changed|Inline|

<h3 id="change-order-leverage-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|InsufficientMargin|
|error|LeverageLimitExceeded|

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

r = requests.get('https://api.delta.exchange/orders/leverage', params={
  'product_id': '0'
}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/orders/leverage?product_id=0 \
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

result = RestClient.get 'https://api.delta.exchange/orders/leverage',
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
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the OrderLeverage object|[OrderLeverage](#schemaorderleverage)|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-positions">Positions</h1>

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

r = requests.get('https://api.delta.exchange/positions', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/positions \
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

result = RestClient.get 'https://api.delta.exchange/positions',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /positions`

> Example responses

> 200 Response

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
  }
]
```

<h3 id="get-open-positions-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of all open positions|[ArrayOfPositions](#schemaarrayofpositions)|

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

r = requests.post('https://api.delta.exchange/positions/change_margin', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST https://api.delta.exchange/positions/change_margin \
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

result = RestClient.post 'https://api.delta.exchange/positions/change_margin',
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
  "user_id": 0,
  "size": 0,
  "entry_price": "string",
  "margin": "string",
  "liquidation_price": "string",
  "bankruptcy_price": "string",
  "adl_level": 0,
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}
```

<h3 id="add/remove-position-margin-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the position object|[Position](#schemaposition)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if position margin could not be changed|Inline|

<h3 id="add/remove-position-margin-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|PositionNotSet|
|error|LeverageLimitExceeded|
|error|InsufficientMargin|
|error|ExistingOrderWithLowerThanBankruptcy|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Close position

<a id="opIdclosePosition"></a>

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

r = requests.post('https://api.delta.exchange/positions/close', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X POST https://api.delta.exchange/positions/close \
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

result = RestClient.post 'https://api.delta.exchange/positions/close',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`POST /positions/close`

> Body parameter

```json
{
  "product_id": 0,
  "cancel_orders_accepted": "true"
}
```

<h3 id="close-position-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|object|true|none|
|» product_id|body|integer|true|none|
|» cancel_orders_accepted|body|string|true|Flag to choose whether to cancel open orders in case they end up with insufficient margin after closing position|

#### Enumerated Values

|Parameter|Value|
|---|---|
|» cancel_orders_accepted|true|
|» cancel_orders_accepted|false|

> Example responses

> 200 Response

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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}
```

<h3 id="close-position-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|returns the order that was placed for closing position|[Order](#schemaorder)|
|400|[Bad Request](https://tools.ietf.org/html/rfc7231#section-6.5.1)|Returns error if position could not be closed|Inline|

<h3 id="close-position-responseschema">Response Schema</h3>

Status Code **400**

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|» error|string|false|none|none|
|» message|string|false|none|A more verbose error message|

#### Enumerated Values

|Property|Value|
|---|---|
|error|PositionNotSet|
|error|InsufficientMargin|
|error|InsufficientCommission|
|error|OrderSizeExceededAvailable|
|error|OrderLeverageNotSet|
|error|InvalidProduct|
|error|LowerthanBankruptcy|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-trade-history">Trade History</h1>

Get Orders History, Get Fill History

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

r = requests.get('https://api.delta.exchange/orders/history', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/orders/history \
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

result = RestClient.get 'https://api.delta.exchange/orders/history',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /orders/history`

<h3 id="get-order-history-(cancelled-and-closed)-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page_num|query|integer|false|page number for pagination|
|page_size|query|integer|false|page size for pagination|

> Example responses

> 200 Response

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
  }
]
```

<h3 id="get-order-history-(cancelled-and-closed)-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of orders|[ArrayOfOrders](#schemaarrayoforders)|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Get fills

<a id="opIdgetFills"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('https://api.delta.exchange/fills', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/fills \
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

result = RestClient.get 'https://api.delta.exchange/fills',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /fills`

<h3 id="get-fills-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page_num|query|integer|false|page number for pagination|
|page_size|query|integer|false|page size for pagination|

> Example responses

> 200 Response

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
  }
]
```

<h3 id="get-fills-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of Fills|[ArrayOfFills](#schemaarrayoffills)|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-orderbook">Orderbook</h1>

L2Orderbook

## Get L2 orderbook

<a id="opIdgetL2Orderbook"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://api.delta.exchange/orderbook/{product_id}/l2', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/orderbook/{product_id}/l2 \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'https://api.delta.exchange/orderbook/{product_id}/l2',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /orderbook/{product_id}/l2`

<h3 id="get-l2-orderbook-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|product_id|path|integer|true|none|

> Example responses

> 200 Response

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
  ],
  "recent_trades": [
    {
      "side": "buy",
      "size": 0,
      "price": "string",
      "timestamp": 0
    }
  ],
  "spot_price": "string",
  "mark_price": "string",
  "product_id": 0
}
```

<h3 id="get-l2-orderbook-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|L2 orderbook for the product|[L2Orderbook](#schemal2orderbook)|

<aside class="success">
This operation does not require authentication.
</aside>

<h1 id="delta-exchange-api-wallet">Wallet</h1>

Get balances, Get transaction history

## Get Wallet Balances

<a id="opIdgetWalletBalances"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('https://api.delta.exchange/wallet/balances', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/wallet/balances \
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

result = RestClient.get 'https://api.delta.exchange/wallet/balances',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /wallet/balances`

> Example responses

> 200 Response

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

<h3 id="get-wallet-balances-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|List of wallets attached to the user account|[ArrayOfWallets](#schemaarrayofwallets)|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

## Get Wallet transactions

<a id="opIdgetWalletTransactions"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json',
  'api-key': '****',
  'signature': '****',
  'timestamp': '****'
}

r = requests.get('https://api.delta.exchange/wallet/transactions', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/wallet/transactions \
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

result = RestClient.get 'https://api.delta.exchange/wallet/transactions',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /wallet/transactions`

<h3 id="get-wallet-transactions-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|asset_id|query|integer|false|asset_id for that particular Wallet|
|page_num|query|integer|false|page number for pagination|
|page_size|query|integer|false|page size for pagination|

> Example responses

> 200 Response

```json
[
  {
    "id": 0,
    "amount": "string",
    "balance": "string",
    "transaction_type": "pnl",
    "meta_data": {},
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    },
    "created_at": "string"
  }
]
```

<h3 id="get-wallet-transactions-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|list of transactions for that wallet|[ArrayOfTransactions](#schemaarrayoftransactions)|

<aside class="warning">
To perform this operation, you must be sign the request using your api key and secret. See Authentication section for more details.
</aside>

<h1 id="delta-exchange-api-ohlc-candles">OHLC Candles</h1>

## Get OHLC candles

<a id="opIdgetCandles"></a>

> Code samples

```python
import requests
headers = {
  'Accept': 'application/json'
}

r = requests.get('https://api.delta.exchange/chart/history', params={

}, headers = headers)

print r.json()

```

```shell
# You can also use wget
curl -X GET https://api.delta.exchange/chart/history \
  -H 'Accept: application/json'

```

```ruby
require 'rest-client'
require 'json'

headers = {
  'Accept' => 'application/json'
}

result = RestClient.get 'https://api.delta.exchange/chart/history',
  params: {
  }, headers: headers

p JSON.parse(result)

```

`GET /chart/history`

<h3 id="get-ohlc-candles-parameters">Parameters</h3>

|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|symbol|query|string|false|product symbol|
|from|query|integer|false|start time for the interval ( in seconds )|
|to|query|integer|false|end time for the interval ( in seconds )|
|resolution|query|string|false|resolution for the candles|

#### Enumerated Values

|Parameter|Value|
|---|---|
|resolution|1|
|resolution|5|
|resolution|15|
|resolution|60|
|resolution|360|
|resolution|D|

> Example responses

> 200 Response

```json
{
  "t": [
    0
  ],
  "o": [
    "string"
  ],
  "h": [
    "string"
  ],
  "l": [
    "string"
  ],
  "c": [
    "string"
  ],
  "v": [
    0
  ]
}
```

<h3 id="get-ohlc-candles-responses">Responses</h3>

|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OHLC candles|[OHLCData](#schemaohlcdata)|

<aside class="success">
This operation does not require authentication.
</aside>

# Schemas

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

<h2 id="tocSproduct">Product</h2>

<a id="schemaproduct"></a>

```json
{
  "id": 0,
  "symbol": "string",
  "description": "string",
  "product_type": "future",
  "initial_margin": "string",
  "maintenance_margin": "string",
  "settlement_time": "string",
  "impact_size": 0,
  "pricing_source": "string",
  "tick_size": "string",
  "trading_status": "operational",
  "position_size_limit": 0,
  "commission_rate": "string",
  "maker_commission_rate": "string",
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
  }
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer(int64)|false|none|none|
|symbol|string|false|none|none|
|description|string|false|none|none|
|product_type|string|false|none|none|
|initial_margin|string|false|none|none|
|maintenance_margin|string|false|none|none|
|settlement_time|string|false|none|none|
|impact_size|integer|false|none|none|
|pricing_source|string|false|none|none|
|tick_size|string|false|none|none|
|trading_status|string|false|none|none|
|position_size_limit|integer|false|none|none|
|commission_rate|string|false|none|none|
|maker_commission_rate|string|false|none|none|
|underlying_asset|[Asset](#schemaasset)|false|none|none|
|quoting_asset|[Asset](#schemaasset)|false|none|none|
|settling_asset|[Asset](#schemaasset)|false|none|none|

#### Enumerated Values

|Property|Value|
|---|---|
|product_type|future|
|product_type|inverse_future|
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
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
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
|product|[Product](#schemaproduct)|false|none|none|

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
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
  "time_in_force": "gtc"
}

```

*A create order object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|product_id|integer|false|none|none|
|limit_price|string|false|none|none|
|size|integer|false|none|none|
|side|string|false|none|side for which to place order|
|order_type|string|false|none|none|
|time_in_force|string|false|none|none|

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
    "time_in_force": "gtc"
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[CreateOrderRequest](#schemacreateorderrequest)]|false|none|[A create order object]|

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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
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
|product|[Product](#schemaproduct)|false|none|none|

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  }
}

```

*A fill object*

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|id|integer|false|none|none|
|size|integer|false|none|none|
|side|integer|false|none|none|
|price|string|false|none|Price at which the fill happened, BigDecimal sent as string|
|role|string|false|none|none|
|commission|string|false|none|Commission paid on this fill, negative value means commission was earned because of maker role|
|created_at|string|false|none|none|
|product|[Product](#schemaproduct)|false|none|none|

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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    }
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
  ],
  "recent_trades": [
    {
      "side": "buy",
      "size": 0,
      "price": "string",
      "timestamp": 0
    }
  ],
  "spot_price": "string",
  "mark_price": "string",
  "product_id": 0
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
|recent_trades|[object]|false|none|none|
|» side|string|false|none|none|
|» size|integer|false|none|none|
|» price|string|false|none|none|
|» timestamp|integer|false|none|none|
|spot_price|string|false|none|none|
|mark_price|string|false|none|none|
|product_id|integer|false|none|none|

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
  "product": {
    "id": 0,
    "symbol": "string",
    "description": "string",
    "product_type": "future",
    "initial_margin": "string",
    "maintenance_margin": "string",
    "settlement_time": "string",
    "impact_size": 0,
    "pricing_source": "string",
    "tick_size": "string",
    "trading_status": "operational",
    "position_size_limit": 0,
    "commission_rate": "string",
    "maker_commission_rate": "string",
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
    }
  },
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
|product|[Product](#schemaproduct)|false|none|none|
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
    "product": {
      "id": 0,
      "symbol": "string",
      "description": "string",
      "product_type": "future",
      "initial_margin": "string",
      "maintenance_margin": "string",
      "settlement_time": "string",
      "impact_size": 0,
      "pricing_source": "string",
      "tick_size": "string",
      "trading_status": "operational",
      "position_size_limit": 0,
      "commission_rate": "string",
      "maker_commission_rate": "string",
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
      }
    },
    "created_at": "string"
  }
]

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|*anonymous*|[[Transaction](#schematransaction)]|false|none|none|

<h2 id="tocS24hrticker">24hrTicker</h2>

<a id="schema24hrticker"></a>

```json
{
  "symbol": "string",
  "timestamp": 0,
  "open": 0,
  "high": 0,
  "low": 0,
  "close": 0,
  "volume": 0
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

<h2 id="tocSohlcdata">OHLCData</h2>

<a id="schemaohlcdata"></a>

```json
{
  "t": [
    0
  ],
  "o": [
    "string"
  ],
  "h": [
    "string"
  ],
  "l": [
    "string"
  ],
  "c": [
    "string"
  ],
  "v": [
    0
  ]
}

```

### Properties

|Name|Type|Required|Restrictions|Description|
|---|---|---|---|---|
|t|[integer]|false|none|array of timestamps for which candles are returned|
|o|[string]|false|none|open prices for candles|
|h|[string]|false|none|high prices for candles|
|l|[string]|false|none|low prices for candles|
|c|[string]|false|none|close prices for candles|
|v|[integer]|false|none|volumes for candles|

