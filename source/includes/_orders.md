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

```javascript
var query = { side: 'sell' };
client.getOrders(query, function (err, orders) {
  console.log("orders err", err);
  console.log("orders", orders);
});
```

```php
<?php
$query = [ "status" => "canceled", "side" => "sell" ];
$client->getOrders($query);
?>
```

> The above command returns an Object structured like this:

```ruby
# Hashie::Mash Object
orders.each do |order|
  order.orderId
  order.events
end
```

```python
// JSON Array of Objects
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

```javascript
// JSON Array of Objects
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

```php
<?php
// Array of Array Objects
[
  [
    "orderId" => "886313e1-3b8a-5372-9b90-0c9aee199e5d",
    "side" => "buy",
    "orderType" => "limit",
    "status" => "open",
    "price" => 600.12,
    "priceCurrency" => "USD",
    "quantity" => 1.234567,
    "quantity_currency" =>: "BTC",
    "events" => [
      [
        "eventType" => "created",
        "eventDate" => "2014-05-06T13:15:30Z"
      ]
    ]
  ]
]
?>
```

This endpoint retrieves all orders based on the given query.

### HTTP Request

`GET /orders`

### Query Parameters

Param | Description
--- | ---
`status` | enum: `['opened', 'reopened', 'filled', 'canceled']`  
`side` | enum: `['buy', 'sell']`  
`orderType` | enum: `['market', 'limit']`  
`dateMin` | format: ISO-8601, e.g. `'2014-05-06T13:15:30Z'`  
`dateMax` | format: ISO-8601, e.g. `'2014-05-06T13:15:30Z'`


## Get a single order

```ruby
# Get order with the ID
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.get_order_by_id(order_id)

# For convenience, you can also get order by full URL
url = 'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
client.get_order_by_url(url)
```

```python
# Get order with the ID
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.get_order_by_id(order_id)

# For convenience, you can also get order by full URL
url = 'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
client.get_order_by_url(url)
```

```javascript
// Get order with the ID
var orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.getOrderById(orderId, function (err, order) {
  console.log("order err", err);
  console.log("order", order);
});

// For convenience, you can also get order by full URL
var url = 'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09';
client.getOrderByUrl(url, function (err, order) {
  console.log("order err", err);
  console.log("order", order);
});
```

```php
<?php
// Get order with the ID
$orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->getOrderById($orderId);

// For convenience, you can also get order by full URL
$url = 'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09';
$client->getOrderByUrl($url);
?>
```

> The above command returns an Object structured like this:


```ruby
# Hashie::Mash Object
order.orderId # "886313e1-3b8a-5372-9b90-0c9aee199e5d"
order.status # "open"
order.events.each do |event|
  event.eventType
  event.eventDate
end
```

```python
# Json Object
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

```javascript
// Json Object
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

```php
<?php
// Array Object
[
  "orderId" => "886313e1-3b8a-5372-9b90-0c9aee199e5d",
  "side" => "buy",
  "orderType" => "limit",
  "status" => "open",
  "price" => 600.12,
  "priceCurrency" => "USD",
  "quantity" => 1.234567,
  "quantity_currency" =>: "BTC",
  "events" => [
    [
      "eventType" => "created",
      "eventDate" => "2014-05-06T13:15:30Z"
    ]
  ]
]
?>
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
# a limit order to buy bitcoin at a specified price
order = {
  :instrument => "BTC_USD",
  :side => "buy",
  :orderType => "limit",
  :quantity => "0.05",
  :price => "623.12"
}

# Flip the instrument to buy US $500 worth of bitcoin at market price
order = {
  :instrument" => "USD_BTC",
  :side" => "sell",
  :orderType" => "market",
  :quantity" => "500.00"
}
client.create_order(order)
```

```python
# a limit order to buy bitcoin at a specified price
order = {
  "instrument": "BTC_USD",
  "side": "buy",
  "orderType": "limit",
  "quantity": "0.05",
  "price": "623.12"
}

# Flip the instrument to buy US $500 worth of bitcoin at market price
order = {
  "instrument": "USD_BTC",
  "side": "sell",
  "orderType": "market",
  "quantity": "500.00"
}
client.create_order(order)
```

```javascript
// a limit order to buy bitcoin at a specified price
var order = {
  "instrument": "BTC_USD",
  "side": "buy",
  "orderType": "limit",
  "quantity": "0.05",
  "price": "623.12"
}

// Flip the instrument to buy US $500 worth of bitcoin at market price
var order = {
  "instrument": "USD_BTC",
  "side": "sell",
  "orderType": "market",
  "quantity": "500.00"
}

client.createOrder(order, function (err, msg) {
  console.log("cancel order err", err);
  console.log("cancel order", msg);
});
```

```php
<?php
// a limit order to buy bitcoin at a specified price
order = {
  "instrument" => "BTC_USD",
  "side" => "buy",
  "orderType" => "limit",
  "quantity" => "0.05",
  "price" => "623.12"
}

// Flip the instrument to buy US $500 worth of bitcoin at market price
order = {
  "instrument" => "USD_BTC",
  "side" => "sell",
  "orderType" => "market",
  "quantity" => "500.00"
}
$client->createOrder($order);
?>
```

> A successful order creation returns the url location of the new order in the response location header

```ruby
# string
'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
```

```python
# string
'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
```

```javascript
// string
'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
```

```php
<?php
// string
'http://api.buttercoin.com/v1/orders/3f002e80-62c6-4274-a2d7-3f191923be09'
?>
```

Create a new order with the given params

Param | Description
--- | ---
`instrument` | enum: `['BTC_USD, USD_BTC']`
`side` | enum: `['buy', 'sell']`, required `true`  
`orderType` | enum: `['limit', 'market']`, required `true`  
`price` | `string`, required `false`  
`quantity` | `string`, required `false`

TODO:  TALK ABOUT INSTRUMENTS

## Cancel an order

```ruby
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_order(order_id)
```

```python
order_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_order(order_id)
```

```javascript
var orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.cancelOrder(orderId, function (err, msg) {
  console.log("cancel order err", err);
  console.log("cancel order", msg);
});
```

```php
<?php
$orderId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->cancelOrder($orderId);
?>
```

> The above command returns an HTTP response with status code 204

```ruby
# Hashie::Mash Object
response.status # 204
response.message # "This operation has completed successfully"
```

```python
// JSON Object
{ "status": 204, message: "This operation has completed successfully" }
```

```javascript
# JSON Object
{ status: 204, message: "This operation has completed successfully" }
```

```php
<?php
// Array Object
[ "status" => 204, "message" => "This operation has completed successfully" ]
?>
```

Cancel a single order with the given ID.

### HTTP Request

`DELETE /orders/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the order to cancel
