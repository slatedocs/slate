# Customers

## Customer Object

Attribute | Type | Description
--------- | -----| -----------
id | string | Bilendo id of the customer <br>Example: `00000000-0000-0000-0000-000000000000`
external_id | string | your id of the customer
customer_number | string | optional customer number
additional_number | string | optional additional customer number
name | string | name of the customer
phone | string | phone number of the customer
dunning_stop | boolean | prevents reminders
dunning_stop_date | date | the dunning_stop ends on this date
shipping_mode | string | shipping methods with values:<br>`email`<br>`post`<br>`dual_shipping` (email & post simultaneously)<br>`unknown`<br>We default to the company shipping mode settings if empty.
customer_group_id | string | the customer's group id
notice | string | optional note
template_setting_id | string | the customer's template setting id
template_invoice_id | string | the customer's template invoice id
template_email_id | string | the customer's template email id
template_post_id | string | the customer's template post id
created_at | datetime | datetime of creation
updated_at | datetime | datetime of last update

## Get All Customers

This endpoint will display all the customers for a company.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers`

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v2/customers" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=New Companyname Inc." \
```

## Create New Costumer

This endpoint will create a new customer for a company.

<b>API Endpoint</b>

`POST https://apisandbox.bilendo.de/api/v2/customers`

> Request

```shell
curl -X "POST" "https://apisandbox.bilendo.de/api/v2/customers" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=New Company" \
  -d "phone=123456" \
  -d "external_id=<your-customer-id>" \
  -d "customer_number=10001" \
  -d "additional_number=20002" \
  -d "note=Lorem Ipsum" \
  -d "customer_group_id=<customer-group-id>" \
  -d "customer_group_id=<customer-group-id>" \
  -d "template_email_id=<template-email-id>" \
  -d "template_invoice_id=<template-invoice-id>" \
  -d "template_post_id=<template-post-id>" \
  -d "template_setting_id=<template-setting-id>" \
```

Attribute | Type | Description
--------- | -----| -----------
external_id | optional | your id of the customer
customer_number | optional | optional customer number
additional_number | optional | optional additional customer number
name | mandatory | name of the customer
phone | optional | phone number of the customer
notice | optional | optional note

> Response

```json
{
    "data": {
        "id": "<customer-id>",
        "type": "customer",
        "attributes": {
            "id": "<customer-id>",
            "external_id": "<your-customer-id>",
            "customer_number": "10001",
            "additional_number": "20002",
            "name": "New Company",
            "phone": "123456",
            "dunning_stop": false,
            "dunning_stop_date": null,
            "notice": "Lorem Ipsum",
            "shipping_mode": "email",
            "customer_group_id": "<customer-group-id>",
            "template_email_id": "<template-email-id>",
            "template_invoice_id": "<template-invoice-id>",
            "template_post_id": "<template-post-id>",
            "template_setting_id": "<template-setting-id>",
            "created_at": "2020-05-15T15:53:44+02:00",
            "updated_at": "2020-05-15T15:53:44+02:00"
        },
        "relationships": {
            "addresses": {
                "data": [],
                "links": {
                    "self": "https://api.bilendo.de/api/v2/customers/<customer-id>",
                    "related": "https://api.bilendo.de/api/v2/customers/<customer-id>/addresses"
                }
            },
            "contacts": {
                "data": [],
                "links": {
                    "self": "https://api.bilendo.de/api/v2/customers/<customer-id>",
                    "related": "https://api.bilendo.de/api/v2/customers/<customer-id>/contacts"
                }
            }
        }
    }
}
```

## Update Existing Customer

This endpoint will update the details of customer for a company.

<b>API Endpoint</b>

`PATCH https://apisandbox.bilendo.de/api/v2/customers/<customer-id>`

> Request

```shell
curl -X "PATCH" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN" \
  -d "name=New Companyname Inc." \
```

Attribute | Type | Description
--------- | -----| -----------
id | mandatory | Bilendo id of the customer
external_id | optional | your id of the customer
customer_number | optional | optional customer number
additional_number | optional | optional additional customer number
name | mandatory | name of the customer
phone | optional | phone number of the customer
customer_group_id | optional | the customer's group id
notice | optional | optional note
template_setting_id | optional | the customer's template setting id
template_invoice_id | optional | the customer's template invoice id
template_email_id | optional | the customer's template email id
template_post_id | optional | the customer's template post id

## Get a specific Customer

This endpoint will display all the information of a particular customer.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/<customer-id>`

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v2/customers/<customer-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```

## Find a specific Customer

Use this endpoint to case-insensitive find a customer on bilendo by providing your own id.

<b>API Endpoint</b>

`GET https://apisandbox.bilendo.de/api/v2/customers/find/<your-customer-id>`

> Request

```shell
curl -X "GET" "https://apisandbox.bilendo.de/api/v2/customers/find/<your-customer-id>" \
  -H "Authorization: Token token=YOUR-API-TOKEN"
```
