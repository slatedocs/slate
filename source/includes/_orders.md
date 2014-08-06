# Orders

## Get all orders 

```ruby
query = { "status" => "opened" }
client.get_orders(query)
```

```python
query = {'status': 'filled'}
client.get_orders(body=query)
```

```php
$query = [ "status" => "canceled", "side" => "sell" ];
$client->getOrders($query);
```

```javascript
var query = { side: 'sell' };
client.getOrders(query, function (err, orders) {
  console.log("orders err", err);
  console.log("orders", orders);
});
```

> The above command returns JSON structured like this:

```json
[
  {
    "orderId": "886313e1-3b8a-5372-9b90-0c9aee199e5d",
    "side": "buy",
    "orderType": "limit",
    "status": "open",
    "price": 600.12,
    "priceCurrency": "USD",
    "quantity": 1.234567,
    "quantity_currency": "BTC",
    "events": [
      {
        "eventType": "created",
        "eventDate": "2014-05-06T13:15:30Z"
      }
    ]
  }
]
```

This endpoint retrieves all orders based on the given query.

### HTTP Request

`GET /orders`

### Query Parameters

Name | Param | Description
--- | --- | ---
Status | `status` | enum: `['opened', 'reopened', 'filled', 'canceled']`  
Side | `side` | enum: `['buy', 'sell']`  
Order Type | `orderType` | enum: `['market', 'limit']`  
Date Min | `dateMin` | format: ISO-8601, e.g. `'2014-05-06T13:15:30Z'`  
Date Max | `dateMax` | format: ISO-8601, e.g. `'2014-05-06T13:15:30Z'`


## Get a single order

```ruby
# Get order with the ID
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.get_order_by_id(order_id)

# For convenience, you can also get order by full URL
url = 'http://localhost:9002/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
client.get_order_by_url(url)
```

```python
# Get order with the ID
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.get_order_by_id(order_id)

# For convenience, you can also get order by full URL
url = 'http://localhost:9002/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
client.get_order_by_url(url)
```

```php
// Get order with the ID
$orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->getOrderById($orderId);

// For convenience, you can also get order by full URL
$url = 'http://localhost:9002/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09';
$client->getOrderByUrl($url);
```

```javascript
// Get order with the ID
var orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.getOrderById(orderId, function (err, order) {
  console.log("order err", err);
  console.log("order", order);
});

// For convenience, you can also get order by full URL
var url = 'http://localhost:9002/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09';
client.getOrderByUrl(url, function (err, order) {
  console.log("order err", err);
  console.log("order", order);
});
```
> The above command returns JSON structured like this:

```json
{
  "orderId": "886313e1-3b8a-5372-9b90-0c9aee199e5d",
  "side": "buy",
  "orderType": "limit",
  "status": "open",
  "price": 600.12,
  "priceCurrency": "USD",
  "quantity": 1.234567,
  "quantity_currency": "BTC",
  "events": [
    {
      "eventType": "created",
      "eventDate": "2014-05-06T13:15:30Z"
    }
  ]
}
```

This endpoint retrieves a single order with the given ID.

### HTTP Request

`GET /orders/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the order to retrieve

## Create an order

```ruby
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_order(order_id)
```

```python
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_order(order_id)
```

```php
$orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->cancelOrder($orderId);
```

```javascript
var orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.cancelOrder(orderId, function (err, msg) {
  console.log("cancel order err", err);
  console.log("cancel order", msg);
});
```

> A successful order creation returns the url location of the new order in the response location header

```
Location: 'http://localhost:9002/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
```

Create a new order with the given params

Name | Param | Description
--- | --- | ---
Instrument | `instrument` | enum: `['BTC_USD, USD_BTC']`
Side | `side` | enum: `['buy', 'sell']`, required `true`  
Order Type | `orderType` | enum: `['limit', 'market']`, required `true`  
Price | `price` | `string`, required `false`  
Quantity | `quantity` | `string`, required `false`

## Cancel an order

```ruby
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_order(order_id)
```

```python
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_order(order_id)
```

```php
$orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->cancelOrder($orderId);
```

```javascript
var orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.cancelOrder(orderId, function (err, msg) {
  console.log("cancel order err", err);
  console.log("cancel order", msg);
});
```
> The above command returns an HTTP response with status code 204

Cancel a single order with the given ID.

### HTTP Request

`DELETE /orders/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the order to cancel
