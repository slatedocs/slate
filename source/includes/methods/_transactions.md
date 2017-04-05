# Transactions

## Introduction
Transactions are funds movements that happened to your account. This includes Mobile Payments, Airtime Payments,
Collections, Service Charges, Account Balance Funds Update.The transactions API allows you to list all these
transactions.

The transactions api endpoint is:

    <aside class="notice">https://app.beyonic.com/api/transactions</aside>

## The Transaction object

> Sample Transaction Object (JSON):

```json
{
    "id": 218,
    "amount": "228.0000",
    "description": "Incoming payment from +401000000099",
    "created": "2017-03-28T12:50:59Z",
    "type": "mobile_collection"
}
```

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
amount | float | The transaction amount
description | string | The payment description
created | string | The date that the transaction was created, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
type | string | The transaction type. This can be AdminFundsUpdate, MobileFundsUpdate, FundsDeposit, FundsAdjustment,
MobileCollection, MobilePayment, AirtimeTopup, ServiceCharge, MobileWithdrawal, BankWithdrawal

## Retrieving a Single Transaction

> Sample Request:

```shell
curl https://app.beyonic.com/api/transactions/12 -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

transaction = Beyonic::Transaction.get(12)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$transaction = Beyonic_Transaction::get(12);
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

transaction = beyonic.Transaction.get(12)
```

```java
package com.beyonic.examples.account;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


public class SingleTransactionExample {

    private static final String API_ENDPOINT = "https://app.beyonic.com/api/transactions";
    private static final String API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";
    private static final String CHARSET = "UTF-8";

    public static void main(String[] args){
        URL url = null;
        try {
            url = new URL(API_ENDPOINT + "/12");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("charset", CHARSET);
            conn.setRequestProperty("Authorization", "Token " + API_KEY);

            System.out.println(conn.getResponseCode() + " // " + conn.getResponseMessage());

            try {
                if (conn.getResponseCode() == 200) {
                    InputStream inputStream = conn.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    String response = reader.readLine();
                    reader.close();

                    System.out.println(response);
                }
            } finally {
                conn.disconnect();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
```

> Sample Response (JSON) - if you use one of the development libraries, this is automatically converted into a native object for you:

```json
{
   "id": 12,
   "amount": "228.0000",
   "description": "Incoming payment from +401000000099",
   "created": "2017-03-28T12:50:59Z",
   "type": "mobile_collection"
}
```

To retrieve a single transaction, provide the transaction id and a transaction object will be returned.

Parameter | Required | Type | Example | Notes
--------- | -------- | ---- | ------- | -----
id | Yes | Integer | 12 | The id of the transaction you want to retrieve

## Listing all transactions

> Sample Request:

```shell
curl https://app.beyonic.com/api/transactions -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

accounts = Beyonic::Transaction.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$accounts = Beyonic_Transaction::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

accounts = beyonic.Transaction.list()

```

```java
package com.beyonic.examples.accounts;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ListAllTransactionsExample {

    private static final String API_ENDPOINT = "https://app.beyonic.com/api/transactions";
    private static final String API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";
    private static final String CHARSET = "UTF-8";

    public static void main(String[] args){
        URL url = null;
        try {
            url = new URL(API_ENDPOINT);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("charset", CHARSET);
            conn.setRequestProperty("Authorization", "Token " + API_KEY);

            System.out.println(conn.getResponseCode() + " // " + conn.getResponseMessage());

            try {
                if (conn.getResponseCode() == 200) {
                    InputStream inputStream = conn.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    String response = reader.readLine();
                    reader.close();

                    System.out.println(response);
                }
            } finally {
                conn.disconnect();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
```

> Sample Response (JSON)  - if you use one of the development libraries, this is automatically converted into a native object for you:

```json
{
  "count": 2,
  "next": "https://app.beyonic.com/api/transactions?limit=10&offset=10",
  "previous": null,
  "results": [
    {
      "id": 137,
      "amount": "2000.0000",
      "description": "Complementary Test Credit.",
      "created": "2016-12-09T11:16:30Z",
      "type": "admin_funds_transfer"
    },
    {
      "id": 160,
      "amount": "-600.0000",
      "description": "test msente",
      "created": "2017-02-13T12:01:38Z",
      "type": "mobile_payment"
    }
  ]
}
```

To retrieve a list of all transactions, make a GET request to the transactions end point. This will return a list of transactions.

## Filtering Transactions

> Sample Request:

```shell
curl https://app.beyonic.com/api/transactions?type=mobile_payment -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

accounts = Beyonic::Transaction.list(
  type: 'mobile_payment'
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$accounts = Beyonic_Transaction::getAll(array(
  "type" => "mobile_payment"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

accounts = beyonic.Transaction.list(type='mobile_payment')

```

```java
package com.beyonic.examples.accounts;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class FilterTransactionsExample {

    private static final String API_ENDPOINT = "https://app.beyonic.com/api/transactions";
    private static final String API_KEY = "ab594c14986612f6167a975e1c369e71edab6900";
    private static final String CHARSET = "UTF-8";

    public static void main(String[] args){
        URL url = null;
        try {
            url = new URL(API_ENDPOINT + "?account=1");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Accept", "application/json");
            conn.setRequestProperty("charset", CHARSET);
            conn.setRequestProperty("Authorization", "Token " + API_KEY);

            System.out.println(conn.getResponseCode() + " // " + conn.getResponseMessage());

            try {
                if (conn.getResponseCode() == 200) {
                    InputStream inputStream = conn.getInputStream();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    String response = reader.readLine();
                    reader.close();

                    System.out.println(response);
                }
            } finally {
                conn.disconnect();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
```

You can search or filter transactions on the following fields. Simply add them to your request as shown in the examples. You can combine multiple filters. Note that filters return exact matches only.

* account - the account id
* type - the type of the transaction
* start_date - the ealiest date you want to include transactions from
* end_date - the latest date you want to include transactions
