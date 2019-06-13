## Service connections

Service connections are the services that you can create resources for (e.g. compute, object storage). [Environments](#administration-environments) are created for a specific service which allows you to create and manage resources within that service.

<!-------------------- LIST SERVICE CONNECTIONS -------------------->
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


<!-------------------- GET SERVICE CONNECTION -------------------->

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
  "https://cloudmc_endpoint/v1/services/connections/378442e0-d9a4-4e55-83e3-220ba1f909a8/apiInfo?environmentId=c880f6b2-f52e-40d5-b289-7211c0319ebc" \
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
  "https://cloudmc_endpoint/v1/services/connections/378442e0-d9a4-4e55-83e3-220ba1f909a8/parameters" \
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

<!-------------------- GET CONNECTION POLICY DESCRIPTORS -------------------->

### Retrieve connection policy descriptors

`GET /services/connections/:id/policies/descriptors`

```shell
# Retrieve connection policy descriptors
curl "https://cloudmc_endpoint/v1/services/connections/03bc22bd-adc4-46b8-988d-afddc24c0cb5/policies/descriptors?section=trials" \
   -H "MC-Api-Key: your_api_key"
```

Query Parameters | &nbsp;
---------- | -----
`section`<br/>*string* | The name of the policy section to load. Only the policy section matching the section name provided will return all required FormElements and the connection entity.

```json
{
  "data":[{
    "name": "general",
    "label": "general",
    "optional": false,
  },{
    "name": "trials",
    "formElements": [{
      "label": "cloudstack.service_configuration.policies.trials.network_config_for_trial_env.label",
      "descriptionLabel": "cloudstack.service_configuration.policies.trials.network_config_for_trial_env.description",
      "interpolation": {},
      "options": [{
        "value": "isolatedNetwork",
        "type": "option",
        "name": "cloudstack.service_configuration.policies.trials.network_config_for_trial_env.options.isolated_network",
        "is18n": true
      }, {
        "value": "singleNetwork",
        "type": "option",
        "name": "cloudstack.service_configuration.policies.trials.network_config_for_trial_env.options.single_subnet_vpc",
        "is18n": true
      }],
      "disabled": false,
      "required": true,
      "field": "trials:network_config_for_trial_envs",
      "reloadOnChange": false,
      "sectionsToReload": [],
      "type": "select"
    }],
    "entity": {
      "id": "7486dfbf-740d-49b1-ba68-6e4b0070ebbb",
      "name": "Google Cloud Connection",
      "policies": {
        "version": "1.0",
        "cacheEnabled": "false",
        "regions": "us-east,eu-west"
      }
    }
  }]
}
```

Attributes | &nbsp;
---- | -----------
`name`<br/>*string* | The name of the policy section
`label`<br/>*string* | The label key for the policy section name.
`formElements`<br/>*Array* | The FormElements returned by the policy section. Form elements are only returned for a given section if the query param `section` matches the name of a policy section.  
`optional`<br/>*boolean* | Specifies if the policy section is required or not.
`entity`<br/> *Object* | The service connection entity which includes a string to string map of the ServiceConnectionPolicy::name to ServiceConnectionPolicy::value


<!-------------------- UPDATE CONNECTION POLICIES -------------------->

### Update connection policies

`PUT /services/connections/:id/policies`

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "[{"name": "serviceVersion", "value": "1.1"}, {"name": "cacheEnabled", "value": "true"}]" \
   "https://cloudmc_endpoint/v1/services/connections/03bc22bd-adc4-46b8-988d-afddc24c0cb5/policies"
```

```json
{
  "data":[
    {
      "id": "003c32af-e4e0-440c-871e-f20a81e6c0b7",
      "name": "serviceVersion",
      "value": "1.1"
    },
    {
      "id":"a31f100a-f7c8-43d5-b64d-ee2db466f37d",
      "name": "cacheEnabled",
      "value": "true"
    },
    {
      "id": "c681774a-a96c-4dff-a2a6-2e9651459de7",
      "name": "regions",
      "value":"us-east,eu-west"
    }]
}
```

Attributes | &nbsp;
---- | -----------
`name`<br/>*string* | The name of the policy.
`value`<br/>*string* | The policy value.
