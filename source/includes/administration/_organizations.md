## Organizations
Organizations are the largest logical grouping of users, environments and resources available in CloudMC. Each organization is isolated from other organizations. It has its own subdomain (`[entryPoint].CloudMC`) and is protected by its own customizable system [roles](#roles). An administrator that must manage it's sub-organizations environments or provisioned resources can do so by having the `Access other levels` permission. Additionally, provisioned resource usage is metered at the organization level facilitating cost tracking.


<!-------------------- LIST ORGANIZATIONS -------------------->
### List organizations

`GET /organizations`

Retrieves a list of organizations visible to the caller. In most cases, only the caller's organization will be returned. However if the caller's organization has sub-organizations, and the caller has the `Access other levels` permission, the sub-organizations will be returned as well.

```shell
# Retrieve visible organizations
curl "https://cloudmc_endpoint/v1/organizations" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
   "data": [
      {
         "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
         "name": "Umbrella Corporation",
         "entryPoint": "umbrella",
         "parent": {
            "id": "8e3393ce-ee63-4f32-9e0f-7b0200fa655a",
            "name": "Capcom"
         },
         "environments": [
            {
               "id": "9df14056-51e2-4000-ab14-beeaa488500d"
            }
         ],
         "roles": [
            {
               "id": "cdaaa9d0-304e-4063-b1ab-de31905bdab8"
            }
         ],
         "serviceConnections":[
            {
               "id":"11607a49-9691-40fe-8022-2e148bc0d720",
               "serviceCode":"compute-qc"
            }
         ],
         "users": [
            {
               "id":"0c3ffcce-a98d-4159-b6fc-04edd34e89b7",
               "userName":"wbirkin"
            }
         ]
      }
   ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | ---
`name`<br/>*string* | ---
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`
`parent`<br/>*[Organization](#organizations)* | If the organization is a sub-organization, it will have it's `parent` organization. *includes*:`id`,`name`
`environments`<br/>*Array[[Environment](#environments)]* | The environments belonging to the organization<br/>*includes*: `id`
`roles`<br/>*Array[[Role](#roles)]* | The system and environments roles belonging to the organization<br/>*includes*: `id`
`serviceConnections`<br/>*Array[[ServiceConnection](#service-connections)]* | The services for which the organization is allowed to provision resources<br/>*includes*: `id`,`serviceCode`
`users`<br/>*Array[[User](#users)]* | The users of the organization<br/>*includes*: `id`

<!-------------------- FIND ORGANIZATION -------------------->
### Retrieve an organization

`GET /organizations/:id`

Retrieve an organization's details

```shell
# Retrieve an organization
curl "https://cloudmc_endpoint/v1/organizations/[id]" \
   -H "MC-Api-Key: your_api_key"

# Response body example
```
```json
{
   "data": {
      "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
      "name": "Nintendo US",
      "entryPoint": "nintendo-us",
      "parent": {
         "id": "8e3393ce-ee63-4f32-9e0f-7b0200fa655a",
         "name": "Nintendo"
      },
      "environments": [
         {
           "id": "9df14056-51e2-4000-ab14-beeaa488500d"
         }
      ],
      "roles": [
         {
           "id": "cdaaa9d0-304e-4063-b1ab-de31905bdab8"
         }
      ],
      "serviceConnections": [
         {
            "id":"11607a49-9691-40fe-8022-2e148bc0d720",
            "serviceCode":"compute-qc"
         }
      ],
      "users": [
         {
            "id":"0c3ffcce-a98d-4159-b6fc-04edd34e89b7",
            "userName":"reggie"
         }
      ]
  }
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | ---
`name`<br/>*string* | ---
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL :<br/>`[entryPoint].CloudMC`
`parent`<br/>*[Organization](#organizations)* | If the organization is a sub-organization, it will have it's `parent` organization. *includes*:`id`,`name`
`environments`<br/>*Array[[Environment](#environments)]* | The environments belonging to the organization<br/>*includes*: `id`
`roles`<br/>*Array[[Role](#roles)]* | The system and environments roles belonging to the organization<br/>*includes*: `id`
`serviceConnections`<br/>*Array[[ServiceConnection](#service-connections)]* | The services for which the organization is allowed to provision resources<br/>*includes*: `id`,`serviceCode`
`users`<br/>*Array[[User](#users)]* | The users of the organization<br/>*includes*: `id`

<!-------------------- CREATE ORGANIZATION -------------------->
### Create organization

`POST /organizations`

Creates a new organization as a sub-organization of the caller's organization, or a sub-organization of the specified `parent`. The caller requires the `Organizations create` permission.

```shell
# Create an organization
curl -X POST "https://cloudmc_endpoint/v1/organizations" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
```json
{
   "entryPoint":"umbrella",
   "name":"Umbrella Corp",
   "serviceConnections":[
      {
         "id":"9acb3b76-d5d0-420c-b075-ef320b7e5a3e"
      }
   ],
   "parent" : {
      "id":"bc0ceecf-feb5-412c-ab6e-a8df8eb7fbbd"
   }
}
```

Required | &nbsp;
---- | ----
`name`<br/>*string*  | The name of the organization. (Add info about restrictions)
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`


Optional | &nbsp;
---- | ----
`serviceConnections`<br/>Array[[ServiceConnection](#service-connections)] | A list of service connections for which the organization may provision resources.<br/>*required :*`id`
`parent`<br/>[Organization](#organization) | The organization that will be the parent of the new organization. By default, it will default to the caller's organization.<br/>*required :*`id`

The responses' `data` field contains the created [organization](#organizations) with it's `id`.

<!-------------------- UPDATE ORGANIZATION -------------------->
### Update organization
`PUT /organizations/:id`

Update an organization. It's parent organization cannot be changed. It can be assigned service connections

```shell
# Update an organization
curl -X PUT "https://cloudmc_endpoint/v1/organizations/[id]" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "[request_body]"

# Request body example
```
```json
{
   "entryPoint":"umbrella",
   "name":"Umbrella Corp",
   "serviceConnections":[
      {
         "id":"9acb3b76-d5d0-420c-b075-ef320b7e5a3e"
      }
   ]
}
```

Required | &nbsp;
---- | ----
`name`<br/>*string*  | The name of the organization. (Add info about restrictions)
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`

Optional | &nbsp;
---- | ----
`serviceConnections`<br/>Array[[ServiceConnection](#service-connections)] | A list of service connections for which the organization may provision resources. The caller must have access to all connections that are provided. **NB :** Service connection access may be added but not revoked at this time.<br/>*required :* `id`

The responses' `data` field contains the updated [organization](#organizations).

<!-------------------- DELETE ORGANIZATION -------------------->
### Delete organization
`DELETE /organizations/:id`

Delete an organization. The caller may not delete his own organization. Also, an organization may not be deleted if it has sub-organizations.

```shell
# Delete an organization
curl -X DELETE "https://cloudmc_endpoint/v1/organizations/[id]" \
   -H "MC-Api-Key: your_api_key"
```

Returns an HTTP status code 204, with an empty response body.
