### Objects

View and manage your objects within a bucket.

<!-------------------- UPLOAD AN OBJECT -------------------->

#### Upload Object

```shell
curl -X POST \
   -H "X-CSRF-TOKEN: your_token" \
   -H "Cookie: session_id" \
   "https://cloudmc_endpoint/rest/services/operation/upload" \
   --form operation=upload \
   --form entityType=objects \
   --form serviceConnectionId=connection_id \
   --form environmentId=environment_id \
   --form filename=file_size \
   --form bucketName=bucket_name \
   --form regionName=region_name \
   --form file=path_to_file
```

> Request body examples as Multipart Form:

```json
operation: upload
entityType: objects
serviceConnectionId: connection_id
environmentId: environment_id
filename: file_size
bucketName: bucket_name
regionName: region_name
file: path_to_file
```

> The above command returns a JSON structured like this:

```json
{
	"files": [
		{
			"name": "filename.png",
			"size": 93240,
			"status": "success"
		}
	]
}
```

<code>POST /services/operation/upload</code>

Attributes | &nbsp;
---------- | -----
`filename: file_size`<br/>*string* | Multipart form part: key-value pair with the name of the file as key and its file size as value.
`bucketName`<br/>*string* | Multipart form part: key-value pair with "bucketName" as key and the name of the bucket to upload to as value.
`regionName`<br/>*string* | Multipart form part: key-value pair with "regionName" as key and the name of the region to upload to as value.
`file`<br/>*file* | Multipart form part: key-value pair with "file" as key and the file to upload as value.


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
| `taskId` <br/>*string*     | The task id related to the object deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

