## Additional roles

With additional roles, you can allow users access to other organizations. You can specify a scope which targets one or many organizations with a specific role. See [roles](#administration-roles) for more information on roles.

### Scoping

There are different types of scope that you can use depending on your use case. This scope must be provided when assigning an additional role to a user. You can only give a scope/role combination to another user if you have a higher or equivalent additional role.

Scope | Description | Required fields
---------- | ----------- | -----------
ORG_BASE | Applies the role on a specific organization | `organization.id`
ORG_TREE | Applies the role on a specific organization and its sub-organzations | `organization.id`
ORG_SUBS | Applies the role the sub-organzations of a specific organization | `organization.id`
ORG_TOPLEVEL | Applies the role on all top-level organizations | &nbsp;
TAGS_ANYMATCH | Applies the role on all organizations that are tagged with at least one the specified tags | `tags`

### Get additional roles of user

`GET /users/:id/additional_roles`

```shell
# Get additional role of user
curl -X GET "https://cloudmc_endpoint/api/v2/users/:id/additional_roles" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json"

# Response body example
```
```json
{
"data": [
    {
        "id": "ed18cdd0-0fa0-464d-a993-e689d39dfe2e",
        "creationDate": "2019-06-06T15:01:22.000Z",
        "scopeQualifier": "ORG_BASE",
        "primary": false,
        "role": {
            "id": "cc71a40b-d90b-40db-b724-08d71f5179b5",
            "name": "user",
            "isSystem": true,
            "isFixed": true
        },
        "organization": {
            "name": "Test",
            "id": "6861c664-0a83-4e91-bd8c-3a6083e81a13",
            "entryPoint": "test"
        },
        "user": {
            "id": "6ebc54bb-c3fe-4434-b412-09ac4f798680",
            "firstName": "franz",
            "lastName": "franz",
            "userName": "franz",
            "email": "fgarcia@cloudops.com"
        }
    }]
}
```

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the additional role
`creationDate`<br/>*string* | The date the additional role was added/updated on the user
`scopeQualifier`<br/>*string* | The scope of this additional role (ORG_BASE, TAGS_ANYMATCH, GLOBAL, etc..). Please refer to the table above.
`tags`<br/>*[string]* | Organization tags to match for TAGS_ANYMATCH scoping
`role`<br/>*[Role](#administration-roles)* | The role to apply on the target scope
`organization`<br/>*[Organization](#administration-organizations)* | The organization of the additional role. Only present on scopes that target a specific organization.<br/>*includes*: `id`, `name`, `entryPoint`
`user`<br/>*[User](#administration-users)* | The user that the additional role is applied on<br/>*includes*: `id`, `username`, `firstName`, `lastName`, `email`
`primary`<br/>*boolean* | Indicates whether the role is primary.


### Assign additional role to user

`POST /users/:id/additional_roles`

```shell
# Assign an additional role to user
curl -X POST "https://cloudmc_endpoint/api/v2/users/:id/additional_roles" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json"
   -d "[request_body]"

# Request body example
```
```json
{
    "scopeQualifier": "ORG_BASE",
    "role": {
        "id": "cc71a40b-d90b-40db-b724-08d71f5179b5",
    },
    "organization": {
        "id": "6861c664-0a83-4e91-bd8c-3a6083e81a13",
    },
}
```

Required | &nbsp;
---------- | -----------
`scopeQualifier`<br/>*string* | The scope of this additional role (ORG_BASE, TAGS_ANYMATCH, GLOBAL, etc..)
`role.id`<br/>*UUID* | The id of the role to apply on the target scope. Operator cannot be used as additional role.
`organization.id`<br/>*UUID* | The id of the target organization of the scope. Only required when using a scope qualifier that targets an organization.
`tags`<br/>*UUID* | The organization tags of the scope. Only required when using the TAGS_ANYMATCH scope.

You will need to have `Users: Manage` permission to execute this operation.

### Remove additional role from user
`DELETE /users/:user_id/additional_roles/:id`

```shell
# Remove an additional role from user
curl -X DELETE "https://cloudmc_endpoint/api/v2/users/:user_id/additional_roles/:id" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json"

```

You will need to have `Users: Manage` permission to execute this operation.