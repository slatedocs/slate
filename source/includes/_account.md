# Account

## Get account balances

> Success Response Code: 200

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
<?php
client->getBalances();
?>
```

```ruby
client.get_balances()
```

> The above command returns an Object structured like this:

```ruby
# Hashie::Mash Object
balances.BTC # 5.44423312
balances.USD # 1413.56
```

```python
# Dict Object
{
  "BTC": 5.44423312,
  "USD": 1413.56
}
```

```javascript
// JSON Object
{
  "BTC": 5.44423312,
  "USD": 1413.56
}
```

```php
<?php
// Array Object
[
  "BTC" => 5.44423312,
  "USD" => 1413.56
]
?>
```

This endpoint retrieves the account balances in all currencies held.

### HTTP Request

`GET /v1/account/balances`

## Get deposit address

> Success Response Code: 200

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
<?php
client->getDepositAddress();
?>
```

```ruby
client.get_deposit_address()
```

> The above command returns an Object structured like this:

```ruby
# returns a string
"1J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy"
```

```python
# returns a string
"1J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy"
```

```javascript
// returns a string
"1J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy"
```

```php
<?php
// returns a string
"1J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy"
?>
```

Get the bitcoin deposit address associated with this account 

### HTTP Request

`GET /v1/account/depositAddress`


