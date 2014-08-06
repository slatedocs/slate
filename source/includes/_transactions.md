# Transactions

## Get all transactions 

```ruby
query = { "status" => "opened" }
client.get_transactions(query)
```

```python
query = {'status': 'filled'}
client.get_transactions(body=query)
```

```php
$query = [ "status" => "canceled", "side" => "sell" ];
$client->getTransactions($query);
```

```javascript
var query = { side: 'sell' };
client.getTransactions(query, function (err, transactions) {
  console.log("transactions err", err);
  console.log("transactions", transactions);
});
```

> The above command returns JSON structured like this:

```json
{
  "results": [
    {
      "transactionId": "538bdc82848a604c007ceac6",
      "transactionType": "deposit",
      "currency": "USD",
      "amount": 500.98,
      "method": "wire",
      "status": "funded",
      "fundingInfo": {
        "source": "External Customer Bank"
      },
      "events": [
        {
          "eventType": "created",
          "eventDate": "2014-05-06T13:15:30Z"
        }
      ]
    }
  ]
}
```

This endpoint retrieves all transactions based on the given query.

### HTTP Request

`GET /transactions`

### Query Parameters

Name | Param | Description
--- | --- | ---
Status | `status` | enum: `['opened', 'reopened', 'filled', 'canceled']`  
Side | `side` | enum: `['buy', 'sell']`  
Transaction Type | `transactionType` | enum: `['market', 'limit']`  
Date Min | `dateMin` | format: ISO-8601, e.g. `'2014-05-06T13:15:30Z'`  
Date Max | `dateMax` | format: ISO-8601, e.g. `'2014-05-06T13:15:30Z'`


## Get a single transaction

```ruby
# Get transaction with the ID
transaction_id = '538bdc82848a604c007ceac6'
client.get_transaction_by_id(transaction_id)

# For convenience, you can also get transaction by full URL
url = 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6'
client.get_transaction_by_url(url)
```

```python
# Get transaction with the ID
transaction_id = '538bdc82848a604c007ceac6'
client.get_transaction_by_id(transaction_id)

# For convenience, you can also get transaction by full URL
url = 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6'
client.get_transaction_by_url(url)
```

```php
// Get transaction with the ID
$transactionId = '538bdc82848a604c007ceac6';
$client->getTransactionById($transactionId);

// For convenience, you can also get transaction by full URL
$url = 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6';
$client->getTransactionByUrl($url);
```

```javascript
// Get transaction with the ID
var transactionId = '538bdc82848a604c007ceac6';
client.getTransactionById(transactionId, function (err, transaction) {
  console.log("transaction err", err);
  console.log("transaction", transaction);
});

// For convenience, you can also get transaction by full URL
var url = 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6';
client.getTransactionByUrl(url, function (err, transaction) {
  console.log("transaction err", err);
  console.log("transaction", transaction);
});
```
> The above command returns JSON structured like this:

```json
{
  "transactionId": "538bdc82848a604c007ceac6",
  "transactionType": "deposit",
  "currency": "USD",
  "amount": 500.98,
  "method": "wire",
  "status": "funded",
  "fundingInfo": {
    "source": "External Customer Bank"
  },
  "events": [
    {
      "eventType": "created",
      "eventDate": "2014-05-06T13:15:30Z"
    }
  ]
}
```

This endpoint retrieves a single transaction with the given ID.

### HTTP Request

`GET /transactions/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the transaction to retrieve

## Create a deposit

```ruby
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.create_transaction(transaction_id)
```

```python
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.create_transaction(transaction_id)
```

```php
$transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->createTransaction($transactionId);
```

```javascript
var transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.createTransaction(transactionId, function (err, msg) {
  console.log("cancel transaction err", err);
  console.log("cancel transaction", msg);
});
```

> A successful deposit transaction creation returns the url location of the new transaction in the response location header

```
Location: 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6'
```

Create a new deposit with the given params

Name | Param | Description
--- | --- | ---
Method | `method` | enum: `['wire']`, required `true`  
Currency | `currency` | enum: `['USD']`, required `true`  
Amount | `amount` | `string`, required `true`

### HTTP Request

`POST /transactions/deposit`

## Create a withdrawal

```ruby
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.create_transaction(transaction_id)
```

```python
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.create_transaction(transaction_id)
```

```php
$transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->createTransaction($transactionId);
```

```javascript
var transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.createTransaction(transactionId, function (err, msg) {
  console.log("cancel transaction err", err);
  console.log("cancel transaction", msg);
});
```

> A successful withdrawal transaction creation returns the url location of the new transaction in the response location header

```
Location: 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6'
```

Create a new withdrawal with the given params

Name | Param | Description
--- | --- | --- 
Method | `method` | enum: `['check']`, required `true`  
Currency | `currency` | enum: `['USD']`, required `true`  
Amount | `amount` | `string`, required `true`

### HTTP Request

`POST /transactions/withdraw`

## Send bitcoins

```ruby
trxn = {
  :currency => "BTC",
  :amount => "100.231231",
  :destination => "<bitcoin_address>"
}

client.send_bitcoins(trxn, timestamp)
```

```python
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.create_transaction(transaction_id)
```

```php
$transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->createTransaction($transactionId);
```

```javascript
var transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.createTransaction(transactionId, function (err, msg) {
  console.log("cancel transaction err", err);
  console.log("cancel transaction", msg);
});
```

> A successful withdrawal transaction creation returns the url location of the new transaction in the response location header

```
Location: 'http://localhost:9002/v1/transactions/538bdc82848a604c007ceac6'
```

Send bitcoins to the given address with the following params params

Name | Param | Description
--- | --- | --- 
Currency | `currency` | `['BTC']`, required `true`  
Amount | `amount` | `string`, required `true`  
Destination | `destination` | address to which to send currency `string`, required `true`

### HTTP Request

`POST /transactions/send`

## Cancel a transaction

```ruby
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_transaction(transaction_id)
```

```python
transaction_id = 'e3afed81-4a9c-4480-a78a-e0872408b95a'
client.cancel_transaction(transaction_id)
```

```php
$transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
$client->cancelTransaction($transactionId);
```

```javascript
var transactionId = 'e3afed81-4a9c-4480-a78a-e0872408b95a';
client.cancelTransaction(transactionId, function (err, msg) {
  console.log("cancel transaction err", err);
  console.log("cancel transaction", msg);
});
```
> The above command returns an HTTP response with status code 204

Cancel a single transaction with the given ID.

### HTTP Request

`DELETE /transactions/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the transaction to cancel

