# Netsuite

## Initialize<code class='post'>POST</code>

> The above command accepts a basic authentication header:

```
Authorization: Basic <base64 string>

base64 string is the base64-encoding of "username:password"
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "auth_string": "auth_string"
    },
    "metadata": {}
}
```

> The authentication string can then be used to do basic authentication in subsequent endpoint calls, so superuser credentials would not be needed.

> Include basic authentication in subsequent request headers:

```javascript

    Authorization:Basic aW50ZWdyYXRpb25zQHByb2N1c

```

This endpoint enables integration and get or create the integration user. It returns a basic authentication string of the integration user.

<aside class="notice">
Only users with superuser role can call this endpoint.
</aside>

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/initialize/`

### HTTP Response Status Code

201 Created



## Get Accounts<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 1,
            "code": "1000",
            "description": "Supplies",
            "parent": null,
            "active": true,
            "account_type": "Expense",
            "external_id": "1234",
            "custom_fields": {}
        },
        {
            "id": 2,
            "code": "2000",
            "description": "Services",
            "parent": null,
            "active": true,
            "account_type": "Expense",
            "external_id": "4321",
            "custom_fields": {}
        }
    ],
    "metadata": {
        "pagination": {
            "count": 2,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of accounts with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/accounts/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Create Account<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 24,
        "code": "1234",
        "description": "Test Account",
        "parent": null,
        "active": true,
        "account_type": "2",
        "external_id": "4321",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint creates an account.

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/accounts/`

### HTTP Response Status Code

201 Created

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

## Update Account<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 1,
        "code": "1234",
        "description": "Test Account",
        "parent": null,
        "active": true,
        "account_type": "2",
        "external_id": "4321",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint updates a specific account.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`


### URL Parameters

Parameter | Description
--------- | -----------
ACCOUNT_ID | ID of the account being updated

### HTTP Response Status Code

200 OK

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

## Delete Account<code class='delete'>DELETE</code>

This endpoint deletes a specific account.

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
ACCOUNT_ID | ID of the account being deleted

### HTTP Response Status Code

204 No Content



## Get Catalog Items<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 1,
            "name": "Cardboard Boxes",
            "unit_type": "Box",
            "pref_vendor": 2,
            "account_code": null,
            "internal_sku": "C02392",
            "active": true,
            "description": "",
            "product_url": null,
            "currency": 1,
            "price": "2.00000000",
            "external_id": "",
            "custom_fields": {}
        }
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of catalog items with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/catalog-items/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Create Catalog Item<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "name": "Catalog Item",
  "unit_type": "box",
  "pref_vendor": 1,
  "account_code": 2,
  "internal_sku": "SN1234",
  "description": "Catalog Item",
  "product_url": "www.procurify.com",
  "currency": 1,
  "price": "1.00000000",
  "external_id": "1234"
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 353,
        "name": "Catalog Item",
        "unit_type": "box",
        "pref_vendor": 1,
        "account_code": 2,
        "internal_sku": "SN1234",
        "active": true,
        "description": "Catalog Item",
        "product_url": "www.procurify.com",
        "currency": 1,
        "price": "1.00000000",
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint creates a catalog item.

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/catalog-items/`

### HTTP Response Status Code

201 Created

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

## Update Catalog Item<code class='put'>PUT</code>

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

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 353,
        "name": "Catalog Item",
        "unit_type": "box",
        "pref_vendor": 1,
        "account_code": 1234,
        "internal_sku": "SN1234",
        "active": true,
        "description": "Catalog Item",
        "product_url": "www.procurify.com",
        "currency": 1,
        "price": "1.00000000",
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint updates a specific catalog item.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/catalog-items/<CATALOG_ITEM_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CATLOG_ITEM_ID | ID of the catalog item being updated

### HTTP Response Status Code

200 OK

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

## Delete Catalog Item<code class='delete'>DELETE</code>

This endpoint deletes a specific catalog item.

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/catalog-items/<CATALOG_ITEM_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CATALOG_ITEM_ID | ID of the catalog item being deleted

### HTTP Response Status Code

204 No Content



## Get Content Types<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 231,
            "app_label": "account",
            "model": "emailaddress"
        },
        {
            "id": 232,
            "app_label": "account",
            "model": "emailconfirmation"
        }
    ],
    "metadata": {}
}
```

This endpoint retrieves a list content types.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/content-types/?model=<MODEL>`

### URL Parameters

Parameter | Description
--------- | -----------
MODEL | Filter Contenty Types by model name

### HTTP Response Status Code

200 OK



## Get Currencies<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 1,
            "name": "CAD",
            "rate": "1.000000",
            "active": true,
            "description": "",
            "base": true,
            "external_id": "",
            "custom_fields": {}
        }
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of currencies with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/currencies/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Update Currency<code class='put'>PUT</code>

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

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 1,
        "name": "CAD",
        "rate": "1.300000",
        "active": true,
        "description": "Canadian Dollars",
        "base": true,
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint updates a specific currency.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/currencies/<CURRENCY_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CURRENCY_ID | ID of the currency being updated

### HTTP Response Status Code

200 OK

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

## Delete Currency<code class='delete'>DELETE</code>

This endpoint deletes a specific currency.

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/currencies/<CURRENCY_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CURRENCY_ID | ID of the currency being deleted

### HTTP Response Status Code

204 No Content



## Create Custom Field<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
    "field_label": "Subsidiary",
    "field_model": "order_item",
    "field_required": 1,
    "field_choices": ["some subsidiary name", "another subsidiary name"]
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 54,
        "field_label": "Subsidary",
        "field_required": true
    },
    "metadata": {}
}
```

This endpoint creates a custom field.

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/custom-fields/`

### HTTP Response Status Code

201 Created

### Arguments

<code>field_label</code><span class="required-tag">required</span><br />
Custom field name.

<code>field_model</code><span class="required-tag">required</span><br />
Models that support custom fields.

<code>field_required</code><br />
Set custom field to be mandatory.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update Custom Field<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
    "field_label": "Subsidiary",
    "field_model": "order_item",
    "field_required": 1,
    "field_choices": ["some subsidiary name", "another subsidiary name"]
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 54,
        "field_label": "Subsidary",
        "field_required": true
    },
    "metadata": {}
}
```

This endpoint updates a specific custom field.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/custom-fields/<CUSTOM_FIELD_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
CUSTOM_FIELD_ID | ID of the custom field being updated

### HTTP Response Status Code

200 OK

### Arguments

<code>field_label</code><span class="required-tag">required</span><br />
Custom field name.

<code>field_model</code><span class="required-tag">required</span><br />
Models that support custom fields.

<code>field_required</code><br />
Set custom field to be mandatory.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.



## Get Departments<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 1,
            "name": "Accounting",
            "branch_id": 1,
            "active": true,
            "external_id": "1234",
            "custom_fields": {}
        }
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of departments with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/departments/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Create Department<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
  "name": "Accounting",
  "external_id": 4321
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 818,
        "name": "Accounting",
        "branch_id": 1,
        "active": true,
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint creates a department.

<aside class="notice">
Departments are created for ALL locations in Procurify.
</aside>

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/departments/`

### HTTP Response Status Code

201 Created

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Department name.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update Department<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
  "name": "Accounting",
  "external_id": 4321
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 818,
        "name": "Accounting",
        "branch_id": 1,
        "active": true,
        "external_id": "4321",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint updates a specific department.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/departments/<DEPARTMENT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
DEPARTMENT_ID | ID of the department being updated

### HTTP Response Status Code

200 OK

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Department name.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete Department<code class='delete'>DELETE</code>

This endpoint deletes a specific department.

<aside class="notice">
Departments are removed from ALL locations.
</aside>

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/departments/<DEPARTMENT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
DEPARTMENT_ID | ID of the department being deleted

### HTTP Response Status Code

204 No Content



## Get Locations<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
      {
        "id": 1,
        "name": "Procurify",
        "url": "httpss://www.procurify.com/",
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
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of locations with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/locations/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Create Location<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
    "name": "Procurify",
    "url": "httpss://www.procurify.com/",
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

> The above command returns a JSON structured like this:

```json
{
    "data": [
      {
        "id": 1,
        "name": "Procurify",
        "url": "httpss://www.procurify.com/",
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
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint creates a location.

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/locations/`

### HTTP Response Status Code

201 Created

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

## Update Location<code class='put'>PUT</code>

> The above command accepts a PUT body:

```json
{
    "name": "Procurify",
    "url": "httpss://www.procurify.com/",
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

> The above command returns a JSON structured like this:

```json
{
    "data": [
      {
        "id": 1,
        "name": "Procurify",
        "url": "httpss://www.procurify.com/",
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
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint updates a specific location.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/locationss/<LOCATION_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
LOCATION_ID | ID of the location being updated

### HTTP Response Status Code

200 OK

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

## Delete Location<code class='delete'>DELETE</code>

This endpoint deletes a specific location.

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/locations/<LOCATION_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
LOCATION_ID | ID of the location being deleted

### HTTP Response Status Code

204 No Content



## Get Object Maps<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 1,
            "object_id": 151,
            "status": 1,
            "content_type": 23,
            "external_id": ""
        },
        {
            "id": 2,
            "object_id": 1,
            "status": 1,
            "content_type": 23,
            "external_id": ""
        }
    ],
    "metadata": {
        "pagination": {
            "count": 2,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of object maps with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/object-maps/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Upsert Object Map<code class='post'>POST</code>

> The above command accepts a POST body:

```json
{
    "object_id": 151,
    "content_type": 23,
    "status": 1,
    "external_id": "1234",
    "message": "Error Message"
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 1,
        "object_id": 151,
        "status": 1,
        "content_type": 23,
        "external_id": "1234"
    },
    "metadata": {}
}
```

This endpoint upserts an object map.

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/object-maps/`

### HTTP Response Status Code

200 OK

### Arguments

<code>object_id</code><span class="required-tag">required</span><br />
ID of the Procurify object.

<code>content_type</code><span class="required-tag">required</span><br />
ID of Procurify content_type.

<code>status</code><br />
Object map status.

Status | ID
--------- | -----------
PENDING | 0
SYNCED | 1
ERROR | 2

<code>name</code><br />
Object map name.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

<code>message</code><br />
Optional message to save to integration logs.

## Delete Object Map<code class='delete'>DELETE</code>

This endpoint deletes a specific object map.

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/catalog-items/<OBJECT_MAP_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
OBJECT_MAP_ID | ID of the object map being deleted

### HTTP Response Status Code

204 No Content


## Get Purchase Orders<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
      {
        "id": 3,
        "uuid": "58234091-5f3b-4a7d-b696-2e48070cbfa6",
        "purchase_order_no": "",
        "transaction_date": "2019-08-16T11:22:24-07:00",
        "due_date": "2019-08-22T00:24:07-07:00",
        "total": "12691.90",
        "line_items": [{
            "id": 1,
            "name": "these591",
            "quantity": "9.00000",
            "unit_cost": "826.33200000",
            "amount": "7436.99",
            "currency": {
                "id": 1,
                "name": "CAD",
                "rate": "1.000000",
                "active": 1,
                "description": "",
                "base": 0,
                "external_id": "EX_CURRENCY_1",
                "custom_fields": {}
            },
            "account": {
                "id": 1,
                "code": "12345",
                "description": "TEST",
                "parent": "",
                "active": 1,
                "account_type": "Expense",
                "external_id": "EX_ACCOUNTCODE_1",
                "custom_fields": {}
            },
            "department": {
                "id": 1,
                "name": "Accounting",
                "branch_id": 1,
                "active": 1,
                "external_id": "EX_DEPARTMENT_1",
                "custom_fields": {}
            },
            "location": {
                "id": 1,
                "name": "acme",
                "url": "",
                "logo": "procurify_logo.jpg",
                "phone_one": "12312312312",
                "fax": "",
                "email": "",
                "primary_billing_address": {
                    "id": 1,
                    "name": "ACME Industries",
                    "addressLineOne": "12651 Vickers Way",
                    "city": "Vancouver",
                    "postalCode": "V6V 1J2",
                    "state_province": "BC",
                    "country": "US"
                },
                "primary_shipping_address": {
                    "id": 2,
                    "name": "Procurify",
                    "addressLineOne": "12651 Vickers Way",
                    "city": "Vancouver",
                    "postalCode": "V6V 1J2",
                    "state_province": "BC",
                    "country": "US"
                },
                "language": 1,
                "location_timezone": "America / Vancouver",
                "active": 1,
                "external_id": "EX_COMPANYACCOUNT_1",
                "custom_fields": {}
            },
            "catalog_item": {
                "id": 2,
                "name": "Fast f$lm know cell.",
                "unit_type": "",
                "pref_vendor": "",
                "account_code": "",
                "internal_sku": "20940",
                "active": 1,
                "description": "",
                "product_url": "",
                "currency": "",
                "price": "694.39675700",
                "external_id": "EX_CATALOGITEMS_2",
                "custom_fields": {}
            },
            "memo": "Forward conference."
        }],
        "vendor": {
            "id": 2,
            "name": "Vendor Preferred",
            "active": True,
            "address_line_one": "",
            "address_line_two": "",
            "postal_code": "",
            "city": "",
            "state_province": "",
            "country": "",
            "external_id": 'EX_VENDOR_2',
            "custom_field": {}
        },
        "shipping_address": {
            "contact_name": "Purchaser 1",
            "address_line_one": "12651 Vickers Way",
            "city": "Vancouver",
            "state_province": "BC",
            "country": "US",
            "postal_code": "V6V 1J2"
        },
        "shipping_method": {
                    "id": 2,
                    "name": "Canada Post",
                    "description": "Canada Post",
                    "external_id": null,
                    "custom_fields": {}
        },
        "shipping_term": {
            "id": 2,
            "name": "Work To Commence",
            "description": "Work To Commence",
            "external_id": null,
            "custom_fields": {}
        },
        "payment_term": {
            "id": 11,
            "name": "Credit Card",
            "description": "Credit Card",
            "external_id": null,
            "custom_fields": {}
        },
        "memo": "",
        "external_id": "",
        "custom_fields": {}
      }
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of purchase orders with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/purchase-orders/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK



## Get Vendors<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
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
    ],
    "metadata": {
        "pagination": {
            "count": 1,
            "next": null,
            "previous": null,
            "page_size": 10,
            "num_pages": 1,
            "current_page": 1
        }
    }
}
```

This endpoint retrieves a list of vendors with specific status.

### HTTP Request

`GET https://example.procurify.com/api/v3/integrations/netsuite/vendors/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Create Vendor<code class='post'>POST</code>

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

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 711,
        "name": "Procurify,",
        "active": true,
        "address_line_one": "455 Granville St",
        "address_line_two": "300",
        "postal_code": "V6C 1T1",
        "city": "Vancouver",
        "state_province": "British Columbia",
        "country": "Canada",
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint creates a vendor.

### HTTP Request

`POST https://example.procurify.com/api/v3/integrations/netsuite/vendors/`

### HTTP Response Status Code

201 Created

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

## Update Vendor<code class='put'>PUT</code>

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

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 711,
        "name": "Procurify,",
        "active": true,
        "address_line_one": "455 Granville St",
        "address_line_two": "300",
        "postal_code": "V6C 1T1",
        "city": "Vancouver",
        "state_province": "British Columbia",
        "country": "Canada",
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint updates a specific vendor.

### HTTP Request

`PUT https://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
VENDOR_ID | ID of the vendor being updated

### HTTP Response Status Code

200 OK

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

## Delete Vendor<code class='delete'>DELETE</code>

This endpoint deletes a specific vendor.

### HTTP Request

`DELETE https://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
VENDOR_ID | ID of the vendor being deleted

### HTTP Response Status Code

204 No Content
