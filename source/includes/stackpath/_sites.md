## Sites

Create and manage your CDN, WAF, and/or Serverless Scripting Delivery sites. 

<!-------------------- LIST SITES -------------------->

### List sites

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

### Retrieve a site

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
    "status": "ACTIVE"
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

<!-------------------- CREATE A SITE -------------------->

### Create a site

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

### Delete a site

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

### Enable CDN

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

### Disable CDN

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

<!-------------------- RETRIEVE CDN SETTINGS -------------------->

### Retrieve CDN settings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/cdnsettings/9f236f19-55db-411f-9f05-bd79dc91a69b"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "siteId": "9f236f19-55db-411f-9f05-bd79dc91a69b",
    "cacheExpirePolicy": "SPECIFY_CDN_TTL",
    "cacheTtl": 60,
    "queryStringControl": "CUSTOM",
    "customCachedQueryStrings": [
      "customQuery",
    ],
    "dynamicCachingByHeaderEnabled": true,
    "customCachedHeaders": [
      "mydynamicheader"
    ],
    "gzipCompressionEnabled": true,
    "gzipCompressionLevel": 2,
    "contentPersistenceEnabled": true,
    "maximumStaleFileTtl": 30,
    "varyHeaderEnabled": true,
    "browserCacheTtl": 60,
    "corsHeaderEnabled": true,
    "allowedCorsOrigins": "SPECIFY_ORIGINS",
    "originsToAllowCors": [
      "example.org"
    ],
    "http2SupportEnabled": true,
    "http2ServerPushEnabled": true,
    "linkHeader": "my-link-header",
    "canonicalHeaderEnabled": true,
    "canonicalHeader": "my-canonical-header",
    "urlCachingEnabled": true,
    "urlCachingTtl": 300
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/:siteId</a></code>

Retrieve CDN settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`siteId`<br/>*UUID*  | A site's unique identifier. 
`cacheExpirePolicy`<br/>*String* | A site's cache expiry policy. Can be `ORIGIN_CONTROLLED`, `SPECIFY_CDN_TTL`, `NEVER_EXPIRE`, or `DO_NOT_CACHE`. 
`cacheTtl`<br/>*Integer*  | The time to live for the cache. Depends on the cache expiry policy.
`queryStringControl`<br/>*String* | The strategy for caching query strings. Can be `IGNORE`, `CACHE_ALL` or `CUSTOM`. 
`customCachedQueryStrings`<br/>*Array[String]* | List of custom cached query strings. Only visible if the `queryStringControl` attribute is `CUSTOM`
`dynamicCachingByHeaderEnabled`<br/>*Boolean* | Whether or not to enable dynamic caching by headers.
`customCachedHeaders`<br/>*Array[String]*  | A list of custom cached headers. Only visible if `dynamicCachingByHeaderEnabled` is enabled. 
`gzipCompressionEnabled`<br/>*Boolean* | Whether or not to enable gzip compression.
`gzipCompressionLevel`<br/>*Integer* | The level for the gzip compression. Values are between `1` to `6`. Only visible is `gzipCompressionEnabled` is enabled.
`contentPersistenceEnabled`<br/>*Boolean* | Whether or not make cached content available after its expiration time.
`maximumStaleFileTtl`<br/>*Integer*  | The maximum time to live for stale files. Only visible if `contentPersistenceEnabled` is enabled. 
`varyHeaderEnabled`<br/>*Boolean* | Whether or not to enable honoring the vary header in a request.
`browserCacheTtl`<br/>*Integer*  | Sets the default browser expiration time for cached assets. 
`corsHeaderEnabled`<br/>*Boolean* | Sets the Access-Control-Allow-Origin header to allow browsers to access this domain from other origins.
`allowedCorsOrigins`<br/>*String* | The strategy for allowing cors origins. Can be `SPECIFY_ORIGINS` or `ALL_ORIGINS`.
`originsToAllowCors`<br/>*Array[String]* | A list of origins to allow cors requests from. Only visible if `allowedCorsOrigins` is set to `SPECIFY_ORIGINS`.
`http2SupportEnabled`<br/>*Boolean* | Whether or not to enable supporting applications using HTTP/2 protocol.
`http2ServerPushEnabled`<br/>*Boolean* | Whether or not to push assets to the client or browser (user) in advance (before the user requests these assets) which enables faster load times.
`linkHeader`<br/>*String* | The link header for http2ServerPush, only visible if `http2ServerPushEnabled` is enabled. 
`canonicalHeaderEnabled`<br/>*Boolean* | Whether or not to enable setting Link: <http://{hostname}/URI>; rel="canonical" header on each response.
`canonicalHeader`<br/>*String* | The hostname for the canonicalHeader, only visible if `canonicalHeaderEnabled` is enabled. 
`urlCachingEnabled`<br/>*Boolean* | Whether or not to enable caching of URLs without file extensions.
`urlCachingTtl`<br/>*Integer* | The time to live for the url cache. Only visible if `urlCachingEnabled` is enabled. 


<!-------------------- PURGE ALL CDN CACHED CONTENT -------------------->

### Purge all CDN cached content

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/cdnsettings/9f236f19-55db-411f-9f05-bd79dc91a69b?operation=purgeAll"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "e6c03893-212f-4e28-b7a1-66ed7b554839",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/:siteId?operation=purgeAll</a></code>

Purge all CDN cached content of a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the purge operation.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- PURGE CUSTOM CDN CACHED CONTENT -------------------->

### Purge custom CDN cached content

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/cdnsettings/9f236f19-55db-411f-9f05-bd79dc91a69b?operation=purge"
```

> Request body example:

```json
{
  "items": [
    {
      "url": "//<domain_name>/path/to/file",
      "recursive": true,
      "purgeAllDynamic": false,
      "headers": [],
      "purgeSelector": {
        "selectorName": "(?i)<header_name>",
        "selectorValue": "<header_value>",
        "selectorType": "HEADER",
        "selectorValueDelimiter": ""
      }
    }
  ]
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "e6c03893-212f-4e28-b7a1-66ed7b554839",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/:siteId?operation=purge</a></code>

Purge custom CDN cached content of a site in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`items`<br/>*Array[Object]* | The items to purge from the CDN.
`items.url`<br/>*String* | The URL at which to delete content.
 
 Optional | &nbsp;
 ------- | -----------
`items.recursive`<br/>*Boolean* | Whether or not to recursively delete content from the CDN.
`items.invalidateOnly`<br/>*Boolean* | Whether or not to mark the asset as expired and re-validate instead of deleting.
`items.purgeAllDynamic`<br/>*Boolean* | Whether or not to purge dynamic versions of assets.
`items.headers`<br/>*Array[String]* | A list of HTTP request headers used to construct a cache key to purge content by. These headers must be configured in the site configuration's DynamicContent.headerFields property.
`items.purgeSelector`<br/>*Array[Object]* | A key/value pair definition of content to purge from the CDN.
`items.purgeSelector.selectorType`<br/>*String* | The kinds of content that can be purged from the CDN. One of: HEADER (Purge content based on an HTTP response header), TAG (Purge content based on an X-TAG HTTP header value. Purging by tag can be useful when content on the origin is tagged).
`items.purgeSelector.selectorName`<br/>*String* | The name of the type of content to purge. For example, the name of the HTTP response header. Names are case sensitive.
`items.purgeSelector.selectorValue`<br/>*String* | The value of the content to purge. For example, the value of the HTTP response header. Values are case sensitive and may be wild-carded, but cannot match a "/".
`items.purgeSelector.selectorValueDelimiter`<br/>*String* | The delimiter to separate multiple values with. Defaults to ",".



<!-------------------- ENABLE WAF -------------------->

### Enable WAF

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

### Disable WAF

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

### Enable Serverless Scripts

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

### Disable Serverless Scripts

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

<!-------------------- List WAF Settings -------------------->

### Retrieve WAF Settings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/wafsettings/1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "siteId": "1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36",
    "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
    "apiUrls": [
      "/test/this/way"
    ],
    "ddosSettings": {
      "globalThreshold": 5000,
      "burstThreshold": 110,
      "subSecondBurstThreshold": 50
    },
    "monitoringEnabled": false,
    "listPolicyGroups": {
      "policyGroups": [
        {
          "id": "8365e00f-a6c4-43a4-9f07-b830759737b8",
          "name": "User Agents",
          "policies": [
            {
              "name": "Invalid User Agent Prevention",
              "description": "Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid as it does not fit the client's properties.",
              "action": "BLOCK",
              "id": "S28158056",
              "enabled": false
            },
            {
              "name": "Unknown User Agent Prevention",
              "description": "Challenge requests in which the HTTP header describing the user-agent (browser and platform) is missing or unknown.",
              "action": "HANDSHAKE",
              "id": "S28158057",
              "enabled": false
            }
          ]
        },
        {
          "id": "d694f10e-7faf-4517-bc5b-265e95c04442",
          "name": "SPAM and Abuse",
          "policies": [
            {
              "name": "Form Submission Validation",
              "description": "Challenge user sessions and activities that seem to be aggressively using forms on your website to post spam content, generate new accounts, and more.",
              "action": "HANDSHAKE",
              "id": "S28158209",
              "enabled": false
            }
          ]
        },
        {
          "id": "379521f9-5d82-499e-a1b2-18f23800af1c",
          "name": "Allow Known Bots",
          "policies": [
            {
              "name": "Google bot",
              "description": "Google bot",
              "action": "ALLOW",
              "id": "S28158095",
              "enabled": true
            },
            {
              "name": "Google ads bot",
              "description": "Google ads bot",
              "action": "ALLOW",
              "id": "S28158096",
              "enabled": true
            }
          ]
        }
      ]
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/wafsettings/<a href="#administration-sites">:site_id</a></code>

Retrieve WAF Settings.

Attributes | &nbsp;
------- | -----------
`siteId`<br/>*string* | The ID of the site that the WAF settings belongs to.
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`ddosSettings`<br/>*object* | The DDoS Setting containing the different threshold values.
`ddosSettings.globalThreshold`<br/>*Integer* | The number of overall requests per ten seconds that can trigger DDoS protection.
`ddosSettings.burstThreshold`<br/>*Integer* | The number of requests per two seconds that can trigger DDoS protection.
`ddosSettings.subSecondBurstThreshold`<br/>*Integer* | The number of requests per 0.1 seconds that can trigger DDoS protection.
`apiUrls`<br/>*array* | List of configured API urls.
`monitoringEnabled`<br/>*boolean* | If the monitoring mode is enabled.
`listPolicyGroups`<br/>*object* | An object containing the list of policy groups.
`policyGroups`<br/>*array[object]* | A list of policy group object.
`policyGroups.id`<br/>*string* | The ID of the policy group.
`policyGroups.name`<br/>*string* | The name of the policy group.
`policyGroups.policies`<br/>*array[object]* | A list of policies in a policy group.
`policyGroups.policies.name`<br/>*string* | A WAF policy's name.
`policyGroups.policies.id`<br/>*string* | A WAF policy's ID.
`policyGroups.policies.description`<br/>*string* | A WAF policy's description.
`policyGroups.policies.action`<br/>*string* | The potential actions that the WAF will take when a policy is triggered. It can either be `ALLOW`, `BLOCK`, `HANDSHAKE`, `MONITOR` or `CAPTCHA`.
`policyGroups.policies.enabled`<br/>*boolean* | If the WAF policy is enabled.

<!-------------------- Edit WAF Settings for a Site -------------------->

### Edit WAF Settings for a Site

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/wafsettings/c0ddc1b3-b390-4f39-b200-5c0323ca306e"
```

> Request body example:

```json
{
  "listPolicyGroups": {
    "policyGroups": [
      {
        "id": "8365e00f-a6c4-43a4-9f07-b830759737b8",
        "name": "User Agents",
        "policies": [
          {
            "name": "Invalid User Agent Prevention",
            "description": "Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid as it does not fit the client's properties.",
            "action": "BLOCK",
            "id": "S28259696",
            "enabled": false
          },
          {
            "name": "Unknown User Agent Prevention",
            "description": "Challenge requests in which the HTTP header describing the user-agent (browser and platform) is missing or unknown.",
            "action": "HANDSHAKE",
            "id": "S28259697",
            "enabled": false
          }
        ]
      }
    ]
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "573ca8fa-c5ad-4b19-a315-8ddbbc78d7c0",
  "taskStatus": "SUCCESS"
}
```

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/wafsettings/<a href="#administration-sites">:site_id</a></code>

Edit the WAF settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`ddosSettings`<br/>*object* | The DDoS Setting containing the different threshold values.
`ddosSettings.globalThreshold`<br/>*Integer* | The number of overall requests per ten seconds that can trigger DDoS protection.
`ddosSettings.burstThreshold`<br/>*Integer* | The number of requests per two seconds that can trigger DDoS protection.
`ddosSettings.subSecondBurstThreshold`<br/>*Integer* | The number of requests per 0.1 seconds that can trigger DDoS protection.
`apiUrls`<br/>*array* | List of configured API urls.
`monitoringEnabled`<br/>*boolean* | If the monitoring mode is enabled.
`listPolicyGroups`<br/>*object* | An object containing the list of policy groups.
`policyGroups`<br/>*array[object]* | A list of policy group object.
`policyGroups.id`<br/>*string* | The ID of the policy group.
`policyGroups.name`<br/>*string* | The name of the policy group.
`policyGroups.policies`<br/>*array[object]* | A list of policies in a policy group.
`policyGroups.policies.name`<br/>*string* | A WAF policy's name.
`policyGroups.policies.id`<br/>*string* | A WAF policy's ID.
`policyGroups.policies.description`<br/>*string* | A WAF policy's description.
`policyGroups.policies.action`<br/>*string* | The potential actions that the WAF will take when a policy is triggered. It can either be `ALLOW`, `BLOCK`, `HANDSHAKE`, `MONITOR` or `CAPTCHA`.
`policyGroups.policies.enabled`<br/>*boolean* | If the WAF policy is enabled.

<!-------------------- RETRIEVE ORIGIN SETTINGS -------------------->

### Retrieve origin settings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/originsettings/eb3ecdbe-d73b-40e6-a263-166accba75ed"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
    "stackId": "144c3d16-2879-4286-82b6-75e58a6ec1cb",
    "scopeConfigurationId": "45ab2429-ca8d-4145-acc3-f6aea6e8dbef",
    "domain": "bluegreen.com",
    "webSocketsEnabled": false,
    "sslValidationEnabled": false,
    "pullProtocol": "MATCH",
    "hostHeader": "Host: marvel.com",
    "origin": {
      "id": "d92531f4-28f5-456d-9b5f-d1cbb17ccfee",
      "address": "www.test.com:80",
      "commonCertificateName": "commonName", 
      "authMethod": "BASIC", 
      "username": "username"
    },
    "backupOriginEnabled": true,
    "backupOriginExcludeCodes": ["415"],
    "backupOrigin": {
      "id": "f6766ee9-680d-4c92-b77c-36c60a251061",
      "address": "1.2.3.4:443/path",
      "authMethod": "NONE"
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/originsettings/:id</a></code>

Retrieve origin settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID*  | A site's unique identifier. 
`stackId`<br/>*UUID*  | The ID of the stack that a site belongs to.
`scopeConfigurationId`<br/>*UUID*  | The ID of the scope of the site that the origins are connected to.
`domain`<br/>*string* | The domain of the site.
`webSocketsEnabled` <br/>*boolean* | Specifies if web socket connections to the origin server are enabled. 
`sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the origins is enabled.
`pullProtocol` <br/>*string* | The type of protocol used to pull content from the origin. Must be one of ["HTTP", "HTTPS", "MATCH"]. "MATCH" is equivalent to "HTTP or HTTPS".
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin.
`origin` <br/> *Object* | The primary origin that the CDN uses to pull content from. 
`origin.id` <br/> *UUID* | An origin's unique identifier. 
`origin.address` <br/> *string* | The address of the primary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`origin.authMethod` <br/> *string* | Specifies the authentication method that the origin uses. Must be one of ["NONE", "BASIC"].
`origin.username` <br/> *string* | Username to use when authenticating with the origin. 
`origin.password` <br/> *string* | Password to use when authenticating with the origin. 
`origin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`backupOriginEnabled`<br/>*boolean* | Specifies if a backup origin for the site is configured.
`backupOriginExcludeCodes` <br/>*Array[string]* | Requests are made to the backup origin on any 4xx or 5xx response codes returned from the primary origin. This property specifies the response status codes for which calls to the backup origin must not be made. Multiple response codes can be excluded. e.g: ["410", "411", "412"].  Asterisks can be used to cover a range of codes. e.g. All the 4xx codes can be covered using "4*".
`backupOrigin` <br/> *Object* | The secondary origin that the CDN uses to pull content from when the primary origin is not available.
`backupOrigin.id` <br/> *UUID* | A backup origin's unique identifier. 
`backupOrigin.address` <br/> *string* | The address of the secondary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091]. 
`backupOrigin.authMethod` <br/> *string* | Specifies the authentication method that the backup origin uses. Must be one of ["NONE", "BASIC"].
`backupOrigin.username` <br/> *string* | Username to use when authenticating with the backup origin. 
`backupOrigin.password` <br/> *string* | Password to use when authenticating with the backup origin. 
`backupOrigin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.

<!-------------------- EDIT ORIGIN SETTINGS -------------------->

### Edit origin settings

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/originsettings/eb3ecdbe-d73b-40e6-a263-166accba75ed"
```

> Request body example:

```json
{
  "pullProtocol": "MATCH",
  "hostHeader": "marvel.com",
  "sslValidationEnabled": true, 
  "origin": {
    "commonCertificateName": "commonName"
  }, 
  "backupOriginEnabled": true, 
  "backupOrigin": {
    "address": "1.2.3.4:80"
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "e94d2bb6-059a-4eb6-a14f-7c596a5fdea6",
  "taskStatus": "SUCCESS"
}
```

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/originsettings/:id</a></code>

Edit origin settings for a site in a given [environment](#administration-environments).

Optional | &nbsp;
------- | -----------
`webSocketsEnabled` <br/>*boolean* | Specifies if web socket connections to the origin server are enabled. 
`sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the origins is enabled.
`pullProtocol` <br/>*string* | The type of protocol used to pull content from the origin. Must be one of ["HTTP", "HTTPS", "MATCH"]. "MATCH" is equivalent to "HTTP or HTTPS".
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin.
`origin` <br/> *Object* | The primary origin that the CDN uses to pull content from. 
`origin.address` <br/> *string* | The address of the primary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`origin.authMethod` <br/> *string* | Specifies the authentication method that the origin uses. Must be one of ["NONE", "BASIC"].
`origin.username` <br/> *string* | Username to use when authenticating with the origin. 
`origin.password` <br/> *string* | Password to use when authenticating with the origin. 
`origin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`backupOriginEnabled`<br/>*boolean* | Specifies if a backup origin for the site is configured. To configure backupOrigin's settings, this property must be passed as true. 
`backupOriginExcludeCodes` <br/>*Array[string]* | Requests are made to the backup origin on any 4xx or 5xx response codes returned from the primary origin. This property specifies the response status codes for which calls to the backup origin must not be made. Multiple response codes can be excluded. e.g: ["410", "411", "412"].  Asterisks can be used to cover a range of codes. e.g. All the 4xx codes can be covered using "4*".
`backupOrigin` <br/> *Object* | The secondary origin that the CDN uses to pull content from when the primary origin is not available. 
`backupOrigin.address` <br/> *string* | The address of the secondary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.authMethod` <br/> *string* | Specifies the authentication method that the backup origin uses. Must be one of ["NONE", "BASIC"].
`backupOrigin.username` <br/> *string* | Username to use when authenticating with the backup origin. 
`backupOrigin.password` <br/> *string* | Password to use when authenticating with the backup origin. 
`backupOrigin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.