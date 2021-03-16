## Scripts


<!-------------------- DELETE A SCRIPT -------------------->

### Delete a script

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/scripts/dd207010-4570-43ee-9ff2-5421d2306b41?siteId=06ca3df8-8e48-491e-b9f9-4ab4afc355ae"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts/:id?siteId=:siteId</code>

Delete a script in a given [environment](#administration-environments) for a given site ID.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the script deletion.
`taskStatus` <br/>*string* | The status of the operation.