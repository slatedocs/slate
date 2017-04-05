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
