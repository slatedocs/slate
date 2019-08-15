---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ


toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

Welcome to the Procurify Integration API! You can use our API to access the Integration API endpoints, which can setup integrations and access Procurify objects.

We have language bindings in Shell, Ruby, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.


# Netsuite

## Initialize

> The above command returns JSON structured like this:

```json
  {
    "auth_string": "auth_string"
  }
```

This endpoint retrieves a basic authentication string.

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/initialize/`


## Get Accounts

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "code": "12345",
  "description": "test",
  "parent": None,
  "active": True,
  "account_type": "Expense",
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint retrieves a list of accounts with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/accounts/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Create a New Account

> The above command accepts a POST body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321,
}
```

> The above command returns JSON structured like this:

```json
  "id": 2,
  "code": 1234,
  "description": "Test Account",
  "parent": None,
  "active": True,
  "account_type": "Expense",
  "external_id": 4321,
  "custom_fields": {}
```

This endpoint deletes a specific kitten.

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/accounts/`

### Arguments



<code>code</code><span class="required-tag">required</span><br />
Account code.



<code>description</code><br />
Account code description.


<code>account_type</code><span class="required-tag">required</span><br />
Type of the account code.

Types | ID
--------- | -----------
ASSETS | 0
LIABILITY | 1
EXPENSE | 2
INCOME | 3
EQUITY | 4
OTHER | 5




<code>external_id</code><span class="required-tag">required</span><br />
The id of the integration object.

