# Customers

Customers represent individual customer accounts from which you which to withdraw funds.

 Field  | Description 
 ------------- | ------------- 
 id  | ID of the customer.  
 custom_identifier  | Your own unique customer identifier.
 name  | Full name of customer.
 email  | Customer email address.
 customer_type  | Personal or Business.
 home_phone  | Home phone number.
 cell_phone  | Cell phone number.
 bank_name  | Bank name.
 institution_number  | Bank institution number.
 transit_number  | Bank transit number.
 account_number  | Bank account number.
 address  | Customer address.
 transaction_schedules  | A list of transaction schedule objects describing the customer’s payment schedules.
 financial_transactions  | A list of financial transactions that have occurred for a customer.

## Get All Customers

```shell
curl "<rotessa_endpoint>/customers.json" 
  -H "Authorization: Token token=\"<api_key>\""
```

> The above command returns JSON structured like this:

```json
[
    {
        "active": true,
        "bank_name": "Scotiabank",
        "created_at": "2015-02-10T23:50:45.000-06:00",
        "custom_identifier": "Mikey",
        "customer_type": "Personal",
        "email": "mikesmith@test.com",
        "home_phone": "(204) 555 4444",
        "id": 1,
        "identifier": "MikeSmith0001",
        "name": "Mike Smith",
        "phone": "(204) 555 5555",
        "updated_at": "2015-04-24T15:56:23.000-05:00"
    },
    {
        "active": true,
        "bank_name": "Royal Bank",
        "created_at": "2015-02-10T23:50:45.000-06:00",
        "custom_identifier": "Susan Johnson",
        "customer_type": "Business",
        "email": "susan@test.com",
        "home_phone": "(204) 111 4321",
        "id": 2,
        "identifier": "SUSANJO0002",
        "name": "Second Customer",
        "phone": "(204) 111 1234",
        "updated_at": "2015-02-10T23:50:45.000-06:00"
    }
]
```

This endpoint retrieves all customers.

### HTTP REQUEST

`GET https://api.rotessa.com/v1/customers`


<aside class="success">
Remember — a happy customer is an authenticated customer!
</aside>

## Get a Specific Customer Based on Rotessa ID

```shell
curl "<rotessa_endpoint>/customers/<id>" 
  -H "Authorization: Token token=\"<api_key>\""
```

> The above command returns JSON structured like this:

```json
{
    "active": true,
    "address": {
        "address_1": "123 Main Street",
        "address_2": "Unit 4",
        "city": "Toronto",
        "id": 5,
        "postal_code": "M1B 0B7",
        "province_code": "ON"
    },
    "bank_name": "Scotiabank",
    "created_at": "2015-02-10T23:50:45.000-06:00",
    "custom_identifier": "Mikey",
    "customer_type": "Personal",
    "email": "test@rotessa.com",
    "financial_transactions": [],
    "home_phone": "(204) 555 5555",
    "id": 1,
    "identifier": "MikeSmith0001",
    "name": "Mike Smith",
    "phone": "(204) 555 4444",
    "transaction_schedules": [],
    "updated_at": "2015-02-10T23:50:45.000-06:00"
}
```

This endpoint retrieves a specific customer.

<aside class="notice">
If you’re not using an administrator API key, note that some customers will return 403 Forbidden if they are hidden for admins only.
</aside>

### HTTP REQUEST

`GET https://api.rotessa.com/v1/customers/<ID>.json`

### URL PARAMETERS

Parameter  | Description 
 ------------- | ------------- 
ID  | The ID of the customer to retrieve. 


## Get a Specific Customer Based on Custom Identifier

```shell
curl -H 'Content-Type: application/json' 
  -H "Authorization: Token token=\"<api_key>\"" 
  -d '{"custom_identifier": "MIKEY"}' 
  <rotessa_endpoint>/customers/show_with_custom_identifier.json
```

> The above command returns JSON structured like this:

```json
{
    "active": true,
    "address": {
        "address_1": "123 Main Street",
        "address_2": null,
        "city": "Toronto",
        "id": 5,
        "postal_code": "M1B 0B7",
        "province_code": "ON"
    },
    "bank_name": "Scotiabank",
    "created_at": "2015-02-10T23:50:45.000-06:00",
    "custom_identifier": "Mikey",
    "customer_type": "Personal",
    "email": "test@rotessa.com",
    "financial_transactions": [],
    "home_phone": "(204) 555 5555",
    "id": 1,
    "identifier": "MikeSmith0001",
    "name": "Mike Smith",
    "phone": "(204) 555 4444",
    "transaction_schedules": [],
    "updated_at": "2015-02-10T23:50:45.000-06:00"
}
```

This endpoint retrieves a specific customer based on a pre-assigned custom_identifier.

<aside class="notice">
If you’re not using an administrator API key, note that some customers will return 403 Forbidden if they are hidden for admins only.
</aside>

### HTTP REQUEST

`GET https://api.rotessa.com/v1/customers/show_with_custom_identifier.json`

### URL PARAMETERS

Parameter | Description 
 ------------- | ------------- 
custom_identifier | The ID of the customer to retrieve. 

## Create A Customer

```shell
curl -X POST -H 'Content-Type: application/json' 
  -H "Authorization: Token token=\"<api_key>\"" 
  -d '{"custom_identifier": "test api", "email": "test@rotessa.com", "name": "Mike Smith", "bank_name": "Scotiabank", "transit_number": "11111", "institution_number": "111", "account_number": "11111111", "address": { "address_1": "123 Main Street", "address_2": "Unit 4", "city": "Toronto", "province_code": "ON", "postal_code": "M1B 0B7" }}' 
  <rotessa_endpoint>/customers.json
```

> The above command returns JSON structured like this:

```json

```

This endpoint creates a new customer

### HTTP REQUEST
`POST https://api.rotessa.com/v1/customers`

### POST PARAMETERS

Parameter | Default | Description
 ------------- | ------------- | -------------
name | - | Full name of customer
custom_identifier | - | Your own customer identifier. Must be unique.
email | - | Email address
home_phone | - | Home phone number
cell_phone | - | Cell phone number
bank_name | - | Bank name of customer
institution_number | - | Bank institution number
transit_number | - | Bank transit number
account_number | - | Bank account number
address | - | Customer address parameters.
customer_type | - | Personal or Business

## Update A Customer

```shell

```

> The above command returns JSON structured like this:

```json

```

This endpoint creates a new customer

### HTTP REQUEST

`GET https://api.rotessa.com/v1/customers/show_with_custom_identifier.json`

### URL PARAMETERS

Parameter  | Description 
 ------------- | ------------- 
ID | The ID of the customer to retrieve. 














