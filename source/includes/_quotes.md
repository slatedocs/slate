# Quotes

## POST Quote
```shell
curl -i -X POST -H "Content-Type: application/json" -d @create_quote_request.json https://example.com/api/v1/quotes create_quote_request.json
```
> The above command expects JSON structured like this:

```json
{
  "data":[
    {
      "type":"quotes",
      "attributes":{
        "integration_loan_id":54
      },
      "relationships":{
        "customer":{
          "data":{
            "type":"customers",
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
          }
        },
        "vehicle":{
          "data":{
            "type":"vehicles",
            "attributes":{
              "vin":"vehicle_identification_number",
              "mileage":43
            }
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
              "type":"quote_protection",
              "attributes":{
                "miles":12000,
                "months":24,
                "start_date":"11/23/2021",
                "cost":2433,
                "price":700.0,
                "exclude_tax":true
              },
              "relationships":{
                "protection":{
                  "data":{
                    "type":"protection",
                    "id":23
                  }
                }
              }
            },
            {
              "type":"quote_protection",
              "attributes":{
                "miles":26000,
                "months":32,
                "start_date":"11/25/2021",
                "cost":3433,
                "price":503.0,
                "exclude_tax":true
              },
              "relationships":{
                "protection":{
                  "data":{
                    "type":"protection",
                    "id":64
                  }
                }
              }
            }
          ]
        }
      }
    }
  ]
}
```
> The above command in case of success responds with a JSON structured like this:

```json
{
  "data":{
    "type":"quotes",
    "id":3925,
    "attributes":{
      "integration_loan_id":123456771,
      "status":"new",
      "term":24,
      "monthly_payment":"90.22",
      "protections_total":"2000.0",
      "taxed_total":"1300.0",
      "tax":"91.0",
      "subtotal":"2091.0",
      "down_payment":"200.0",
      "total":"1891.0",
      "doc_stamp_fee":"6.65",
      "financed_total":"1897.65",
      "base_fee":"189.77",
      "buy_down_fee":"64.94",
      "additional_term_fee":"0.0",
      "fees":"254.71"
    }
  }
}
```

This endpoint creates a new quote.

### Quote Attributes:

Parameter | Type | Required | Description
-------------- | -------| -------- | --------------
integration_loan_id | int | true | the ID which identifies the quote on the clients side, meaning your internal ID for this quote

### Customer Attributes:

Parameter | Type | Required | Description
-------------- | -------| -------- | --------------
first_name | string | true | First Name of the customer
last_name | string |  true| Last Name of the customer
ssn | string | true | SSN of the customer
date_of_birth | string | true | Date of birth of this customer on format 'mm/dd/yyyy'
address_1 | string | true | First line of customers address
address_2 | string | true | Second line of customers address
city | string | true | City
state | string | true | State
postal_code | string | true | ZipCode
email | string | true | Customer email
cell_number | string | true | CellPhone Number
phone_number | string |  true | Phone Number

### Vehicle Attributes:

Parameter | Type | Required | Description
-------------- | -------| -------- | --------------
vin | string | true | Vehicle Identification Number
mileage | string |  true | Odometer Reading

### Employee Attributes:

Parameter | Type | Required | Description
-------------- | -------| -------- | --------------
id | int | true | Employee ID on Line5 (from the employees response)

### Quote Protections Attributes:

Parameter | Type | Required | Description
-------------- | -------| -------- | --------------
months | int | true | Number of months covered in the protection
miles | int | true | Miles covered on the protection
start_date | string | true | Starting Date of the coverage 'mm/dd/yyyy'
start_miles | string | true | Starting Miles of the coverage
cost | decimal | true | Cost of activating the protection for the delaer
price | decimal | true | Price of the protection to the customer
exclude_tax | boolean | false | If this protections has it's taxes excluded

### Protection related to each quote_protection

Parameter | Type | Required | Description
-------------- | ------- | -------- | --------------
id | int | true | Protection ID on Line5 (from the protections response)


### Response

When the quote creation succeeds the server will issue a response with status code 201 and the rate attributes of the created Quote

Parameter | Type | Description
-------------- | ------- | --------------
integration_loan_id | int | the ID which identifies the quote on the clients side, meaning your internal ID for this quote
status | string | Status of the deal (new, awaiting_funding, finalized)
term | int | Effective term of the coverage, amount of months were the vehicle is covered
monthly_payment | decimal | Monthly payment required from the customer
protections_total | decimal | Total cost of the protections
taxed_total | decimal | Total amount taxed
tax | decimal | Tax percent
subtotal | decimal | Subtotal amount (taxes + costs)
down_payment | decimal | Down payment required by the customer
total | decimal | Total cost
doc_stamp_fee | decimal | Documents Fee
financed_total | decimal | Total amount that is going to be financed
base_fee | decimal | Base fee for the deal
buy_down_fee | decimal | Buy Down Fee
additional_term_fee | decimal | Fee for adjusting the term
fees | decimal | Total amount of fees

### HTTP Request

`POST http://example.com/api/v1/quotes`

