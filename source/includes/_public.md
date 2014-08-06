# Public

## Get the ticker

```ruby
client.get_ticker()
```

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
client->getTicker();
```

> The above command returns JSON structured like this:

```json
{
  "currency": "USD",
  "last": 404.12,
  "bid": 403.98,
  "ask": 404.22
}
```

Get the last trade price, current ask, and current bid

### HTTP Request

`GET /ticker`



<aside class="notice">
An API Key is not required to access this endpoint.
</aside>

## Get the orderbook

```ruby
client.get_order_book()
```

```python
client.get_order_book()
```

```php
$client->getOrderBook()
```

```javascript
client.getOrderbook(function (err, orderBook) {
  console.log("order book err", err);
  console.log("order book", orderBook);
});
```

> The above command returns JSON structured like this:

```json
{
  "bid": [
    {
      "price": 402.87,
      "quantity": 1.3
    },
    {
      "price": 404.21,
      "quantity": 1.25
    },
    {
      "price": 410.87,
      "quantity": 1.32
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

Get all the orders in the book on both the bid and ask sides

### HTTP Request

`GET /orderbook`


<aside class="notice">
An API Key is not required to access this endpoint.
</aside>
