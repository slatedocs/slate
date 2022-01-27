## Rollbacks

Rollbacks enable service providers to reprocess usage data from the past. 
Currently the only supported rollback type REPROCESS uses existing collected usage metrics and reprocesses it through the monetization engine. The most current effective pricing configuration will be used to price these records. 

<!-------------------- LIST ROLLBACK TRIGGERS -------------------->
### List rollback triggers

`GET /rollbacks`

Retrives a list of rollback triggers for a reseller.

> Note: You must have the Reseller pricing permission on the target reseller. If the caller does not have the correct permissions or the reseller with the ID provided does not exist then a `404 Not Found` response will be returned. The `organization_id` query parameter is optional. If not present, it will default to the caller's organization.

```shell
# Retrieve rollback triggers
curl "https://cloudmc_endpoint/rest/rollbacks?organization_id=23910576-d29f-4c14-b663-31d728ff49a5" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "createdDate": "2022-01-06T17:43:55Z",
      "resetDate": "2022-01-06",
      "rollbacks": [
        {
          "resetDate": "2022-01-06",
          "organization": {
            "name": "Operator",
            "id": "1b47df69-6458-4ea6-8c4b-2894b3f7ec00"
          },
          "id": 28428,
          "state": "COMPLETED",
          "serviceConnection": {
            "serviceCode": "swiftstack-aaaa",
            "name": "Object Storage",
            "id": "4fa42796-6b93-4d9f-b5f7-34c4d1c796ea",
            "type": "swiftstack"
          }
        },
        {
          "resetDate": "2022-01-06",
          "organization": {
            "name": "WhitePages",
            "id": "5f07f7d6-8eaf-418e-87a1-8dc063135003"
          },
          "id": 28429,
          "state": "SCHEDULED",
          "serviceConnection": {
            "serviceCode": "stackpath-aaaa",
            "name": "Edge Services",
            "id": "2d468fc0-434d-49a7-9739-e8d4fda0c488",
            "type": "stackpath"
          }
        }
      ],
      "organization": {
        "name": "Operator",
        "id": "1b47df69-6458-4ea6-8c4b-2894b3f7ec00"
      },
      "name": "Rollback January",
      "description": "This is a description",
      "id": "006980fe-6ee5-4c04-a0aa-df04acab54f9",
      "state": "SCHEDULED",
      "type": "REPROCESS"
    }
  ]
}
```
| Attributes                   | &nbsp;                                                                                                                             |
| ---------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_              | The UUID of the rollback trigger provider.                                                                                         |
| `name`<br/>_string_          | The name of the rollback.                                                                                                          |
| `description`<br/>_string_   | The description of the rollback (optional).                                                                                        |
| `organization.id`<br/>_UUID_ | The UUID of the organization (reseller) responsble for creating the rollback trigger                                               |
| `type`<br/>_string_          | The type of the rollback: Possible values are `REPROCESS, RECOLLECT`.                                                              |
|                              | The `REPROCESS` type is only available to users with operator permission.                                                          |
|                              | The `RECOLLECT` type is available to connection owners and operators.                                                              |
| `state`<br/>_enum_           | The state of the rollback. Possible values are: `COMPLETED`, `SCHEDULED` & `PENDING`.                                              |
| `createdDate`<br/>_string_   | The date the rollback trigger was created.                                                                                         |
| `resetDate`<br/>_string_     | The date in which we want to start the rollback (inclusive).                                                                       |
| `rollbacks`<br/>_Array_      | A list of rollbacks scoped to a service connection and organization.                                                               |

<!-------------------- GET ROLLBACK TRIGGER -------------------->
### Get a rollback trigger

`GET /rollbacks/:id`

Retrives a rollback trigger's details.

> Note: You must have the Reseller pricing permission on the target reseller. If the caller does not have the correct permissions or the reseller with the ID provided does not exist then a `404 Not Found` response will be returned.

```shell
# Retrieve rollback triggers
curl "https://cloudmc_endpoint/rest/rollbacks/23910576-d29f-4c14-b663-31d728ff49a5" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "createdDate": "2022-01-10T17:06:10Z",
    "resetDate": "2022-01-10",
    "rollbacks": [
      {
        "resetDate": "2022-01-10",
        "organization": {
          "name": "WhitePages",
          "id": "5f07f7d6-8eaf-418e-87a1-8dc063135003"
        },
        "id": 28446,
        "state": "COMPLETED",
        "serviceConnection": {
          "serviceCode": "swiftstack-aaaa",
          "name": "Object Storage",
          "id": "4fa42796-6b93-4d9f-b5f7-34c4d1c796ea",
          "type": "swiftstack"
        }
      }
    ],
    "organization": {
      "name": "Operator",
      "id": "1b47df69-6458-4ea6-8c4b-2894b3f7ec00"
    },
    "name": "Rollback",
    "description": "Fix bug in pipeline for date conversion",
    "id": "6064e10e-a105-423a-b724-ba470bf42e79",
    "state": "COMPLETED",
    "type": "REPROCESS"
  }
}
```

| Attributes                   | &nbsp;                                                                                                                               |
| ---------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| `id`<br/>_UUID_              | The UUID of the rollback trigger provider.                                                                                           |
| `name`<br/>_string_          | The name of the rollback.                                                                                                            |
| `description`<br/>_string_   | The description of the rollback (optional).                                                                                          |
| `organization.id`<br/>_UUID_ | The UUID of the organization (reseller) responsble for creating the rollback trigger.                                                |
| `type`<br/>_string_          | The type of the rollback: Possible values are `REPROCESS, RECOLLECT`.                                                                |
|                              | The `REPROCESS` type is only available to users with operator permission.                                                            |
|                              | The `RECOLLECT` type is available to connection owners and operators.                                                                |
| `state`<br/>_enum_           | The state of the rollback. Possible values are: `COMPLETED`, `SCHEDULED` & `PENDING`.                                                |
| `createdDate`<br/>_string_   | The date the rollback trigger was created.                                                                                           |
| `resetDate`<br/>_string_     | The date in which we want to start the rollback (inclusive).                                                                         |
| `rollbacks`<br/>_Array_      | A list of rollbacks scoped to a service connection and organization that were generated based on the rollback trigger configuration. |

<!-------------------- CREATE A ROLLBACK TRIGGER -------------------->

### Create a rollback trigger

`POST /rollbacks`

Creates a rollback which will result in reprocessing of usage for the given request body. The Rollback API supports two types of rollback. `REPROCESS` and `RECOLLECT`

The `REPROCESS` rollback type uses existing usage that was previously collected from a backend service and re-processes it in the monetization engine. The latest pricing configuration will be used when these records. 
The API body supports targeting a set of service connections and organizations as well as the date from which the rollback should begin. If usage is not found for for the requested date and organization and service connection pair the API will default to the earliest available usage for the pair. If there is no previous usage for the organization and connection, no rollback will be generated for this pair.

<aside class="notice">
  <strong>Note:</strong> A rollback will be performed for every valid pair of organizations and service connections. Rollbacks will only be performed when the organization is assigned the connection and has some previous usage for this connection.
</aside>

The `RECOLLECT` rollback type can be used by connection owners to retrigger the collection of usage from the underlying backend service. The `RECOLLECT` rollback is limitted by the retention period of underlying usage of the targeted service. If for example the targeted service only stores 60 days of usage the earliest reset date will be 60 days before today. A recollect rollback impacts **all** assigned organizations of the selected service connection. 

Note: this operation will take time and the state of the rollbacks will update once the operation is complete. 

Once a rollback is complete the usage on the customer usage reports after the selected reset date should reflect the latest pricing configuration applied. 
Rollbacks of all types will **not** impact issued, paid or overdue invoices. Only invoices that are not in the hands of customers will be regenerated. 

> Note: You must have the Reseller pricing permission on the target reseller. If the caller does not have the correct permissions or the reseller with the ID provided does not exist then a `404 Not Found` response will be returned.


```shell
# Retrieve rollback triggers
curl "https://cloudmc_endpoint/rest/rollbacks/23910576-d29f-4c14-b663-31d728ff49a5" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "name": "Rollback - Object Storage",
  "description": "This rollback correct API errors from the service",
  "type": "REPROCESS",
  "organization": {
    "id": "1b47df69-6458-4ea6-8c4b-2894b3f7ec00"
  },
  "resetDate": "2022-01-10",
  "serviceConnectionIds": ["4fa42796-6b93-4d9f-b5f7-34c4d1c796ea"],
  "organizationIds": ["5f07f7d6-8eaf-418e-87a1-8dc063135003"]
}
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "resetDate": "2022-01-10",
    "rollbacks": [
      {
        "resetDate": "2022-01-10",
        "organization": {
          "name": "WhitePages",
          "id": "5f07f7d6-8eaf-418e-87a1-8dc063135003"
        },
        "id": 28447,
        "state": "SCHEDULED",
        "serviceConnection": {
          "serviceCode": "swiftstack-aaaa",
          "name": "Object Storage",
          "id": "4fa42796-6b93-4d9f-b5f7-34c4d1c796ea",
          "type": "swiftstack"
        }
      }
    ],
    "organization": {
      "id": "1b47df69-6458-4ea6-8c4b-2894b3f7ec00"
    },
    "name": "Rollback - Object Storage",
    "description": "This rollback correct API errors from the service",
    "id": "eb484aea-cf19-4db1-8329-507d8a0d5c17",
    "state": "SCHEDULED",
    "type": "REPROCESS"
  }
}
```

| Attributes                         | &nbsp;                                                                                                                            |
| ---------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `id`<br/>_UUID_                    | The UUID of the rollback trigger provider.                                                                                        |
| `name`<br/>_string_                | The name of the rollback.                                                                                                         |
| `description`<br/>_string_         | The description of the rollback (optional).                                                                                       |
| `organization.id`<br/>_UUID_       | The UUID of the organization (reseller) responsble for creating the rollback trigger.                                             |
| `type`<br/>_string_                | The type of the rollback: Possible values are `REPROCESS, RECOLLECT`.                                                             |
|                                    | The `REPROCESS` type is only available to users with operator permission.                                                         |
|                                    | The `RECOLLECT` type is available to connection owners and operators.                                                             |
| `resetDate`<br/>_string_           | The date in which we want to start the rollback (inclusive).                                                                      |
| `organizationIds`<br/>_Array_      | The list of targeted organization IDs to apply the rollback.                                                                      |
| `serviceConnectionIds`<br/>_Array_ | The list of affected service connection IDs to apply the rollback.                                                                |
