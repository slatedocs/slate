---
title: Tether API Reference

language_tabs:
  - ruby
  - python
  - php

toc_footers:
  - <a href='https://wallet.tether.to/'>Tether homepage</a>
  - <a href='https://wallet.tether.to/app/#!/settings/apikeys'>Generate API Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Tether API!

We have library in Ruby, PHP and Python versions are planned. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

- [Tether API Ruby client](https://bitbucket.org/tetherto/tether-api-client-ruby)
- [Tether API PHP client](https://bitbucket.org/tetherto/tether-api-client-php) (planned)
- [Tether API Python client](https://bitbucket.org/tetherto/tether-api-client-python) (planned)

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
You can create a Tether API key and Tether API secret key on [API Keys](https://wallet.tether.to/app/#!/settings/apikeys) page.
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
<tr><td><a href="#merchant-api">merchant</a></td><td>POST /invoices</td></tr>
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
[{"confirmed":"12.30097754","pending":"0.0","currency":"USD₮"},{"confirmed":"0.01679","pending":"0.0","currency":"BTC"},{"confirmed":"32.0199","pending":"0.0","currency":"EUR₮"}]
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
[{"source_currency":"BTC","target_currency":"USD₮","exchange_rate":"235.51"},{"source_currency":"USD₮","target_currency":"BTC","exchange_rate":"0.0042461"},{"source_currency":"BTC","target_currency":"EUR₮","exchange_rate":"211.031655"},{"source_currency":"EUR₮","target_currency":"BTC","exchange_rate":"0.00473863"},{"source_currency":"BTC","target_currency":"JPY₮","exchange_rate":"28482.981295"},{"source_currency":"JPY₮","target_currency":"BTC","exchange_rate":"0.00003511"}]
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
[{"id":2018,"amount":"1234.0","balance":"7201.94","message":null,"created_at":"2015-05-25T22:48:27+08:00","updated_at":"2015-05-25T23:16:09+08:00","description":"Acquire $1,234.00 USD₮, Fee: $20.00 USD₮, Total amount to be wired: $1,254.00 USD₮","currency":"USD₮","status":"completed","could_be_exchanged":false,"tx_type":"acquire","reference_id":"WE1AM64","fee":"20.0"},{"id":2019,"amount":"-1.0","balance":"7200.94","message":"For the glory of all cats in the world!","created_at":"2015-05-28T11:32:51+08:00","updated_at":"2015-05-28T11:32:51+08:00","description":"Sent $1.00 USD₮ to glory@cat.com","currency":"USD₮","status":"pending","could_be_exchanged":false,"tx_type":"send","transaction_id":null,"counterparty_address":"glory@cat.com"},{"id":2020,"amount":"-0.01","balance":"0.00679","message":"Here is your part of booty, Ma.","created_at":"2015-06-04T19:30:42+08:00","updated_at":"2015-06-04T19:30:42+08:00","description":"Sent ฿0.01000 BTC to ma@barker.me","currency":"BTC","status":"pending","could_be_exchanged":false,"tx_type":"send","transaction_id":null,"counterparty_address":"ma@barker.me"}]
```

This endpoint retrieves all user's transactions on Tether. See <a href="#get-transaction-by-id">Get transaction by ID</a> section for description of returned values.

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
{"id":2019,"amount":"-1.0","balance":"7200.94","message":"For the glory of all cats in the world!","created_at":"2015-05-28T11:32:51+08:00","updated_at":"2015-05-28T11:32:51+08:00","description":"Sent $1.00 USD₮ to glory@cat.com","currency":"USD₮","status":"pending","could_be_exchanged":false,"tx_type":"send","transaction_id":null,"counterparty_address":"glory@cat.com"}
```

This endpoint retrieves information about specific transaction.

### HTTP Request

`GET /transactions/:transaction_id`

### Parameters

Parameter | Description
--------- | -----------
transaction_id | ID that is returned in full transactions list and on new transaction creation

### Return values

Value | Description
--------- | -----------
amount | Amount of transaction, negative if it's an outgoing transaction
balance | Account balance after the transaction
could_be_exchanged | The transaction is applicable for automatic exchange
counterparty_address | The address of recipient (`tx_type=send`) or the address of the sender (`tx_type=receive`)
currency | Transaction currency code
description | Automatically generated description of transaction
fee | Wire transfer reference ID (`tx_type IN ('acquire', 'redeem')`)
id | Internal transaction ID
message | Message included with the transaction
reference_id | Wire transfer reference ID (`tx_type=acquire`)
status | 'Pending', 'Processing', 'Completed' or 'Denied'
transaction_id | Blockchain transaction ID (`tx_type IN ('send', 'receive')`)
tx_type | 'convert', 'receive', 'send', 'acquire', 'redeem', 'unclaimed_return' or 'claimed_own'

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
{"success":true,"id":1234,"message":"Success! Sent ฿1.2345 BTC to ma@barker.me","method":"email"}
```

This endpoint creates new transaction and returns its ID.

### HTTP Request

`POST /transactions`

### Parameters

Parameter | Description
--------- | -----------
amount | Amount to send (decimal (8,16))
currency | Currency of outgoing transaction
destination | Recipient: email or bitcoin/mastercoin address
message | Message to include (for email destinations and own reference)

### Return values

Value | Description
--------- | -----------
id | Tether internal transaction ID
method | 'internal', 'blockchain' or 'email'
success | boolean
transaction_id | Blockchain transaction ID (`method=blockchain`)

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
{"id":12345,"uuid":"2b9763d8-b429-4c56-b9e9-dcda1512f4a5","source_currency":"BTC","target_currency":"USD₮","original_amount":"0.03","exchanged_amount":"11.121213","exchange_rate":"371.45","created_at":"2014-11-26T00:00:51Z","updated_at":"2014-11-26T20:10:33Z","status":"Completed"}
```

This endpoint retrieves information about specific exchange order. See <a href="#create-new-exchange-order">Create new exchange order</a> section for description of returned values.

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
  :target_currency => 'USD₮',
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
{"id":12345,"uuid":"2b9763d8-b429-4c56-b9e9-dcda1512f4a5","source_currency":"BTC","target_currency":"USD₮","original_amount":"0.03","exchanged_amount":"11.121213","exchange_rate":"371.45","created_at":"2014-11-26T00:00:51Z","updated_at":"2014-11-26T20:10:33Z","status":"Pending"}
```

This endpoint creates new exchange order and returns its ID.

### HTTP Request

`POST /exchange_orders`

### Parameters

Parameter | Description
--------- | -----------
amount | Amount to convert (decimal (8,16))
source_currency | Currency which should be converted
target_currency | Currency which would be received

### Return values

Value | Description
--------- | -----------
id | Internal exchange order ID
exchange_rate | Rate of exchange, available when conversion status is Completed
exchanged_amount | Amount received from conversion (decimal (8,16)), available when conversion status is Completed
original_amount | Amount to convert (decimal (8,16))
status | 'Pending', 'Processing' or 'Completed'
source_currency | Currency which would be converted
target_currency | Currency which would be received
uuid | Internal exchange order UUID

# Merchant API

This section describes API which is available only for merchants. It is manually activated for your account by Tether.
Please [contact support](https://tether.to/contact-us/) for additional information and instructions.

## Create new invoice

```ruby
invoice_parameters = {
  :currency => 'USD₮',
  :amount => 420
}
invoice = client.new_invoice(invoice_parameters)
```

```php
# TODO
```

```python
# TODO
```

> The JSON in raw API response looks like this:

```json
{"id":10344,"deposit_address":"37G3god6LmXyfyYbPxokCAwqQvqaENZQsq","status":"no_payment","invoiced_amount":"420.0","received_amount":"0.0","created_at":"2015-08-13T13:33:11Z","updated_at":"2015-08-13T13:33:11Z","currency":"USD₮"}
```

This endpoint creates new invoice and returns its information.

### HTTP Request

`POST /invoices`

### Parameters

Parameter | Description
--------- | -----------
amount | Amount of invoice (decimal (8,16))
currency | Currency of invoice

### Return values

Value | Description
--------- | -----------
id | Internal invoice ID
deposit_address | Address where invoiced amount should be sent. You should pass this address to your customer together with invoiced_amount and currency
status | 'no_payment', 'partial_payment', 'full_payment' or 'overpaid'
invoiced_amount | Amount that is expected to be received (decimal (8,16))
received_amount | Actually received amount (decimal (8,16))
currency | Currency that is expected to receive

## Callbacks

> The JSON of callback:

```json
{"id":13406,"deposit_address":"35dzdB6HbgusXHgvY7L3wyWmqhiNkwdPRH","status":"overpaid","invoiced_amount":"420.0","received_amount":"600.01","created_at":"2015-08-14T15:45:29Z","updated_at":"2015-08-16T13:44:41Z","currency":"USD₮","signature":"cf61abec01ca26f582311bea5e5b3682"}
```

> String to be MD5 hashed to manually calculate signature (using demo API secret):
 
```
1340635dzdB6HbgusXHgvY7L3wyWmqhiNkwdPRH420.0600.01USD₮overpaidZOEHtNbe8fgj4DMHSZAq/2hDZE6JHruqPKYfLbMASBX6Y/OVGuY/5xmJh3MCyOwG5PIodX2/q+gBjZ4KoJXYsQ==
```

> Checking signature using client library:

```ruby
begin
  client.check_signature(:invoice_callback, params)
  # Signature is valid
rescue ApiError => error
  # Signature is not valid, see error.message for details
end
```

```php
# TODO
```

```python
# TODO
```

If the status of created invoice is changed you will get a callback to the IPN URL you've provided during
Merchant API activation. The structure of callback JSON is the same as on <a href="#create-new-invoice">new invoice creation</a> + a signature field.

<aside>
Every callback should have a signature in it. All requests without a valid signature should be discarded and reported as a hack attempt.
To check the signature concatenate the following fields from callback (order is important): id, deposit_address, invoiced_amount, received_amount, currency, status.
Concatenate the resulting string with your API secret and hash it with MD5. The resulting hash should be equal to the hash in callback.
</aside>

Expected IPN response should have HTTP 200 status code. Otherwise the callback is marked as undelivered and will be repeatedly resent with increasing delay:

Attempt # | Delay before
--------- | -----------
1 | 0 seconds
2 | 1 minute
3 | 3 minutes
4 | 30 minutes
5 | 1 hour
6 | 12 hours
7 | 1 day
8 | 1 week
9 | 1 month
10 | callback is marked as failed
