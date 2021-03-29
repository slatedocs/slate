## Firewall Rules

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
