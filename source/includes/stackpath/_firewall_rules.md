## Firewall Rules

Deploy and manage Firewall Rules used to control and limit access to your sites. 

<!-------------------- LIST FIREWALL RULES -------------------->

### List firewall rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/firewallrules?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
        "id": "1533148",
        "name": "Rule 1 ",
        "ipStart": "10.10.10.10",
        "ipEnd": "20.20.20.20",
        "action": "ALLOW",
        "enabled": "true"
    },
    {
        "id": "1533345",
        "name": "Rule 2 ",
        "ipStart": "192.0.0.1",
        "ipEnd": "192.1.1.2",
        "action": "BLOCK",
        "enabled": "true"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the firewall rule is applied to. This parameter is required.
`action`<br/>*string* | Filter IP addresses, which are either ALLOW or BLOCK. This parameter is optional. If not provided, it will return both the type of IP addresses.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The unique identifier for the rule.
`name`<br/>*string* | The name of the rule.
`ipStart`<br/>*string* | The start ip adress for the rule.
`ipEnd`<br/>*string* | There end ip adress for the rule.
`action`<br/>*string* | Either ALLOW or BLOCK.
`enabled`<br/>*string* | Whether the rule is enabled or not.

<!-------------------- RETRIEVE A RULE -------------------->

### Retrieve a firewall rule 

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/firewallrules/1533148?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data":{
    "id": "1533148",
    "name": "Rule 1 ",
    "ipStart": "10.10.10.10",
    "ipEnd": "20.20.20.20",
    "action": "ALLOW",
    "enabled": "true"
    },
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the firewall rule is applied to. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The unique identifier for the rule.
`name`<br/>*string* | The name of the rule.
`ipStart`<br/>*string* | The start ip adress for the rule.
`ipEnd`<br/>*string* | There end ip adress for the rule.
`action`<br/>*string* | Either ALLOW or BLOCK.
`enabled`<br/>*string* | Whether the rule is enabled or not.

### Create a firewall rule

Restrict access to a site using allow and block rules.

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Required Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to create the firewall rule. This parameter is required.

Required Body Attribute | &nbsp;
------------------------| -----------
`action`<br/>*string* | Either ALLOW or BLOCK.
`name`<br/>*string* | The name of the rule.
`ipStart`<br/>*string* | The start ip adress for the rule. When no `ipEnd` attribute is provided, the rule only applies for the ip provided in `ipStart`.

Optional Body Attribute | &nbsp;
----------------------- | -----------
`ipEnd`<br/>*string* | There end ip adress for the rule.

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/firewallrules?siteId=f9dea588-d7ab-4f42-b6e6-4b85f273f3db"
```
> Request body example for creating a firewall rule:

```json
{
    "action": "ALLOW",
    "name": "firewall rule",
    "ipStart": "192.168.0.6",
    "ipEnd": "192.168.0.7"
}
```

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to creation of the firewall rule.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- DELETE A FIREWALL RULE -------------------->

### Delete a firewall rule

Delete a firewall rule in a given [environment](#administration-environments) for a given site ID.

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/firewallrules/2318483?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules/:id?siteId=:siteId</code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the firewall rule. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the firewall rule deletion.
`taskStatus` <br/>*string* | The status of the operation.