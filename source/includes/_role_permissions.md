# Role Permissions
## List Role Permissions

```javascript
fetch('https://core.eventtia.com/v1/roles/<id>/role_permissions/', {
  method: 'GET',
  headers: {
    'Authorization': '<your token>',
  }
})
```
> Make sure you replace &lt;your token&gt; with the JWT you get when you authenticate. 

> Make sure you replace &lt;id&gt; with the id for the role. 

> Example of a successful (200) response:

```http
HTTP/1.1 200 OK
{
  "data": [
  {
    "id": "22",
    "type": "role_permissions",
    "attributes": {
      "id": 22,
      "role_id": 1,
      "permission_id": 2
    },
    "relationships": {
      "role": {
        "data": {
            "id": "1",
            "type": "roles"
          }
        },
        "permission": {
            "data": {
              "id": "2",
              "type": "permissions"
            }
          }
      }
    },
  }
  ]
}

```
This endpoint list all role permissions related to a given role

### HTTP Request

`GET /v1/roles/:id/role_permissions/`

### Path Parameters

Parameter |  Type   | Description
--------- | ------- | -----------
id | integer | Id for the desired role
page | json | A page object as described <a href="#pagination">here</a>
