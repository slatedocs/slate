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

Welcome ...

## REST API Conventions

The Quipu API is based on ... <a href="http://jsonapi.org/">JSON API</a>

All request should include the header `Accept: application/vnd.quipu.v1+json`.

### Filtering

When fetching collections of resources you can use `filter[filter_name]=filter_value` query params.

The available filters are detailed in each section.

Example:

<code>GET /invoices?**filter[period]=1Q-2015&filter[kind]=income**</code>

### Sorting

When fetching collections of resources you can use `sort=-issued_at,total_amount`. Each sorting criteria separated with a comma.

The `-` sign at the beggining of a sorting criteria means that the order for this criteria is descendant.

Example:

<code>GET /invoices?**sort=-issued_at,total_amount** # => order_by issued_at desc, total_amount asc;</code>

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

> Example request

```shell
curl "http://getquipu.com/contacts" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": [{
    "id": "45923",
    "type": "contacts",
    "attributes": {
      "name": "PEPEMOBILE S.L.",
      "tax_id": "ESB85033470",
      "phone": "999999999",
      "email": "pepe@phone.com",
      "address": "Paseo de la Castellana 8, 7-D",
      "town": "Madrid",
      "zip_code": "28046",
      "country_code": "es",
      "total_paid_incomes": "13284.56",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "13284.56",
      "total_paid_expenses": "0.0",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "0.0",
      "client_number": "6",
      "supplier_number": null,
      "is_client": true,
      "is_supplier": false,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }, {
    "id": "45956",
    "type": "contacts",
    "attributes": {
      "name": "Amazon EU S.a.r.l., España",
      "tax_id": "ESW0184081H",
      "phone": "999999999",
      "email": "",
      "address": "Via De Las Dos Castillas, 33, Atica Ed. 2",
      "town": "Pozuelo de Alarcón",
      "zip_code": "28224",
      "country_code": "es",
      "total_paid_incomes": "0.0",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "0.0",
      "total_paid_expenses": "263.15",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "263.15",
      "client_number": null,
      "supplier_number": 931,
      "is_client": false,
      "is_supplier": true,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }
  }, {

    ...

  }],
  meta: {
    "total_pages": 7
  }
}
```

`GET /contacts`

### Available filters

Filter name | Description | Valid values | Example
------------| ------------| ------------ | -------
q | Search by name | Any | `/contacts?filter[q]=amazon`
kind | Filter contacts by kind | `employee`, `supplier` and `client` | `contacts?filter[kind]=client`

### Sorting

Criteria name | Description | Example
------------- | ----------- | -------
name | Sorts contacts by name | `/contacts?sort=name`
total_paid_income | Sorts contacts by the amount of money they have paid to us | `/contacts?sort=-total_paid_income`
total_unpaid_income | Sorts contacts by the amount of money they owe us | `/contacts?sort=total_unpaid_income`
total_paid_expenses | Sorts contacts by the amount of money we have paid to them | `/contacts?sort=total_paid_expenses`
total_unpaid_expenses | Sorts contacts by the amount of money we owe them | `/contacts?sort=-total_unpaid_expenses`

### Pagination

20 contacts in every response. Total pages indicated by `total_pages` in response `meta` object.

You can request a specific page with a query param: `GET /contacts?page[number]=7`

## Getting a contact

> Example request

```shell
curl "http://getquipu.com/contacts/45923" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```

> Example response

```shell
{
  "data": {
    "id": "45923",
    "type": "contacts",
    "attributes": {
      "name": "PEPEMOBILE S.L.",
      "tax_id": "ESB85033470",
      "phone": "999999999",
      "email": "pepe@phone.com",
      "address": "Paseo de la Castellana 8, 7-D",
      "town": "Madrid",
      "zip_code": "28046",
      "country_code": "es",
      "total_paid_incomes": "13284.56",
      "total_unpaid_incomes": "0.0",
      "total_incomes": "13284.56",
      "total_paid_expenses": "0.0",
      "total_unpaid_expenses": 0.0,
      "total_expenses": "0.0",
      "client_number": "6",
      "supplier_number": null,
      "is_client": true,
      "is_supplier": false,
      "is_employee": false,
      "is_supplier_of_direct_goods": false,
      "bank_account_number": "ES92 3821 0601 2314 3339 5656",
      "bank_account_swift_bic": "",
      "deletable": false
    }
  }
}
```

`GET /contact/:contact_id`

## Creating a contact

`POST /contacts`

## Updating a contact

`PATCH /contacts/:id`

## Deleting a contact

`DELETE /contacts/:id`
