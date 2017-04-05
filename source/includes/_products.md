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
