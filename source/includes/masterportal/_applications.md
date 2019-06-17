### Applications

Applications' login can be automated by MasterPortal. It has an entrypoint that points to the MasterPortal proxy and can have credentials added to it. 

#### Add Credentials

```shell
Example Request: 
curl --request POST \
  --url 'https://cloudmc_endpoint/v2/services/mp-devel/test-applications/apps/b6c4ca5b-e85a-41d3-80b2-5d21d6ce7060?operation=addCredentials' \
  --header 'mc-api-key: your_api_key' \
  --data '{
	"username": "sample_username",
	"password": "sample_password"
}'
```
```json
Example Response: 
{
  "taskId": "ac3144ab-03c8-4564-afbf-fabf5fc68199",
  "taskStatus": "SUCCESS"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apps/:id</code>

Add credentials to your own user for the given application.

Required | &nbsp;
---------- | -----
`username`<br/>*string* | The username for the application
`password`<br/>*string* | The password for the application

#### Add Credentials for Another User

```shell
Example Request: 
curl --request POST \
  --url 'https://cloudmc_endpoint/v2/services/mp-devel/test-applications/appUser/1a578977-5744-4832-bae3-d91ad2939adf:b6c4ca5b-e85a-41d3-80b2-5d21d6ce7060?operation=addUserCredentials' \
  --header 'content-type: application/json' \
  --header 'mc-api-key: your_api_key' \
  --data '{
	"cloudMcUserId": "1a578977-5744-4832-bae3-d91ad2939adf",
	"app": {
		"id": "b6c4ca5b-e85a-41d3-80b2-5d21d6ce7060",
		"username": "sample_username",
		"password": "sample_password"
	}
}'

```
```json
Example Response: 
{
  "taskId": "ecdd71ea-1648-44d2-a9cf-71b160acab17",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/appUser/:id</code>

Add credentials to another user for the given application. Note the appUser's id
is their [CloudMC user](#administration-users) id and [application](#masterportal-applications) id concatenated like `<cloudMcUserId>:<appId>`.

Required | &nbsp;
---------- | -----
`cloudMcUserId`<br/>*UUID* | The id for the *cloudmc* user to which the credentials should be added
`app > id`<br/>*UUID* | The id of the [application](#masterportal-applications) to which the credentials should be added
`app > username`<br/>*string* | The username for the application
`app > password`<br/>*string* | The password for the application

#### Login to An Application

```shell
Example Request: 
curl --request POST \
  --url 'https://cloudmc_endpoint/v2/services/mp-devel/test-applications/apps/d5484354-28a3-45be-a536-0b02ef3c8e23?operation=login' \
  --header 'mc-api-key: your_api_key' 
```

```json
Example Response: 
{    
  "data": "https://mp_proxy_endpoint/portal/login-path/427f5873-7edf-4bba-ba65-8c927776da81/d5484354-28a3-45be-a536-0b02ef3c8e23/datadog-ukqrqhie/f59139e1-82e5-4526-bd5d-04c777a55f2a/b7f0bdd5-b544-d07e-ee56-4ee0d1a8a9c3",
  "taskId": "38805aa4-0a30-4197-8ce9-f79872080773",
  "taskStatus": "SUCCESS"
}
```

  <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/apps/:id?operation=login</code>

  Login to the provided application. You can only login as your own user. Thus, you must have credentials set on your own user for the specific application.

