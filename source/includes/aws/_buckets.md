### Buckets

View and manage your buckets.

<!-------------------- GET Bucket -------------------->

#### Retrieve a Bucket

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/rest/services/aws/test-env/buckets/us-east-1/bucket-nsturk-lullp"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "size": 123123,
        "keyCount": 4,
        "id": "us-east-1/bucket-nsturk-lullp",
        "name": "bucket-nsturk-lullp",
        "region": "us-east-1",
        "created": "Tue Mar 22 16:15:03 UTC 2022",
        "url": "https://bucket-nsturk-lullp.s3.us-east-1.amazonaws.com/",
        "access": "private"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets/:regionName/:bucketName</code>

Retrieve a list of all buckets from Amazon S3.

| Attributes | &nbsp; |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the bucket, which is of the form `:regionName/:bucketName`.
| `name`<br/>*string*               | The name of the bucket.
| `region`<br/>*string*             | The region the bucket exists in.
| `created`<br/>*string*            | The date the bucket was created.
| `url`<br/>*string*                | The full endpoint url used to make api calls on the bucket.
| `size`<br/>*integer*               | The size of the bucket in bytes. Ommited if query parameter details=`false`.
| `keyCount`<br/>*integer*           | The number of objects inside the bucket. Ommited if query parameter details=`false`.

| Optional Query Parameters | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `details` <br/>*boolean*  | Whether to include more details about the bucket, if ommited defaults to `true` and returns extra parameters `size` and `keyCount`.  |

<!-------------------- GET buckets -------------------->

#### List Buckets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/rest/services/aws/test-env/buckets"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "us-east-1/bucketOne",
            "name": "bucketOne",
            "region": "us-east-1",
            "created": "Tue Mar 01 16:13:29 EST 2022",
            "url": "https://bucketOne.s3.amazonaws.com/"
        },
        {
            "id": "ap-south-1/bucketTwo",
            "name": "bucketTwo",
            "region": "ap-south-1",
            "created": "Fri Mar 04 16:20:29 EST 2022",
            "url": "https://bucketTwo.s3.amazonaws.com/"
        }
    ],
    "metadata": {
        "recordCount": 2
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets</code>

Retrieve a list of all buckets from Amazon S3.

| Attributes | &nbsp; |
|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `id`<br/>*string*                 | The ID of the bucket, which is of the form `:regionName/:bucketName`.
| `name`<br/>*string*               | The name of the bucket.
| `region`<br/>*string*             | The region the bucket exists in.
| `created`<br/>*string*            | The date the bucket was created.
| `url`<br/>*string*                | The full endpoint url used to make api calls on the bucket.


<!-------------------- Create bucket -------------------->

#### Create Bucket

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/rest/services/aws/test-env/buckets?operation=create"
```

> Request body examples:

```json
{
  "access": "private",
  "name": "bucket-root-agejo",
  "region": "us-east-1",
}
```


> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets&operation=create</code>

Create a bucket in Amazon S3.

| Mandatory Body Parameters                   | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `access` <br/>*string*     | The desired access level of the bucket. The list of supported Canned ACL is: private, public-read, public-read-write, authenticated-read, log-delivery-write, aws-exec-read.     |
| `name` <br/>*string*       | The name of the bucket.                       |
| `region` <br/>*string*     | The region to create the bucket in.           |

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the bucket creation.   |
| `taskStatus` <br/>*string* | The status of the operation.                  |

| Mandatory Query Parameters | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `operation` <br/>*string*  | The type of operation to execute. In this case, `create`. |


<!-------------------- Update bucket -------------------->

#### Update Bucket Permissions

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/rest/services/aws/test-env/buckets/:regionName/:bucketName?operation=edit_privileges"
```

> Request body examples:

```json
{
	"access": "public-read"
}
```

> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets/:regionName/:bucketName?operation=edit_privileges</code>

Update the canned ACL of a buckets from Amazon S3.

Mandatory Body Parameters | &nbsp;
---------- | -----
`access`<br/>*string* | The name of the Canned ACL to be assigned to the bucket. The list of supported Canned ACL is: private, public-read, public-read-write, authenticated-read, log-delivery-write, aws-exec-read.

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the bucket creation.   |
| `taskStatus` <br/>*string* | The status of the operation.                  |

| Mandatory Query Parameters | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `operation` <br/>*string*  | The type of operation to execute. In this case, `edit_privileges`. |

<!-------------------- DELETE A BUCKET -------------------->

#### Delete Bucket

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/rest/services/aws/test-env/buckets/us-east-1/bucketOne&operation=delete"
```
> The above command returns a JSON structured like this:

```json
{
    "taskId": "30121175-926a-4fd2-991b-ff303ffdf905",
    "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/buckets/:regionName/:bucketName&operation=delete</code>

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task id related to the bucket deletion. |
| `taskStatus` <br/>*string* | The status of the operation.                  |

| Mandatory Query Parameters | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `operation` <br/>*string*  | The type of operation to execute. In this case, `delete`. |


