### Object Storage API Credentials

View and manage your FlashBlade's s3 object-storage API credentials. You need to be a member of the environment to operation on these resources.

<!-------------------- LIST CREDENTIALS -------------------->

#### List credentials

```shell
curl --request GET \
  --url 'https://cloudmc_endpoint/v1/services/purestorage/test-env/apiCredentials/:regionName' \
  --header 'Mc-Api-key: your_api_key'
```

> The above command returns JSON structured like this:

```json 
{
	"data": [
		{
			"accessKeyId": "AKIASQ3YW7O2RARDARUO",
			"region": "montreal"
		}
	],
	"metadata": {
		"recordCount": 1
	}
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials</code>

Retrieves a list of object storage s3 API credentials. There will only ever be one entry per region, if credentials exist for that region. 

| Attributes                 | &nbsp;                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `accessKeyId`<br/>_string_ | The ID for your s3 access key.                                                                                              |
| `region`<br/>_string_      | The region the access key belongs to.                                                  |

<!-------------------- GET CREDENTIALS -------------------->

#### Get credentials

```shell
curl --request GET \
  --url 'https://cloudmc_endpoint/v1/services/purestorage/test-env/apiCredentials/:regionName' \
  --header 'Mc-Api-key: your_api_key'
```

> The above command returns a JSON structured like this:

```json
{
	"data": {
		"accessKeyId": "AKIASQ3YW7O2RARDARUO",
		"region": "montreal"
	}
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials/:regionName</code>

Retrieves an access key by region.

| Attributes                 | &nbsp;                                                                                                                      |
| -------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| `accessKeyId`<br/>_string_ | The ID for your s3 access key.                                                                                              |
| `region`<br/>_string_      | The region the access key belongs to.                                                     |



<!-------------------- GENERATE CREDENTIALS -------------------->

#### Generate credentials

```shell
curl --request POST \
  --url 'https://cloudmc_endpoint/rest/services/purestorage/test-env/apiCredentials?operation=generate' \
  --header 'Content-Type: application/json' \
  --header 'Mc-Api-key: your_api_key' \
  --data '{
		"region": "montreal"
	}'
```

> The above command returns JSON structured like this:

```json
{
	"data": {
		"accessKeyId": "AKIASQ3YW7O2YA4SUQEC",
		"secretKey": "YOUR_SECRET_KEY",
		"region": "montreal"
	},
	"taskId": "fa565b90-e530-4abe-b88a-8aa6adc4dfc6",
	"taskStatus": "SUCCESS"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials?operation=generate</code>

Generates, or regenerates if credentials are existing, access key credentials on the purestorage environment. Regenerating will *permanently* delete the previous credentials saved for your user. 

The secret key should be saved immediately after generation as it will be not be retrievable afterwards.

<aside class="warning">
If you have an existing access key, this will delete and replace that key.
</aside>

<aside class="notice">
You should be saving the secret key as it will only be shown at the generation step.
</aside>

| Required                   | &nbsp;                                              				 |
|----------------------------|-------------------------------------------------------------------|
| `region` <br/>*string*     | The PureStorage Flashblade you want to create the credentials on. |

Return value:

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `accessKeyId`<br/>_string_ | The ID for your object storage's s3 API access key.                                         |
| `secretKey`<br/>_string_   | The secret key for your object storage's s3 API access key. Should be saved.                |
| `region`<br/>_string_      | The region the access key belongs to. Values depend on the configuration of the PureStorage plugin. |
| `taskId` <br/>*string*     | The [task ID](#tasks).                            |
| `taskStatus` <br/>*string* | The status of the operation.                                           | 

#### Delete credentials
```shell
curl --request DELETE \
  --url `https://cloudmc_endpoint/rest/services/purestorage-aaaa/emcilroy-local/apiCredentials/montreal` \
  --header 'Mc-Api-Key: your_api_key'
```

> The above command returns JSON structured like this:

```json
{
	"taskId": "0773c033-8f0c-4366-bfe3-ca544b7cb3ac",
	"taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apiCredentials/:regionName</code>

Deletes the access credentials for your purestorage environment.

Return value:

| Attributes                 | &nbsp;                                        |
|----------------------------|-----------------------------------------------|
| `taskId` <br/>*string*     | The [task ID](#tasks).   |
| `taskStatus` <br/>*string* | The status of the operation.                  | 