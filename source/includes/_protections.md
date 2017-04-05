# Protections

## Get all protections
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
      "type":"protections",
      "attributes":{
        "provider":"Line/5",
        "name":"Total Tyre Protection",
        "form_number": "T-12345"
      }
    },
    {
      "id":"3923",
      "type":"protections",
      "attributes":{
        "provider":"Super Provider",
        "name":"The Awesome Protection",
        "form_number": "JA7889"
      }
    }
  ]
}
```

This endpoint retrieves all available protections with their form numbers, these protection ids are the ones that need to come related to the quote protections on the quote creation.

### Protection Attributes

Parameter | Type | Description
-------------- | -------------- | --------------
id | int | the id which identifies the protection
provider | string | Name of the protectio provider
name | string | Name of the protection
form_number | string | Form number that identifies the contract

### HTTP Request

`GET http://example.com/api/v1/protections`
