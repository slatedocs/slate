### Affinity groups

Affinity groups are a way of influencing on which host an [instance](#cloudstack-instances) will be deployed. An anti-affinity group (the only type of affinity group we support) allows you to put [instances](#cloudstack-instances) on different hosts to increase fault-tolerance. In the unlikely event of a host failure, your services would still be up on another host (assuming you distribute your services on multiple instances).

<!-------------------- LIST AFFINITY GROUPS -------------------->

#### List affinity groups

```shell
curl -X GET \
  -H "MC-Api-Key: your_api_key" \
  "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/affinitygroups"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "id": "d4fd794f-66e1-4906-a720-d0afb04bd517",
    "name": "gnr",
    "type":"host anti-affinity",
    "instanceIds": [
      "92b4df86-fee3-4610-8167-78332b86362f"
    ]
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/affinitygroups</code>

Retrieve a list of all affinity groups in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the affinity group
`name`<br/>*string* | The name of the affinity group
`type`<br/>*string* | The type of affinity group. We only support anti-affinity
`instanceIds`<br/>*Array[UUID]* | The ids of the [instances](#cloudstack-instances) in the affinity group


<!-------------------- RETRIEVE AN AFFINITY GROUP -------------------->

#### Retrieve an affinity group

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/affinitygroups/d4fd794f-66e1-4906-a720-d0afb04bd517"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "d4fd794f-66e1-4906-a720-d0afb04bd517",
    "name": "gnr",
    "type": "host anti-affinity",
    "instanceIds": [
      "92b4df86-fee3-4610-8167-78332b86362f"
    ]
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/affinitygroups/:id</code>

Retrieve information about an affinity group.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the affinity group
`name`<br/>*string* | The name of the affinity group
`type`<br/>*string* | The type of affinity group. We only support anti-affinity
`instanceIds`<br/>*Array[UUID]* | The ids of the [instances](#cloudstack-instances) in the affinity group



<!-------------------- CREATE AN AFFINITY GROUP -------------------->

#### Create an affinity group

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/affinitygroups"
```
> Request body example:

```json
{
   "name": "gnr",
   "description": "My affinity group",
   "type": "host anti-affinity",
   "instanceIds": [
     "92b4df86-fee3-4610-8167-78332b86362f"
   ]
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/affinitygroups</code>

Create an affinity group and add [instances](#cloudstack-instances) to it.

Required | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the new affinity group
`description`<br/>*string* | A description of the affinity group
`type`<br/>*string* | The type of new affinity group. We only support anti-affinity
`instanceIds`<br/>*Array[UUID]* | The ids of the [instances](#cloudstack-instances) in the affinity group



<!-------------------- UPDATE AN AFFINITY GROUP -------------------->

#### Update an affinity group

```shell
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/affinitygroups/d4fd794f-66e1-4906-a720-d0afb04bd517"
```
> Request body example:

```json
{
   "instanceIds": [
     "92b4df86-fee3-4610-8167-78332b86362f",
     "105f8b5e-5482-4bf5-88ca-7d7b7f431e3e"
   ]
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/affinitygroups/:id</code>

Update the list of [instances](#cloudstack-instances) in the affinity group.

Required | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the new affinity group
`description`<br/>*string* | A description of the affinity group
`type`<br/>*string* | The type of new affinity group. We only support anti-affinity
`instanceIds`<br/>*Array[UUID]* | The ids of the [instances](#cloudstack-instances) in the affinity group


<!-------------------- DELETE AN AFFINITY GROUP -------------------->

#### Delete an affinity group

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/compute-on/test_area/affinitygroups/d4fd794f-66e1-4906-a720-d0afb04bd517"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/affinitygroups/:id</code>

Delete an existing affinity group.
