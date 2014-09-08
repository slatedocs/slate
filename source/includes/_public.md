# Public

## Get the orderbook

> Success Response Code: 200

```ruby
client.get_order_book()
```

```python
client.get_order_book()
```

```javascript
client.getOrderbook(function (err, orderBook) {
  console.log("order book err", err);
  console.log("order book", orderBook);
});
```

```php
<?php
$client->getOrderBook();
?>
```

> The above command returns an Object structured like this:

```ruby
# Hashie::Mash Object examples

# get the highest bid price
orderbook.bid.first.price # 402.87
# get the quantity of the lowest ask
orderbook.ask.first.quantity # 1.35

# loop through all bids
orderbook.bid.each do |order|
order.price
order.quantity
end
```

```python
# Dict Object
{
  "bid": [
    {
      "price": 402.87,
      "quantity": 1.3
    },
    {
      "price": 404.21,
      "quantity": 1.25
    }
  ],
  "ask": [
    {
      "price": 423.58,
      "quantity": 1.3
    },
    {
      "price": 425.25,
      "quantity": 1.35
    }
  ],
  "price_currency": "USD",
  "quantity_currency": "BTC"
}
```

```javascript
// JSON Object
{
  "bid": [
    {
      "price": 402.87,
      "quantity": 1.3
    },
    {
      "price": 404.21,
      "quantity": 1.25
    }
  ],
  "ask": [
    {
      "price": 423.58,
      "quantity": 1.3
    },
    {
      "price": 425.25,
      "quantity": 1.35
    }
  ],
  "price_currency": "USD",
  "quantity_currency": "BTC"
}
```

```php
<?php
// Array Object
[
  "bid" => [
    [
      "price" => 402.87,
      "quantity" => 1.3
    ],
    [
      "price" => 404.21,
      "quantity" => 1.25
    ]
  ],
  "ask" => [
    [
      "price" => 423.58,
      "quantity" => 1.3
    ],
    [
      "price" => 425.25,
      "quantity" => 1.35
    ]
  ]
]
?>
```

Get all the orders in the book on both the bid and ask sides

### HTTP Request

`GET /v1/orderbook`

<aside class="notice">
An API Key is not required to access this endpoint.
</aside>

## Get trade history

> Success Response Code: 200

```ruby
client.get_trade_history()
```

```python
client.get_trade_history()
```

```javascript
client.getTradeHistory(function (err, trades) {
  console.log("trades err", err);
  console.log("trade history", trades);
});
```

```php
<?php
$client->getTradeHistory();
?>
```

> The above command returns an Object structured like this:

```ruby
# Hashie::Mash Object examples

# get the highest bid price
orderbook.bid.first.price # 402.87
# get the quantity of the lowest ask
orderbook.ask.first.quantity # 1.35

# loop through all bids
orderbook.bid.each do |order|
order.price
order.quantity
end
```

```python
# Dict Object
{
  "bid": [
    {
      "price": 402.87,
      "quantity": 1.3
    },
    {
      "price": 404.21,
      "quantity": 1.25
    }
  ],
  "ask": [
    {
      "price": 423.58,
      "quantity": 1.3
    },
    {
      "price": 425.25,
      "quantity": 1.35
    }
  ],
  "price_currency": "USD",
  "quantity_currency": "BTC"
}
```

```javascript
// JSON Object
{
  "bid": [
    {
      "price": 402.87,
      "quantity": 1.3
    },
    {
      "price": 404.21,
      "quantity": 1.25
    }
  ],
  "ask": [
    {
      "price": 423.58,
      "quantity": 1.3
    },
    {
      "price": 425.25,
      "quantity": 1.35
    }
  ],
  "price_currency": "USD",
  "quantity_currency": "BTC"
}
```

```php
<?php
// Array Object
[
  "bid" => [
    [
      "price" => 402.87,
      "quantity" => 1.3
    ],
    [
      "price" => 404.21,
      "quantity" => 1.25
    ]
  ],
  "ask" => [
    [
      "price" => 423.58,
      "quantity" => 1.3
    ],
    [
      "price" => 425.25,
      "quantity" => 1.35
    ]
  ]
]
?>
```

Get the last one hundred trades

### HTTP Request

`GET /v1/trades`

<aside class="notice">
An API Key is not required to access this endpoint.
</aside>

## Get the ticker

> Success Response Code: 200

```python
client.get_ticker()
```

```javascript
client.getTicker(function (err, ticker) {
  console.log("ticker err", err);
  console.log("ticker", ticker);
});
```

```php
<?php
client->getTicker();
?>
```

```ruby
client.get_ticker()
```

> The above command returns an Object structured like this:

```python
# Dict Object
{
  "currency": "USD",
  "last": 404.12,
  "bid": 403.98,
  "ask": 404.22
}
```

```javascript
// JSON Object
{
  "currency": "USD",
  "last": 404.12,
  "bid": 403.98,
  "ask": 404.22
}
```

```php
<?php
// Array Object
[
  "currency" => USD,
  "last" => 589.67,
  "bid" => 584.95,
  "ask" => 589.67
]
?>
```

```ruby
# Hashie::Mash Object
ticker.ask # 589.67
ticker.bid # 584.95
ticker.last # 589.67
ticker.currency # "USD"
```

Get the last trade price, current ask, and current bid

### HTTP Request

`GET /v1/ticker`

<aside class="notice">
An API Key is not required to access this endpoint.
</aside>


