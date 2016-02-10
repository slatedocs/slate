# Accounts

## Introduction

Accounts are buckets from which money to be sent is debited. The accounts api method allows you to list your accounts and view balances for each account.

The accounts api endpoint is https://app.beyonic.com/api/accounts

## The account object

Field | Type | Description
----- | -----| ----
id | long integer | Unique object identifier
organization | long integer | The ID of the organization that the contact belongs to. (This is usually your organization ID)
balance | float | The current account balance
currency | string | The account's currency code. i.e KES, UGX
status | string | The account's status. One of: active or inactive
created | string | The date that the account was created, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
author | long integer | The ID of the user who created the account
modified | string | The date that the account was last modified, in the UTC timezone. Format: "YYYY-MM-DDTHH:MM:SSZ"
updated_by | string | The ID of the user who last updated the account

## Listing all accounts

> Sample Request:

```shell
curl https://app.beyonic.com/api/accounts -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = Beyonic::Account.list
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contact = Beyonic_Account::getAll();
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = beyonic.Account.list()

```

> Sample Response (JSON)

```json
{
    "count": 2,
    "next": "https://app.beyonic.com/api/contacts?offset=10",
    "previous": null,
    "results": [
        {
            "id": 1146,
            "organization":1,
            "balance": 200.0,
            "currency": "KES",
            "status": "active",
            "created": "2015-02-13T04:22:31Z",
            "author": 7,
            "modified": "2015-02-26T13:00:35Z",
            "updated_by": 1
        },
        {
            "id": 1147,
            "organization":1,
            "balance": 100.0,
            "currency": "UGX",
            "status": "active",
            "created": "2015-02-13T04:22:31Z",
            "author": 7,
            "modified": "2015-02-26T13:00:35Z",
            "updated_by": 1
        },
    ]
}
```

To retrieve a list of all accounts, make a GET request to the accounts end point. This will return a list of accounts.

## Filtering accounts

> Sample Request:

```shell
curl https://app.beyonic.com/api/accounts?currency=KES -H "Authorization: Token ab594c14986612f6167a975e1c369e71edab6900"
```

```ruby
require 'beyonic'
Beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = Beyonic::Account.list(
  currenncy: "KES"
)
```

```php
<?php
require_once('./lib/Beyonic.php');
Beyonic::setApiKey("ab594c14986612f6167a975e1c369e71edab6900");

$contact = Beyonic_Account::getAll(array(
  "currency" => "KES"
));
?>
```

```python
import beyonic
beyonic.api_key = 'ab594c14986612f6167a975e1c369e71edab6900'

contact = beyonic.Account.list(currency='KES')

```

You can search or filter accounts on the following fields. Simply add them to your request as shown in the examples. You can combine multiple filters. Note that filters return exact matches only.

* currrency - the accounts's currency
* status - the accounts's status
