### API Credentials

View and manage your s3 object-storage API credentials. You need to be a member of the environment to operation on these resources.

<!-------------------- LIST CREDENTIALS -------------------->

#### List credentials

```shell
curl --request GET \
  --url 'https://cloudmc_endpoint/v1/services/aws/test-env/apiCredentials/global' \
  --header 'Mc-Api-key: your_api_key'
```

> The above command returns JSON structured like this:

```json 
{
	"data": [
		{
			"accessKeyId": "AKIASQ3YW7O2RARDARUO",
			"region": "global"
		}
	],
	"metadata": {
		"recordCount": 1
	}
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials</code>

Retrieves a list of aws s3 API credentials. There will only ever be one time in this list if a user has credentials.

| Attributes                 | &nbsp;                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `accessKeyId`<br/>_string_ | The ID for your s3 access key.                                                                                              |
| `region`<br/>_string_      | The region the access key belongs to. Will always be 'global' for AWS.                                                      |

<!-------------------- GET CREDENTIALS -------------------->

#### Get credentials

```shell
curl --request GET \
  --url 'https://cloudmc_endpoint/v1/services/aws/test-env/apiCredentials/global' \
  --header 'Mc-Api-key: your_api_key'
```

> The above command returns a JSON structured like this:

```json
{
	"data": {
		"accessKeyId": "AKIASQ3YW7O2RARDARUO",
		"region": "global"
	}
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials/global</code>

Retrieves an access key by region. The only region supported for AWS is 'global'. 

| Attributes                 | &nbsp;                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `accessKeyId`<br/>_string_ | The ID for your s3 access key.                                                                                              |
| `region`<br/>_string_      | The region the access key belongs to. Will always be 'global' for AWS.                                                      |



<!-------------------- GENERATE CREDENTIALS -------------------->

#### Generate credentials

```shell
curl --request POST \
  --url 'https://cloudmc_endpoint/rest/services/aws/test-env/apiCredentials?operation=generate' \
  --header 'Mc-Api-key: your_api_key'
```

> The above command returns JSON structured like this:

```json
{
	"data": {
		"accessKeyId": "AKIASQ3YW7O2YA4SUQEC",
		"secretKey": "YOUR_SECRET_KEY",
		"region": "global"
	},
	"taskId": "fa565b90-e530-4abe-b88a-8aa6adc4dfc6",
	"taskStatus": "SUCCESS"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials?operation=generate</code>

Generates, or regenerates if credentials are existing, access key credentials on the AWS environment. Regenerating will *permanently* delete the previous credentials saved for your user. 

The secret key should be saved immediately after generation as it will be not be retrievable afterwards.

<aside class="warning">
If you have an existing access key, this will delete and replace that key.
</aside>

<aside class="notice">
You should be saving the secret key as it will only be shown at the generation step.
</aside>

Return value:

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `accessKeyId`<br/>_string_ | The ID for your s3 access key.                                         |
| `secretKey`<br/>_string_   | The secret key for your s3 access key. Should be saved.                |
| `region`<br/>_string_      | The region the access key belongs to. Will always be 'global' for AWS. |
| `taskId` <br/>*string*     | The task ID.                            |
| `taskStatus` <br/>*string* | The status of the operation.                                           | 

#### Delete credentials
```shell
curl --request DELETE \
  --url `https://cloudmc_endpoint/rest/services/aws-aaaa/emcilroy-local/apiCredentials/global` \
  --header 'Mc-Api-Key: your_api_key'
```

> The above command returns JSON structured like this:

```json
{
	"taskId": "0773c033-8f0c-4366-bfe3-ca544b7cb3ac",
	"taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials/global</code>

Deletes the access credentials for your aws environment.

Return value:

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The task ID.   |
| `taskStatus` <br/>*string* | The status of the operation.                  | 