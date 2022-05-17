## Activity

Whenever there is an event that occurs under the Administration panel for an organization (e.g: a user added to the organization, a role assigned to a user, etc.) an activity event is created.

The activity chart display 
the activity per day over the last 30 days. 

<!------------------- LIST ACTIVITIES --------------------->

### List activity per organization

`GET /activity`

Retrieve activity count grouped by organization.


```shell
# Retrieve activity per organization
curl "https://cloudmc_endpoint/rest/organizations/activity" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "afd011d5-c7dd-4763-9892-ccbdafcd273b":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,21,23,27,0,0,3],
        "37088fe3-b266-4283-a8d0-7ff78e476760":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,7],
        "3c733655-c520-49e8-97f1-150d78d07fa5":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,16,0,0,0,0,0]
    }
}
```

where the key is the organization UUID and the value is an array of integer representing daily activity. The size of the array of integer represents each day over a period of 30 days, relative to today.

## Activity Logs

Activity logs are used to view the different audited operations on a given organization.

<!------------------- LIST ACTIVITIES --------------------->

### List activities

`GET /activity_log`

Retrieves a list of activities on a given organization. Optional parameters `organizationId` and `only_mine` can be specified to narrow the list of activities being returned.

Optional Query Parameters 	 | &nbsp;
---------------------------- | -----------
`organizationId`<br/>*UUID* | The organization id for which we want to get the activities from. When not specified, the activities for the organization the current user is associated to will be returned.
`only_mine`<br/>*boolean* | Indicates if the list should include only activities performed by the current user. When not specified, the value is `false`.
`includeSubOrgs`<br/>*boolean* | Indicates if the list should include the sub-organizations.  When not specified, the value is `false`.
`environmentId`<br/>*UUID* | The environment id for which we want to get the activities from. When not specified, all environments will be returned.
`serviceConnectionId`<br/>*UUID* | The environment id for which we want to get the activities from. When not specified, all environments will be returned.
`userId`<br/>*UUID* | The user id for which we want to get the activities from. When not specified, all users will be returned.
`category`<br/>*string* | The category for which we want to get the activities from. When not specified, all categories will be returned.
`eventCode`<br/>*string* | The event code for which we want to get the activities from. When not specified, all event codes will be returned.
`status`<br/>*string* | The status for which we want to get the activities from. When not specified, all statuses will be returned.
`start`<br/>*date* | The start timestamp in RFC3339 text format which which we want to get the activities from. When not specified, all events will be returned.
`end`<br/>*date* | The end timestamp in RFC3339 text format which which we want to get the activities from. When not specified, all events will be returned.

```shell
# Retrieve activity list
curl "https://cloudmc_endpoint/api/v1/activity_log" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "userLastname": "Name",
      "organizationId": "856ed38e-da4a-4f51-a7ad-e4981a44c66c",
      "requesterIp": "127.0.0.1",
      "userEmail": "username@acme.com",
      "correlationId": "caa1445a-99d4-4ec2-a6d0-13ea29f12b09",
      "id": "000598f3-d538-4b18-a5e7-964696ef8d79",
      "userOrganizationId": "a21debb5-b4ac-4e4b-9491-d0f4df6cd4f9",
      "organizationName": "Acme",
      "created": "2021-02-02T14:12:39.422Z",
      "userId": "0d7baac6-885a-4c82-9656-77529213223e",
      "eventContext": "{\"id\":null,\"firstName\":\"User\",\"lastName\":\"Name\",\"userName\":\"username@acme.com\",\"timezone\":null,\"status\":null,\"organization\":{\"id\":\"856ed38e-da4a-4f51-a7ad-e4981a44c66c\",\"name\":\"Acme\",\"isDbAuthentication\":true},\"locale\":\"en\",\"email\":\"username@acme.com\",\"lastLogin\":null,\"lastFailedLogin\":null,\"loginCount\":null,\"isTechnicalContact\":null,\"isBusinessContact\":null,\"creationDate\":null,\"tfaEnabled\":false,\"receivesEmailNotifications\":true,\"primaryRoleBinding\":{\"id\":null,\"role\":{\"id\":\"e292f73b-99ff-4677-9aeb-d98b3e196089\",\"name\":\"guest\",\"isFixed\":true,\"isSystem\":true},\"organization\":{\"id\":\"856ed38e-da4a-4f51-a7ad-e4981a44c66c\"}}}",
      "eventCode": "users.created",
      "userFirstname": "User",
      "userOrganizationName": "System",
      "category": "SYSTEM",
      "updated": "2021-02-02T14:12:43.709Z",
      "status": "SUCCESS",
      "username": "username"
    }
  ]
}
```

An array of activities with the following attributes are returned.

Activity Attributes | &nbsp;
------------------- | -----------
`id`<br/>*UUID* | The id of the activity.
`correlationId`<br/>*UUID* | The correlation id of the activity.
`eventCode`<br/>*string* | The human readable code for the event.
`category`<br/>*string* | The category the event belongs to.
`status`<br/>*string* | The status of the event.
`created`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the activity was created.
`updated`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the activity was created.
`userId`<br/>*UUID* | The id of the user who generated the activity.
`username`<br/>*string* | The username of the user who generated the activity.
`userFirstname`<br/>*string* | The first name of the user who generated the activity.
`userLastname`<br/>*string* | The first name of the user who generated the activity.
`userEmail`<br/>*string* | The email of the user who generated the activity.
`userOrganizationId`<br/>*UUID* | The id of the organization of the user who generated the activity.
`userOrganizationName`<br/>*string* | The name of the organization of the user who generated the activity.
`organizationId`<br/>*UUID* | The id of the organization of activity belongs to.
`organizationName`<br/>*string* | The name of the organization of activity belongs to.
`requesterIp`<br/>*string* | The ip address of the requester.
`eventContext`<br/>*string* | The escaped json event context.

<!------------------- LIST ACTIVITY CODES -------------------->

### List activity codes

`GET /activity_log/codes`

Retrieves a list of activity codes. Optional parameters `organizationId` and `include_subs` can be specified to narrow the list of activities being returned.

Optional Query Parameters  | &nbsp;
-------------------------- | -----------
`organizationId`<br/>*UUID* | The organization id for which we want to get the activity codes from. When not specified, the activity codes for the organization the current user is associated to will be returned.
`include_subs`<br/>*boolean* | If we want to include sub-organizations activity codes.

```shell
# Retrieve activity codes
curl "https://cloudmc_endpoint/api/v1/activity_log/codes" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```js
{
  "data": {
    "SYSTEM": [
      "res_commitments.update",
      "users.autocreated",
      "environment_members.purge",
      "custom_field.deleted",
      "organizations.provision",
      "trials.converted_to_billable",
      // ...
    ]
  }
}
```

The list of activity codes is returned grouped by category.

<!------------------- ACTIVITIES SUMMARY -------------------->

### Get activities summary

`GET /activity_log/summary`

Retrieves a summary of activities. An optional `maxNumberOfItems` can be passed to narrow the number of items down to be included in the summary.

Optional Query Parameters  | &nbsp;
-------------------------- | -----------
`maxNumberOfItems`<br/>*number* | The number of items to be included in the summary.

```shell
# Retrieve activities summary
curl "https://cloudmc_endpoint/api/v1/activity_log/summary" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "userLastname": "Name",
      "organizationId": "829f0117-4b1f-49bb-8daf-ea4625ea6133",
      "environmentId": "e721bb72-e332-4745-b72f-0b15633d2823",
      "serviceConnectionName": "service-connection-name",
      "environmentName": "env-local",
      "userEmail": "username@acme.com",
      "id": "2fd514fb-bdb8-481c-ad0c-7da683181df5",
      "userOrganizationId": "829f0117-4b1f-49bb-8daf-ea4625ea6133",
      "serviceConnectionType": "stackpath",
      "organizationName": "System",
      "created": "2021-03-11T18:45:01.486Z",
      "userId": "ff17986e-8a66-4e23-8cb1-f846b1c1deb6",
      "parentId": "f5b77da1-9539-446b-8399-94c034604b0f",
      "eventContext": "{\"userName\":\"username@acme.com\",\"environmentName\":\"env-local\",\"organizationName\":\"Acme\",\"connectionName\":\"service-connection-name\"}",
      "eventCode": "environment_members.provision",
      "serviceConnectionId": "8c77bf1a-3eca-4509-b13d-005bf779df28",
      "userFirstname": "User",
      "userOrganizationName": "System",
      "category": "SYSTEM",
      "updated": "2021-03-11T18:45:02.340Z",
      "status": "SUCCESS",
      "username": "username@acme.com"
    }
  ]
}
```

An array of activity summaries with the following attributes are returned.

Activity Summary Attributes | &nbsp;
--------------------------- | -----------
`id`<br/>*UUID* | The id of the activity.
`parentId`<br/>*UUID* | The id of the parent activity.
`eventCode`<br/>*string* | The human readable code for the activity event.
`category`<br/>*string* | The category the activity event belongs to.
`status`<br/>*string* | The status of the activity event.
`created`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the activity was created.
`updated`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the activity was created.
`userId`<br/>*UUID* | The id of the user who generated the activity.
`username`<br/>*string* | The username of the user who generated the activity.
`userFirstname`<br/>*string* | The first name of the user who generated the activity.
`userLastname`<br/>*string* | The first name of the user who generated the activity.
`userEmail`<br/>*string* | The email of the user who generated the activity.
`userOrganizationId`<br/>*UUID* | The id of the organization of the user who generated the activity.
`userOrganizationName`<br/>*string* | The name of the organization of the user who generated the activity.
`organizationId`<br/>*UUID* | The id of the organization the activity belongs to.
`organizationName`<br/>*string* | The name of the organization of activity belongs to.
`environmentId`<br/>*UUID* | The id of the environment the activity belongs to.
`environmentName`<br/>*string* | The name of the environment the activity belongs to.
`eventContext`<br/>*string* | The escaped json event context.
`serviceConnectionId`<br/>*UUID* | The id of the service connection the activity belongs to.
`serviceConnectionName`<br/>*string* | The name of the service connection the activity belongs to.
`serviceConnectionType`<br/>*string* | The type of the service connection the activity belongs to.