---
title: Datil Global API

language_tabs:
  - shell: cURL

toc_footers:
  - <a href='https://datil.co'>Get your API key</a>
  - <a href='http://github.com/tripit/slate'>Docs thanks to Slate</a>

search: true
---

# Introduction

This is the Datil global e-billing API. It allows you to generate invoices and other tax documents in Ecuador, Colombia and Perú. Other countries coming soon.

The API is in beta. We would love to hear your thoughts about it.

## Operations

All API operations are done via POST requests to the following URL:

`POST https://api.datil.co/ebilling`

# Authentication

Get an API key by logging in into your Datil account at
[app.datil.co](https://app.datil.co), go to the _Configuration_ and look for the "API Key" section.

<img src="https://s3-us-west-2.amazonaws.com/static-files/datil-py-blurred-api-key.png">

Datil uses the following headers to authenticate your requests:

`X-Key: <legacy-api-key>` This is valid for Ecuador requests.

`X-Api-Key: <api-key>` This is required for all requests.

# Invoices

## Issuing an invoice

### Operation

`POST /ebilling/invoices/issue`

### Request

> #### Example request

```shell
curl -v https://api.datil.co/ebilling/invoices/issue \
-H "Content-Type: application/json" \
-H "X-Key: <your-legacy-api-key>" \
-H "X-Api-Key: <your-api-key>" \
-d '{"country": "CO"
     "type": "invoice",
     "document": {
       "properties": [
         {
           "key": "Contract Number",
           "value": "420420"
         }
       ],
       "payments": [
         {
           "properties": {
             "bills": "109 pennies"
           },
           "amount": 1.09,
           "method": "cash"
         }
       ],
       "supplier": {
         "tax_id_type": "ruc",
         "properties": [
           {
             "key": "required_accounting",
             "value": "true"
           },
           {
             "key": "special_contributor",
             "value": "124531"
           }
         ],
         "address": "Carrera 11 Calle 9",
         "email": "e@datil.co",
         "phone": "57122222222222",
         "city": "Bogotá",
         "tax_id": "091726282001",
         "commercial_name": "Acmesa",
         "legal_name": "Acme S.A.",
         "administrative_district_level_1": "Cundinamarca",
         "administrative_district_level_2": "Bogota",
         "country": "CO"
      },
      "taxes": [
        {
          "amount": 0.11,
          "type": "2",
          "id": "3",
          "taxable_amount": 0.98
        }
      ],
      "issue_date": "2016-11-22 23:00:00",
      "customer": {
        "tax_id_type": "ruc",
        "properties": [
          {
            "key": "required_accounting",
            "value": "true"
          },
          {
            "key": "special_contributor",
            "value": "202984"
          }
        ],
        "address": "Carrera 10 Calle 1",
        "email": "w@datil.co",
        "phone": "57122222222222",
        "city": "Bogota DC",
        "tax_id": "1050320-1",
        "commercial_name": "Datil Technolgies S.A.S",
        "legal_name": "Datil",
        "administrative_district_level_1": "Cundinamarca",
        "administrative_district_level_2": "Bogota",
        "country": "CO"
      },
      "subtotal_amount": 0.98,
      "total_tax_amount": 0.17,
      "total_amount": 1.15,
      "currency": "COP",
      "id": "001-001-000000002",
      "uuid": "12345-12345-12345-12345-12345",
      "items": [
        {
          "description": "Apple",
          "properties": {
            "key": "size",
            "value": "M"
          },
          "unit_discount": 0.00,
          "unit_code": "units",
          "taxes": [
            {
              "amount": 0.17,
              "rate": 0.17,
              "type": "2",
              "id": "3",
              "taxable_amount": 0.98
            }
          ],
          "secondary_id": "123",
          "unit_price": 0.99,
          "id": "ABC",
          "subtotal_amount": 0.98,
          "total_amount": 1.15,
          "quantity": 1
        }
      ]
  }
}'
```
