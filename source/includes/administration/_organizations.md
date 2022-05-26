## Organizations
Organizations are the largest logical grouping of users, environments and resources available in CloudMC. Each organization is isolated from other organizations. It has its own subdomain (`[entryPoint].CloudMC`) and is protected by its own customizable system [roles](#administration-roles). An administrator that must manage its sub-organizations environments or provisioned resources can do so by having the `Access other levels` permission. Additionally, provisioned resource usage is metered at the organization level facilitating cost tracking.


<!-------------------- LIST ORGANIZATIONS -------------------->
### List organizations

`GET /organizations`

Retrieves a list of organizations visible to the caller. In most cases, only the caller's organization will be returned. However if the caller's organization has sub-organizations, and the caller has the `Access other levels` permission, the sub-organizations will be returned as well.

```shell
# Retrieve visible organizations
curl "https://cloudmc_endpoint/api/v2/organizations" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
   "data": [
      {
         "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
         "lineage": "03bc22bd-adc4-46b8-988d-afddc24c0cb5, 5ff3a3d8-41a8-4ca2-813f-7d5af4cfc872",
         "name": "Umbrella Corporation",
         "entryPoint": "umbrella",
         "billableStartDate": "2017-08-15T12:00:00.000Z",
         "creationDate": "2022-04-29T19:49:18.000Z",
         "isBillable": true,
         "billingMode": "CREDIT_CARD",
         "isReseller": false,
         "features": [],
         "customFields": {},
         "tags": [
            {
               "system": true,
               "name": "billable",
               "id": "5a84485f-7eed-11ec-b819-0242ac120002"
            },
            {
               "system": false,
               "name": "organizationTagOne",
               "id": "fc2a164f-3871-4eed-9591-d3ceb838550b"
            },
            {
               "system": false,
               "name": "organizationTagTwo",
               "id": "12d6d802-ca56-4c22-9c9d-e76ee0b1e97c"
            }
         ],
         "deleted": false,
         "isDbAuthentication": true,
         "isLdapAuthentication": false,
         "isTrial": false,
         "reseller": {
           "id": "5d841eb6-5913-4244-b001-917228e7aa64"
          },
         "parent": {
            "id": "8e3393ce-ee63-4f32-9e0f-7b0200fa655a",
            "name": "Capcom"
         },
         "environments": [
            {
               "id": "9df14056-51e2-4000-ab14-beeaa488500d",
               "deleted": false
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
               "userName":"wbirkin",
               "deleted": false
            }
         ]
      }
   ]
}
```
Optional Query Parameters | &nbsp;
---------- | -----------
`include_deleted`<br/>*boolean* | Whether or not to include deleted organizations and resources in the response.

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the organization.
`lineage`<br/>*string* | A string of comma-seperated UUIDs of the lineage of the organization.
`name`<br/>*string* | The name of the organization.
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL : `[entryPoint].CloudMC`.
`billableStartDate`<br/>*string* | The billable start date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the organization.
`creationDate`<br/>*string* | The date the organization was created in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
`isBillable`<br/>*boolean* | If the organization is billable this values is true, false otherwise.
`billingMode`<br/>*enum* | The billing mode of the organization. It could be either "MANUAL" or "CREDIT_CARD". Default value is "MANUAL".
`tags`<br/>*Array[object]* | Tags associated to the organization. <br/>*includes*: `id`*UUID*, `name`*string*, `system`*boolean*
`parent`<br/>*[Organization](#administration-organizations)* | If the organization is a sub-organization, it will have its `parent` organization. *includes*:`id`,`name`.
`reseller`<br/>*[Organization](#administration-organizations)* | The nearest reseller of the organization. *includes*:`id`.
`environments`<br/>*Array[[Environment](#administration-environments)]* | The environments belonging to the organization.<br/>*includes*: `id`
`serviceConnections`<br/>*Array[[ServiceConnection](#administration-service-connections)]* | The services for which the organization is allowed to provision resources.<br/>*includes*: `id`,`serviceCode`
`resourceCommitments`</br>*Array[[ResourceCommitment](#administration-retrieve-a-resource-commitment)]* | The resource commitments applied on the organization.
`users`<br/>*Array[[User](#administration-users)]* | The users of the organization.<br/>*includes*: `id`
`features`<br/>*Array[[OrganizationFeature]]* | The features offered by the organization and their access levels.
`customFields`<br/>*map* | Map of custom fields on the organization and their values.
`isDbAuthentication`<br/>*boolean* | Whether or not the organization supports database authentication.
`isLdapAuthentication`<br/>*boolean* | Whether or not LDAP authentication is enabled on this organization.
`isTrial`<br/>*boolean* | Whether or not this is a trial organization.
`isReseller`<br/>*boolean* | Whether or not this organization is a reseller or not.
`customDomain`<br/>*[VerifiedDomain](#administration-get-verified-domains)* | The custom domain for the organization.

<!-------------------- FIND ORGANIZATION -------------------->
### Retrieve an organization

`GET /organizations/:id`

Retrieve an organization's details.

```shell
# Retrieve an organization
curl "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "id": "03bc22bd-adc4-46b8-988d-afddc24c0cb5",
      "lineage": "03bc22bd-adc4-46b8-988d-afddc24c0cb5, 5ff3a3d8-41a8-4ca2-813f-7d5af4cfc872",
      "name": "Nintendo US",
      "entryPoint": "nintendo-us",
      "billableStartDate": "2017-08-15T12:00:00.000Z",
      "isBillable": true,
      "billingMode": "CREDIT_CARD",
      "isReseller": false,
      "tags": [
         {
            "system": true,
            "name": "billable",
            "id": "5a84485f-7eed-11ec-b819-0242ac120002"
         },
         {
            "system": false,
            "name": "organizationTagOne",
            "id": "fc2a164f-3871-4eed-9591-d3ceb838550b"
         },
         {
            "system": false,
            "name": "organizationTagTwo",
            "id": "12d6d802-ca56-4c22-9c9d-e76ee0b1e97c"
         }
      ],
      "parent": {
         "id": "8e3393ce-ee63-4f32-9e0f-7b0200fa655a",
         "name": "Nintendo"
      },
      "reseller": {
        "id": "5d841eb6-5913-4244-b001-917228e7aa64"
        },
      "customFields": {},
      "notes": "",
      "customFieldDefinitions": [],
      "isDbAuthentication": true,
      "isLdapAuthentication": false,
      "quotas": [
        {
         "name": "unlimited",
         "id": "3311d69e-12c8-4295-bae0-34e9a1c57982",
         "serviceConnection": {
          "id": "78f55cd7-47c9-47ac-a6a0-203b838d1507"
         }
       }
      ],
      "ldap": {
        "deleted": false,
        "id": "4de3ed48-0b9c-43c8-a93a-244d763b6861"
      },
      "environments": [
         {
           "id": "9df14056-51e2-4000-ab14-beeaa488500d"
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
`lineage`<br/>*string* | A string of comma-seperated UUIDs of the lineage of the organization.
`name`<br/>*string* | The name of the organization.
`entryPoint`<br/>*string* | The entry point of the organization is the subdomain of the organization in the CloudMC URL :<br/>`[entryPoint].CloudMC`.
`billableStartDate`<br/>*string* | The billable start date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the organization.
`isBillable`<br/>*boolean* | If the organization is billable this values is true, false otherwise.
`quotas`<br/>*Array[Quotas]* | A list of quotas that associated to the organization.
`billingMode`<br/>*enum* | The billing mode of the organization. It could be either "MANUAL" or "CREDIT_CARD". Default value is "MANUAL".
`tags`<br/>*Array[object]* | Tags associated to the organization. <br/>*includes*: `id`*UUID*, `name`*string*, `system`*boolean*
`parent`<br/>*[Organization](#administration-organizations)* | If the organization is a sub-organization, it will have its `parent` organization. *includes*:`id`,`name`.
`reseller`<br/>*[Organization](#administration-organizations)* | The nearest reseller of the organization. *includes*:`id`.
`environments`<br/>*Array[[Environment](#administration-environments)]* | The environments belonging to the organization.<br/>*includes*: `id`
`serviceConnections`<br/>*Array[[ServiceConnection](#administration-service-connections)]* | The services for which the organization is allowed to provision resources.<br/>*includes*: `id`,`serviceCode`
`resourceCommitments`</br>*Array[[ResourceCommitment](#administration-retrieve-a-resource-commitment)]* | The resource commitments applied on the organization.
`users`<br/>*Array[[User](#administration-users)]* | The users of the organization.<br/>*includes*: `id`
`notes`<br/>*string* | Organization notes.
`features`<br/>*Array[[OrganizationFeature]]* | The features offered by the organization and their access levels.
`customFields`<br/>*map* | Map of custom fields on the organization and their values.
`customFieldDefinitions`<br/>*Array[[CustomFieldDefinition]]* | Custom field definitions of the organization.
`isDbAuthentication`<br/>*boolean* | Whether or not the organization supports database authentication.
`isLdapAuthentication`<br/>*boolean* | Whether or not LDAP authentication is enabled on this organization.
`ldap`<br/>*Object* | LDAP authentication associated with the organization.
`isTrial`<br/>*boolean* | Whether or not this is a trial organization.
`isReseller`<br/>*boolean* | Whether or not this organization is a reseller or not.
`customDomain`<br/>*[VerifiedDomain](#administration-get-verified-domains)* | The custom domain for the organization.

<!-------------------- CREATE ORGANIZATION -------------------->
### Create organization

`POST /organizations`

Creates a new organization as a sub-organization of the caller's organization, or a sub-organization of the specified `parent` or at the top level if the calling user has an unscoped permission. The caller requires the `Organizations create` permission.

Any service connections that are supplied in the request will be assigned to the organization asynchronously. The state of the connections assigned to the organization and its progress is reflected in the organization service connections.

The task id returned in the response below can also be used to track the completion of the asynchronous assignation of connections to this organization.

```shell
# Create an organization
curl -X POST "https://cloudmc_endpoint/api/v2/organizations" \
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
`billingMode`<br/>*enum* | The billing mode of the organization. It could be either "MANUAL" or "CREDIT_CARD". Default value is "MANUAL".
`tags`<br/>*Array[object]* | Tags associated to the organization. Tags provided in the request cannot be system tags. <br/>*required* : `id` or `name`

The responses' `data` field contains the created [organization](#administration-organizations) with its `id`.

Response | &nbsp;
---------- | -----------
`data`<br/>*[Organization](#administration-organizations)* | The information about the created organization


```shell
# Response body example
```
```json
{
  "taskId": "aee1862d-c187-43eb-be12-754c24022dfc",
  "taskStatus": "PENDING",
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
    "tags": [],
    "isDbAuthentication": true,
    "deleted": false,
    "serviceConnections": [],
    "reseller": {
			"id": "5d841eb6-5913-4244-b001-917228e7aa64"
		},
    "ldap": {
      "deleted": false,
      "id": "0bf68b3a-8248-487b-a855-1003874339e7"
    },
    "name": "Shopify",
    "id": "85487519-54e3-4dad-9c42-3a5ff7f1a359",
    "entryPoint": "shopify"
  }
}
```

<!-------------------- UPDATE ORGANIZATION -------------------->
### Update organization
`PUT /organizations/:id`

Update an organization. It's parent organization cannot be changed. Any service connections that are supplied in the request will be assigned to the organization asynchronously. The state of the connections assigned to the organization and its progress is reflected in the organization service connections.

The task id returned in the response below can also be used to track the completion of the asynchronous assignation of connections to this organization.


```shell
# Update an organization
curl -X PUT "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
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
`serviceConnections`<br/>Array[[ServiceConnection](#administration-service-connections)] | A list of service connections for which the organization may provision resources. The caller must have access to all connections that are provided. <br/>_Read below (after the request parameter list) for more details._<br/>*required attributes of the service connection:* `id`
`tags`<br/>*Array[object]* | Tags associated to the organization. Tags provided in the request cannot be system tags. Must have the `Reseller: Organizations metadata: Manage` permission. User cannot modify tags of their own (non-root) organization. <br/>*required* : `id` or `name`
`resourceCommitments`</br>*Array[[ResourceCommitment](#administration-retrieve-a-resource-commitment)]* | The resource commitments applied on the organization.
`users`<br/>*Array[[User](#administration-users)]* | The users of the organization.<br/>*required attributes of the organization* : `id`
`notes`<br/>*string* | Organization notes. Must have the `Organization metadata: Manage` permission.
`isDbAuthentication`<br/>*boolean* | Whether or not the organization supports database authentication.
`isLdapAuthentication`<br/>*boolean* | Whether or not LDAP authentication is enabled on this organization.
`customDomain`<br/>*[VerifiedDomain](#administration-get-verified-domains)* | An object describing a verified domain. Must have the `Organization: Manage reseller features` permission. <br/>*required* : `id`
`billingMode`<br/>*enum* | The billing mode of the organization. It could be either "MANUAL" or "CREDIT_CARD". Default value is "MANUAL".
`isBillable`<br/>*boolean* | If the organization is billable this values is true, false otherwise.

The responses' `data` field contains the updated [organization](#administration-organizations).</br>
**NB :** At this time the API only enables adding access to Service connections but not revoking it. A Service connection can be assigned to an organization only if: 

- The organization owns the service connection _(i.e. the organizationId of the service connection is this organization's id)_
- If the organization is a sub-organization in some organization hierachy, then the service connection must be either **owned by** or **assigned to** its immediate parent organization


Response | &nbsp;
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
    "isTrial": false,
    "creationDate": "2020-04-14T18:46:15.000Z",
    "tags": [],
    "isDbAuthentication": true,
    "deleted": false,
    "serviceConnections": [],
    "ldap": {
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
curl -X DELETE "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5" \
   -H "MC-Api-Key: your_api_key"
```

Response                  | &nbsp;
--------------------------|-----------------------
`taskId`<br/>*UUID*       | The id of the task.
`taskStatus`<br/>*string* | The status of the task.

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
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/verified_domains" \
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
`createdDate`<br/>*string* |  The date the verified domain was created. In [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601).
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
curl -X POST "https://cloudmc_endpoint/api/v2/organizations87895f43-51c1-43cc-b987-7e301bf5b86a/verified_domains" \
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
curl -X DELETE "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5/verified_domains/22d30872-8e90-43b5-b1ba-636bead42e34" \
   -H "MC-Api-Key: your_api_key"
```

Returns an HTTP status code 200, with an empty response body.

<!-------------------- GET SECURITY SETTINGS -------------------->
### Get security settings
`GET /organizations/organization_id/security_settings`

Retrieve the security settings for the organization.

```shell
# Retrieve the organization's security settings
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/security_settings" \
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
    "blockedNativeLoginDomain": "",
    "verifiedDomains": [
       {
        "lastCheckedDate": "2020-08-03T17:19:36Z",
        "createdDate": "2020-08-03T16:14:00Z",
        "domain": "newDomainName.com",
        "organization": {
          "lineage": "87895f43-51c1-43cc-b987-7e301bf5b86a",
          "notes": "",
          "isTrial": false,
          "creationDate": "2020-04-30T21:25:49.000Z",
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
    ],
    "passwordPolicy": {
      "constraints": [
        {
          "name": "min_password_length",
          "value": 8,
          "isMandatory": false
        },
        {
          "name": "min_lowercase_letters",
          "value": 1,
          "isMandatory": true
        },
        {
          "name": "min_uppercase_letters",
          "value": 1,
          "isMandatory": true
        },
        {
          "name": "min_numbers",
          "value": 1,
          "isMandatory": true
        },
        {
          "name": "min_special_characters",
          "value": 1,
          "isMandatory": true
        }
      ],
      "isParentPolicy": false,
    }
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
`blockedNativeLoginDomain`<br/>*string* | The blocked native login domain.
`verifiedDomains`<br/>*Array[[verified domains](#administration-get-verified-domains)]*| A list of verified domains (with VERIFIED status) for which successful matching OIDC logins will create new users.
`passwordPolicy`<br/>*object*  | The password policy assigned to the organization. 
`passwordPolicy.constraints`<br/>*Array[Object]* | List of password policy constraints.
`passwordPolicy.isParentPolicy`<br/>*boolean* | A boolean flag to indicate if the password policy is a parent policy.
`passwordPolicy.constraints.name`<br/>*string* | A string that represents the constraint name.
`passwordPolicy.constraints.value`<br/>*int* | An integer that represents the minimum value for the constraint.
`passwordPolicy.constraints.isMandatory`<br/>*boolean* | A boolean flag to indicate if the constraint is mandatory or not.


<!-------------------- UPDATE SECURITY SETTINGS -------------------->
### Update security settings
`PUT /organizations/:organization_id/security_settings`

```shell
# Update an organization's security settings
curl -X PUT "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5/security_settings" \
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
	},
   "passwordPolicy": {
      "constraints": [
         {
               "name": "min_password_length",
               "value": 8,
               "isMandatory": false
         },
         {
               "name": "min_lowercase_letters",
               "value": 1,
               "isMandatory": true
         },
         {
               "name": "min_uppercase_letters",
               "value": 1,
               "isMandatory": true
         },
         {
               "name": "min_numbers",
               "value": 1,
               "isMandatory": true
         },
         {
               "name": "min_special_characters",
               "value": 1,
               "isMandatory": true
         }
      ]
   }
}
```

Create a new or update an existing security settings for an organization.

Required | &nbsp;
---- | ----
`defaultRole`<br/>*object*  | The role that will be assigned to new users logging into the organization with an email domain matching that of the organization's security settings. 
`defaultRole.name`<br/>*string* | The name of the default role.
`defaultRole.id`<br/>*UUID* | The id of the default role.

Optional | &nbsp;
---- | ----
`autoCreationEnabled`<br/>*boolean* | A boolean specifying whether to enable automatic end-user account creation upon successful OIDC login.
`verifiedDomains`<br/>*Array[[verified domains](#administration-get-verified-domains)]*| A list of objects containing the ids of verified domains (with VERIFIED status) for which successful matching OIDC logins will create new users.
`blockedNativeLoginDomain`<br/>*string* | The blocked native login domain.
`passwordPolicy`<br/>*object*  | The password policy that will be assigned to the organization. 
`passwordPolicy.constraints`<br/>*Array[Object]* | List of password policy constraints objects with the following fields.
`passwordPolicy.constraints.name`<br/>*string* | A string that represents the constraint name.
`passwordPolicy.constraints.value`<br/>*int* | An integer that represents the minimum value for the constraint.
`passwordPolicy.constraints.isMandatory`<br/>*boolean* | A boolean flag to indicate if the constraint is mandatory or not.

Returns an HTTP status code 200, with an empty response body.

- If `defaultRole` is not passed in the request:
   - The system will assign `Guest`as a default role to the organization.
- If `passwordPolicy` is passed in the request:
   - The system will create a new or update the existing password policy for the organization.
- If `autoCreationEnabled` and/or `verifiedDomains` is passed in the request:
   - The system will create a new or update the existing security settings for the organization.


<!-------------------- GET ORGANIZATION PASSWORD POLICY -------------------->

### Get password policy
`GET /organizations/organization_id/password_policy`

Retrieve the password policy for the organization.

```shell
# Retrieve the organization's own or inherited password policy.
curl "https://cloudmc_endpoint/api/v2=2/organizations/e8d95716-26a9-4054-833e-81cd3a5155cd/password_policy" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "name": "min_password_length",
            "value": 8,
            "isMandatory": true
        },
        {
            "name": "min_lowercase_letters",
            "value": 1,
            "isMandatory": true
        },
        {
            "name": "min_uppercase_letters",
            "value": 1,
            "isMandatory": true
        },
        {
            "name": "min_numbers",
            "value": 1,
            "isMandatory": true
        },
        {
            "name": "min_special_characters",
            "value": 1,
            "isMandatory": true
        }
    ]
}
```
Attributes | &nbsp;
---- | -----------
*Array[Object]*| A list of password policy constraint objects with the following fields.
`name`<br/>*string* | The name of the constraint.
`value`<br/>*int* | The minimum value for the constraint.
`isMandatory`<br/>*boolean* | Flag to indicate if the constraint is mandatory or not.

<!-------------------- DELETE PASSWORD POLICY FOR ORGANIZATION -------------------->
### Delete password policy
`DELETE /organizations/:id/password_policy`

Delete a password policy for an organization. Root reseller organization will not be able to delete its password policy. A reseller sub-organization can delete its password policy.

```shell
# Delete an organization
curl -X DELETE "https://cloudmc_endpoint/api/v2/organizations/e8d95716-26a9-4054-833e-81cd3a5155cd/password_policy" \
   -H "MC-Api-Key: your_api_key"
```

Returns an HTTP status code 200, with an empty response body.

<!-------------------- GET MANAGEABLE CONNECTIONS OF ORGANIZATION -------------------->
### Get manageable connections of an organization
`GET /organizations/:id/manageable_connections`

Get a list of Service connections that can be managed by the current user on the given organization.

```shell
# Update an organization
curl -X GET "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5/manageable_connections" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
[
  {
    "id": "2f7b4d49-b426-424f-b272-396b66947bb1",
    "name": "Microsoft Azure",
    "type": "azure",
    "serviceCode": "azure-dev",
    "status": {
      "id": "97b3f5fa-1bda-4dae-b716-8039d9b89a56",
      "serviceConnection": null,
      "reachable": true,
      "lastUpdated": null,
      "message": null,
    },
    "quotas": []
  },
  {
    "id": "b1dc9202-4e1a-4180-9ed6-28025b5aacdd",
    "name": "Objects Lab",
    "type": "swiftstack",
    "serviceCode": "objects-lab",
    "iconOverrideUrl": "https://icon-override-url.png",
    "status": {
      "id": "74a78d2b-c0da-475e-9bb7-218adc745d81",
      "serviceConnection": null,
      "reachable": true,
      "lastUpdated": null,
      "message": null,
    },
    "quotas": [
      { ... },
      { ... },
    ]
  }
]
```
Attributes | &nbsp;
---- | -----------
`id`<br/>*string* | The id of the service connection.
`name`<br/>*string* | The name of the service connection.
`type`<br/>*string* | The type of the service connection. _(e.g. gcp, azure, aws, cloudca, swift, etc.)_
`serviceCode`<br/>*string* | The globally unique serviceCode that identifies the service connection.
`status`<br/>*Object* | The status object describing the status of connectivity to this service from CloudMc.
`quotas`<br/>*Array[Quotas]* | A list of quotas that can be associated to the service connnection.
`iconOverrideUrl`<br/>*string* | The icon the overwrites the default icon for the service connection.

The user should have `Connections reseller` permission on the organization. This list includes the following types of Service connections:

- If the API user is from this organization:
   - Service connections `owned by` and `assigned to` this organization
- If the API user is from this organization's immediate parent organization:
   - Service connections `assigned to` this organization
   - Service connections `owned by` and `assigned to` this organization's immediate parent organization _(i.e. the user's organization)_
- If the API user is from any organization between this organization's immediate parent organization and the root organization:
   - Service connections `assigned to` this organization
   - Service connections `owned by` the user's organization **and** is `assigned to` this organization's immediate parent organization
   - Service connections `assigned to` the user's organization **and** is `assigned to` this organization's immediate parent organization

<!-------------------- MARK AS RESELLER -------------------->
### Mark organization as reseller
`POST /organizations/:organization_id/mark_reseller`

```shell
# Mark an organization as reseller
curl -X POST "https://cloudmc_endpoint/api/v2/organizations/03bc22bd-adc4-46b8-988d-afddc24c0cb5/mark_reseller" \
   -H "MC-Api-Key: your_api_key" \
```

Mark the organization as a reseller. Returns an HTTP status code 200, with an empty response body.


<!-------------------- GET IDENTITY PROVIDERS -------------------->
### Get identity providers
`GET /organizations/:organization_id/identity_providers`

Retrieve the identity providers for the organization.

```shell
# Retrieve the organization's identity providers
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/identity_providers" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "32a5640c-b366-44b1-882a-ee2e1951c592",
      "organization": {
        "name": "my organization",
        "id": "87895f43-51c1-43cc-b987-7e301bf5b86a",
        "entryPoint": "myOrg"
      },
      "type": "OIDC",
      "css": "",
      "provider": "GOOGLE",
      "displayName": "Google",
      "logo": "/static/img/google_signin.svg",
      "rank": 1
    }
  ]
}
```
Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the identity provider.
`organization`<br/>*[Organization](#administration-organizations)* | The organization to which the verified domain belongs. *includes*:`id`,`name`, `entryPoint`.
`type`<br/>*string* | The type of authentication protocol. Possible values: OIDC, SAML.
`css`<br/>*string* | Custom css for the login button of the identity provider.
`provider`<br/>*string* | The name of the provider. Possible values include the default providers (e.g GOOGLE), or CUSTOM for a custom user-defined provider.
`displayName`<br/>*string* | The display name of the identity provider that will appear on the login screen.
`logo`<br/>*string* | A base64 encoded data URL or URL to an image for the logo to display on the login screen.
`rank`<br/>*int* | If provided, this integer sorts identity providers on the Login page in ascending order.




<!-------------------- GET BILLING -------------------->
### Get billing information
`GET /organizations/:organization_id/billing_info`

Retrieve the billing information for an organization.

```shell
# Retrieve the organization's billing information
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/billing_info" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "23910576-d29f-4c14-b663-31d728ff49a5",
    "organization": {
      "id": "23910576-d29f-4c14-b663-31d728ff49a5"
    },
    "billingProvider": {
      "id": "f26e66a4-755c-4867-b565-ad68aa515237"
    },
    "cardType": "Mastercard",
    "cardMaskedNumber": "************1234",
    "cardName": "John Doe",
    "cardExp": "0124",
    "billingAddressLineOne": "555 SomeStree",
    "billingAddressLineTwo": "App #2",
    "billingAddressCity": "SomeCity",
    "billingAddressProvince": "NY",
    "billingAddressPostalCode": "555555",
    "billingAddressCountry": "US",
    "customAttribute" : {
      "uid": "774B145528524D7C65590CE77B933135",
      "customerRefNumber": "208523664"
    }
  }
}
```
Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the billing information.
`organization`<br/>*[Organization](#administration-organizations)* | The organization to which belongs the billing information.
`billingProvider`<br/>*[BillingProvier](#administration-billing-providers)* | The billing provider associated to the credit card.
`cardType`<br/>*string* | The credit card type.
`cardMaskedNumber`<br/>*string* | The credit card masked number.
`cardName`<br/>*string* | The name on the credit card 
`cardExp`<br/>*string* | The credit card expiration ('mmyy' format)
`billingAddressLineOne`<br/>*string* | The address line 1 of the billing address.
`billingAddressLineTwo`<br/>*string* | The address line 2 of the billing address.
`billingAddressCity`<br/>*string* | The city of the billing address.
`billingAddressProvince`<br/>*string* | The province or state code (2 letters) of the billing address.
`billingAddressPostalCode`<br/>*string* | The postal/zip code of the billing address.
`billingAddressCountry`<br/>*string* | The country code (ISO 2 or 3 letter code) of the billing address.
`customAttribute` <br/>*Object*| The custom attributes associated to the billing provider

Chase attributes | &nbsp;
---- | -----------
`customAttribute.uid` <br/>*string* | Chase registration id.
`customAttribute.customerRefNum` <br/>*string* | Chase customer reference number/profile id.
`customAttribute.originalMitTransactionId` <br/>*string* | Chase customer original transaction id.


<!-------------------- DELETE CREDIT CARD -------------------->
### Clear credit card information
`DELETE /organizations/:organization_id/billing_info`

Delete the billing information for an organization. Only accessible to users with System:Pricings permission.

Returns an HTTP status code 200, with an empty response body.

```shell
# Delete the organization's billing information
curl -X DELETE "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/billing_info" \
   -H "MC-Api-Key: your_api_key"
```


<!-------------------- UPDATE BILLABLE ORGANIZATION INFORMATION -------------------->
### Set billable organization information
`PUT /organizations/:organization_id/billable`

Set the organization to billable and update the billable organization information.
If the organization's assigned pricing package is changed, this API will reprocess usage starting from the current in progres 
billing cycle. Any previously drafted invoices will be generated and reports will reflect the pricing configuration of the newly selected
pricing package.

```shell
# Update billable organization info
curl -X PUT "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/billable" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
  "id": "39f6260d-f0ca-4be9-93c4-46405d471c04",
  "billableStart": "2015-01-18",
	"pricingPackage": {
		"id": "58bad1de-1f87-422b-b44f-27ed58889272"
	}
}
```

Required | &nbsp;
---- | ----
`id`<br/>*UUID* | The id of the udpated billable organization information.
`billableStart`<br/>*string*  | The date the organization became billable, in YYYY-MM-DD format.
`pricingPackage.id`<br/>*UUID* | The id of the pricing package applied on the organization.

Optional | &nbsp;
---- | ----
`billableEnd`<br/>*string*  | The date the organization stops being billable, in YYYY-MM-DD format.

The response's `data` field contains the updated billable organization info with it's `id`, the `billableStart`, as well as the pricing package and it's`id`.

<!-------------------- LIST APPLICABLE PRICING PACKAGES TO ORG -------------------->
### List applicable pricing packages to an organization

`GET /organizations/:organization_id/pricing_packages`

Retrieves a list of applicable pricing packages to an organization.

```shell
# Retrieve visible organizations
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/pricing_packages" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "offerType": "30-day-trial",
      "pricingDefinition": {
        "id": "c9a396f1-690a-4201-a3bf-b1da37221acc"
      },
      "endDate": "2022-09-14T00:00:00Z",
      "organization": {
        "id": "de6cf332-14b2-4da8-8522-3dfe12fcd0da"
      },
      "name": {
        "en": "Applied Pricing",
        "fr": "Applied Pricing"
      },
      "id": "92041aa8-7784-45b0-aa85-76376ede784d",
      "creationDate": "2021-09-13T15:18:38.000Z",
      "startDate": "2021-09-22T20:09:32.084Z"
    }
  ]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The UUID of the pricing package.
`offerType`<br/>*string* | The offer type of the pricing package.
`pricingDefinition`<br/>*Object* | The pricing definition associated with the pricing package.
`pricingDefinition.id`<br/>*UUID* | The UUID of the pricing.
`organization`<br/>*Object* | The object representing the organization owning the pricing package.
`organization.id`<br/>*UUID* | The UUID of the organization.
`startDate`<br/>*date* | The start date of the pricing package.
`endDate`<br/>*date* | The end date of the pricing package. If it is not present, there is no end date defined.
`creationDate`<br/>*Object* | The date the pricing package was created.
`name` <br/>*Map[String, String]* | The name translations of the pricing package.

<!-------------------- LIST ORG BILLING EMAILS -------------------->
### List billing emails

`GET /organizations/:organization_id/billing_emails`

Retrieves a list of billing emails configured on the org. These emails will also receive billing related emails along with users that have the Admin:Billing role.

```shell
# Retrieve billing emails
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/billing_emails" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "billingEmails": {
      "example@email.com": "John",
      "billing@company.com": "Billing team"
    }
  }
}
```

Attributes | &nbsp;
---- | -----------
`billingEmails`<br/>*map* | A map of billing emails and names associated with them.

<!-------------------- Update ORG BILLING EMAILS -------------------->
### Update billing emails

`PUT /organizations/:organization_id/billing_emails`

Update the list of billing emails configured on the org. These emails will also receive billing related emails along with users that have the Admin:Billing role.

```shell
# Update billing emails
curl "https://cloudmc_endpoint/api/v2/organizations/87895f43-51c1-43cc-b987-7e301bf5b86a/billing_emails" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
   "billingEmails": {
      "example@email.com": "John",
      "billing@company.com": "Billing team"
   }
}
```

Required | &nbsp;
---- | ----
`billingEmails`<br/>*map* | A map of billing emails and names associated with them. There is a maximum of three emails that can be configured. Each entry must have a valid email specified along with a name.

<!-------------------- FIND BILLING CYCLE -------------------->
### Get a billing cycle for an org

`GET /organizations/:organization_id/billing_cycles/:billing_cycle_id`

Retrieves a billing cycle for the organization.

```shell
# Retrieve billing cycle
curl "https://cloudmc_endpoint/api/v2/organizations/c01e2bd4-50c4-4ef4-b756-f728823309a4/billing_cycles/8259182d-5234-4a78-adf6-7edc11db2e3b" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "pricingPackages": [
      {
        "endDate": "2021-12-01",
        "packageId": "508a1f5f-2504-41ac-b48f-b87e757840a4",
        "name": {
          "en": "Cox Pricing Package"
        },
        "startDate": "2021-11-01"
      }
    ],
    "deferred": false,
    "invoices": [],
    "discounts": [
      {
        "endDate": "2021-11-11",
        "name": {
          "en": "Credit 01"
        },
        "discountId": "e6ada5f6-9806-466c-8522-314da152a8e7",
        "type": "CREDIT",
        "startDate": "2021-11-01",
        "remaining": {
          "discountedProducts": {},
          "discountedCategories": {},
          "packageDiscount": 10.0,
          "labels": {}
        }
      },
    ],
    "endDate": "2021-12-01",
    "currency": "USD",
    "id": "8259182d-5234-4a78-adf6-7edc11db2e3b",
    "state": "IN_PROGRESS",
    "startDate": "2021-11-01"
  }
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the billing cycle.
`startDate`<br/>*string* | The start date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the billing cyle.
`endDate`<br/>*string* | The end date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the billing cyle.
`currency`<br/>*string* | The currency associated to the organization.
`deferred`<br/>*boolean* | Indicates whether the billing cycle is deferred or not.
`invoices`<br/>*Array[UUID]* | Array of UUIDs of the invoices associated with the billing cycle.
`pricingPackages`<br/>*Array[Object]* | List of pricing packages associated with the billing cycle.
`pricingPackages.endDate`<br/>*string* | The end date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of when the pricing package was applied to the billing cycle.
`pricingPackages.startDate`<br/>*string* | The start date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) of the pricing package associated with the billing cycle.
`pricingPackages.name`<br/>*Map[String, String]* | The name translations of the pricing package.
`discounts`<br/>*Array[Object]* | List of discounts applied during the billing cycle.
`discounts.endDate`<br/>*date* | The end date of the discount.
`discounts.startDate`<br/>*date* | The start date of the discount.
`discounts.name`<br/>*Map[String, String]* | The name translations of the discount.
`discounts.type`<br/>*enum* | The type of the discount. It could be either "PERCENTAGE" or "CREDIT".
`discounts.remaining`<br/>*Object* | Tracking of the credits remaining and used for the billing cycle.
`discounts.discountId`<br/>*UUID* | The UUID of the discount.
`state`<br/>*enum* | The state of the billing cycle. It could be "NONE", "WAITING_INVOICE", "WAITING_PAYMENT", "PAID", "IN_PROGRESS", or "FUTURE".


<!-------------------- UPDATE BILLABLEORGINFO PACKAGE & DISCOUNTS FOR BILLING CYCLE -------------------->
### Update the pricing package and discounts starting at a billing cycle

`PUT /organizations/:organization_id/billable_info`

Updates the organization's billable information with the new pricing package and discounts starting at the specified billing cycle

```shell
# Update billable information
curl "https://cloudmc_endpoint/api/v2/organizations/c01e2bd4-50c4-4ef4-b756-f728823309a4/billable_info" \
   -H "MC-Api-Key: your_api_key" \
   -H "Content-Type: application/json" \
   -d "request_body"
```
> Request body example:

```json
{
  "billableOrgInfoId": "1529945f-2254-4242-8633-a49ac237919b",
  "billingCycleId": "8f651e10-f8c7-4f26-8ab5-75f2e5bc4f79",
  "pricingPackageId": "87cf333a-fb01-4114-971f-da5c972bfece",
  "discountIds": [
    "033f37c5-9ea4-4caa-9008-5db9118b3d30",
    "9254ca94-b12b-4cf4-92c3-d51cef33a229"
  ]
}
```
| Attributes                      | &nbsp;                                                                                                              |
|---------------------------------|---------------------------------------------------------------------------------------------------------------------|
| `billableOrgInfoId`<br/>*UUID*  | The id of the billable organization information.                                                                    |
| `billingCycleId`<br/>*UUID*     | The id of the starting billing cycle.                                                                               |
| `pricingPackageId`<br/>*UUID*   | The id of pricing package to apply.                                                                                 |
| `discountIds`<br/>*Array[UUID]* | The list of discount Ids to apply at the start of the billing cycle. An empty list results in no discounts to apply |


> The above command returns a JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "0594913c-b909-43dd-9467-79a09219f760"
    },
    "applicableDiscounts": [],
    "currency": "USD",
    "id": "a37218aa-3515-49c2-8600-e1a856bebc9b",
    "pricingPackage": {
      "id": "1529945f-2254-4242-8633-a49ac237919b"
    },
    "billableStart": "2021-11-22"
  }
}
```

| Response | &nbsp;                                                                                                            |
`data`<br/>*[Organization](#administration-organizations)* | The information about the updated organization

|-------------------------------------|---------------------------------------------------------------------------------------|
|`organization`<br/>*[Organization](#administration-organizations)* | The organization to which belongs the billing information.|
| `currency`<br/>*String*             | The currency used by the organization for billing, payments and invoices.             |
| `id`<br/>*UUID*                     | The id of billing information.                                                        |
| `pricingPackage`<br/>*Object*       | The pricing package currently applied to the organization.                            |
| `billableStart`<br/>*String*        | The the start date when the application start generating billing cycles and invoices. |
| `applicableDiscounts`<br/>*Array[Object]* | The discounts applicable to the billable org .                                  |

