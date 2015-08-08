# Transactions

## Get User Transactions

```shell
curl -X "GET" "http://partner.url/api/v2/:user_id:/transactions" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/:user_id:/transactions')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var TransactionsResponse = sdk.GetTransactions();
```
> Response payload

```json
{
  "meta": {
    "current_page": 1,
    "total_pages": 2
  },
  "accounts": [
    {
      "id": 42,
      "name": "eChecking"
    }
  ],
  "transactions": [
    {
      "id": "42",
      "reference_id": "42",
      "transaction_type": "Debit",
      "memo": "GameStop",
      "balance": 10.15,
      "posted_at": "2012-05-24T00:00:00Z",
      "created_at": {
      },
      "nickname": "GameStop",
      "original_name": "GameStop",
      "check_number": "1000",
      "tags": [
        {
          "name": "Coffee",
          "balance": 10.0
        }
      ],
      "links": {
        "account": 42
      }
    }
  ]
}
```




Return a paginated list of all transactions for the given user.

`GET /api/v2/users/:user_id:/transactions`

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var pageNumber = 2;
var TransactionsResponse = sdk.GetTransactionsByPage(pageNumber);
```

### Parameters

| Parameter | Description |
|-----------|-------------|
| `page` | Return subsequent pages of results. |

### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Get Account Transactions

```shell
curl -X "GET" "http://partner.url/api/v2/accounts/:account_id:/transactions" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/accounts/:account_id:/transactions')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var accountId = 12345;
var TransactionsResponse = sdk.GetTransactionsByAccount(accountId);
```

> Response payload

```json
{
  "meta": {
    "current_page": 1,
    "total_pages": 2
  },
  "accounts": [
    {
      id: 42,
      name: "eChecking"
    }
  ],
  "transactions": [
    {
      "id": "42",
      "reference_id": "42",
      "transaction_type": "Debit",
      "memo": "GameStop",
      "balance": 10.15,
      "posted_at": "2012-05-24T00:00:00Z",
      "created_at": {
      },
      "nickname": "GameStop",
      "original_name": "GameStop",
      "check_number": "1000",
      "tags": [
        {
          "name": "Coffee",
          "balance": 10.0
        }
      ],
      "links": {
        "account": 42
      }
    }
  ]
}
```

Return a paginated list of all transactions for the given account.

`GET /api/v2/users/:user_id:/accounts/:account_id:/transactions`

To view additional transactions call `/api/v2/users/:user_id:/accounts/:account_id:/transactions?page=:page_number:`

### Status Codes

| Status | Description |
|--------|-------------|
| `200 OK` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |
| `404 Not Found` | returned when an invalid user or account is specified |


## Get Budget Transactions

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/budgets/:budget_id:/transactions" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/budgets/:budget_id:/transactions')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var budgetId = 12345;
var TransactionsResponse = sdk.GetTransactionsByBudget(budgetId);
```

> Response payload

```json
{
  "accounts": [
    {
      id: 42,
      name: "eChecking"
    }
  ],
  "transactions": [
    {
      "id": "42",
      "reference_id": "42",
      "transaction_type": "Debit",
      "memo": "GameStop",
      "balance": 10.15,
      "posted_at": "2012-05-24T00:00:00Z",
      "created_at": {
      },
      "nickname": "GameStop",
      "original_name": "GameStop",
      "check_number": "1000",
      "tags": [
        {
          "name": "Coffee",
          "balance": 10.0
        }
      ],
      "links": {
        "account": 42
      }
    }
  ]
}
```

Return a list of all transactions for the given budget (for the current month).

`GET /api/v2/users/:user_id:/budgets/:budget_id:/transactions`



### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user or account is specified |


## Search Transactions

```shell
curl -X "GET" "http://partner.url/api/v2/users/:user_id:/transactions/search?q=GameStop&untagged=0&begin_on=2013-01-01&end_on=2013-06-01" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/transactions/search?q=GameStop&untagged=0&begin_on=2013-01-01&end_on=2013-06-01')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var searchCriteria = new TransactionSearchCriteriaModel{
	Query = "GameStop",
	Untagged = false,
	BeginOn = new DateTime(2013, 1, 1),
	EndOn = new DateTime(2013, 6, 1),
	AccountIds = new List<int>{12345, 67890},
	Tags = new List<string>{"Personal", "Transportation"}
};
var TransactionsResponse = sdk.SearchTransactions(searchCriteria);
```

> Response payload

```json
{
  "accounts": [
    {
      id: 42,
      name: "eChecking"
    }
  ],
  "transactions": [
    {
      "id": "42",
      "reference_id": "42",
      "transaction_type": "Debit",
      "memo": "GameStop",
      "balance": 10.15,
      "posted_at": "2013-05-24T00:00:00Z",
      "created_at": {
      },
      "nickname": "GameStop",
      "original_name": "GameStop",
      "check_number": "1000",
      "tags": [
        {
          "tag": {
            "name": "Entertainment",
            "balance": 10.0
          }
        }
      ],
      "links": {
        "account": 42
      }
    }
  ]
}
```

Search transactions for the given user.

`GET /api/v2/users/:user_id:/transactions/search?q=GameStop&untagged=0&begin_on=2013-01-01&end_on=2013-06-01`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `q` | The search term. |
| `account_ids` | Limit search results to accounts. |
| `untagged` | Limit search results to untagged transactions. Should be `1` for true; `0` for false. |
| `tags[]` | Limit search results to tagged transactions.|
| `begin_on` | Limit search results to after this date (inclusive). |
| `end_on` | Limit search results to before this date (inclusive). |



### Status Codes

| Status | Description |
|--------|-------------|
| 200 OK | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |


## Updating transactions

```shell
curl -X "PUT" "http://partner.url/api/v2/users/:user_id:/transactions/:transaction_id:" -u ":geezeo-api-key::" -d ":request_payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/users/:user_id:/transactions/:transaction_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Put.new uri.request_uri
  request.basic_auth key,''
  request.body = :request_payload:

  response = http.request request

  puts response.body
end

```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var requestModel = new TransactionRequestModel{
	Transaction = new TransactionModel{
		Nickname = "Starbucks"
	},
	Tagging = new TaggingModel{
		Type = TaggingType.Regular,
		Regular = new List<string> {"Coffee"}
	}
};
var transactionId = "85b20186-b367-4feb-8acd-d5378e7b4d94";
var updated = sdk.UpdateTransaction(transactionId, requestModel);
```


> Request payload single tag

```json
{
  "transaction": {
    "nickname": "Starbucks",
  },
  "tagging": {
    "type": "regular",
    "regular": ["Coffee"]
  }
}
```

```c#

var requestModel = new TransactionRequestModel{
	Transaction = new TransactionModel{
		Nickname = "Starbucks"
	},
	Tagging = new TaggingModel{
		Type = TaggingType.Regular,
		Regular = new List<string> {"Coffee"}
	}
};

```

> Request payload split tag

```json
{
  "transaction": {
    "nickname": "Starbucks",
  },
  "tagging": {
    "type": "split",
    "split": [
      { "name": "Entertainment", "value": 3 },
      { "name": "Coffee", "value": 2.50 }
    ]
  }
}
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);
var requestModel = new SplitTransactionRequestModel{
	Transaction = new TransactionModel{
		Nickname = "Starbucks"
	},
	Tagging = new SplitTaggingModel{
		Type = TaggingType.Split,
		Split = new List<TagRequest> {
			new TagRequest{Name = "Entertainment", Value = 3},
			new TagRequest{Name = "Coffee", Value = 2.50}
		}
	}
};
var transactionId = "85b20186-b367-4feb-8acd-d5378e7b4d94";
var updated = sdk.SplitTransaction(transactionId, requestModel);
```

```c#


```

> Request payload with adding a rule

```json
{
  "transaction": {
    "nickname": "Starbucks",
  },
  "tagging": {
    "type": "regular",
    "regular": ["Coffee"],
    "repeat": true
  }
}
```

```c#
var apiKey = "geezeo-api-key";
var url = "partner.url";
var userId = "user_id";
var sdk = new SDK(apiKey, url, userId);

var requestModel = new TransactionRuleRequestModel{
	Transaction = new TransactionModel{
		Nickname = "Starbucks"
	},
	Tagging = new TaggingRuleModel{
		Type = TaggingType.Regular,
		Regular = new List<string> {"Coffee"},
		Repeat = true,
		Account = TaggingAccount.CurrentAccount,
		PostedAt = TaggingPostedAt.AnyDate
	}
};
var transactionId = "85b20186-b367-4feb-8acd-d5378e7b4d94";
var updated = sdk.UpdateTransactionRule(transactionId, requestModel);

```


> Error response payload

```json
{
  "error": {
    "message": "Error in transaction",
    "data": ["Specific error message"]
  }
}
```

Transaction nicknames and tags can be changed. 

Tags can be a single tag, or split a transactions into multiple tags.

Rules can be added by adding a repeat node to the json. Once a rule is added the platform will ensure future matching transactions receive that tag and nickname.

Split tags are not supported by rules as they are specific to an exact amount.

`PUT /api/v2/users/:user_id:/transactions/:transaction_id:`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `nickname` | The nickname to give this transaction. |
| `type` | Type of tag(s) being set. Required if tags are being set. Should be `regular` or `split`. |
| `regular` | The regular tag being applied to this transaction. |
| `split` | A list of key/value pairs, where `name` is the name of the tag and `value` is the amount. |
| `repeat` | Should this tag be applied to similar transactions.  __Default__ `false`.|
| `account` | The account(s) where the rule should be applied.  Should be `current_account` or `all_accounts`.  __Default__ `all_accounts`. |
| `posted_at` | When the rule should start being applied.  Should be `any_date` or `future_date`.  __Default__ `any_date`. |


### Status Codes

| Status | Description |
|--------|-------------|
| 204 No Content | returned when successful |
| 401 Not Authorized | returned when invalid credentials are provided |
| 404 Not Found | returned when an invalid user is specified |
| 422 Unprocessable Entity | returned when the parameters given were invalid |
