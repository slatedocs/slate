---
title: API Reference

language_tabs:
  - shell
  - ruby

toc_footers:
  - <a href='//geezeo.com'>Powered by:<img class="logo" src="/images/logo.png"></a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Overview

The Geezeo REST API provides a method of read and partial write access to a users PFM data. This API is for Partner use only, and is not designed or intended for use by the end user. In addition, security is limited to a Partner-wide access token at this time, so care should be taken that the token is not exposed to an end user.

# Accounts

## Account Types

Group | Account Types
----- | -------------
Cash | checking, savings, money market
Debt | autos creditline home loan student_loans
Investment | investment
Asset | asset cd
Credit card | cards
Bill | bill

## Get Accounts

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/accounts" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> The above command returns JSON structured like this:

```json
{
  "accounts": [
    {
      "id": 42,
      "name": "eChecking",
      "balance": "300.54",
      "reference_id": "789274930",
      "aggregation_type": "cashedge",
      "state": "active",
      "harvest_updated_at": "2013-03-05T12:00:00Z",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "fi": {
        "id": 2,
        "name": "CashEdge Test Bank (Agg) - Retail Non 2FA"
      },
      "error": {
        "message": "There was an error.",
        "code": "300",
        "actionable": true
      },
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

Return a list of accounts for the given user (this will exclude non-classified CashEdge accounts).

`GET /api/v2/users/:user_id:/accounts`

###Status Codes

Status | Description
------ | -----------
200 OK | returned when successful
401 Not Authorized | returned when invalid credentials are provided
404 Not Found | returned when an invalid user is specified

## Get All Accounts

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/accounts/all" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/accounts/all')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> The above command returns JSON structured like this:

```json
{
  "accounts": [
    {
      "id": 42,
      "name": "eChecking",
      "balance": "300.54",
      "reference_id": "789274930",
      "aggregation_type": "cashedge",
      "state": "active",
      "harvest_updated_at": "2013-03-05T12:00:00Z",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "fi": {
        "id": 2,
        "name": "CashEdge Test Bank (Agg) - Retail Non 2FA"
      },
      "error": {
        "message": "There was an error.",
        "code": "300",
        "actionable": true
      },
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

Return a list of accounts for the given user (this will exclude non-classified CashEdge accounts).

`GET /api/v2/users/:user_id:/accounts/all`

###Status Codes

Status | Description
------ | -----------
200 OK | returned when successful
401 Not Authorized | returned when invalid credentials are provided
404 Not Found | returned when an invalid user is specified

## Get Potential Cashflow Accounts

```shell
curl -X "GET" "http://geezeo.dev:3000/api/v2/users/:user_id:/accounts/potential_cashflow" -u "%geezeo-api-key%:"
```

```ruby
uri = URI('https://geezeobkdemo.mybankhq.com/api/v2/users/:user_id:/accounts/potential_cashflow')
key = ':geezeo-aip-key:'

Net::HTTP.start(uri.host, uri.port,
  :use_ssl => uri.scheme == 'https') do |http|

  request = Net::HTTP::Get.new uri.request_uri
  request.basic_auth key,''

  response = http.request request

  puts response.body
end

```

> The above command returns JSON structured like this:

```json
{
  "accounts": [
    {
      "id": 42,
      "name": "eChecking",
      "balance": "300.54",
      "reference_id": "789274930",
      "aggregation_type": "cashedge",
      "state": "active",
      "harvest_updated_at": "2013-03-05T12:00:00Z",
      "account_type": "checking",
      "include_in_expenses": true,
      "include_in_budget": true,
      "include_in_cashflow": true,
      "include_in_dashboard": true,
      "include_in_goals": true,
      "include_in_networth": true,
      "fi": {
        "id": 2,
        "name": "CashEdge Test Bank (Agg) - Retail Non 2FA"
      },
      "error": {
        "message": "There was an error.",
        "code": "300",
        "actionable": true
      },
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

Return a list of accounts for the given user (this will exclude non-classified CashEdge accounts).

`GET /api/v2/users/:user_id:/accounts`

###Status Codes

Status | Description
------ | -----------
200 OK | returned when successful
401 Not Authorized | returned when invalid credentials are provided
404 Not Found | returned when an invalid user is specified
