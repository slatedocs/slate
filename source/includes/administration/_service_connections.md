## Service connections

Service connections are the services that you can create resources for (e.g. compute, object storage). [Environments](#administration-environments) are created for a specific service which allows you to create and manage resources within that service.

<!-------------------- LIST ORGANIZATIONS -------------------->
### List service connections

`GET /services/connections`

```json
{
  "data":[{
    "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
    "serviceCode": "compute-qc",
    "name": "Compute - Québec",
    "type": "CloudCA",
    "status": {  
      "lastUpdated": "2017-08-15T12:00:00.000Z",
      "reachable": true
    }
  }]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the service connection
`serviceCode`<br/>*string* | The service code of the service connection. It is used in the endpoint of the services API.
`name`<br/>*string* | The name of the service connection
`type`<br/>*string* | The type of the service connection.
`status`<br/>*Object* | Status of the service connection. Tells you if the service is up.<br/>*includes*: `lastUpdated`, `reachable`


<!-------------------- GET ORGANIZATION -------------------->

### Retrieve a service connection

`GET /services/connections/:id`

```json
{
  "data":[{
    "id": "adfbdb51-493b-45b1-8802-3f6327afb9e6",
    "serviceCode": "compute-qc",
    "name": "Compute - Québec",
    "type": "CloudCA",
    "status": {  
      "lastUpdated": "2017-08-15T12:00:00.000Z",
      "reachable": true
    }
  }]
}
```

Attributes | &nbsp;
---- | -----------
`id`<br/>*UUID* | The id of the service connection
`serviceCode`<br/>*string* | The service code of the service connection. It is used in the endpoint of the services API.
`name`<br/>*string* | The name of the service connection
`type`<br/>*string* | The type of the service connection.
`status`<br/>*Object* | Status of the service connection. Tells you if the service is up.<br/>*includes*: `lastUpdated`, `reachable`

<!-------------------- GET APIINFO -------------------->

### Retrieve API credentials

`GET /services/connections/:id/apiInfo`

```shell
# Retrieve your API credentials
curl -X GET \
  "https://cloudmc_endpoint/v1/services/connections/[id]/apiInfo?environmentId=[id]" \
  -H "MC-Api-Key: your_api_key" \
# Response body example
```
```json
{
    "data": {
        "canRegenerateCredentials": true,
        "fields": [{
            "key": "endpoint",
            "value": "https://your_endpoint.com/auth",
            "sensitive": false
        }, {
            "key": "api_key",
            "value": "my_api_key",
            "sensitive": true
        }, {
            "key": "secret_key",
            "value": "my_secret_key",
            "sensitive": true
        }, {
            "key": "project_id",
            "value": "079bdead-61b5-4b38-86ed-dbbf963808ec",
            "sensitive": false
        }]
    }
}
```

Retrieve your API keys for some environment within a service. A user can only access their own API keys and only for environments where they are a member.

Query Parameters (*required*) | &nbsp;
---------- | -----
`environmentId`<br/>*UUID* | The id of the environment.


Attributes | &nbsp;
---- | -----------
`canRegenerateCredentials`<br/>*boolean* | True if the user can regenerate their API keys for the service.
`fields`<br/>*Array[object]* | An array of objects that describe the different parameters (*e.g. endpoint, api_key, secret_key, project_id*) comprised in the users' API credentials.<br/>*includes*: `key`, `value` and `sensitive`

<!-------------------- GET PARAMETERS -------------------->

### Retrieve connection parameters

`GET /services/connections/:id/parameters`

```shell
# Retrieve the connection parameters
curl -X GET \
  "https://cloudmc_endpoint/v1/services/connections/[id]/parameters" \
  -H "MC-Api-key: your_api_key" \
# Response body example
```
```json
{
    "data": [{
        "parameter": "jsonCredentials",
        "id": "ee7f5ba3-3efc-4efd-819b-1dd947b3473a",
        "value": "JSON representation of credentials here",
        "serviceConnection": {
            "id": "d461e683-30c9-4b4e-bab6-def1a3575227"
        }
    }, {
        "parameter": "billingAccountId",
        "id": "cd404ae3-884d-4b38-a9b7-cd1bba5c0a46",
        "value": "02C9H96Q-2H1JS2-K9SJD8",
        "serviceConnection": {
            "id": "d461e683-30c9-4b4e-bab6-def1a3575227"
        } 
    }]
}
```

Retrieve a service connection's parameters, used to create and manage connections to services. You can retreive these parameteres only if you are assigned a role that has the `Manage Service connections` permission granted to it.

Attributes | &nbsp;
---- | -----------
`data`<br/>*Array[object]* | An array of objects that describe the service connection parameters.<br/>*includes*: `parameter`, `id`, `value` and `serviceConnection.id`