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

`https://example.procurify.com/api/v3/integrations/netsuite/initialize/`

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

`https://example.procurify.com/api/v3/integrations/netsuite/accounts/`

### URL Parameters

Parameter | Description | Example
--------- | ----------- | ---------
STATUS | status can be `pending`, `synced`, or `error` | `?status=pending`
CODE | the alphanumeric account code, **can be comma separated** | `?code=ABC123,DEF456,999`

### HTTP Response Status Code

200 OK

## Get Single Account Details<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": {
            "id": 1,
            "code": "1000",
            "description": "Supplies",
            "parent": null,
            "active": true,
            "account_type": "Expense",
            "external_id": "1234",
            "custom_fields": {}
    },
    "metadata": {}
    }
}
```

This endpoint retrieves a list of accounts with specific status.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`

### HTTP Response Status Code

200 OK

## Create Account<code class='post'>POST</code>

> The above command accepts a body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321,
  "parent": null
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

`https://example.procurify.com/api/v3/integrations/netsuite/accounts/`

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

> The above command accepts a body:

```json
{
  "code": 1234,
  "description": "Test Account",
  "account_type": 2,
  "external_id": 4321,
  "parent": null
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

`https://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`


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

`https://example.procurify.com/api/v3/integrations/netsuite/accounts/<ACCOUNT_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
ACCOUNT_ID | ID of the account being deleted

### HTTP Response Status Code

204 No Content

## Get Payment Terms<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 13,
            "name": "New term",
            "description": "",
            "external_id": "haha",
            "custom_fields": {}
        },
        {
        "id": 14,
        "name": "New term 2",
        "description": "",
        "external_id": "haha 2",
        "custom_fields": {}
    },
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

This endpoint retrieves a list of payment-terms with specific status.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/payment-terms/`

### URL Parameters

Parameter | Description | Example
--------- | ----------- | ---------
STATUS | status can be `pending`, `synced`, or `error` | `?status=pending`

### HTTP Response Status Code

200 OK

## Get Single Payment Term Details<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 14,
        "name": "New term 2",
        "description": "",
        "external_id": "haha 2",
        "custom_fields": {}
    },
    "metadata": {}
    }
}
```

This endpoint retrieves a list of payment-terms with specific status.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/payment-terms/<PAYMENT_TERM_ID>/`

### HTTP Response Status Code

200 OK

## Create Payment Term<code class='post'>POST</code>

> The above command accepts a body:

```json
{
    "name": "New term 2",
    "description": "This describes me",
    "external_id": "haha 2"
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 14,
        "name": "New term 2",
        "description": "",
        "external_id": "haha 2",
        "custom_fields": {}
    },
    "metadata": {}
    }
}
```

This endpoint creates an account.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/payment-terms/`

### HTTP Response Status Code

201 Created

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Name of the payment term

<code>description</code><br />
Payment Term description.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update Payment Term<code class='put'>PUT</code>

> The above command accepts a body:

```json
{
    "name": "New term 2",
    "description": "This describes me",
    "external_id": "haha 2"
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 14,
        "name": "New term 2",
        "description": "",
        "external_id": "haha 2",
        "custom_fields": {}
    },
    "metadata": {}
    }
}
```

This endpoint updates a specific account.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/payment-terms/<PAYMENT_TERM_ID>/`


### URL Parameters

Parameter | Description
--------- | -----------
PAYMENT_TERM_ID | ID of the account being updated

### HTTP Response Status Code

200 OK

### Arguments

<code>name</code><span class="required-tag">required</span><br />
Name of the payment term

<code>description</code><br />
Payment Term description.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete Payment Term<code class='delete'>DELETE</code>

This endpoint deletes a specific account.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/payment-terms/<PAYMENT_TERM_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
PAYMENT_TERM_ID | ID of the account being deleted

### HTTP Response Status Code

204 No Content

## Get Content Types<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": 180,
      "app_label": "ap",
      "model": "bill"
    },
    {
      "id": 185,
      "app_label": "ap",
      "model": "item"
    },
    {
      "id": 23,
      "app_label": "procurify",
      "model": "po"
    },
    {
      "id": 280,
      "app_label": "receipt",
      "model": "item"
    }
  ],
  "metadata": {}
}
```

This endpoint retrieves a list content types.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/content-types/?model=<MODEL>`

### URL Parameters

Parameter | Description
--------- | -----------
MODEL | Filter Contenty Types by model name

### HTTP Response Status Code

200 OK

## Get PO Custom Field<code class='get'>GET</code>


> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": 54,
        "field_label": "Weight",
        "field_required": false
    },
    "metadata": {}
}
```

This endpoint retrieves the Purchase Order custom fields.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/custom-fields/purchase-orders/`

### HTTP Response Status Code

200 OK

### URL Parameters


## Upsert PO Custom Field Value<code class='post'>POST</code>

> The above command accepts a body:

```json
{
	"purchase_order_id": 1
	"custom_field_id": 1
	"custom_field_value": "Test"
}
```

> The above command returns a JSON structured like this:

```json
{
    "data": {
        "purchase_order_id": 1,
        "custom_field_id": 1,
        "custom_field_value": "Test"
    },
    "metadata": {}
}
```

This endpoint updates a PO custom field value.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/custom-fields/purchase-orders/`

### HTTP Response Status Code

201 Created

### Arguments

<code>purchase_order_id</code><span class="required-tag">required</span><br />
Purchase order ID.

<code>custom_field_id</code><span class="required-tag">required</span><br />
PO custom field ID.

<code>custom_field_value</code><span class="required-tag">required</span><br />
Set custom field value for the purchase order.


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

`https://example.procurify.com/api/v3/integrations/netsuite/object-maps/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Upsert Object Map<code class='post'>POST</code>

> The above command accepts a body:

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

`https://example.procurify.com/api/v3/integrations/netsuite/object-maps/`

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

`https://example.procurify.com/api/v3/integrations/netsuite/catalog-items/<OBJECT_MAP_ID>/`

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
      "id": 52,
      "uuid": "8325e590-3b53-11e7-bfdd-021a9831e76d",
      "purchase_order_no": "",
      "transaction_date": "2017-05-17T15:52:33-07:00",
      "due_date": "2017-05-16T23:00:00-07:00",
      "total": "80.00",
      "created_by": {
        "id": 15,
        "first_name": "Joe",
        "last_name": "Smith",
        "email": "joesmith@test.com"
      },
      "line_items": [
        {
          "id": 193,
          "name": "Whiteout",
          "quantity": "10.00000",
          "unit_cost": "8.00",
          "amount": "80.00",
          "currency": {
            "id": 3,
            "name": "USD",
            "rate": "1.000000",
            "active": true,
            "description": "",
            "base": true,
            "external_id": null,
            "custom_fields": {}
          },
          "account": {
            "id": 1,
            "code": "1000",
            "description": "Supplies",
            "parent": null,
            "active": true,
            "account_type": "Expense",
            "external_id": null,
            "custom_fields": {}
          },
          "department": {
            "id": 1,
            "name": "Accounting",
            "branch_id": 1,
            "active": true,
            "external_id": null,
            "custom_fields": {}
          },
          "location": {
            "id": 1,
            "name": "Glenn Research Center",
            "url": "www.nasa.gov/centers/glenn/home/",
            "phone_one": "(216) 433-4000",
            "fax": "",
            "email": "",
            "primary_billing_address": {
              "id": 1,
              "name": "Glenn Research Center",
              "address_line_one": "21000 Brookpark Rd, Cleveland",
              "city": "Cleveland",
              "postal_code": "44135",
              "state_province": "OH",
              "country": "USA"
            },
            "primary_shipping_address": {
              "id": 2,
              "name": "Glenn Research Center",
              "address_line_one": "21000 Brookpark Rd, Cleveland",
              "city": "Cleveland",
              "postal_code": "44135",
              "state_province": "OH",
              "country": "USA"
            },
            "language": 1,
            "location_timezone": "America/Vancouver",
            "active": true,
            "external_id": null,
            "custom_fields": {}
          },
          "catalog_item": {
            "id": 4,
            "name": "Whiteout",
            "unit_type": "Dozen",
            "pref_vendor": 6,
            "account_code": 1,
            "internal_sku": "29382",
            "active": true,
            "description": "",
            "product_url": null,
            "currency": 1,
            "price": "8.00000000",
            "external_id": null,
            "custom_fields": {}
          },
          "memo": "",
          "last_approver": {
            "id": 15,
            "first_name": "Kathryn",
            "last_name": "Hire",
            "email": "kathryn.hire@redshift7.com"
          },
          "external_id": null,
          "custom_fields": {},
          "order_description": "Order with Procurify"
        }
      ],
      "vendor": {
        "id": 6,
        "name": "5 STAR",
        "active": true,
        "address_line_one": "55 West Hampton Ave",
        "address_line_two": "",
        "postal_code": "JKF 345",
        "city": "Toronto",
        "state_province": "Ontario",
        "country": "Canada",
        "email": "purchasing@fivestarcanada.com",
        "alt_email": null,
        "contact": "Ivan Improve",
        "phone": "930-456-8700",
        "alt_phone": "",
        "fax": "",
        "comments": "Notebooks and canvas supplier.",
        "url": "http://fivestarbooks.com/",
        "payment_term": "n 30",
        "shipping_term": "FOB",
        "external_id": null,
        "custom_fields": {}
      },
      "shipping_address": {
        "contact_name": "Neil Armstrong",
        "address_line_one": "21000 Brookpark Rd, Cleveland",
        "city": "Cleveland",
        "state_province": "OH",
        "country": "USA",
        "postal_code": "44135"
      },
      "shipping_method": {
        "id": 5,
        "name": "FedEX",
        "description": "FedEX",
        "external_id": null,
        "custom_fields": {}
      },
      "shipping_term": {
        "id": 4,
        "name": "FOB",
        "description": "FOB",
        "external_id": null,
        "custom_fields": {}
      },
      "payment_term": {
        "id": 11,
        "name": "n 30",
        "description": "n 30",
        "external_id": null,
        "custom_fields": {}
      },
      "subtotal": "80.00",
      "freight": "0.00",
      "other": "0.00",
      "discount": "0.00",
      "tax": "0.00",
      "memo": "",
      "external_id": "9999",
      "custom_fields": {
        "Weight": null,
        "New Field": null
      }
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

`https://example.procurify.com/api/v3/integrations/netsuite/purchase-orders/?status=pending,ignore&transaction_date=2020-01-02`

### URL Parameters

#### status

Use this field to get purchase orders of a certain status.  Multiple statuses can be combined using comma-separation. 

Value       | Description
----------- | -----------
pending     | Get all records that need to be processed in NS (a combination of new/updated/deleted)
synced      | Get all synced records previously successfully synced
error       | Get all records that encountered an error during its most recent sync
ignore      | Get all records that are not meant to sync over to NS. These are usually records that exist before initialization.

#### id

Try it out! `?id=1234` will get you PO with id=1234

#### transaction_date

Try it out! `?transaction_date=2020-03-24` will get you PO's that were created after March 24th of 2020

### HTTP Response Status Code

200 OK

## Get Item Receipt Lines<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": 24,
      "name": "Whiteout",
      "order_item_id": 193,
      "purchased_quantity": "10.00",
      "received_quantity": "5.00",
      "receive_history": [
        {
          "received_quantity": "3.00",
          "timestamp": "2019-11-28T12:31:57.735000-08:00"
        },
        {
          "received_quantity": "2.00",
          "timestamp": "2019-11-28T12:32:17.234000-08:00"
        },
        {
          "received_quantity": "3.00",
          "timestamp": "2019-11-28T12:32:38.206000-08:00"
        },
        {
          "received_quantity": "2.00",
          "timestamp": "2019-11-28T12:33:16.307000-08:00"
        },
        {
          "received_quantity": "5.00",
          "timestamp": "2019-11-28T12:49:25.943000-08:00"
        }
      ],
      "purchase_order": {
        "id": 52,
        "purchase_order_no": "",
        "uuid": "8325e590-3b53-11e7-bfdd-021a9831e76d",
        "external_id": "9999",
        "custom_fields": {
          "Weight": null,
          "New Field": null
        }
      },
      "created_at": "2019-11-28T12:31:57.735536-08:00",
      "updated_at": "2019-11-28T12:49:25.943330-08:00",
      "last_synced_info": {
        "synced_at": "2019-11-28T12:49:10.912734-08:00",
        "received_quantity": "2.00",
        "delta": "3.00"
      },
      "external_id": "9999",
      "custom_fields": {}
    },
    {
      "id": 25,
      "name": "Whiteout",
      "order_item_id": 193,
      "purchased_quantity": "10.00",
      "received_quantity": "1.00",
      "receive_history": [
        {
          "received_quantity": "3.00",
          "timestamp": "2019-11-28T12:32:00.199000-08:00"
        },
        {
          "received_quantity": "4.00",
          "timestamp": "2019-11-28T12:32:20.390000-08:00"
        },
        {
          "received_quantity": "3.00",
          "timestamp": "2019-11-28T12:32:41.805000-08:00"
        },
        {
          "received_quantity": "4.00",
          "timestamp": "2019-11-28T12:33:18.868000-08:00"
        },
        {
          "received_quantity": "1.00",
          "timestamp": "2019-11-28T12:49:28.888000-08:00"
        }
      ],
      "purchase_order": {
        "id": 52,
        "purchase_order_no": "",
        "uuid": "8325e590-3b53-11e7-bfdd-021a9831e76d",
        "external_id": "9999",
        "custom_fields": {
          "Weight": null,
          "New Field": null
        }
      },
      "created_at": "2019-11-28T12:32:00.199650-08:00",
      "updated_at": "2019-11-28T12:49:28.888547-08:00",
      "last_synced_info": {
        "synced_at": "2019-11-28T12:49:08.573131-08:00",
        "received_quantity": "4.00",
        "delta": "-3.00"
      },
      "external_id": "9999",
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

This endpoint retrieves a list of item receipt lines with specific status.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/item-receipt-lines/?status=<STATUS>`

### URL Parameters

#### status

Value       | Description
----------- | -----------
pending     | Get all records that need to be processed in NS (a combination of new/updated/deleted)
synced      | Get all synced records previously successfully synced
error       | Get all records that encountered an error during its most recent sync

#### id

Try it out! `?id=1234` will get you item receipt line with id=1234

### HTTP Response Status Code

200 OK

### Fun Facts

- New item receipt lines are guaranteed to have at least 1 item with quantity > 0
- Pending item receipt lines will only show up if PO has status `SYNCED`

## Get Vendors<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": 2,
            "name": "Staples",
            "active": true,
            "address_line_one": "1852 24th Ave",
            "address_line_two": "Unit 123",
            "postal_code": "72715",
            "city": "New York",
            "state_province": "NY",
            "country": "US",
            "email": "vendoremail@test.com",
            "alt_email": "vendoraltemail@test.com",
            "contact": "Joe Smith",
            "phone": "479-195-8789",
            "alt_phone": "479-696-4781",
            "fax": "479-222-5688",
            "comments": "Please call AR when placing PO to confirm receipt.",
            "url": "http://www.staples.com/",
            "payment_term": "Due on Receipt",
            "shipping_term": "FOB",
            "vendor_external_id": "VENDOR_EX_1",
            "external_id": "EX_VENDOR_2",
            "custom_field": {}
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

`https://example.procurify.com/api/v3/integrations/netsuite/vendors/?status=<STATUS>`

### URL Parameters

Parameter | Description
--------- | -----------
STATUS | status can be "pending", "synced", or "error"

### HTTP Response Status Code

200 OK

## Get Single Vendor Details<code class='get'>GET</code>

> The above command returns a JSON structured like this:

```json
{
    "data": {
            "id": 2,
            "name": "Staples",
            "active": true,
            "address_line_one": "1852 24th Ave",
            "address_line_two": "Unit 123",
            "postal_code": "72715",
            "city": "New York",
            "state_province": "NY",
            "country": "US",
            "email": "vendoremail@test.com",
            "alt_email": "vendoraltemail@test.com",
            "contact": "Joe Smith",
            "phone": "479-195-8789",
            "alt_phone": "479-696-4781",
            "fax": "479-222-5688",
            "comments": "Please call AR when placing PO to confirm receipt.",
            "url": "http://www.staples.com/",
            "payment_term": "Due on Receipt",
            "shipping_term": "FOB",
            "vendor_external_id": "VENDOR_EX_1",
            "external_id": "EX_VENDOR_2",
            "custom_field": {}
        },
    "metadata": {}
    }
}
```

This endpoint retrieves a list of vendors with specific status.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

### HTTP Response Status Code

200 OK

## Create Vendor<code class='post'>POST</code>

> The above command accepts a body:

```json
{
    "name": "Procurify",
    "address_line_one": "455 Granville St",
    "address_line_two": "300",
    "postal_code": "V6C 1T1",
    "city": "Vancouver",
    "state_province": "British Columbia",
    "country": "Canada",
    "email": "vendoremail@test.com",
    "alt_email": "vendoraltemail@test.com",
    "contact": "Joe Smith",
    "phone": "479-195-8789",
    "alt_phone": "479-696-4781",
    "fax": "479-222-5688",
    "comments": "Please call AR when placing PO to confirm receipt.",
    "url": "http://www.staples.com/",
    "payment_term": "Due on Receipt",
    "shipping_term": "FOB",
    "vendor_external_id": "VENDOR_EX_1",
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
        "email": "vendoremail@test.com",
        "alt_email": "vendoraltemail@test.com",
        "contact": "Joe Smith",
        "phone": "479-195-8789",
        "alt_phone": "479-696-4781",
        "fax": "479-222-5688",
        "comments": "Please call AR when placing PO to confirm receipt.",
        "url": "http://www.staples.com/",
        "payment_term": "Due on Receipt",
        "shipping_term": "FOB",
        "vendor_external_id": "VENDOR_EX_1",
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint creates a vendor.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/vendors/`

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

<code>email</code><br />
Vendor email.

<code>alt_email</code><br />
Vendor alternate email.

<code>contact</code><br />
Vendor contact.

<code>phone</code><br />
Vendor phone number.

<code>alt_phone</code><br />
Vendor alternate phone number.

<code>fax</code><br />
Vendor fax number.

<code>comments</code><br />
Vendor comments.

<code>url</code><br />
Vendor URL.

<code>payment_term</code><br />
Vendor payment term.

<code>shipping_term</code><br />
Vendor shipping term.

<code>vendor_external_id</code><br />
Vendor external id.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Update Vendor<code class='put'>PUT</code>

> The above command accepts a body:

```json
{
    "name": "Procurify",
    "address_line_one": "455 Granville St",
    "address_line_two": "300",
    "postal_code": "V6C 1T1",
    "city": "Vancouver",
    "state_province": "British Columbia",
    "country": "Canada",
    "email": "vendoremail@test.com",
    "alt_email": "vendoraltemail@test.com",
    "contact": "Joe Smith",
    "phone": "479-195-8789",
    "alt_phone": "479-696-4781",
    "fax": "479-222-5688",
    "comments": "Please call AR when placing PO to confirm receipt.",
    "url": "http://www.staples.com/",
    "payment_term": "Due on Receipt",
    "shipping_term": "FOB",
    "vendor_external_id": "VENDOR_EX_1",
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
        "email": "vendoremail@test.com",
        "alt_email": "vendoraltemail@test.com",
        "contact": "Joe Smith",
        "phone": "479-195-8789",
        "alt_phone": "479-696-4781",
        "fax": "479-222-5688",
        "comments": "Please call AR when placing PO to confirm receipt.",
        "url": "http://www.staples.com/",
        "payment_term": "Due on Receipt",
        "shipping_term": "FOB",
        "vendor_external_id": "VENDOR_EX_1",
        "external_id": "1234",
        "custom_fields": {}
    },
    "metadata": {}
}
```

This endpoint updates a specific vendor.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

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

<code>email</code><br />
Vendor email.

<code>alt_email</code><br />
Vendor alternate email.

<code>contact</code><br />
Vendor contact.

<code>phone</code><br />
Vendor phone number.

<code>alt_phone</code><br />
Vendor alternate phone number.

<code>fax</code><br />
Vendor fax number.

<code>comments</code><br />
Vendor comments.

<code>url</code><br />
Vendor URL.

<code>payment_term</code><br />
Vendor payment term.

<code>shipping_term</code><br />
Vendor shipping term.

<code>vendor_external_id</code><br />
Vendor external id.

<code>external_id</code><span class="required-tag">required</span><br />
ID of the integration object.

## Delete Vendor<code class='delete'>DELETE</code>

This endpoint deletes a specific vendor.

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/vendors/<VENDOR_ID>/`

### URL Parameters

Parameter | Description
--------- | -----------
VENDOR_ID | ID of the vendor being deleted

### HTTP Response Status Code

204 No Content

## Get Logs<code class='get'>GET</code>

### HTTP Request

`https://example.procurify.com/api/v3/integrations/netsuite/logs/`

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": 1,
      "sync_status": "Info",
      "is_incoming": false,
      "object_details": {
        "id": 10,
        "content_type": 60,
        "external_id": "external-account-code-10",
        "uuid": "",
        "identifiter": "account_code_1 - description",
        "message": "Sync Complete",
      },
      "created_at": "2019-12-10T17:47:00.373867-08:00"
    },
    {
      "id": 2,
      "sync_status": "Info",
      "is_incoming": false,
      "object_details": {
        "id": 20,
        "content_type": 21,
        "external_id": "external-vendor-20",
        "uuid": "",
        "identifiter": "Vendor 1",
        "message": "Sync Complete",
      },
      "created_at": "2019-12-10T17:47:00.373867-08:00"
    },
    {
      "id": 3,
      "sync_status": "Error",
      "is_incoming": false,
      "object_details": {
        "id": 30,
        "content_type": 23,
        "external_id": "external-po-30",
        "uuid": "6bfcf0610fd211eaa1e506ca8f09037c",
        "identifiter": "PF30",
        "message": "You have entered an Invalid Field Value 2 for the following field: location.",
      },
      "created_at": "2019-12-10T17:47:00.373867-08:00"
    },
    {
      "id": 4,
      "sync_status": "Error",
      "is_incoming": false,
      "object_details": {
        "id": 40,
        "content_type": 280,
        "external_id": "external-reciept-item-40",
        "uuid": "6bfcf0610fd211eaa1e506ca8f09037c",
        "identifiter": "PF30",
        "message": "You can not initialize itemreceipt: invalid reference 42111.",
      },
      "created_at": "2019-12-10T17:47:00.373867-08:00"
    },
  ],
  "metadata": {
    "pagination": {
      "count": 5,
      "next": null,
      "previous": null,
      "page_size": 10,
      "num_pages": 1,
      "current_page": 1
    }
  }
}
```

### URL Parameters

Parameter   | Values
------------| -----------
status      | `success`, `error`
object_type | `purchaseorder`, `receiptline`, `accountcode`, `vendor`

### HTTP Response Status Code

200 OK

## Batch Upsert Object Maps <code class='get'>POST</code>

### HTTP Request

`https://example.procurify.com/api/v3/integrations/object-maps/batch/`

> The above command accepts a body:

```json
[
    {
        "object_id": 151,
        "content_type": 23,
        "status": 1,
        "external_id": "1234",
        "message": "Error Message"
    },
    {
        "object_id": 121,
        "content_type": 23,
        "status": 1,
        "external_id": "1244",
        "message": "Error Message"
    },
]
```

> The above command returns a JSON structured like this:

```json
{
    "data": [
    {
        "id": 1,
        "object_id": 151,
        "status": 1,
        "content_type": 23,
        "external_id": "1234"
    },
    {
        "id": 2,
        "object_id": 121,
        "status": 1,
        "content_type": 23,
        "external_id": "1244"
    }
    ],
    "metadata": {}
}
```

This endpoint batch upserts multiple object maps.

### HTTP Response Status Code

201 CREATED

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
