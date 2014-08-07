# Key

## Get permissions

```ruby
client.get_key()
```

```python
client.get_key()
```

```javascript
client.getKey(function (err, ticker) {
  console.log("key err", err);
  console.log("key", ticker);
});
```

```php
<?php
client->getKey();
?>
```

> The above command returns an Object structured like this:

```ruby
# Hashie::Mash Object
key.permissions.each do |permission|
  permission
end
```

```python
// JSON Object (Array)
[
  "get-account",
  "create-buy",
  "create-sell",
  "cancel-order"
]
```

```javascript
// JSON Object (Array)
[
  "get-account",
  "create-buy",
  "create-sell",
  "cancel-order"
]
```

```php
<?php
// Array Object
[
  "get-account",
  "create-buy",
  "create-sell",
  "cancel-order"
]
?>
```

Get all the permissions associated with this key

### HTTP Request

`GET /key`
