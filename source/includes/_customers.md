# Customers

## Get All Customers

This endpoint will display all the customers for a company.

<b>API Endpoint</b>

`GET https://api.bilendo.de/api/v2/customers`

## Create New Costumer

This endpoint will create a new customer for a company.

<b>API Endpoint</b>

`POST https://api.bilendo.de/api/v2/customers`

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
  -d "dunning_stop=false" \
  -d "shipping_mode=email" \
```

Attribute | Type | Description
--------- | ----------- | ---------
id | string | Bilendo id of the contact <br>Example: `con-00000000-0000-0000-0000-000000000000`
external_id | string | your id of the contact
name | string | name of the contact
phone | string | phone number of the contact
gender | integer | 0 = unknown<br>1 = male<br>2 = female
salutation | integer | 0 = formal<br>1 = informal
salutation text | string | 0 = "Sehr geehrter Herr #{name}"; <br>"Sehr geehrter Frau #{name}"; <br>"Sehr geehrte Damen und Herren" (if a name missing) <br>1 = "Hallo #{name}"
email | string | email
customer_id | string | the customer id
main_contact | boolean | true = main contact<br>false = not main contact

> Response

```json
 "data": [
        {
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
                "created_at": "2020-05-13T12:52:12+02:00",
                "updated_at": "2020-05-13T13:31:07+02:00"
            }
        }
    ]
}
```
