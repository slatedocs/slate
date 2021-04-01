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
        "action": "ALLOW",
        "enabled": "true",
        "id": "1533148",
        "ipEnd": "20.20.20.20",
        "ipStart": "10.10.10.10",
        "name": "Rule 1 ",
        "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb"
    },
    {
        "action": "BLOCK",
        "enabled": "true",
        "id": "1533345",
        "ipEnd": "192.1.1.2",
        "ipStart": "192.0.0.1",
        "name": "Rule 2 ",
        "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb"
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
`action`<br/>*string* | Filter IP addresses, which are either ALLOW or BLOCK. This parameter is optional. If not provided, it will return both the type of IP addresses.
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to. This parameter is required.

Attributes | &nbsp;
------- | -----------
`action`<br/>*string* | Either ALLOW or BLOCK.
`enabled`<br/>*boolean* | Whether or not the rule is enabled.
`id`<br/>*string* | The unique identifier for the rule.
`ipEnd`<br/>*string* | The end ip adress for the rule.
`ipStart`<br/>*string* | The start ip adress for the rule.
`name`<br/>*string* | The name of the rule.
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to.

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
    "action": "ALLOW",
    "enabled": "true",
    "id": "1533148",
    "ipEnd": "20.20.20.20",
    "ipStart": "10.10.10.10",
    "name": "Rule 1 ",
    "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb"
    },
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to. This parameter is required.

Attributes | &nbsp;
------- | -----------
`action`<br/>*string* | Either ALLOW or BLOCK.
`enabled`<br/>*boolean* | Whether or not the rule is enabled.
`id`<br/>*string* | The unique identifier for the rule.
`ipEnd`<br/>*string* | The end ip adress for the rule.
`ipStart`<br/>*string* | The start ip adress for the rule.
`name`<br/>*string* | The name of the rule.
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to.

<!-------------------- CREATE A FIREWALL RULE -------------------->

### Create a firewall rule

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
  "enabled": true,
  "ipEnd": "192.168.0.7",
  "ipStart": "192.168.0.6",
  "name": "firewall rule",
  "siteId": "1c6c127a-bfa4-4c85-a329-13c0581b41eb"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Restrict access to a site using allow and block rules.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*string* | The ID of the site for which to create the firewall rule. This parameter is required.

Required| &nbsp;
------------------------| -----------
`action`<br/>*string* | Either ALLOW or BLOCK.
`ipStart`<br/>*string* | The start ip adress for the rule. When no `ipEnd` attribute is provided, the rule only applies for the ip provided in `ipStart`.
`name`<br/>*string* | The name of the rule.

Optional| &nbsp;
----------------------- | -----------
`enabled`<br/>*boolean* | Whether or not the rule is enabled. The default value is false.
`ipEnd`<br/>*string* | The end ip adress for the rule.
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to.

<!-------------------- EDIT A FIREWALL RULE -------------------->

### Edit a firewall rule

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/firewallrules/1576836?siteId=1c6c127a-bfa4-4c85-a329-13c0581b41eb"
```
> Request body example:

```json
{
  "action": "ALLOW",
  "enabled": true,
  "id": "1576836",
  "ipEnd": "192.1.1.2",
  "ipStart": "192.0.0.1",
  "name": "allow.rule.cloudmc.xzp12",
  "siteId": "1c6c127a-bfa4-4c85-a329-13c0581b41eb"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/firewallrules/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Edit a firewall rule.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to. This parameter is required.

Required | &nbsp;
------- | -----------
`action`<br/>*string* | Either ALLOW or BLOCK.
`ipStart`<br/>*string* | The start ip adress for the rule.
`name`<br/>*string* | The name of the rule.

Optional | &nbsp;
------- | -----------
`enabled`<br/>*boolean* | Whether or not the rule is enabled. The default value is false.
`id`<br/>*string* | The unique identifier for the rule.
`ipEnd`<br/>*string* | The end ip adress for the rule.
`siteId`<br/>*string* | The ID of the site for which the firewall rule is applied to.

<!-------------------- DELETE A FIREWALL RULE -------------------->

### Delete a firewall rule

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

Delete a firewall rule

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the firewall rule. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the firewall rule deletion.
`taskStatus` <br/>*string* | The status of the operation.