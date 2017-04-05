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
