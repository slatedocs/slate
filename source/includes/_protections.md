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
      }
    }
  ]
}
```

This endpoint retrieves all available protections with their forms.
