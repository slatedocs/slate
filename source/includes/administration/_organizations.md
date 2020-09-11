## Organizations
Organizations are the largest logical grouping of users, environments and resources available in CloudMC. Each organization is isolated from other organizations. It has its own subdomain (`[entryPoint].CloudMC`) and is protected by its own customizable system [roles](#administration-roles). An administrator that must manage its sub-organizations environments or provisioned resources can do so by having the `Access other levels` permission. Additionally, provisioned resource usage is metered at the organization level facilitating cost tracking.


<!-------------------- LIST ORGANIZATIONS -------------------->
### List organizations

`GET /organizations`

Retrieves a list of organizations visible to the caller. In most cases, only the caller's organization will be returned. However if the caller's organization has sub-organizations, and the caller has the `Access other levels` permission, the sub-organizations will be returned as well.

```shell
# Retrieve visible organizations
curl "https://cloudmc_endpoint/v2/organizations" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
   "data": [
      {
         "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
         "name": "Umbrella Corporation",
         "entryPoint": "umbrella",
         "billableStartDate": "2017-08-15T12:00:00.000Z",
         "isBillable": true,
         "tags": ["a-tag"],
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
               "serviceCode":"compute-qc",
               "state": "PROVISIONED",
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
`id`<br/>*UUID* | The id of the organization.
`name`<br/>*string* | The name of the organization.
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`.
`billableStartDate`<br/>*string* | The billable start date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the organization.
`isBillable`<br/>*boolean* | If the organization is billable this values is true, false otherwise.
`tags`<br/>*Array[string]* | Tags associated to the organization.
`parent`<br/>*[Organization](#administration-organizations)* | If the organization is a sub-organization, it will have its `parent` organization. *includes*:`id`,`name`.
`environments`<br/>*Array[[Environment](#administration-environments)]* | The environments belonging to the organization.<br/>*includes*: `id`
`roles`<br/>*Array[[Role](#administration-roles)]* | The system and environments roles belonging to the organization.<br/>*includes*: `id`
`serviceConnections`<br/>*Array[[ServiceConnection](#administration-service-connections)]* | The services for which the organization is allowed to provision resources.<br/>*includes*: `id`,`serviceCode`
`resourceCommitments`</br>*Array[[ResourceCommitment](#administration-retrieve-a-resource-commitment)]* | The resource commitments applied on the organization.
`users`<br/>*Array[[User](#administration-users)]* | The users of the organization.<br/>*includes*: `id`
`notes`<br/>*string* | Organization notes.
`isDbAuthentication`<br/>*boolean* | Whether or not the organization supports database authentication.
`isLdapAuthentication`<br/>*boolean* | Whether or not LDAP authentication is enabled on this organization.
`isTrial`<br/>*boolean* | Whether or not this is a trial organization.
`customDomain`<br/>*[VerifiedDomain](#administration-get-verified-domains)* | The custom domain for the organization.

<!-------------------- FIND ORGANIZATION -------------------->
### Retrieve an organization

`GET /organizations/:id`

Retrieve an organization's details.

```shell
# Retrieve an organization
curl "https://cloudmc_endpoint/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
      "name": "Nintendo US",
      "entryPoint": "nintendo-us",
      "billableStartDate": "2017-08-15T12:00:00.000Z",
      "isBillable": true,
      "tags": ["a-tag"],
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
            "serviceCode":"compute-qc",
            "state": "PROVISIONED",
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
`id`<br/>*UUID* | The id of the organization.
`name`<br/>*string* | The name of the organization.
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL :<br/>`[entryPoint].CloudMC`.
`billableStartDate`<br/>*string* | The billable start date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the organization.
`isBillable`<br/>*boolean* | If the organization is billable this values is true, false otherwise.
`tags`<br/>*Array[string]* | Tags associated to the organization.
`parent`<br/>*[Organization](#administration-organizations)* | If the organization is a sub-organization, it will have its `parent` organization. *includes*:`id`,`name`.
`environments`<br/>*Array[[Environment](#administration-environments)]* | The environments belonging to the organization.<br/>*includes*: `id`
`roles`<br/>*Array[[Role](#administration-roles)]* | The system and environments roles belonging to the organization.<br/>*includes*: `id`
`serviceConnections`<br/>*Array[[ServiceConnection](#administration-service-connections)]* | The services for which the organization is allowed to provision resources.<br/>*includes*: `id`,`serviceCode`
`resourceCommitments`</br>*Array[[ResourceCommitment](#administration-retrieve-a-resource-commitment)]* | The resource commitments applied on the organization.
`users`<br/>*Array[[User](#administration-users)]* | The users of the organization.<br/>*includes*: `id`
`notes`<br/>*string* | Organization notes.
`isDbAuthentication`<br/>*boolean* | Whether or not the organization supports database authentication.
`isLdapAuthentication`<br/>*boolean* | Whether or not LDAP authentication is enabled on this organization.
`isTrial`<br/>*boolean* | Whether or not this is a trial organization.
`customDomain`<br/>*[VerifiedDomain](#administration-get-verified-domains)* | The custom domain for the organization.

<!-------------------- CREATE ORGANIZATION -------------------->
### Create organization

`POST /organizations`

Creates a new organization as a sub-organization of the caller's organization, or a sub-organization of the specified `parent` or at the top level if the calling user has an unscoped permission. The caller requires the `Organizations create` permission.

Any service connections that are supplied in the request will be assigned to the organization asynchronously. The state of the connections assigned to the organization and its progress is reflected in the organization service connections.

The task id returned in the response below can also be used to track the completion of the asynchronous assignation of connections to this organization.

```shell
# Create an organization
curl -X POST "https://cloudmc_endpoint/v2/organizations" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

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
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`.


Optional | &nbsp;
---- | ----
`serviceConnections`<br/>Array[[ServiceConnection](#administration-service-connections)] | A list of service connections for which the organization may provision resources.<br/>*required :*`id`
`parent`<br/>[Organization](#administration-organization) | The organization that will be the parent of the new organization. By default, it will default to the caller's organization.<br/>*required :*`id`

The responses' `data` field contains the created [organization](#administration-organizations) with its `id`.

Response | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the task
`taskStatus`<br/>*string* | The status of the task
`data`<br/>*[Organization](#administration-organizations)* | The information about the created organization


```shell
# Response body example
```
```json
{
  "data": {
    "lineage": "85487519-54e3-4dad-9c42-3a5ff7f1a359",
    "quotas": [
      {
        "name": "Unlimited",
        "id": "09244b06-5b89-43fe-b972-016a590eeb38",
        "serviceConnection": {
          "id": "8901494c-01ee-4d6b-bd12-cd5347127039"
        }
      }
    ],
    "hashAlgorithmName": "SHA-512",
    "hashIterations": 100,
    "isTrial": false,
    "creationDate": "2020-04-14T18:46:15.000Z",
    "version": 2,
    "tags": [],
    "isDbAuthentication": true,
    "deleted": false,
    "serviceConnections": [],
    "ldap": {
      "version": 1,
      "deleted": false,
      "id": "0bf68b3a-8248-487b-a855-1003874339e7"
    },
    "name": "Shopify",
    "id": "85487519-54e3-4dad-9c42-3a5ff7f1a359",
    "entryPoint": "shopify"
  },
  "taskId": "fd7f6c47-d525-414c-a77f-69047966c765",
  "taskStatus": "PENDING"
}
```

<!-------------------- UPDATE ORGANIZATION -------------------->
### Update organization
`PUT /organizations/:id`

Update an organization. It's parent organization cannot be changed. Any service connections that are supplied in the request will be assigned to the organization asynchronously. The state of the connections assigned to the organization and its progress is reflected in the organization service connections.

The task id returned in the response below can also be used to track the completion of the asynchronous assignation of connections to this organization.


```shell
# Update an organization
curl -X PUT "https://cloudmc_endpoint/v2/organizations/3f913132-d479-4332-8fee-9a8c0c01328a" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

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

Optional | &nbsp;
---- | ----
`name`<br/>*string*  | The name of the organization. (Add info about restrictions)
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`.
`serviceConnections`<br/>Array[[ServiceConnection](#administration-service-connections)] | A list of service connections for which the organization may provision resources. The caller must have access to all connections that are provided. **NB :** Service connection access may be added but not revoked at this time.<br/>*required :* `id`
`tags`<br/>*Array[string]* | Tags associated to the organization.
`resourceCommitments`</br>*Array[[ResourceCommitment](#administration-retrieve-a-resource-commitment)]* | The resource commitments applied on the organization.
`users`<br/>*Array[[User](#administration-users)]* | The users of the organization.<br/>*required* : `id`
`notes`<br/>*string* | Organization notes. Must have the `Organization metadata: Manage` permission.
`isDbAuthentication`<br/>*boolean* | Whether or not the organization supports database authentication.
`isLdapAuthentication`<br/>*boolean* | Whether or not LDAP authentication is enabled on this organization.
`customDomain`<br/>*[VerifiedDomain](#administration-get-verified-domains)* | An object describing a verified domain. Must have the `Organization: Manage reseller features` permission. <br/>*required* : `id`

The responses' `data` field contains the updated [organization](#administration-organizations).


Response | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the task
`taskStatus`<br/>*string* | The status of the task
`data`<br/>*[Organization](#administration-organizations)* | The information about the updated organization


```shell
# Response body example
```
```json
{
  "data": {
    "lineage": "85487519-54e3-4dad-9c42-3a5ff7f1a359",
    "quotas": [
      {
        "name": "Unlimited",
        "id": "09244b06-5b89-43fe-b972-016a590eeb38",
        "serviceConnection": {
          "id": "8901494c-01ee-4d6b-bd12-cd5347127039"
        }
      }
    ],
    "hashAlgorithmName": "SHA-512",
    "hashIterations": 100,
    "isTrial": false,
    "creationDate": "2020-04-14T18:46:15.000Z",
    "version": 2,
    "tags": [],
    "isDbAuthentication": true,
    "deleted": false,
    "serviceConnections": [],
    "ldap": {
      "version": 1,
      "deleted": false,
      "id": "0bf68b3a-8248-487b-a855-1003874339e7"
    },
    "name": "Shopify",
    "id": "85487519-54e3-4dad-9c42-3a5ff7f1a359",
    "entryPoint": "shopify"
  },
  "taskId": "aee1862d-c187-43eb-be12-754c24022dfc",
  "taskStatus": "PENDING"
}
```

<!-------------------- DELETE ORGANIZATION -------------------->
### Delete organization

`DELETE /organizations/:id`

Delete an organization. The caller may not delete his own organization. Also, an organization may not be deleted if it has sub-organizations.

Organizations are deleted asynchronously on the underlying services.

Deleting an organization is composed of the following steps:

1. Remove users from environments
2. Delete users
3. Delete environments
4. Delete organization

These steps are performed on each service assigned to the organization.

If one of the steps fails, subsequent steps are aborted and an error response is returned.

Following an error response, subsequent delete attempts will be considered as a "force delete". A force delete entails reattempting to delete the organization as explained above and then deleting related database models regardless of the response from the underlying services.

```shell
# Delete an organization
curl -X DELETE "https://cloudmc_endpoint/v2/organizations/3f913132-d479-4332-8fee-9a8c0c01328a" \
   -H "MC-Api-Key: your_api_key"
```

Response                  | &nbsp;
--------------------------|-----------------------
`taskId`<br/>*UUID*       | The id of the task
`taskStatus`<br/>*string* | The status of the task

```shell
# Response body example
```

```json
{
  "taskId": "cd921b44-ca9f-4f6b-b184-f952e5ab010a",
  "taskStatus": "PENDING"
}
```

Returns an HTTP status code 204, with an empty response body.

<!-------------------- GET VERIFIED DOMAINS -------------------->
### Get verified domains
`GET /organizations/:organization_id/verified_domains`

Get a list of all verified domains on the specified organization.

```shell
# Retrieve all verified domains
curl "https://cloudmc_endpoint/v1/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/verified_domains" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "lastCheckedDate": "2020-07-31T19:14:36Z",
      "createdDate": "2020-07-31T19:12:55Z",
      "domain": "aGoodFakeDomain.com",
      "organization": {
        "name": "my organization",
        "id": "87895f43-51c1-43cc-b987-7e301bf5b86a",
        "entryPoint": "myOrg"
      },
      "id": "22d30872-8e90-43b5-b1ba-636bead42e34",
      "verificationCode": "cmc-verification=81405f20-f96e-4964-b8bb-fb97c802ca5c",
      "status": "VERIFIED"
    },
    {
      "lastCheckedDate": "2020-08-03T15:24:35Z",
      "createdDate": "2020-08-03T14:41:20Z",
      "domain": "anotherFakeDomain.com",
      "organization": {
        "name": "my organization",
        "id": "87895f43-51c1-43cc-b987-7e301bf5b86a",
        "entryPoint": "myOrg"
      },
      "id": "5752811e-08cf-4105-91ca-bac80efe3d23",
      "verificationCode": "cmc-verification=a571fb45-1dc6-4569-adf2-9e166861499f",
      "status": "PENDING"
    }
  ]
}
```

Attributes | &nbsp;
---- | -----------
`lastCheckedDate`<br/>*string* |  The last date that the domain's DNS was checked for the TXT record with the verification code. In [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
`domain`<br/>*string* | The domain associated with the organization.
`organization`<br/>*[Organization](#administration-organizations)* | The organization to which the verified domain belongs. *includes*:`id`,`name`, `entryPoint`.
`id`<br/>*UUID* | The id of the verified domain.
`verificationCode`<br/>*string* | The verification code for the domain. This is the value that should be added to the domain's DNS registration as a new TXT record. CloudMC will check on a recurring schedule if the TXT record has been added to the domain, and update the status to VERIFIED once found.
`status`<br/>*string* | The status of the domain ownership proof. Possible values are : VERIFIED, PENDING, ERROR.

<!-------------------- CREATE VERIFIED DOMAIN -------------------->
### Create verified domain

`POST /organizations/:organization_id/verified_domains`

Creates a new verified domain in the specified organization.

```shell
# Create a verified domain
curl -X POST "https://cloudmc_endpoint/v1/organizations87895f43-51c1-43cc-b987-7e301bf5b86a/verified_domains" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
   "domain":"www.umbrellaCorp.com"
}
```

Required | &nbsp;
---- | ----
`domain`<br/>*string*  | The domain associated with the organization. 

The responses' `data` field contains the created verified domain with its `id`, as well as with the `verificationCode`. A TXT record will need to be added to the domain's DNS registration with the verification code as its value.


<!-------------------- DELETE VERIFIED DOMAIN -------------------->
### Delete verified domain
`DELETE /organizations/:organization_id/verified_domains/:id`

Delete a specified domain on the organization.

```shell
# Delete a verified domain
curl -X DELETE "https://cloudmc_endpoint/v1/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5/verified_domains/22d30872-8e90-43b5-b1ba-636bead42e34" \
   -H "MC-Api-Key: your_api_key"
```

Returns an HTTP status code 200, with an empty response body.

<!-------------------- GET SECURITY SETTINGS -------------------->
### Get security settings
`GET /organizations/organization_id/security_settings`

Retrieve the security settings for the organization.

```shell
# Retrieve the organization's security settings
curl "https://cloudmc_endpoint/v1/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/security_settings" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "defaultRole": {
      "name": "guest",
      "id": "6e022506-ab89-4676-859d-06d370b67417"
    },
    "organization": {
      "name": "my organization",
      "id": "87895f43-51c1-43cc-b987-7e301bf5b86a",
      "entryPoint": "myOrg"
    },
    "autoCreationEnabled": true,
    "verifiedDomains": [
       {
        "lastCheckedDate": "2020-08-03T17:19:36Z",
        "createdDate": "2020-08-03T16:14:00Z",
        "domain": "newDomainName.com",
        "organization": {
          "lineage": "87895f43-51c1-43cc-b987-7e301bf5b86a",
          "notes": "",
          "hashAlgorithmName": "SHA-512",
          "hashIterations": 100,
          "isTrial": false,
          "creationDate": "2020-04-30T21:25:49.000Z",
          "version": 2,
          "isLdapAuthentication": false,
          "isBillable": false,
          "isDbAuthentication": true,
          "deleted": false,
          "ldap": {
            "id": "063ec8ee-8a55-4374-9c8c-57a10f11cf1b"
          },
          "name": "my organization",
          "id": "87895f43-51c1-43cc-b987-7e301bf5b86a",
          "entryPoint": "myOrg"
        },
        "id": "29d66b1d-669a-439b-883a-d7c1e36e1ca6",
        "verificationCode": "cmc-verification=8c8f5473-9306-4e16-a820-a747482e85e5",
        "status": "VERIFIED"
      }
    ]
  }
}
```
Attributes | &nbsp;
---- | -----------
`defaultRole`<br/>*object* | The role that will be assigned to new users logging into the organization with an email domain matching that of the organization's security settings. 
`defaultRole.name`<br/>*string* | The name of the default role.
`defaultRole.id`<br/>*UUID* | The id of the default role.
`organization`<br/>*[Organization](#administration-organizations)* | The organization to which the verified domain belongs. *includes*:`id`,`name`, `entryPoint`.
`autoCreationEnabled`<br/>*boolean* | A boolean specifying whether to enable automatic end-user account creation upon successful OIDC login.
`verifiedDomains`<br/>*Array[[verified domains](#administration-get-verified-domains)]*| A list of verified domains (with VERIFIED status) for which successful matching OIDC logins will create new users.

<!-------------------- UPDATE SECURITY SETTINGS -------------------->
### Update security settings
`PUT /organizations/:organization_id/security_settings`

```shell
# Update an organization's security settings
curl -X PUT "https://cloudmc_endpoint/v1/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5/security_settings" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
   "autoCreationEnabled": true,
   "verifiedDomains": [ 
	 	{ 
			 "id": "29d66b1d-669a-439b-883a-d7c1e36e1ca6"
		}
	],
	"defaultRole": {
      "name": "guest",
      "id": "6e022506-ab89-4676-859d-06d370b67417" 
	}
}
```

Required | &nbsp;
---- | ----
`defaultRole`<br/>*object*  | The role that will be assigned to new users logging into the organization with an email domain matching that of the organization's security settings. 
`defaultRole.name`<br/>*string* | The name of the default role.
`defaultRole.id`<br/>*UUID* | The id of the default role.

Optional | &nbsp;
---- | ----
`autoCreationEnabled`<br/>*boolean* | A boolean specifying whether to enable automatic end-user account creation upon successful OIDC login.
`verifiedDomains`<br/>*Array[[verified domains](#administration-get-verified-domains)]*| A list of objects containing the ids of verified domains (with VERIFIED status) for which successful matching OIDC logins will create new users.

Returns an HTTP status code 200, with an empty response body.
