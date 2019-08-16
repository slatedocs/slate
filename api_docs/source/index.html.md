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


## Get Accounts<code class='get'>GET</code>

> The above command returns JSON structured like this:

```json
[
    {
      "id": 1,
      "code": "12345",
      "description": "test",
      "parent": "",
      "active": 1,
      "account_type": "Expense",
      "external_id": "1234",
      "custom_fields": {}
    }
]
```

This endpoint retrieves a list of accounts with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/accounts/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Create a New Account<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "code": 1234,
  "description": "Test Account",
  "parent": "",
  "active": 1,
  "account_type": "Expense",
  "external_id": 4321,
  "custom_fields": {}
}
```

This endpoint creates an account.

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
ID of the integration object.

## Update an Account<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "code": 1234,
  "description": "Test Account",
  "parent": "",
  "active": 1,
  "account_type": "Expense",
  "external_id": 4321,
  "custom_fields": {}
}
```

This endpoint updates a specific account.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
ACCOUNT_ID | ID of the account being updated


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
ID of the integration object.

## Delete an Account<code class='delete'>DELETE</code>

This endpoint deletes a specific account.

### HTTP Request

`DELETE http://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
ACCOUNT_ID | ID of the account being deleted



## Get Vendors<code class='get'>GET</code>

> The above command returns JSON structured like this:

```json
[
    {
      "id": 1,
      "name": "Procurify",
      "active": 1,
      "address_line_one": "455 Granville St",
      "address_line_two": "300",
      "postal_code": "V6C 1T1",
      "city": "Vancouver",
      "state_province": "British Columbia",
      "country": "Canada",
      "external_id": "1234",
      "custom_fields": {}
    }
]
```

This endpoint retrieves a list of vendors with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/vendors/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Create a New Vendor<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "name": "Procurify",
  "address_line_one": "455 Granville St",
  "address_line_two": "300",
  "postal_code": "V6C 1T1",
  "city": "Vancouver",
  "state_province": "British Columbia",
  "country": "Canada",
  "external_id": "1234"
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Procurify",
  "active": 1,
  "address_line_one": "455 Granville St",
  "address_line_two": "300",
  "postal_code": "V6C 1T1",
  "city": "Vancouver",
  "state_province": "British Columbia",
  "country": "Canada",
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint creates a vendor.

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/vendors/`

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Vendor name.

<code>address_line_one</code><br />
Vendor address line one.

<code>address_line_two</code><br />
Vendor address line two.

<code>postal_code</code><br />
Vendor postal code.

<code>city</code><br />
Vendor city.

<code>state_province</code><br />
Vendor state or province.

<code>country</code><br />
Vendor country.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update a Vendor<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "name": "Procurify",
  "address_line_one": "455 Granville St",
  "address_line_two": "300",
  "postal_code": "V6C 1T1",
  "city": "Vancouver",
  "state_province": "British Columbia",
  "country": "Canada",
  "external_id": "1234"
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Procurify",
  "active": 1,
  "address_line_one": "455 Granville St",
  "address_line_two": "300",
  "postal_code": "V6C 1T1",
  "city": "Vancouver",
  "state_province": "British Columbia",
  "country": "Canada",
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint updates a specific vendor.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
VENDOR_ID | ID of the vendor being updated


### Arguments

<code>name</code><span class="required-tag">required</span><br />
Vendor name.

<code>address_line_one</code><br />
Vendor address line one.

<code>address_line_two</code><br />
Vendor address line two.

<code>postal_code</code><br />
Vendor postal code.

<code>city</code><br />
Vendor city.

<code>state_province</code><br />
Vendor state or province.

<code>country</code><br />
Vendor country.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete a Vendor<code class='delete'>DELETE</code>

This endpoint deletes a specific vendor.

### HTTP Request

`DELETE http://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
VENDOR_ID | ID of the vendor being deleted



## Get Currencies<code class='get'>GET</code>

> The above command returns JSON structured like this:

```json
[
    {
      "id": 1,
      "name": "CAD",
      "rate": "1.000000",
      "active": 1,
      "description": "Canadian Dollars",
      "base": 0,
      "external_id": "1234",
      "custom_fields": {}
    }
]
```

This endpoint retrieves a list of currencies with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/currencies/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Update a Currency<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "name": "CAD",
  "rate": "1.000000",
  "active": 1,
  "description": "Canadian Dollars",
  "base": 0,
  "external_id": "1234"
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "CAD",
  "rate": "1.000000",
  "active": 1,
  "description": "Canadian Dollars",
  "base": 0,
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint updates a specific currency.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/currencies/<CURRENCY_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CURRENCY_ID | ID of the currency being updated


### Arguments

<code>name</code><span class="required-tag">required</span><br />
Currency name.

<code>rate</code><span class="required-tag">required</span><br />
Currency rate relative to the base currency.

<code>active</code><br />
Set currency to active or inactive.

<code>description</code><br />
Currency description.

<code>base</code><br />
Set currency to base currency.

<aside class="notice">
Only one currency can be set as the base currency.
</aside>

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete a Currency<code class='delete'>DELETE</code>

This endpoint deletes a specific currency.

### HTTP Request

`DELETE http://example.procurify.com/api/v3/integrations/netsuite/currencies/<CURRENCY_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CURRENCY_ID | ID of the currency being deleted



## Get Locations<code class='get'>GET</code>

> The above command returns JSON structured like this:

```json
[
    {
        "id": 1,
        "name": "Procurify",
        "url": "https://www.procurify.com/",
        "logo": "procurify-logo.png",
        "phone_one": "1 888-463-5254",
        "fax": "1 888-463-5254",
        "email": "procurify@procurify.com",
        "primary_billing_address": {
            "id": 1,
            "name": "Procurify",
            "addressLineOne": "455 Granville St",
            "city": "Vancouver",
            "postal_code": "V6C 1T1",
            "state_province": "British Columbia",
            "country": "Canada"
        },
        "primary_shipping_address": {
            "id": 2,
            "name": "Procurify",
            "addressLineOne": "455 Granville St",
            "city": "Vancouver",
            "postal_code": "V6C 1T1",
            "state_province": "British Columbia",
            "country": "Canada"
        },
        "language": 1,
        "location_timezone": "Asia/Singapore",
        "active": 1,
        "external_id": "1234",
        "custom_fields": {}
    }
]
```

This endpoint retrieves a list of locations with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/locations/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Create a New Location<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
    "name": "Procurify",
    "url": "https://www.procurify.com/",
    "phone_one": "1 888-463-5254",
    "location_timezone": "Asia/Singapore",
    "fax": "1 888-463-5254",
    "email": "procurify@procurify.com",
    "primary_billing_address": {
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
    },
    "primary_shipping_address": {
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
    },
    "external_id": 1234
}
```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"name": "Procurify",
	"url": "https://www.procurify.com/",
	"logo": "procurify-logo.png",
	"phone_one": "1 888-463-5254",
	"fax": "1 888-463-5254",
	"email": "procurify@procurify.com",
	"primary_billing_address": {
		"id": 1,
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
	},
	"primary_shipping_address": {
		"id": 2,
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
	},
	"language": 1,
	"location_timezone": "Asia/Singapore",
	"active": 1,
	"external_id": "1234",
	"custom_fields": {}
}
```

This endpoint creates a location.

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/locations/`

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Location name.

<code>url</code><br />
Location url.

<code>phone_one</code><span class="required-tag">required</span><br />
Location phone number.

<code>fax</code><br />
Location fax number.

<code>email</code><br />
Location email.

<code>primary_billing_address</code><span class="required-tag">required</span><br />
Location billing address.

<code>primary_shipping_address</code><span class="required-tag">required</span><br />
Location shipping address.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update a Location<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
    "name": "Procurify",
    "url": "https://www.procurify.com/",
    "phone_one": "1 888-463-5254",
    "location_timezone": "Asia/Singapore",
    "fax": "1 888-463-5254",
    "email": "procurify@procurify.com",
    "primary_billing_address": {
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
    },
    "primary_shipping_address": {
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
    },
    "external_id": 1234
}
```

> The above command returns JSON structured like this:

```json
{
	"id": 1,
	"name": "Procurify",
	"url": "https://www.procurify.com/",
	"logo": "procurify-logo.png",
	"phone_one": "1 888-463-5254",
	"fax": "1 888-463-5254",
	"email": "procurify@procurify.com",
	"primary_billing_address": {
		"id": 1,
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
	},
	"primary_shipping_address": {
		"id": 2,
		"name": "Procurify",
		"addressLineOne": "455 Granville St",
		"city": "Vancouver",
		"postal_code": "V6C 1T1",
		"state_province": "British Columbia",
		"country": "Canada"
	},
	"language": 1,
	"location_timezone": "Asia/Singapore",
	"active": 1,
	"external_id": "1234",
	"custom_fields": {}
}
```

This endpoint updates a specific location.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/locationss/<LOCATION_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
LOCATION_ID | ID of the location being updated


### Arguments

<code>name</code><span class="required-tag">required</span><br />
Location name.

<code>url</code><br />
Location url.

<code>phone_one</code><span class="required-tag">required</span><br />
Location phone number.

<code>fax</code><br />
Location fax number.

<code>email</code><br />
Location email.

<code>primary_billing_address</code><span class="required-tag">required</span><br />
Location billing address.

<code>primary_shipping_address</code><span class="required-tag">required</span><br />
Location shipping address.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete a Location<code class='delete'>DELETE</code>

This endpoint deletes a specific location.

### HTTP Request

`DELETE http://example.procurify.com/api/v3/integrations/netsuite/locations/<LOCATION_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
LOCATION_ID | ID of the location being deleted



## Get Departments<code class='get'>GET</code>

> The above command returns JSON structured like this:

```json
[
    {
      "id": 1,
      "name": "Accounting",
      "branch_id": 1,
      "active": 1,
      "external_id": "1234",
      "custom_fields": {}
    }
]
```

This endpoint retrieves a list of departments with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/departments/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Create a New Department<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "name": "Accounting",
  "external_id": 4321
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Accounting",
  "branch_id": 1,
  "active": 1,
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint creates a department.

<aside class="notice">
Departments are created for ALL locations in Procurify.
</aside>

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/departments/`

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Department name.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update a Department<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "name": "Accounting",
  "branch_id": 1,
  "external_id": 4321
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Accounting",
  "branch_id": 1,
  "active": 1,
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint updates a specific department.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/departments/<DEPARTMENT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
DEPARTMENT_ID | ID of the department being updated


### Arguments

<code>name</code><span class="required-tag">required</span><br />
Department name.

<code>branch_id</code><br />
ID of parent location.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete a department<code class='delete'>DELETE</code>

This endpoint deletes a specific department.

<aside class="notice">
Departments are removed from ALL locations.
</aside>

### HTTP Request

`DELETE http://example.procurify.com/api/v3/integrations/netsuite/departments/<DEPARTMENT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
DEPARTMENT_ID | ID of the department being deleted



## Create a New Custom Field<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
    "field_label": "Subsidiary",
    "field_model": "order_item",
    "field_required": 1,
    "field_choices": ["some subsidiary name", "another subsidiary name"]
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "field_label": "Subsidiary",
  "field_required": 1
}
```

This endpoint creates a custom field.

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/custom-fields/`

### Arguments

<code>field_label</code><span class="required-tag">required</span><br />
Custom field name.

<code>field_model</code><span class="required-tag">required</span><br />
Models that support custom fields.

<code>field_required</code><br />
Set custom field to be mandatory.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update a Custom Field<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
    "field_label": "Subsidiary",
    "field_model": "order_item",
    "field_required": 1,
    "field_choices": ["some subsidiary name", "another subsidiary name"]
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "field_label": "Subsidiary",
  "field_required": 1
}
```

This endpoint updates a specific custom field.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/custom-fields/<CUSTOM_FIELD_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTOM_FIELD_ID | ID of the custom field being updated

### Arguments

<code>field_label</code><span class="required-tag">required</span><br />
Custom field name.

<code>field_model</code><span class="required-tag">required</span><br />
Models that support custom fields.

<code>field_required</code><br />
Set custom field to be mandatory.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.



## Get Catalog Items<code class='get'>GET</code>

> The above command returns JSON structured like this:

```json
[
    {
      "id": 1,
      "name": "Catalog Item",
      "unit_type": "box",
      "pref_vendor": 1,
      "account_code": 1234,
      "internal_sku": "SN1234",
      "active": 1,
      "description": "Catalog Item",
      "product_url": "www.procurify.com",
      "currency": 1,
      "price": "1.00000000",
      "external_id": "1234",
      "custom_fields": {}
    }
]
```

This endpoint retrieves a list of catalog items with specific status.

### HTTP Request

`GET http://example.procurify.com/api/v3/integrations/netsuite/catalog-items/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

## Create a New Catalog Item<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "name": "Catalog Item",
  "unit_type": "box",
  "pref_vendor": 1,
  "account_code": 1234,
  "internal_sku": "SN1234",
  "description": "Catalog Item",
  "product_url": "www.procurify.com",
  "currency": 1,
  "price": "1.00000000",
  "external_id": "1234"
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Catalog Item",
  "unit_type": "box",
  "pref_vendor": 1,
  "account_code": 1234,
  "internal_sku": "SN1234",
  "active": 1,
  "description": "Catalog Item",
  "product_url": "www.procurify.com",
  "currency": 1,
  "price": "1.00000000",
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint creates a catalog item.

### HTTP Request

`POST http://example.procurify.com/api/v3/integrations/netsuite/catalog-items/`

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Catalog item name.

<code>unit_type</code><br />
Catalog item unit type.

<code>pref_vendor</code><br />
ID of default vendor.

<code>account_code</code><br />
ID of default account.

<code>internal_sku</code><br />
Catalog item internal sku.

<code>description</code><br />
Catalog item description.

<code>product_url</code><br />
Catalog item url.

<code>currency</code><br />
ID of currency.

<code>price</code><span class="required-tag">required</span><br />
Catalog item price.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update a Catalog Item<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "name": "Catalog Item",
  "unit_type": "box",
  "pref_vendor": 1,
  "account_code": 1234,
  "internal_sku": "SN1234",
  "description": "Catalog Item",
  "product_url": "www.procurify.com",
  "currency": 1,
  "price": "1.00000000",
  "external_id": "1234"
}
```

> The above command returns JSON structured like this:

```json
{
  "id": 1,
  "name": "Catalog Item",
  "unit_type": "box",
  "pref_vendor": 1,
  "account_code": 1234,
  "internal_sku": "SN1234",
  "active": 1,
  "description": "Catalog Item",
  "product_url": "www.procurify.com",
  "currency": 1,
  "price": "1.00000000",
  "external_id": "1234",
  "custom_fields": {}
}
```

This endpoint updates a specific catalog item.

### HTTP Request

`PUT http://example.procurify.com/api/v3/integrations/netsuite/catalog-items/<CATALOG_ITEM_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CATLOG_ITEM_ID | ID of the catalog item being updated


### Arguments

<code>name</code><span class="required-tag">required</span><br />
Catalog item name.

<code>unit_type</code><br />
Catalog item unit type.

<code>pref_vendor</code><br />
ID of default vendor.

<code>account_code</code><br />
ID of default account.

<code>internal_sku</code><br />
Catalog item internal sku.

<code>description</code><br />
Catalog item description.

<code>product_url</code><br />
Catalog item url.

<code>currency</code><br />
ID of currency.

<code>price</code><span class="required-tag">required</span><br />
Catalog item price.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete a Catalog Item<code class='delete'>DELETE</code>

This endpoint deletes a specific catalog item.

### HTTP Request

`DELETE http://example.procurify.com/api/v3/integrations/netsuite/catalog-items/<CATALOG_ITEM_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CATALOG_ITEM_ID | ID of the catalog item being deleted
