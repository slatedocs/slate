## Delivery Rules

Deploy and manage Delivery rules which allow you to modify StackPath CDN settings based on a number of factors like URL visited, HTTP header, and more.

<!-------------------- LIST DELIVERY RULES -------------------->



<!-------------------- RETRIEVE A DELIVERY RULE -------------------->



<!-------------------- CREATE A DELIVERY RULE -------------------->



<!-------------------- EDIT A DELIVERY RULE -------------------->



<!-------------------- DELETE A DELIVERY RULE -------------------->

### Delete a delivery rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliveryrules/90d6a6ed-05a5-4b45-8d5a-e8229f535149?siteId=1c6c127a-bfa4-4c85-a329-13c0581b41eb"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "2c7429dc-64c2-492d-a767-f18c990af164",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliveryrules/:id?siteId=:siteId</code>

Delete a delivery rule.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the delivery rule. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the delivery rule deletion.
`taskStatus` <br/>*string* | The status of the operation.