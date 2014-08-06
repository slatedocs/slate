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
client->getKey();
```

> The above command returns JSON structured like this:

```json
{
  "permissions": [
    "get-account",
    "create-buy",
    "create-sell",
    "cancel-order"
  ]
}
```

Get all the permissions associated with this key

### HTTP Request

`GET /key`
