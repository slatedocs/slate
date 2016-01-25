# Aggregation
Geezeo uses CashEdge aggregation services to allow users to view their entire financial portfolio. Accounts are grouped in 4 categories: Cash, Credit Cards, Debts, and Investments. A user can edit each account listed under a category to change the exact account type, update their account credentials or view single account transactions.

The Aggregation API is currently a synchronous API. Any calls that result in a
query to a third party will block the return of the API call. Timeouts should
be set high (most likely upwards of 120s), accordingly.

The functionality that is supported is:

* Searching for FIs
* Retrieving login parameters for an FI
* Adding FIs (both MFA and non-MFA)
* Classifying newly added accounts
* Harvesting a user

## Overview

The process of adding new aggregated accounts to a user is a multi-step one.
Briefly, the user will search for the FI, either by name or URL. The particular
login parameters specific to that FI will be retrieved from the API, and
displayed to the user. The user input will be submitted and processed. If the
credentials are valid, a list of accounts and account types will be returned,
along with all valid account types for that FI. The user then has the
opportunity to rename and reclassify any or all accounts, as well as ignoring
any or all accounts. Those choices will be sent back via the API, and the
accounts will be added and updated.

## Common Responses

> Message Example

```json
{
  "response": {
    "message": "Harvest complete",
    "data": {
      "key": "value"
    }
  }
}
```

> Error Example

```json
{
  "error":
  {
    "message": "Something unexpected happened"
  }
}
```

There are two common responses that may be returned when a request does not
return the expected data, Message and Error.

The Error response indicates that something went wrong with the request, and
provides the message received from the backend services.

The Message response usually will indicate that the response conditionally
succeeded, but requires more data to continue processing. An example of this is
adding a FI that requires a MFA answer. The response from the "Add FI" request
will be a Message, containing the necessary data to continue processing the
request.


## Get FIs

```shell
curl -X "GET" "http://partner.url/api/v2/ce_fis" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/ce_fis')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> Response payload

```json
{
  "meta": {
    "current_page": 1,
    "total_pages": 2
  },
  "ce_fis": [
    {
      "id": 42,
      "name": "CashEdge Test Bank (Agg) - Retail Non 2FA",
      "url": "https://cashbank.cashedge.com/cashedgeBank/CashedgeBankSite/LoginPage.jsp",
      "ce_login_parameters": {
        "id": 2,
        "parameter_id": "42971",
        "parameter_caption": "Username",
        "parameter_type": "login",
        "parameter_max_length": 20
      },
      "ce_accounts": {
        "name": "Savings",
        "acct_type": "SDA",
        "ext_type": "SDA",
        "group": "Cash"
      }
    }
  ]
}
```

Return a paginated list of all CE-FIs

If the user desires to reclassify any or all accounts, the full list of
supported account types for the FI can be retrieved via the API.

A user may wish to reclassify accounts if the initial account type is incorrect
(for example: Savings selected for a Checking account).

The account types control how the transaction and balance data for the account
are processed, and choosing an incorrect account type may result in invalid
data being returned.

When classifying an account, the user should be presented with the name and
value of the `cashedge_account_type` data structure. The `acct_type` and
`ext_type` values will be joined with a comma and provided back to the API.


`GET /api/v2/ce_fis`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `page` | Return subsequent pages of results. |



`ce_accounts` is a list of all supported account types. The data is the same
returned in the account list response.

### Status Codes

| Status | Description |
|--------|-------------|
| `200 OK` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |


## Get an FI

```shell
curl -X "GET" "http://partner.url/api/v2/ce_fis/:ce_fi_id:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/ce_fis/:ce_fi_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```


> Response Payload

```json
{
  "ce_fis": [
    {
      "id": 42,
      "name": "CashEdge Test Bank (Agg) - Retail Non 2FA",
      "url": "https://cashbank.cashedge.com/cashedgeBank/CashedgeBankSite/LoginPage.jsp",
      "ce_login_parameters": {
        "id": 2,
        "parameter_id": "42971",
        "parameter_caption": "Username",
        "parameter_type": "login",
        "parameter_max_length": 20
      },
      "ce_accounts": {
        "name": "Savings",
        "acct_type": "SDA",
        "ext_type": "SDA",
        "group": "Cash"
      }
    }
  ]
}
```

Return the requested CashEdge Financial Institution

`GET /api/v2/ce_fis/:ce_fi_id:`


### Status Codes

| Status | Description |
|--------|-------------|
| `200 OK` | returned when successful |
| `401 Not Authorized` | returned when invalid credentials are provided |


## Search for an FI

```shell
curl -X "GET" "http://partner.url/api/v2/ce_fis/search?:parameters:" -u ":geezeo-api-key::"
```

```ruby
uri = URI('https://partner.url/api/v2/ce_fis/search?:parameters:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> Response Payload

```json
{
  "meta": {
    "current_page": 1,
    "total_pages": 2
  },
  "ce_fis": [
    {
      "id": 2,
      "fi_id": 20349,
      "name": "CashEdge Test Bank (Agg) - Retail Non 2FA",
      "url": "https://cashbank.cashedge.com/cashedgeBank/CashedgeBankSite/LoginPage.jsp",
      "ce_login_parameters": [
        {
          "id": 3,
          "parameter_id": "42971",
          "parameter_caption": "UserName",
          "parameter_type": "login",
          "parameter_max_length": 20
        },
        {
          "id": 4,
          "parameter_id": "42972",
          "parameter_caption": "Password",
          "parameter_type": "password",
          "parameter_max_length": 20
        }
      ]
    }
  ]
}
```

Search for an FI.

`GET /api/v2/ce_fis/search?q=CashEdge+Test+Bank+%28Agg%29+-+Retail+Non+2FA`

### Parameters

| Parameter | Description |
|-----------|-------------|
| `q` | The search string for a Financial Institution (FI). |
| `scope` | The FI attribute that the search should be restricted to. Valid values are `name` and `url`. |
| `page` | Return subsequent pages of results. |




The `ce_login_parameters` are necessary to actually add the FI. Each parameter must be presented to the user, and their response captured.

* `parameter_id` Will be used in subsequent requests to identify this parameter.
* `parameter_caption` Should be used as the label of the field when presented to the user.
* `parameter_type` If this is "password", the field should be masked.
* `parameter_max_length` Maximum length of the text field to present the user.


## Validate FI login credentials

```shell
curl -X "POST" "http://partner.url/api/v2/:user_id:/ce_fis" -u ":geezeo-api-key::" -d ":payload:"
```

```ruby
uri = URI('https://partner.url/api/v2/ce_fis/search?:parameters:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''
  request.body = :body:

  response = http.request request

  puts response.body
end

```

> Request payload

```
credentials[login_params][42971]=script1&credentials[login_params][42972]=cashedge1&id=2
```


> Response payload

```json
{
  "accounts": [
    {
      "id": 657,
      "name": "Banking",
      "balance": "3897.52",
      "reference_id": null,
      "aggregation_type": "cashedge",
      "state": "active",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type": {
        "name": "Savings",
        "acct_type": "SDA",
        "ext_type": "SDA",
        "group": "Cash"
      }
    },
    {
      "id": 658,
      "name": "Red Wing Shoe Company, Inc. 401k Profit Sharing Plan",
      "balance": "21099.0",
      "reference_id": null,
      "aggregation_type": "cashedge",
      "state": "active",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type": {
        "name": "Investment",
        "acct_type": "INV",
        "ext_type": "INV",
        "group": "Investment"
      }
    }
  ]
}
```

`POST /api/v2/users/pcid/ce_fis`


Here, the user supplied credentials are submitted. The integer keys are the
values in the previous response `parameter_id` fields. The `parameter_caption`
values are what the fields should be labeled as when presented to the user.

In this case, the `UserName` value is `script1`, and the `Password` value is `cashedge1`.



* `id` The Geezeo ID of the account
* `name` The name of the account at the FI
* `balance` The current decimal balance on the account
* `cashedge_account_type` This is the data used to classify the account
* `cashedge_account_type[name]` The account name to show the user
* `cashedge_account_type[acct_type]` This is used to classify the account
* `cashedge_account_type[ext_type]` This is used to classify the account


## Classifying accounts

> Request payload

```
accounts[657][type_code]=SDA,SDA&accounts[658][type_code]=ignore
```

> Response payload

```json
{
  "accounts": [
    {
      "id": 657,
      "name": "My Checking",
      "balance": "3897.52",
      "reference_id": null,
      "aggregation_type": "cashedge",
      "state": "active",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type": {
        "name": "Savings",
        "acct_type": "SDA",
        "ext_type": "SDA",
        "group": "Cash"
      }
    }
  ]
}
```


This is required even if the user does not wish to reclassify their accounts.
In that case, the existing `acct_type` and `ext_type` must be supplied back
to the API. If this step is omitted, the accounts will not actually be added to
the users account. Additionally, the account can be renamed at this step by
providing the `details` parameter.


`PUT /api/v2/users/:user_id:/accounts/classify`


### Parameters

| Parameter | Description |
|-----------|-------------|
| `accounts[657]` | The integer portion of this key is the `id` value from the account details in the previous `POST /api/v2/users/pcid/ce_fis` request. |
| `accounts[657][type_code]` | A value is made up of the concatenated `acct_type` and `ext_type`, joined by a comma (ie: SDA,SDA). This is our best guess as to what the account is. Submitting a value of `ignore` will omit the account from aggregation. |



## MFA


> GET /api/v2/ce_fis/?query=CashEdge+Test+Bank+%28Agg%29+-+Retail+2FA

> Response payload

```json
{
  "ce_fis": [
    {
      "id": 1,
      "fi_id": 20404,
      "name": "CashEdge Test Bank (Agg) - Retail 2FA",
      "url": "https://cashbank.cashedge.com/cashedgeBank/aggrretail2FA/cashedge_login.html",
      "ce_login_parameters": [
        {
          "id": 1,
          "parameter_id": "42969",
          "parameter_caption": "User ID",
          "parameter_type": "login",
          "parameter_max_length": 30
        },
        {
          "id": 2,
          "parameter_id": "42970",
          "parameter_caption": "Password",
          "parameter_type": "password",
          "parameter_max_length": 30
        }
      ]
    }
  ]
}
```

> POST /api/v2/users/:user_id:/ce_fis

> Request payload

```
credentials[login_params][42969]=test&credentials
```

> Response payload

```json
{
  "response": {
    "message": "The account requires further authentication",
    "data": {
      "mfa_parameters": [
        {
          "ce_login_parameter": {
            "ce_fi_id": null,
            "parameter_caption": "What is your favorite color?",
            "parameter_id": "answer",
            "parameter_max_length": null,
            "parameter_type": "password"
          }
        }
      ],
      "session_key": "464a674e7367646e2b77665576726947426b627879413d3d",
      "harvest_id": "123770714",
      "login_id": "19349692"
    }
  }
}
```

> PUT /api/v2/users/:user_id:/ce_fis/1

> Request payload

```
harvest_id=123770714&login_id=19349692&mfa_responses[answer]=red&session_key=464a674e7367646e2b77665576726947426b627879413d3d
```

> Response payload

```json
{
  "accounts": [
    {
      "id": 658,
      "name": "Checking",
      "balance": "70.0",
      "reference_id": null,
      "aggregation_type": "cashedge",
      "state": "active",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type": {
        "name": "Checking",
        "acct_type": "DDA",
        "ext_type": "DDA",
        "group": "Cash"
      }
    },
    {
      "id": 659,
      "name": "Checking1",
      "balance": "150.0",
      "reference_id": null,
      "aggregation_type": "cashedge",
      "state": "active",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type": {
        "name": "Checking",
        "acct_type": "DDA",
        "ext_type": "DDA",
        "group": "Cash"
      }
    }
  ]
}
```

> PUT /api/v2/users/:user_id:/accounts/classify

> Request Payload

```
accounts[658][type_code]=DDA,DDA&accounts[658][details]=My+Checking&accounts[659][type_code]=ignore
```

> Response payload

```json
{
  "accounts": [
    {
      "id": 658,
      "name": "My Checking",
      "balance": "70.0",
      "reference_id": null,
      "aggregation_type": "cashedge",
      "state": "active",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type": {
        "name": "Checking",
        "acct_type": "DDA",
        "ext_type": "DDA",
        "group": "Cash"
      }
    }
  ]
}
```

MFA (Multi-Factor Authentication) is a method of identify verification that
some FIs require. After the normal username/password credentials, there is a
2nd verification step. This step differs for each FI. The aggregation API
returns the appropriate prompts, and accepts them for verification.

The overall process is the same as a non-MFA FI, with a fork for the secondary
verification step. After the "Validating FI login credentials" step in the
non-MFA steps, instead of returning a list of accounts at the FI, the API will
return an error response with the necessary MFA prompts and parameters to
continue adding the FI.

### Example Flow to right


## Pending Accounts

> Response payload 

```json
{
  "pending_accounts": [
    {
      "id": 2,
      "name": "CashEdge Test Bank (Agg) - Retail Non 2FA",
      "account_ids": [
        "19435010"
      ]
    }
  ]
}
```


In some circumstances, the account will be added at the aggregator, but not
finalized/classified, leaving the account in an inconsistent state. These
accounts can be viewed by checking `pending_accounts`.


`GET /api/v2/users/:user_id:/pending_accounts`


### Removing Pending Accounts

`DELETE /api/v2/users/:user_id:/pending_accounts/:panding_account_id:`

## Change CE FI Login API

This is for changing the login credentials for the FI account used by the
aggregator. This can also be used to respond to new MFA challenges issued by
the FI.

### Non-MFA Example

> Non MFA Request payload

```
credentials[login_params][1234]=username&credentials[login_params][1235]=newpassword
```

> Non MFA Response payload

```json
{
  "accounts": [
    {
      "id":86,
      "name":"account-name",
      "balance":"42.5",
      "reference_id":"42",
      "aggregation_type":"cashedge",
      "state":"active",
      "harvest_updated_at":"2013-03-07T14:42:00Z",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type":{
        "name":"Checking",
        "acct_type":"DDA",
        "ext_type":"DDA",
        "group":null
      },
      "fi":{
        "id":99,
        "name":"FI"
      }
    }
  ]
}
```

`PUT /api/v2/users/:user_id:/accounts/:account_id/update_credentials`

> Non MFA Request Payload

```
credentials[login_params][1234]=username&credentials[login_params][1235]=newpassword
```

### Parameters

The new login credentials are in the same form as when adding the FI initially.
* `credentials[login_params][:login_parameter_id:]`
* `credentials[login_params][:password_parameter_id:]`

### Response

On success, the response will be the json of the account that has been updated.
When an MFA challenge occurs, the challenge will be returned so the answer may
be resubmitted. On error, a message describing the error will be returned.

#### Example

`PUT /api/v2/users/:user_id:/accounts/:account_id/update_credentials`



### MFA Example

#### Initial Request/Response

`PUT /api/v2/users/:user_id:/accounts/:account_id/update_credentials`


> MFA Request payload

```
credentials[login_params][1234]=username&credentials[login_params][1235]=newpassword
```

> MFA Response payload

```json
{
  "response":"The account requires further authentication",
  "data":{
    "mfa_parameters":[
      {
        "ce_login_parameter":{
          "ce_fi_id":null,
          "parameter_caption":"What is your favorite color?",
          "parameter_id":"answer",
          "parameter_max_length":null,
          "parameter_type":"password"
        }
      }
    ],
    "session_key":"464a674e7367646e2b77665576726947426b627879413d3d",
    "harvest_id":"123770714",
    "login_id":"19349692"
  }
}
```

The answer to the MFA challenge can then be submitted to continue the process. These paramaters are required for this request:
* `mfa_responses[answer]` The answer to the MFA challenge.
* `harvest_id` From the previous request.
* `login_id` From the previous request.
* `session_key` From the previous request.

### Followup Request/Response

`PUT /api/v2/users/:user_id:/accounts/:account_id/update_credentials`

> Followup Request

```
mfa_responses[answer]=red&harvest_id=123770714&login_id=19349692&session_key=464a674e7367646e2b77665576726947426b627879413d3d
```

> Follwup Response

```json
{
  "accounts": [
    {
      "id":86,
      "name":"account-name",
      "balance":"42.5",
      "reference_id":"42",
      "aggregation_type":"cashedge",
      "state":"active",
      "harvest_updated_at":"2013-03-07T14:42:00Z",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "cashedge_account_type":{
        "name":"Checking",
        "acct_type":"DDA",
        "ext_type":"DDA",
        "group":null
      },
      "fi":{
        "fi_id":99,
        "name":"FI"
      }
    }
  ]
}
```

### Error Response

```json
{
  "error": {
    "message":"Something unexpected happened.",
    "data":{}
  }
}
```