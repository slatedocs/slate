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
    }
  ]
}
```

This endpoint retrieves all employees.

Parameter | Type | Description
-------------- | -------------- | --------------
id | int | the id which identifies the employee
email | string | The email of the employee

### HTTP Request

`GET http://example.com/api/v1/employees`

<aside class="success">
Remember — a happy dealer is an authenticated dealer!
</aside>
