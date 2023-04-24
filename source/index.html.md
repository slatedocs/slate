---
title: QUIPU API Reference

language_tabs:
  - shell

toc_footers:
  - <a href='https://getquipu.com'>Quipu</a>

includes:
  - contacts
  - invoices_tickets_and_paysheets
  - invoices
  - tickets
  - items
  - paysheets
  - numbering_series
  - analytic_categories
  - accounting_categories
  - accounting_subcategories
  - attachments
  - errors

search: true
---

# Introduction

Welcome to Quipu API.

Quipu is an invoice and taxes software as a service for freelances and companies.

Feel free to use our API and develop amazing things. To use our API you need to sign up in our software [here](https://getquipu.com/en).

You will have 15 days to try it for free. If you need more time just contact our support team and we will extend the days.

You can get more information about our API, libraries and other applications here: [https://getquipu.com/en/integrations](https://getquipu.com/en/integrations).

## REST API Conventions

The Quipu API is based on ... <a href="http://jsonapi.org/">JSON API</a>

All request should include the header `Accept: application/vnd.quipu.v1+json`.

All POST, PUT and PATCH request must include the header `Content-Type: application/vnd.quipu.v1+json`, except when specifically indicated otherwise.

### Filtering

When fetching collections of resources you can use `filter[filter_name]=filter_value` query params.

The available filters are detailed in each section.

Example:

<code>GET /invoices?**filter[period]=1Q-2015&filter[kind]=income**</code>

### Sorting

When fetching some collections of resources you can use `?sort=sort_criteria_1,sort_criteria_2,-sorting_criteria_3,...`, each sorting criteria separated with a comma.

The `-` sign at the beggining of a sorting criteria means that the order for this criteria is descendant.

Example:

<code>GET /invoices?**sort=-issued_at,total_amount** # => order_by issued_at desc, total_amount asc;</code>

## Rate limiting

In order to guarantee a fair usage of the platform by all users, we set a maximum of 5 requests every 5 seconds (effectively 900 requests every 15 minutes), for a specific pair of credentials.

We implement the standard `RateLimit` headers defined in section 3 of [this document](https://www.ietf.org/archive/id/draft-polli-ratelimit-headers-02.html) so the API user can know the limit, how much usage there is left, and when will this usage be reset.

In the event that a request surpasses the allocated limit for that account, a 429 status code will be returned.

## Endpoints summary

### [Contacts](#contacts-section)

* `GET    /contacts`
* `POST   /contacts`
* `GET    /contacts/:id`
* `PATCH  /contacts/:id`
* `DELETE /contacts/:id`

### [Invoices, tickets and paysheets](#invoices-tickets-and-paysheets-section)

* `GET /book_entries`

### [Invoices](#invoices-section)

* `GET    /invoices`
* `POST   /invoices`
* `GET    /invoices/:id`
* `PATCH  /invoices/:id`
* `DELETE /invoices/:id`

### [Tickets](#tickets-section)

* `GET    /tickets`
* `POST   /tickets`
* `GET    /tickets/:id`
* `PATCH  /tickets/:id`
* `DELETE /tickets/:id`

### [Paysheets](#paysheets-section)

* `GET    /paysheets`
* `POST   /paysheets`
* `GET    /paysheets/:id`
* `PATCH  /paysheets/:id`
* `DELETE /paysheets/:id`

### [Numbering series](#numbering-series-section)

* `GET    /numbering_series`
* `POST   /numbering_series`
* `GET    /numbering_series/:id`
* `PATCH  /numbering_series/:id`
* `DELETE /numbering_series/:id`

### [Analytic categories](#analytic-categories-section)

* `GET    /analytic_categories`
* `POST   /analytic_categories`
* `GET    /analytic_categories/:id`
* `PATCH  /analytic_categories/:id`
* `DELETE /analytic_categories/:id`

### [Accounting categories](#accounting-categories-section)

* `GET    /accounting_categories`
* `GET    /accounting_categories/:id`

### [Accounting subcategories](#accounting-subcategories-section)

* `GET    /accounting_subcategories`
* `POST   /accounting_subcategories`
* `GET    /accounting_subcategories/:id`
* `PATCH  /accounting_subcategories/:id`
* `DELETE /accounting_subcategories/:id`

### [Attachments](#attachments-section)

* `POST   /attachments`
* `GET    /attachments/:id`
* `DELETE /attachments/:id`

# Authentication

We use OAuth2 to authorize the requests.

## Getting an access token

> Example request

```shell
curl "https://getquipu.com/oauth/token" \
  -H "Authorization: Basic UHROeGZDc0drbGltRXJRcVZUZUFGRFVUVWpkTVZDcmpORklsclJlS..." \
  -H "Content-Type: application/x-www-form-urlencoded;charset=UTF-8" \
  -d "scope=ecommerce" \
  -d "grant_type=client_credentials"
```

> Example response

```shell
{
  "token_type":    "bearer",
  "created_at":    1456339025,
  "access_token":  "7c74b8e69bdd19a90e1ffaf987ada2ca67b948b0bed7b2cf95ad58f5ecb14294",
  "refresh_token": null,
  "expires_in":    1456346225
}
```

To get an access token you will need the account's `app_id` and `app_secret` credentials.

As is standard in basic access authentication, the header's structure corresponds to `Authorization Basic credentials`, where `credentials` is the result of:

* Joining `app_id` and `app_secret` by a single colon
* Applying Base64 (URL safe mode) to the result

Example:

* if `app_id` were `PtNxfCsGklimErQqVTeAFDUTUjdMVCrjNFIlrReIimSHKMoOaWxAxwHPNevbIwFV`
* and `app_secret` were `HRcqlIcHjYUWunjgVmAQiWYjbYFAGSoLhpXkHoGPhjdwQmXmRIxDQOQJOANpfnbD`
* then the header would be `Authorization Basic UHROeGZDc0drbGltRXJRcVZUZUFGRFVUVWpkTVZDcmpORklsclJlSWltU0hLTW9PYVd4QXh3SFBOZXZiSXdGVjpIUmNxbEljSGpZVVd1bmpnVm1BUWlXWWpiWUZBR1NvTGhwWGtIb0dQaGpkd1FtWG1SSXhEUU9RSk9BTnBmbmJE`

<aside class="notice">
  When a token expires you will need to request for a new one
</aside>

## Using the token in the requests

> Example request

```shell
curl "https://getquipu.com/invoices" \
  -H "Authorization: Bearer be32259bd1d0f4d3d02bcc0771b1b507e2b666ba9e9ba3d7c5639e853f722eb4" \
  -H "Accept: application/vnd.quipu.v1+json"
```
