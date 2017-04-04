---
title: Line 5 Aoi

language_tabs:
  - shell

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Introduction

This documentation describes the api endpoint of Line5

# Authentication

> To authorize, use this code:




```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Token YOUR_API_KEY"
```

> Make sure to replace `YOUR_API_KEY` with your API key.

Line5 uses API keys to allow access to the API. You can register a new Line5 API key by contacting Line5.

Line5 expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Token YOUR_API_KEY`

<aside class="notice">
You must replace <code>YOUR_API_KEY</code> with your personal API key.
</aside>

# Employees

## Get All active employees

```shell
curl "http://example.com/api/v1/employees"
  -H "Authorization: Token YOR_API_KEY"
```
> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "3989",
      "type": "employees",
      "attributes": {
        "email": "john@example.com"
      }
    },
    {
      "id": "3988",
      "type": "employees",
      "attributes": {
        "email": "klaus@example.com"
      }
    },
    {
      "id": "3995",
      "type": "employees",
      "attributes": {
        "email": "tobias@example.com"
      }
    },
    {
      "id": "3997",
      "type": "employees",
      "attributes": {
        "email": "ygritte@example.com"
      }
    },
    {
      "id": "3996",
      "type": "employees",
      "attributes": {
        "email": "victor@example.com"
      }
    }
  ]
}
```

This endpoint retrieves all employees.

### HTTP Request

`GET http://example.com/api/v1/employees`

<aside class="success">
Remember — a happy dealer is an authenticated dealer!
</aside>

# Products

## Get all products
```shell
curl "http://example.com/api/v1/employees"
  -H "Authorization: Your API key"
```

> The above command returns JSON structured like this:

```json
{
  "data":[
    {
      "id":"3989",
      "type":"products",
      "attributes":{
        "provider":"Line/5",
        "name":"Total Tyre Protection",
        "relationships":{
          "forms":{
            "data":[
              {
                "type":"forms",
                "id":34,
                "attributes":{
                  "miles":12000,
                  "start_miles":50,
                  "months":24,
                  "start_date":"11/24/2017",
                  "price":560.99,
                  "cost":344.35
                }
              },
              {
                "type":"forms",
                "id":34,
                "attributes":{
                  "miles":12000,
                  "start_miles":50,
                  "months":24,
                  "start_date":"11/24/2017",
                  "price":560.99,
                  "cost":344.35
                }
              }
            ]
          }
        }
      }
    }
  ]
}
```

This endpoint retrieves all available products with their forms.

# Quotes

## POST Quote
```shell
curl -i -X POST -H "Content-Type: application/json" -d @create_quote_request.json https://line5-ecredit.herokuapp.com/api/v1/quotes create_quote_request.json
```
> The above command expects JSON structured like this:

```json
{
  "data":[
    {
      "id":43,
      "type":"quotes",
      "attributes":{
        "integration_loan_id":54
      },
      "relationships":{
        "customer":{
          "data":{
            "type":"customers",
            "id":23
          }
        },
        "vehicle":{
          "data":{
            "type":"vehicles",
            "id":32
          }
        },
        "employee":{
          "data":{
            "type":"employee",
            "id":3
          }
        },
        "quote_protections":{
          "data":[
            {
              "type":"quote_protections",
              "id":5
            },
            {
              "type":"quote_protections",
              "id":12
            }
          ]
        }
      }
    }
  ],
  "included":[
    {
      "type":"customers",
      "id":23,
      "attributes":{
        "first_name":"first_name",
        "last_name":"last_name",
        "ssn":"customer_ssn",
        "date_of_birth":"yyyy-mm-dd",
        "address_1":"street_address_1",
        "address_2":"street_address_2",
        "city":"city",
        "state":"state_abbreviation",
        "postal_code":"5_digit_zip",
        "cell_number":"8885551212",
        "phone_number":"8885551212"
      }
    },
    {
      "type":"vehicles",
      "id":32,
      "attributes":{
        "vin":"vehicle_identification_number",
        "mileage":43
      }
    },
    {
      "type":"quote_protection",
      "id":5,
      "attributes":{
        "name":"Output GPS Tuner",
        "term":24,
        "lifetime_term":false,
        "start_date":[
          "Today",
          "In-service Date",
          "Model Year"
        ],
        "price":1000.0,
        "exclude_tax":false
      }
    },
    {
      "type":"quote_protection",
      "id":12,
      "attributes":{
        "name":"Power Video Tuner",
        "term":24,
        "lifetime_term":false,
        "start_date":[
          "Today",
          "In-service Date",
          "Model Year"
        ],
        "price":700.0,
        "exclude_tax":true
      }
    }
  ]
  }
}
```
## PUT Rates
## PUT Quote Protections
## PUT Finalize
