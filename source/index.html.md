---
title: API Reference

language_tabs:
  - shell
  - ruby

toc_footers:
  - <a href='http://getquipu.com'>Quipu</a>

includes:
  - errors

search: true
---

# Introduction

## REST API Conventions

The Quipu API is based on ... <a href="http://jsonapi.org/">JSON API</a>

All request should include the header `Accept: application/vnd.quipu.v1+json`.

## Endpoints summary

### [Contacts](#contacts-section)

* `GET    /contacts`  
* `POST   /contacts`  
* `GET    /contacts/:id`  
* `PATCH  /contacts/:id`  
* `DELETE /contacts/:id`


### Invoices, tickets and paysheets


* `GET /book_entries`

### Invoices

* `GET    /invoices`  
* `POST   /invoices`  
* `GET    /invoices/:id`  
* `PATCH  /invoices/:id`  
* `DELETE /invoices/:id`

### Tickets

* `GET    /tickets`  
* `POST   /tickets`  
* `GET    /tickets/:id`  
* `PATCH  /tickets/:id`  
* `DELETE /tickets/:id`

### Paysheets

* `GET    /paysheets`  
* `POST   /paysheets`  
* `GET    /paysheets/:id`  
* `PATCH  /paysheets/:id`  
* `DELETE /paysheets/:id`

### Numbering series

* `GET    /numbering_series`  
* `POST   /numbering_series`  
* `GET    /numbering_series/:id`  
* `PATCH  /numbering_series/:id`  
* `DELETE /numbering_series/:id`

### Analytic categories

* `GET    /analytic_categories`  
* `POST   /analytic_categories`  
* `GET    /analytic_categories/:id`  
* `PATCH  /analytic_categories/:id`  
* `DELETE /analytic_categories/:id`

### Analytic subcategories

* `GET    /analytic_subcategories`  
* `POST   /analytic_subcategories`  
* `GET    /analytic_subcategories/:id`  
* `PATCH  /analytic_subcategories/:id`  
* `DELETE /analytic_subcategories/:id`

### Accounting categories

* `GET    /accounting_categories`  
* `GET    /accounting_categories/:id`  

### Accounting subcategories

* `GET    /accounting_subcategories`  
* `POST   /accounting_subcategories`  
* `GET    /accounting_subcategories/:id`  
* `PATCH  /accounting_subcategories/:id`  
* `DELETE /accounting_subcategories/:id`

# Authentication

We use OAuth2 to authorize the requests.

## Getting an access token

> Example request

```shell
curl "http://getquipu.com/oauth/token" \
  -H "Authorization: Basic MGE2NzJjZDY5YmFkYjE1NjM4MWUyOTdlZjJkZjk4ZmE1Mjg5ZDdkNTA4 ..." \
  -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
  -d "grant_type=client_credentials"
```

```ruby
require 'oauth2'

oauth_client = OAuth2::Client.new("<client_id>", "<client_secret>", site: 'https://getquipu.com')

access_token = oauth_client.client_credentials.get_token
```

> Example response

```shell
{
  "token_type":    "bearer",
  "created_at":    1456339025,
  "access_token":  "7c74b8e69bdd19a90e1ffaf987ada2ca67b948b0bed7b2cf95ad58f5ecb14294",
  "refresh_token": null,
  "expires_at":    1456346225
}
```

```ruby
{
  token_type:    "bearer",
  created_at:    1456339025,
  access_token:  "7c74b8e69bdd19a90e1ffaf987ada2ca67b948b0bed7b2cf95ad58f5ecb14294",
  refresh_token: nil,
  expires_at:    1456346225
}
```

To get an access token you will need the account's `app_id` and `app_secret` credentials.

<aside class="notice">
  When a token expires you will need to request for a new one
</aside>

## Using the token in the requests

Blah blah blah

> Example request

```shell
curl "http://getquipu.com/invoices" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

# <a name="contacts-section"></a>Contacts

## Listing contacts

`GET /contacts`

### Available filters

### Sorting

## Getting a contact

`GET /contact/:contact_id`

## Creating a contact

`POST /contacts`

## Updating a contact

`PATCH /contacts/:id`

## Deleting a contact

`DELETE /contacts/:id`
