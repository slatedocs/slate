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
        "type": "gcp"
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

`GET /quota/:id`

```shell
# Retrieve a specific quota

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
        "type": "gcp"
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
