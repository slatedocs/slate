### Scripts

Deploy and manage Serverless Scripts used to interact with requests made to the site.

<!-------------------- LIST SCIPTS -------------------->

#### List scripts

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/scripts?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "4d13a920-79b7-4129-957b-bd4f006b1ac8",
      "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "scriptName",
      "createdAt": "2021-03-15T19:05:45.157987Z",
      "updatedAt": "2021-03-15T19:05:45.157987Z",
      "version": "1",
      "routes": [
        "v1/api"
      ]
    },
    {
      "id": "28e6b0c7-ee5d-4bd3-abfb-13dfc6e15c0d",
      "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "scriptName2",
      "createdAt": "2021-03-15T18:53:18.587749Z",
      "updatedAt": "2021-03-15T18:53:18.587749Z",
      "version": "1",
      "routes": [
        "v1/api",
        "v2/api"
      ]
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to list the scripts. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The unique identifier for the script.
`stackId`<br/>*UUID* | The ID of the stack that the script belongs to.
`siteId`<br/>*UUID* | The ID of the site that the script belongs to.
`name`<br/>*string* | The display name of the script.
`createdAt`<br/>*string* | Creation timestamp of the script.
`updatedAt`<br/>*string* | The date on which the script was last updated.
`version`<br/>*string* | The version number of the script.
`routes`<br/>*Array[string]* | The routes that incoming requests should respond with a script.

<!-------------------- RETRIEVE A SCRIPT --------------------->

#### Retrieve a script

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/scripts/439b145a-7c55-4a73-8cf2-d8faabfe6d22?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "4d13a920-79b7-4129-957b-bd4f006b1ac8",
    "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
    "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
    "name": "scriptName1",
    "createdAt": "2021-03-15T19:05:45.157987Z",
    "updatedAt": "2021-03-15T19:05:45.157987Z",
    "code": "// sample script
    addEventListener('fetch', event => {
      event.respondWith(handleRequest(event.request));
    });

    /**
    * Fetch and return the request body
    * @param {Request} request
    */
    async function handleRequest(request) {
      // Wrap your script in a try/catch and return the error stack to view error information
      try {
        /* The request can be modified here before sending it with fetch */

        const response = await fetch(request);

        /* The response can be modified here before returning it */

        return response;
      } catch (e) {
        return new Response(e.stack || e, { status: 500 });
      }
    }",
    "version": "1",
    "routes": [
      "v1/api"
    ]
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to list the scripts. This parameter is required.

Retrieve a script of a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The unique identifier for the script.
`stackId`<br/>*UUID* | The ID of the stack that the script belongs to.
`siteId`<br/>*UUID* | The ID of the site that the script belongs to.
`name`<br/>*string* | The display name of the script.
`createdAt`<br/>*string* | Creation timestamp of the script.
`updatedAt`<br/>*string* | The date on which the script was last updated.
`code`<br/>*string* | The contents of the script.
`version`<br/>*string* | The version number of the script.
`routes`<br/>*Array[string]* | The routes that incoming requests should respond with a script.

<!-------------------- CREATE A SCRIPT -------------------->

#### Create a script

Create a new serverless script that allows you to run JavaScript code at the Edge, on all of PoPs with real-time access to each of the requests that come in for your site.

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to create the script. This parameter is required.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The name of the script.
`routes`<br/>*Array[string]* | At least one route in the form of a URI.
`code`<br/>*string* | The JavaScript code used for the script.

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/scripts?siteId=:siteId"
```
> Request body example for creating a script:

```json
{
  "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
  "name": "script-name",
  "routes": ["route"],
  "code": "// sample script
addEventListener('fetch', event => {
  event.respondWith(handleRequest(event.request));
});

/**
 * Fetch and return the request body
 * @param {Request} request
 */
async function handleRequest(request) {
  // Wrap your script in a try/catch and return the error stack to view error information
  try {
    /* The request can be modified here before sending it with fetch */

    const response = await fetch(request);

    /* The response can be modified here before returning it */

    return response;
  } catch (e) {
    return new Response(e.stack || e, { status: 500 });
  }
}"
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "dfc0b899-ac0f-447b-8f50-74bf78d1c034",
  "taskStatus": "PENDING"
}
```

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to creation of the script.
`taskStatus` <br/>*string* | The status of the operation.


<!-------------------- EDIT A SCRIPT -------------------->

#### Edit a script

Edit a script in a given [environment](#administration-environments) for a given site ID.

```shell
curl -X PUT \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/scripts/dd207010-4570-43ee-9ff2-5421d2306b41?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> Request body example for editing a script:

```json
{
  "routes": ["route"],
  "code": "console.log('hello')"
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>


Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to edit the script. This parameter is required.

Optional | &nbsp;
------- | -----------
`routes`<br/>*Array[string]* | At least one route in the form of a URI.
`code`<br/>*string* | The JavaScript code used for the script or the Base64 encoded contents of the script

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to creation of the script.
`taskStatus` <br/>*string* | The status of the operation.


<!-------------------- DELETE A SCRIPT -------------------->

#### Delete a script

Delete a script in a given [environment](#administration-environments) for a given site ID.

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/stackpath/test-area/scripts/dd207010-4570-43ee-9ff2-5421d2306b41?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the script. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the script deletion.
`taskStatus` <br/>*string* | The status of the operation.
