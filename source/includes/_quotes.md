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
                "name":"Power Video Tuner",
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
                "name":"Cool Protection",
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
> The above command respods JSON structured like this:

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
      "fees":"254.71",
      "loan":null
    }
  }
}
```

## PUT Rates
## PUT Quote Protections
## PUT Finalize
