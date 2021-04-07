### Delivery Rules

Set up delivery rules to improve access, security and set custom rules.

<!-------------------- LIST DELIVERY_RULE -------------------->

#### List delivery rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliveryrules?siteId=dcc2771d-a524-4f8c-a666-f699985d6961"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "fc72c60a-d411-4b35-9deb-9dbc889faf7e",
      "name": "addHeader",
      "slug": "portal-ui-custom-1617310238955",
      "stackId": "fd157f7c-e5cd-439b-b6c5-5864583a8ce8",
      "siteId": "dcc2771d-a524-4f8c-a666-f699985d6961"
    },
    {
      "id": "d411c60a-d411-4b35-9deb-f699985d6961",
      "name": "removeHeader",
      "slug": "portal-ui-custom-1617310238955",
      "stackId": "fd157f7c-e5cd-439b-b6c5-5864583a8ce8",
      "siteId": "dcc2771d-a524-4f8c-a666-f699985d6961"  
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliveryrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Retrieve a list of all delivery rules in a given [environment](#administration-environments) within a site.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | A delivery rule's unique identifier. 
`name`<br/>*string* | The name of the delivery rule.
`slug`<br/>*string* | A delivery rule's programmatic name.
`stackId`<br/>*string* | The ID of the stack that the delivery rule belongs to.
`siteId`<br/>*string* | The ID of the site that the delivery rule is applied to.

<!-------------------- DELETE A DELIVERY RULE -------------------->

#### Delete a delivery rule

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
