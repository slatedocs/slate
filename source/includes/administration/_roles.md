## Roles
Roles have a number of permissions associated with them and are bound to users with a given scope. They are associated to users through role bindings.

### List Roles

`GET /roles`

Retrieves a list of roles visible to the caller. The user does not have to have explicit access to that role for it to be returned. If a user's permissions on a given context context include all cumulative permissions for all roles a user is bound to that role will be returned in the roles api call. 

Example: If a user has a role with `env:<entity>:read` and `env:<entity>:create` and another role exists with just `env:<entity>:read` it will be returned in the API call. 

```shell
# Retrieve all env-scoped roles applicable to this environment 
curl "https://cloudmc_endpoint/api/v2/roles?environment_id=4865a023-1dd5-45a3-a23d-e952ceb7a44a&filter_scope=ENV" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
   "data":[
      {
         "creationDate":"2019-03-11T22:16:15.000Z",
         "version":1,
         "isSystem":false,
         "isDefault":true,
         "deleted":false,
         "permissions":[
            {
               "name":"env:*:*",
               "id":"98047553-7a00-450d-afd0-d49eee436603"
            }
         ],
         "name":"editor",
         "id":"b230cc47-3fad-4759-8ad2-de80bc6ac7e8",
         "isFixed":true,
         "defaultScope":"ENV",
         "pluginName": "cloudstack"
      },
      {
         "creationDate":"2019-03-11T22:16:12.000Z",
         "version":1,
         "isSystem":false,
         "isDefault":false,
         "deleted":false,
         "permissions":[
            {
               "name":"env:*:read"
            }
         ],
         "name":"viewer",
         "alias":"viewer",
         "id":"f405a594-56c7-43d4-b790-ab8c616253fc",
         "isFixed":true,
         "defaultScope":"ENV",
         "pluginName": "cloudstack"
      }
   ]
}
```

Query Params | &nbsp;
---- | -----------
`filter_scope`<br/>*[ScopeQualifier](#administration-scopequalifier)* | Return only roles with this as the default scope.
`system_only`<br/>*boolean* | Return only system roles.
`organization_id`<br/>*UUID* | Return only roles requesting user can assign on this organization.
`environment_id`<br/>*UUID* | Filters out env-scoped roles applicated to this environment. If an environment is of a plugin type that has custom plugin roles it only returns the plugin's roles, if the environment has no plugin defined roles it returns only the default environment-scoped roles.

### ScopeQualifier 
* `ENV`
* `ORG_BASE` 
* `ORG_TREE` 
* `ORG_SUB` 
* `ORG_TOPLEVEL`
* `TAG_ANYMATCH`
* `GLOBAL`