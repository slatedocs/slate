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

`POST https://api.datil.co/`

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

`POST /sales/invoices`

### Request

> #### Example request

```shell
curl -v https://api.datil.co/sales/invoices \
-H "Content-Type: application/json" \
-H "X-Key: <your-legacy-api-key>" \
-H "X-Api-Key: <your-api-key>" \
-d '{
      "country": "CO",
      "number": "001-001-000000002",
      "uuid": "12345-12345-12345-12345-12345",
      "issue_date": "2016-11-22 23:00:00",
      "supplier": {
        "tax_identification_type": "31",
        "properties": [],
        "address": "Carrera 11 Calle 9",
        "email": "e@datil.co",
        "phone": "57122222222222",
        "locality": "Bogotá",
        "sublocality": "Centro",
        "tax_identification": "091726282001",
        "tax_level_code": "2",
        "business": {
           "legal_name": "Datil Technolgies S.A.S",
        },
        "administrative_district_level_1": "Cundinamarca",
        "country": "CO"
      },
      "customer": {
        "tax_identification_type": "31",
        "properties": [],
        "address": "Carrera 10 Calle 1",
        "email": "w@datil.co",
        "phone": "57122222222222",
        "locality": "Bogota DC",
        "sublocality": "Centro",
        "tax_identification": "1050320-1",
        "tax_level_code": "2",
        "person": {"first_name": "Juan",
                   "middle_name": "A.",
                   "last_name": "Argüello"},
        "administrative_district_level_1": "Cundinamarca",
        "country": "CO"
      },
      "taxes": [
        {
          "amount": 419046.82,
          "tax_code": "03",
          "tax_rate": 4.14,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        },
        {
          "amount": 1619504.64,
          "tax_code": "01",
          "tax_rate": 16.00,
          "rate_code": "3",
          "taxable_amount": 10121904.00
        }
      ],
      "totals": {
        "subtotal_amount": 10121904.00,
        "total_tax_amount": 2038551.46,
        "total_amount": 12160455.46,
      }
      "currency": "COP",
      "items": [
        {
          "description": "Apple",
          "properties": {
            "key": "size",
            "value": "M"
          },
          "unit_discount": 0.00,
          "unit_code": "units",
          "unit_price": 43256.00,
          "id": "ABC",
          "subtotal_amount": 10121904.00,
          "total_amount": 1.15,
          "quantity": 234
        }
      ],
      "properties": [
         {
           "key": "Contract Number",
           "value": "420420"
         }
       ],
       "payments": [
         {
           "properties": {
             "account_number": "2223XXXX23",
             "bank": "Bancolombia"
           },
           "amount": 1.09,
           "method": "42"
         }
       ],
  }'
```

### Response

"hi"

# Enums
## Tax identification types

Code | Description
---- | -----------
11   | Registro civil
12   | Tarjeta de identidad
13   | Cédula de ciudadanía
21   | Tarjeta de extranjería
22   | Cédula de extranjería
31   | NIT
41   | Pasaporte
42   | Documento de identificación extranjero

## Tax codes

Code | Description
---- | -----------
01   | [IVA](http://www.andi.com.co/es/GAI/GuiInv/Imp/RIMC/Paginas/IVA.aspx) tax total
02   | [Impuesto al consumo](http://www.comunidadcontable.com/BancoConocimiento/Otros/impuesto-nacional-al-consumo.asp) tax total
03   | [ICA](http://www.shd.gov.co/shd/industria-y-comercio) tax total
04-09| Code range reserved for DIAN use.
0A - ZZ | Available code ranges.

## Payment methods
Payment methods codes are defined by the [4461 UN/CEFACT standard v06B](http://www.unece.org/trade/untdid/d16a/tred/tred4461.htm). The following are the most common codes according to DIAN:

Code | Description
---- | -----------
10   | Cash
20   | Check
41   | Wire transfer
42   | Bank deposit
54   | Credit card

## Currency codes
Currency codes are defined by the [ISO 4217 standard](http://www.xe.com/iso4217.php). The following table shows some examples:

Code | Description
---- | -----------
USD  | United States of America, Dollar
EUR  | Euro Member Country
COP  | Colombia, Pesos

## Country codes
Country codes are defined by the [ISO 3166-2 standard](http://data.okfn.org/data/core/country-list). The following table shows some examples:

Code | Description
---- | -----------
CO   | Colombia
US   | United States of America
EC   | Ecuador

## Person types
Code | Description
---- | -----------
1    | Company
2    | Person

## Tax regimes
Code | Description
---- | -----------
0    | Simplified
2    | Common

[Learn more](http://www.dian.gov.co/descargas/Material_Informativo/serie_comun_simplificado.pdf) about tax regimes in Colombia.

## Incoterm codes
Code | Description
---- | -----------
CFR  | Cost and Freight
CIF  | Cost, Insurance and Freight
CIP  | Carriage and Insurance Paid to
CPT  | Carriage Paid To
DAF  | Delivered At Frontier
DAP  | Delivered At Place
DAT  | Delivered At Terminal
DDP  | Delivered Duty Paid
DDU  | Delivery Duty Unpaid
DEQ  | Delivered Ex Quay
DES  | Delivered Ex Ship
EXW  | Ex Works
FAS  | Free Alongside Ship
FCA  | Free Carrier
FOB  | Free On Board
OTR  | Other delivery terms
