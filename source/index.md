---
title: Tether API Reference

language_tabs:
  - ruby
  - python
  - php

toc_footers:
  - <a href='https://wallet.tether.to/'>Tether homepage</a>
  - <a href='https://wallet.tether.to/settings'>Generate API Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Tether API!

We have libraries in Ruby, PHP and Python. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

- [Tether API Ruby client](https://bitbucket.org/tetherto/tether-api-client-ruby)
- [Tether API PHP client](https://bitbucket.org/tetherto/tether-api-client-php)
- [Tether API Python client](https://bitbucket.org/tetherto/tether-api-client-python)

# Authentication

> To initialize authorized client, use this code:

```ruby
  require 'tether';
  client = Tether::Client.new('TetherAPIKey', 'TetherAPISecret')
  
  # Ruby client returns [Hashie::Mash](https://github.com/intridea/hashie) object on API requests.
```

```php
# TODO
```

```python
# TODO
```

> Make sure to replace `TetherAPIKey` with your API key and `TetherAPISecret` with your API secret.

Tether uses HMAC authentication. Each request should be signed with a secret that you can see when creating a new API key.
You can create a Tether API key and Tether API secret key on [Tether Settings](https://wallet.tether.to/settings) page. 
Tether expects for the signature to be included in all API requests to the server in a standard HTTP Authorization header that has the following form:

`Authorization: APIAuth TetherAPIKey:Signature`

For request authentication, the TetherAPIKey element identifies the secret key that was used to compute the signature and, also, the user making the request.
The Authorization header is computed as following:

<aside>
  Authorization = "APIAuth" + " " + TetherAPIKey + ":" + Signature;<br><br>
  
  Signature = Base64( HMAC-SHA1( TetherAPISecret, StringToSign ) );<br><br>
  
  StringToSign = Content-Type + "," +	Content-MD5 + "," +	URI + "," + Timestamp;
</aside>

The Signature is the Base64 encoded RFC 2104 HMAC-SHA1 of selected parts from the request, and so the Signature part of the Authorization header will vary from request to request. 
If the request signature calculated by the Tether API matches the Signature included in the Authorization header, the request will be processed under the identity of 
the user to whom the key was issued. Otherwise you will get `401 Unauthorized` error as a response.

# Permissions

Each API key can have one or more permissions:

<table>
<tr><th>Permission</th><th>Rights</th></tr>
<tr><td>read_balances</td><td>GET /balances</td></tr>
<tr><td>read_transactions</td><td>GET /transactions<br>GET /transaction/:id</td></tr>
<tr><td>create_transaction</td><td>POST /transactions</td></tr>
<tr><td>read_exchange_orders</td><td>GET /exchange_orders<br>GET /exchange_orders/:id</td></tr>
<tr><td>create_exchange_order</td><td>POST /exchange_orders</td></tr>
<tr><td>read_exchange_rates</td><td>GET /exchange_rates</td></tr>
</table>

If the API key does not have a required permission you will get `403 Forbidden` error as a response.


# Balances

## Get wallet balances

```ruby
result = client.balances
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"balances":[{"currency":"BTC","confirmed":"22.04085912","pending":"0.0"},{"currency":"USDt","confirmed":"5.56923451","pending":"0.0"}]}
```

This endpoint retrieves all balances of the account.


### HTTP Request

`GET /balances`

### Parameters

None.


# Exchange rates

## Get exchange rates

```ruby
result = client.exchange_rates
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"exchange_rates":[{"source_currency":"BTC","target_currency":"USDt","exchange_rate":"246.5"},{"source_currency":"USDt","target_currency":"BTC","exchange_rate":"0.0040568"}]}
```

This endpoint retrieves all exchange rates on Tether.

### HTTP Request

`GET /exchange_rates`

### Parameters

None.


# Transactions

## Get full transactions list

```ruby
result = client.transactions
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
[{"id":331,"currency":"BTC","amount":"0.003","type":null,"status":"COMPLETED","message":null,"created_at":"2014-11-25T23:56:39Z","updated_at":"2014-11-25T23:56:39Z","remark":"You received BTC from an external account. txid: 52c90d367fac0a86057e8eb54022bbf504a1003a9b65fca444b59a1327dc7915","transaction_id":"52c90d367fac0a86057e8eb54022bbf504a1003a9b65fca444b59a1327dc7915"},{"id":432,"currency":"BTC","amount":"-0.03","type":null,"status":"COMPLETED","message":null,"created_at":"2014-11-26T00:00:51Z","updated_at":"2014-11-26T00:00:51Z","remark":"Convert 0.03 BTC to USDt. TXID: bd9c9e4f78ef39ffeba674d08673bba1f4ac91f6dbfd41e4760dfabd2ed99a9d","transaction_id":"bd9c9e4f78ef39ffeba674d08673bba1f4ac91f6dbfd41e4760dfabd2ed99a9d"},{"id":433,"currency":"USDt","amount":"0.007713","type":null,"status":"COMPLETED","message":null,"created_at":"2014-11-26T00:20:20Z","updated_at":"2014-11-26T00:20:20Z","remark":"Received 0.00771299 USDt from BTC conversion."}, {"id":512,"currency":"USDt","amount":"-143.0","type":null,"status":"COMPLETED","message":null,"created_at":"2014-12-10T16:44:53Z","updated_at":"2014-12-10T16:44:53Z","remark":"Redeem 143.0 USDt, Fee: 20, Total amount to be wired: 123.0"}]
```

This endpoint retrieves all user's transactions on Tether.

### HTTP Request

`GET /transactions`

### Parameters

None.

## Get transaction by ID

```ruby
transaction_id = 12345
result = client.get_transaction(transaction_id)
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"id":12345,"currency":"BTC","amount":"0.003","type":null,"status":"COMPLETED","message":null,"created_at":"2014-11-25T23:56:39Z","updated_at":"2014-11-25T23:56:39Z","remark":"You received BTC from an external account. txid: 52c90d367fac0a86057e8eb54022bbf504a1003a9b65fca444b59a1327dc7915","transaction_id":"52c90d367fac0a86057e8eb54022bbf504a1003a9b65fca444b59a1327dc7915"}
```

This endpoint retrieves information about specific transaction.

### HTTP Request

`GET /transactions/:transaction_id`

### Parameters

Parameter | Description
--------- | -----------
transaction_id | ID that is returned in full transactions list and on new transaction creation


## Create new transaction

```ruby
transaction_parameters = {
  :currency => 'BTC',
  :amount => 1.234,
  :destination => 'ma@barker.me',
  :message => 'Here is your part of booty, Ma.'
}
transaction = client.new_transaction(transaction_parameters)
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"success":true,"id":1234,"message":"Success! Sent 1.2345 BTC to ma@barker.me","method":"email"}
```

This endpoint creates new transaction and returns its ID.

### HTTP Request

`POST /transactions`

### Parameters

Parameter | Description
--------- | -----------
currency | Currency of outgoing transaction
amount | Amount to send (decimal (8,16))
destination | Recipient: email or bitcoin address
message | Message to include for email destinations

### Return values

Value | Description
--------- | -----------
id | Internal transaction ID
method | 'internal', 'blockchain' or 'email'. Only blockchain transactions contain transaction_id
transaction_id | Blockchain transaction ID
success | boolean 





# Exchange orders

## Get full exchange orders list

```ruby
result = client.exchange_orders
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
[{"id":12,"uuid":"2b9763d8-b429-4c56-b9e9-dcda1512f4a5","source_currency":"BTC","target_currency":"USDt","original_amount":"0.03","exchanged_amount":"11.121213","exchange_rate":"371.45","status":"COMPLETED","created_at":"2014-11-26T00:00:51Z","updated_at":"2014-11-26T20:10:33Z"},{"id":13,"uuid":"2b97e202-de74-4924-b0e8-995c17a0307f","source_currency":"BTC","target_currency":"USDt","original_amount":"0.013","exchanged_amount":"4.74324151","exchange_rate":"368.43","status":"COMPLETED","created_at":"2014-11-26T20:24:39Z","updated_at":"2014-12-04T20:03:48Z"},{"id":14,"uuid":"2b97e202-de74-4924-b0e8-995c17a0307f","source_currency":"USDt","target_currency":"BTC","original_amount":"4.75095451","exchanged_amount":"0.01277333","exchange_rate":"371.21","status":"COMPLETED","created_at":"2014-11-25T11:11:11Z","updated_at":"2014-12-04T20:16:45Z"}]
```

This endpoint retrieves all user's exchange orders on Tether.

### HTTP Request

`GET /exchange_orders`

### Parameters

None.

## Get exchange order by ID

```ruby
exchange_order_id = 12345
result = client.get_exchange_order(exchange_order_id)
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"id":12345,"uuid":"2b9763d8-b429-4c56-b9e9-dcda1512f4a5","source_currency":"BTC","target_currency":"USDt","original_amount":"0.03","exchanged_amount":"11.121213","exchange_rate":"371.45","created_at":"2014-11-26T00:00:51Z","updated_at":"2014-11-26T20:10:33Z","status":"Completed"}
```

This endpoint retrieves information about specific exchange order.

### HTTP Request

`GET /exchange_orders/:exchange_order_id`

### Parameters

Parameter | Description
--------- | -----------
exchange_order_id | ID that is returned in full exchange orders list and on new exchange order creation


## Create new exchange order

```ruby
exchange_order_parameters = {
  :source_currency => 'BTC',
  :target_currency => 'USDt',
  :amount => 1.234
}
exchange_order = client.new_exchange_order(exchange_order_parameters)
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"id":12345,"uuid":"2b9763d8-b429-4c56-b9e9-dcda1512f4a5","source_currency":"BTC","target_currency":"USDt","original_amount":"0.03","exchanged_amount":"11.121213","exchange_rate":"371.45","created_at":"2014-11-26T00:00:51Z","updated_at":"2014-11-26T20:10:33Z","status":"Pending"}
```

This endpoint creates new exchange order and returns its ID.

### HTTP Request

`POST /exchange_orders`

### Parameters

Parameter | Description
--------- | -----------
source_currency | Currency which should be converted
target_currency | Currency which would be received 
amount | Amount to convert (decimal (8,16))

### Return values

Value | Description
--------- | -----------
id | Internal exchange order ID
uuid | Internal exchange order UUID
source_currency | Currency which should be converted
target_currency | Currency which would be received 
original_amount | Amount to convert (decimal (8,16))
exchanged_amount | Amount received from conversion (decimal (8,16))
exchange_rate | Rate of exchange
status | 'Pending', 'Processing' or 'Completed'

