### Sites

Create and manage your CDN, WAF, and/or Serverless Scripting Delivery sites. 

<!-------------------- LIST SITES -------------------->

#### List sites

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
      "domain": "slow-test.com",
      "createdAt": "2021-02-19T19:29:58.713874Z",
      "updatedAt": "2021-02-19T19:30:04.656652Z",
      "services": [
        "CDN",
        "SERVERLESS_EDGE_ENGINE",
        "WAF"
      ],
      "id": "9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5",
      "status": "ACTIVE"
    },
    {
      "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
      "domain": "speedytest.com",
      "createdAt": "2021-02-08T14:57:01.576395Z",
      "updatedAt": "2021-02-08T14:57:09.861832Z",
      "services": [
        "CDN",
        "WAF"
      ],
      "id": "04deb6d1-ad84-425f-8f10-92106a22c3b4",
      "status": "ACTIVE"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites</code>

Retrieve a list of all sites in a given [environment](#administration-environments).

Optional | &nbsp;
------ | -----------
`status`<br/>*string* | Setting the status parameter will return only the **stackpath sites** with that particular status. The site's status can either be `ACTIVE`, `PENDING`, or `PROVISIONING`.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A sites's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`domain`<br/>*string* | The domain of the site.
`status`<br/>*string* | The status of the site. It can either be `ACTIVE`, `PENDING`, or `PROVISIONING`.
`createdAt`<br/>*string* | The date on which the site was created.
`updatedAt`<br/>*string* | The date on which the site was last updated.
`services`<br/>*array* | List of services running on the site.

<!-------------------- RETRIEVE A SITE -------------------->

#### Retrieve a site

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
    "domain": "slow-test.com",
    "createdAt": "2021-02-19T19:29:58.713874Z",
    "updatedAt": "2021-02-19T19:30:04.656652Z",
    "services": [
      "CDN",
      "SERVERLESS_EDGE_ENGINE",
      "WAF"
    ],
    "id": "9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5",
    "status": "ACTIVE",
    "edgeAddress": "v2a4k7y8.stackpathcdn.com",
    "anycastIp": "151.139.128.10",
    "deliveryDomains": [
    {
      "domain": "v2a4k7y8.stackpathcdn.com",
      "validatedAt": "2021-02-26T19:00:15.177411Z"
    },
    {
      "domain": "slow-test.com",
    }],
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id</code>

Retrieve a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A sites's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`domain`<br/>*string* | The domain of the site.
`status`<br/>*string* | The status of the site. It can either be `ACTIVE`, `PENDING`, or `PROVISIONING`.
`createdAt`<br/>*string* | The date on which the site was created.
`updatedAt`<br/>*string* | The date on which the site was last updated.
`services`<br/>*array* | List of services running on the site.
`edgeAddress`<br/>*string* | The edge address of the site.
`anycastIp`<br/>*string* | The anycast IP address that domains should be pointed to.
`deliveryDomains`<br/>*array* | List of delivery domains of the site.
`deliveryDomains.domain`<br/>*string* | A delivery domain of the site.
`deliveryDomains.validatedAt`<br/>*string* | The date the domain was validated to be pointing to Stackpath.

<!-------------------- CREATE A SITE -------------------->

#### Create a site

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites"
```
> Request body example for a site with basic authentication:

```json
{
  "domain": "www.rpgfan.com",
  "services": [
    "CDN",
    "SERVERLESS_EDGE_ENGINE",
    "WAF"
  ],
  "protocol": "HTTPS",
  "hostname": "199.250.204.212",
  "authMethod": "BASIC",
  "username": "alavoie",
  "password": "123456"
}
```

> Request body example for a site with no authentication:

```json
{
  "domain": "www.rpgfan.com",
  "services": [
    "CDN",
    "SERVERLESS_EDGE_ENGINE",
    "WAF"
  ],
  "protocol": "HTTPS",
  "hostname": "199.250.204.212"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites</code>

Create a site in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`domain`<br/>*string* | The domain name that will be used for the site.
`services`<br/>*Array[string]* | Services list that will be used on the site. Possibles values are `CDN`,`SERVERLESS_EDGE_ENGINE` or  `WAF`.
`protocol`<br/>*string* | Protocol that will be used to communicate with the hostname. Possibles values are `HTTP` or `HTTPS`.
`hostname`<br/>*string* | The hostname to that will be used to get the information from. The hostname can be an IP or a name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). 
 
 Optional | &nbsp;
 ------- | -----------
`authMethod`<br/>*string* | The authentication method to communicate with the hostname. Possibles values are `NONE` or `BASIC`. If not provided, it will default to `NONE` unless the username or password is provided. It would then default to `BASIC`.
`username`<br/>*Array[Object]* | The username for the basic authentication. Required if authMethod is `BASIC` or if the password id provided. 
`password`<br/>*string* | The password for the basic authentication. Required if authMethod is `BASIC` or if the password id provided.


<!-------------------- DELETE A SITE -------------------->

#### Delete a site

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id</code>

Delete a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE CDN -------------------->

#### Enable CDN

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=enable_cdn"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=enable_cdn</code>

Enable CDN for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- Disable CDN -------------------->

#### Disable CDN

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=disable_cdn"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=disable_cdn</code>

Disable CDN for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE WAF -------------------->

#### Enable WAF

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=enable_waf"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=enable_waf</code>

Enable WAF for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- Disable WAF -------------------->

#### Disable WAF

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=disable_waf"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=disable_waf</code>

Disable WAF for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE Serverless Scripts -------------------->

#### Enable Serverless Scripts

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=enable_scripts"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=enable_scripts</code>

Enable Serverless Scripts for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- Disable Serverless Scripts -------------------->

#### Disable Serverless Scripts

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=disable_scripts"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=disable_scripts</code>

Disable Serverless Scripts for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.
