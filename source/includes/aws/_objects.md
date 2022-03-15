### Objects

View and manage your objects within a bucket.

<!-------------------- DELETE AN OBJECT -------------------->

#### Delete Objects

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/rest/services/aws/test-env/objects/:regionName/:bucketName/:pathToObject/?operation=object_delete"
```

> Request body examples:

```json
{
	"fullPath": "images/",
  "id": "ap-south-1/bucket-root-dwyak/images/",
}
```

> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/objects/:regionName/:bucketName/:fullPath</code>
| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the bucket deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

