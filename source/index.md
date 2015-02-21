---
title: Tether API Reference

language_tabs:
  - ruby
  - python
  - php

toc_footers:
  - <a href='https://tether.to/'>Tether homepage</a>
  - <a href='https://tether.to/settings'>Generate API Key</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Tether API!

We have libraries in Ruby, PHP and Python. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

- [Tether API Ruby client](https://github.com/WebLogicNow/tether-api-client-ruby/)
- [Tether API PHP client](https://github.com/WebLogicNow/tether-api-client-php/)
- [Tether API Python client](https://github.com/WebLogicNow/tether-api-client-python/)

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
You can create a Tether API key and Tether API secret key on [Tether Settings](https://tether.to/settings) page. 
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
{"balances":[{"currency":"BTC","confirmed":"22.04085912","pending":"0.0"},{"currency":"THR","confirmed":"5.56923451","pending":"0.0"}]}
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
{"exchange_rates":[{"source_currency":"BTC","target_currency":"US+","exchange_rate":"246.5"},{"source_currency":"US+","target_currency":"BTC","exchange_rate":"0.0040568"}]}
```

This endpoint retrieves all exchange rates on Tether.

### HTTP Request

`GET /exchange_rates`

### Parameters

None.


