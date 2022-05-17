## Quotas

Quotas are used to limit the resource usage on a service connection consumed by an organization. The primary use case for CloudMC is to enforce limited quotas on trial accounts. Quotas can target different resources. For example, number of vCPUs, allocated memory, disk size, network bandwidth, number of public IPs and more.

<!------------------- LIST QUOTAS --------------------->

### List quotas

`GET /quotas?organization_id=:id&type=[owned|assigned]`

Retrieves a list of quotas configured for a given organization. An optional `type` can be specified to retrieve either only the `assigned` or `owned` quotas.

**Query Parameters**

Optional | &nbsp;
---------- | -----------
`organization_id`<br/>*UUID* | The organization id for which we want to get the quotas from. When not specified, the quotas for the organization the current user is associated to will be returned.
`type`<br/>*UUID* | The type of quotas. This can be `assigned` (quotas assigned to an organization) or `owned` (quotas managed by an organization). When not specified, both types are returned.

```shell
# Retrieve quotas list
curl "https://cloudmc_endpoint/api/v2/quotas" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
        {
      "ownerOrganization": {
        "name": "System",
        "id": "a21debb5-b4ac-4e4b-9491-d0f4df6cd4f9"
      },
      "deleted": false,
      "quotaDetails": [
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "1c005444-6ea2-4ebc-85f7-d75f5b1943d3",
          "type": "INSTANCE_MEMORY",
          "labelKey": "quotas.memory",
          "version": 1
        },
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "674f4755-640b-4697-87bb-8a5d03704552",
          "type": "DISK_SIZE",
          "labelKey": "quotas.disk_size",
          "version": 1
        },
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "691c55b5-ecaf-434d-b509-97c4fb554d1d",
          "type": "INSTANCE_VCPUS",
          "labelKey": "quotas.vcpus",
          "version": 1
        }
      ],
      "name": "Quota Name",
      "defaultForService": true,
      "description": "Quota Description",
      "numberOfOrganizationsAppliedTo": 1,
      "id": "24330f70-9845-4851-acc0-ecd5d9b13613",
      "creationDate": "2021-01-06T19:17:06.000Z",
      "version": 1,
      "serviceConnection": {
        "serviceCode": "service-code",
        "name": "service-name",
        "id": "52fb6687-44cb-4db3-9e63-bdfabfe2faf1",
        "type": "gcp",
        "organization": {
          "id": "c5305a63-d45c-422e-9b6b-72ed1c60aedc"
        }
      },
      "defaultForTrial": true
    },
  ]
}
```
An array of quotas with the following attributes are returned.

Quota Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the quota.
`name`<br/>*string* | The name of the quota.
`description`<br/>*string* | The description of the quota.
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the quota was created.
`numberOfOrganizationsAppliedTo`<br/>*number* | The number of organizations the quota is assigned to.
`defaultForService`<br/>*boolean* | Weather or not the quota is the default for service connections.
`defaultForTrial`<br/>*boolean* | Weather or not the quota is the default for trials.
`ownerOrganization`<br/>*[Organization](#administration-organizations)* | The organization that manages the quota.<br/>*includes*: `id` and `name`.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection associated to the quota.<br/>*includes*: `id` and `name`.
`quotaDetails`<br/>*Array [QuotaDetail]* | The quota details.

The following table lists the attributes for `QuotaDetail`:

QuotaDetail Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the quota detail.
`type`<br/>*string* | The type of quota (metric).
`labelKey`<br/>*string* | The key used for the label.
`metricIdentifier`<br/>*string* | Id matching the metric identifiers provided by the plugin writer.
`ceiling`<br/>*number* | The ceiling value (metric).
`limitsize`<br/>*number* | `DEPRECATED` The maximum for the type (metric).

<!-------------------- GET A QUOTA -------------------->

### Retrieve a quota

`GET /quotas/:id`

```shell
# Retrieve a specific quota
curl "https://cloudmc_endpoint/api/v2/quotas/:id" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
      "ownerOrganization": {
        "name": "System",
        "id": "a21debb5-b4ac-4e4b-9491-d0f4df6cd4f9"
      },
      "deleted": false,
      "quotaDetails": [
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "1c005444-6ea2-4ebc-85f7-d75f5b1943d3",
          "type": "INSTANCE_MEMORY",
          "labelKey": "quotas.memory",
          "version": 1
        },
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "674f4755-640b-4697-87bb-8a5d03704552",
          "type": "DISK_SIZE",
          "labelKey": "quotas.disk_size",
          "version": 1
        },
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "691c55b5-ecaf-434d-b509-97c4fb554d1d",
          "type": "INSTANCE_VCPUS",
          "labelKey": "quotas.vcpus",
          "version": 1
        }
      ],
      "name": "Quota Name",
      "defaultForService": true,
      "description": "Quota Description",
      "numberOfOrganizationsAppliedTo": 1,
      "id": "24330f70-9845-4851-acc0-ecd5d9b13613",
      "creationDate": "2021-01-06T19:17:06.000Z",
      "version": 1,
      "serviceConnection": {
        "serviceCode": "service-code",
        "name": "service-name",
        "id": "52fb6687-44cb-4db3-9e63-bdfabfe2faf1",
        "type": "gcp",
        "organization": {
          "id": "c5305a63-d45c-422e-9b6b-72ed1c60aedc"
        }
      },
      "defaultForTrial": true
    }
}
```
A quota with the following attributes are returned.

Quota Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the quota.
`name`<br/>*string* | The name of the quota.
`description`<br/>*string* | The description of the quota.
`creationDate`<br/>*string* | The date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) that the quota was created.
`numberOfOrganizationsAppliedTo`<br/>*number* | The number of organizations the quota is assigned to.
`defaultForService`<br/>*boolean* | Weather or not the quota is the default for service connections.
`defaultForTrial`<br/>*boolean* | Weather or not the quota is the default for trials.
`ownerOrganization`<br/>*[Organization](#administration-organizations)* | The organization that manages the quota.<br/>*includes*: `id` and `name`.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | The service connection associated to the quota.<br/>*includes*: `id` and `name`.
`quotaDetails`<br/>*Array [QuotaDetail]* | The quota details.

The following table lists the attributes for `QuotaDetail`:

QuotaDetail Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The id of the quota detail.
`type`<br/>*string* | The type of quota (metric).
`labelKey`<br/>*string* | The key used for the label.
`metricIdentifier`<br/>*string* | Id matching the metric identifiers provided by the plugin writer.
`ceiling`<br/>*number* | The ceiling value (metric).
`limitsize`<br/>*number* | `DEPRECATED` The maximum for the type (metric).

<!------------------- CREATE QUOTA -------------------->

### Create a quota

`POST /quotas`

```shell
curl -X POST "https://cloudmc_endpoint/api/v2/quotas" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:
```json
{
  "name": "my-quota-name",
  "serviceConnection": {
    "id": "6abd9b5b-2aad-4732-9177-509d536c5739"
  },
  "ownerOrganization": {
    "id": "976e1d4b-de6f-454b-a189-b12dd1b85112"
  },
  "quotaDetails": [
    {
      "metricIdentifier": "instance.cpu.count",
      "ceiling": 5
    },
    {
      "metricIdentifier": "disk.size.gb",
      "ceiling": 500
    }
  ],
  "defaultForService": true,
  "defaultForTrial": true
}
```

Create a quota owned by an organization for a connection.

Once created, a quota can be applied to any child organization of the quota's owner. This endpoint cannot be used to apply a quota to an organization. See `POST /quotas/apply` instead.

There can only be one default quota and one default trial quota for a connection. Any attempt to create a default quota, when there's already an existing one, will result in the exsting quota losing it's default status.

Required | &nbsp;
-------- | --------
`name`<br/>*string* | Name of the quota. Must be unique across the connection and organization.
`serviceConnection`<br/>*[ServiceConnection](#administration-service-connections)* | Service connection associated to the quota.<br/>*required*: `id`
`quotaDetails`<br/>*Array[QuotaDetails]* | List of `QuotaDetail` making up the quota. A `QuotaDetail` represents a limit on a resource and is directly linked to a `MetricDescriptor`. A `MetricDescriptor` describes a metric offered by the plugin. For more information, consult the SDK documentation.<br/>*required*: `metricIdentifier`, `ceiling`
`quotaDetail.metricIdentifier`<br/>*string* | A unique identifier used to define a `MetricDescriptor`.
`quotaDetail.ceiling`<br/>*number* | The ceiling for this particular quota detail.

Optional | &nbsp;
-------- | --------
`ownerOrganization`<br/>*[Organization](#administration-organization)* | Organization in which the quota will be created. *Defaults to caller's organization*.<br/>*required:* `id`
`defaultForService`<br/>*Boolean* | A flag denoting if this quota is the default quota for this connection. There can only be one default quota per connection/organization.
`defaultForTrial`<br/>*Boolean* | A flat denoting if this quota is the default quota for a trial. There can only be one default trial quota per connection/organization.

The responses' `data` field contains the created [quota](#administration-quota) with its `id`.

<!------------------- UPDATE QUOTA -------------------->

### Update a quota
`PUT /quotas/:id`

```shell
curl -X PUT "https://cloudmc_endpoint/api/v2/quotas" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:
```json
{
  "name": "my-quota-name",
  "description": "Quotas for trials",
  "quotaDetails": [
    {
      "metricIdentifier": "instance.cpu.count",
      "ceiling": 5
    },
    {
      "metricIdentifier": "disk.size.gb",
      "ceiling": 300
    }
  ],
}
```
Notes:
- An existing quotas, owner organization and service connection cannot be changed.
- The `quotaDetails` in the request will *entirely* replace the previous `quotaDetails`. A quotaDetail for every metric enforced by the plugin must be present. 
- The default flags of the quota can not be changed via the update endpoint. To update these flags, the 'quotas/:id/default' should be used. 
- There is an asynchronous portion of this API that will assign the updated quota limits to all currently assigned organizations and organization environments on the backend service. 


Required | &nbsp;
-------- | --------
`name`<br/>*string* | Name of the quota. Must be unique across the connection and organization.
`quotaDetails`<br/>*Array[QuotaDetails]* | List of `QuotaDetail` making up the quota. A `QuotaDetail` represents a limit on a resource and is directly linked to a `MetricDescriptor`. A `MetricDescriptor` describes a metric offered by the plugin. For more information, consult the SDK documentation.<br/>*required*: `metricIdentifier`, `ceiling`
`quotaDetail.metricIdentifier`<br/>*string* | A unique identifier used to define a `MetricDescriptor`.
`quotaDetail.ceiling`<br/>*number* | The ceiling for this particular quota detail.

Optional | &nbsp;
-------- | --------
`description`<br/>*String* | The description of this quota

The responses' `data` field contains the updated [quota](#administration-quota).

> The above command returns a JSON structured like this:

```json
{
  "taskId": "085b008e-7ee4-444b-8092-350190786147",
  "taskStatus": "PENDING",
  "data":{
    "ownerOrganization":{
      "name":"Cox Communications",
      "id":"ca785487-5e22-4bac-ab01-187260b0d0cb"
    },
    "quotaDetails":[
        {
          "ceiling":12.0,
          "limitSize":12,
          "metricIdentifier":"workload_cpu_count",
          "metricDescriptor":{
            "metricIdentifier":"workload_cpu_count",
            "nameLabelKey":"metrics.quotas.workload_cpu_count",
            "unitLabelKey":"metrics.units.unit",
            "categoryLabelKey":"usage.stackpath.compute",
            "resourceMetricType":"GAUGE"
          },
          "id":"04d7c0cb-455a-42b2-b32a-b914c871a598",
          "type":"workload_cpu_count",
          "labelKey":"workload_cpu_count.label"
        }
    ],
    "description":"Trials assigned Edge Cloud should be assigned this quota",
    "numberOfOrganizationsAppliedTo":0,
    "creationDate":"2021-03-10T16:37:02.000Z",
    "defaultForTrial":true,
    "name":"Trial",
    "organizations":[],
    "defaultForService":false,
    "id":"6c44dc22-abf9-4fa2-b722-751848f1858e",
    "serviceConnection":{
      "serviceCode":"edge-cloud-beta",
      "organization":{
        "id":"ca785487-5e22-4bac-ab01-187260b0d0cb"
      },
      "name":"Edge Cloud Beta",
      "id":"081ffa1f-1531-4dd5-a7e2-070e560409ce",
      "type":"stackpath"
    }
  }
},


```
Attributes | &nbsp;
---------- | -----------
`taskId`<br/>*UUID* | The id of the asynchronous task
`taskStatus`<br/>*string* | The current status of the asynchronous task
`data`<br/>*[Quota](#administration-quotas)* | The updated quota model


<!-------------------- DELETE A QUOTA -------------------->

### Delete a quota
`DELETE /quotas/:id1?quota_id=:id2`

Deletes an existing quota. The parameter `quota_id` is only required when deleting a quota that is currently assigned to an organization. 

```shell
# Delete a specific quota 
curl -X DELETE "https://cloudmc_endpoint/api/v2/quotas/:id" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "085b008e-7ee4-444b-8092-350190786147",
  "taskStatus": "SUCCESS"
}
```

**Query Parameters**

Optional | &nbsp;
---------- | -----------
`quota_id`<br/>*UUID* | The id of the quota that will be used as a substitution for the quota that is being deleted. 


<!-------------------- SET A QUOTA AS DEFAULT -------------------->

### Assign quota to be default quota 
`POST /quotas/:quota_id?service=true&trial=false`

Makes a quota with :quota_id the default for the a service, trial or both. A quota can only be set as default if the quota is owned by the 
connection owner. 

```shell
# Makes a specific quota default 
curl -X POST "https://cloudmc_endpoint/api/v2/quotas/:id/default?service=true&trial=false" \
   -H "MC-Api-Key: your_api_key"
```
> The above command returns the updated quota when it was successfully made a default for service or trial. 

Note: This endpoint only attempts to set the quota as the default, it does not remove the default flag of the quota 
if both `service` and `trial` query parameters are false. 

```json
{
  "data": {
      "ownerOrganization": {
        "name": "System",
        "id": "a21debb5-b4ac-4e4b-9491-d0f4df6cd4f9"
      },
      "deleted": false,
      "quotaDetails": [
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "1c005444-6ea2-4ebc-85f7-d75f5b1943d3",
          "type": "INSTANCE_MEMORY",
          "labelKey": "quotas.memory",
          "version": 1
        },
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "674f4755-640b-4697-87bb-8a5d03704552",
          "type": "DISK_SIZE",
          "labelKey": "quotas.disk_size",
          "version": 1
        },
        {
          "ceiling": 1.0,
          "deleted": false,
          "limitSize": 0,
          "metricIdentifier": "metric-id",
          "id": "691c55b5-ecaf-434d-b509-97c4fb554d1d",
          "type": "INSTANCE_VCPUS",
          "labelKey": "quotas.vcpus",
          "version": 1
        }
      ],
      "name": "Quota Name",
      "defaultForService": true,
      "defaultForTrial": false,
      "description": "Quota Description",
      "numberOfOrganizationsAppliedTo": 1,
      "id": "24330f70-9845-4851-acc0-ecd5d9b13613",
      "creationDate": "2021-01-06T19:17:06.000Z",
      "version": 1,
      "serviceConnection": {
        "serviceCode": "service-code",
        "name": "service-name",
        "id": "52fb6687-44cb-4db3-9e63-bdfabfe2faf1",
        "type": "gcp",
        "organization": {
          "id": "c5305a63-d45c-422e-9b6b-72ed1c60aedc"
        }
      }
    }
}
```

**Query Parameters**

Optional                | &nbsp;
---------------------   | -----------
`service`<br/>*boolean* | Indicates if this quota should be made the default quota for all organizations assigned this service connection.
`trial`<br/>*boolean*  | Indicates if this quota should be made the default quota for all trial organization assigned this service connection. 
