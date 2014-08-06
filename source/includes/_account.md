# Account

## Get account balances

```ruby
client.get_balances()
```

```python
client.get_balances()
```

```javascript
client.getBalances(function (err, ticker) {
  console.log("balances err", err);
  console.log("balances", ticker);
});
```

```php
client->getBalances();
```

> The above command returns JSON structured like this:

```json
{
  "BTC": 5.44423312,
  "USD": 1413.56
}
```

This endpoint retrieves the account balances in all currencies held.

### HTTP Request

`GET /account/balances`

## Get deposit address

```ruby
client.get_deposit_address()
```

```python
client.get_deposit_address()
```

```javascript
client.getDepositAddress(function (err, address) {
  console.log("address err", err);
  console.log("address", address);
});
```

```php
client->getDepositAddress();
```

> The above command returns JSON structured like this:

```json
{
  "address": "1J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy"
}
```

Get the bitcoin deposit address associated with this account 

### HTTP Request

`GET /account/depositAddress`
