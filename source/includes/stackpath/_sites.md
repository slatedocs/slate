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
`cacheTtl`<br/>*Integer*  | The time to live for the cache, in seconds. Depends on the cache expiry policy.
`queryStringControl`<br/>*String* | The strategy for caching query strings. Can be `IGNORE`, `CACHE_ALL` or `CUSTOM`. 
`customCachedQueryStrings`<br/>*Array[String]* | List of custom cached query strings. Only visible if the `queryStringControl` attribute is `CUSTOM`.
`dynamicCachingByHeaderEnabled`<br/>*Boolean* | Whether or not to enable dynamic caching by headers.
`customCachedHeaders`<br/>*Array[String]*  | A list of custom cached headers. Only visible if `dynamicCachingByHeaderEnabled` is true. 
`gzipCompressionEnabled`<br/>*Boolean* | Whether or not to enable gzip compression.
`gzipCompressionLevel`<br/>*Integer* | The level for the gzip compression. Values are between `1` to `6`. Only visible is `gzipCompressionEnabled` is true.
`contentPersistenceEnabled`<br/>*Boolean* | Whether or not make cached content available after its expiration time.
`maximumStaleFileTtl`<br/>*Integer*  | The maximum time to live for stale files, in seconds. Only visible if `contentPersistenceEnabled` is true.
`varyHeaderEnabled`<br/>*Boolean* | Whether or not to enable honoring the vary header in a request.
`browserCacheTtl`<br/>*Integer*  | Sets the default browser expiration time for cached assets, in seconds. 
`corsHeaderEnabled`<br/>*Boolean* | Sets the Access-Control-Allow-Origin header to allow browsers to access this domain from other origins.
`allowedCorsOrigins`<br/>*String* | The strategy for allowing cors origins. Can be `SPECIFY_ORIGINS` or `ALL_ORIGINS`.
`originsToAllowCors`<br/>*Array[String]* | A list of origins to allow cors requests from. Only visible if `allowedCorsOrigins` is set to `SPECIFY_ORIGINS`.
`http2SupportEnabled`<br/>*Boolean* | Whether or not to enable supporting applications using HTTP/2 protocol.
`http2ServerPushEnabled`<br/>*Boolean* | Whether or not to push assets to the client or browser (user) in advance (before the user requests these assets) which enables faster load times.
`linkHeader`<br/>*String* | The link header for http2ServerPush, only visible if `http2ServerPushEnabled` is true.
`canonicalHeaderEnabled`<br/>*Boolean* | Whether or not to enable setting Link: <http://{hostname}/URI>; rel="canonical" header on each response.
`canonicalHeader`<br/>*String* | The hostname for the canonicalHeader, only visible if `canonicalHeaderEnabled` is true.
`urlCachingEnabled`<br/>*Boolean* | Whether or not to enable caching of URLs without file extensions.
`urlCachingTtl`<br/>*Integer* | The time to live for the url cache. Only visible if `urlCachingEnabled` is true.

<!-------------------- EDIT CDN SETTINGS -------------------->

### Edit CDN settings

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/cdnsettings/9f236f19-55db-411f-9f05-bd79dc91a69b"
```

> Request body example:

```json
{
  "urlCachingEnabled": true,
  "urlCachingTtl": 1,
  "canonicalHeaderEnabled": true,
  "queryStringControl": "CUSTOM",
  "customCachedQueryStrings": [
    "help"
  ]
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "e94d2bb6-059a-4eb6-a14f-7c596a5fdea6",
  "taskStatus": "SUCCESS"
}
```

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/:siteId</a></code>

Edit CDN settings for a site in a given [environment](#administration-environments).

Optional | &nbsp;
------- | -----------
`cacheExpirePolicy`<br/>*String* | A site's cache expiry policy. Can be `ORIGIN_CONTROLLED`, `SPECIFY_CDN_TTL`, `NEVER_EXPIRE`, or `DO_NOT_CACHE`. 
`cacheTtl`<br/>*Integer*  | The time to live for the cache, in seconds. Only applies when attribute `cacheExpirePolicy` is `SPECIFY_CDN_TTL`.
`queryStringControl`<br/>*String* | The strategy for caching query strings. Can be `IGNORE`, `CACHE_ALL` or `CUSTOM`. 
`customCachedQueryStrings`<br/>*Array[String]* | List of custom cached query strings. Only applies when attribute `queryStringControl` is `CUSTOM`.
`dynamicCachingByHeaderEnabled`<br/>*Boolean* | Whether or not to enable dynamic caching by headers.
`customCachedHeaders`<br/>*Array[String]*  | A list of custom cached headers. Only applies when attribute `dynamicCachingByHeaderEnabled` is true. 
`gzipCompressionEnabled`<br/>*Boolean* | Whether or not to enable gzip compression.
`gzipCompressionLevel`<br/>*Integer* | The level for the gzip compression. Values should be between `1` to `6`, where `6` is the default. Only applies when attribute `gzipCompressionEnabled` is true.
`contentPersistenceEnabled`<br/>*Boolean* | Whether or not make cached content available after its expiration time.
`maximumStaleFileTtl`<br/>*Integer*  | The maximum time to live for stale files, in seconds. Only applies when attribute `contentPersistenceEnabled` is true.
`varyHeaderEnabled`<br/>*Boolean* | Whether or not to enable honoring the vary header in a request.
`browserCacheTtl`<br/>*Integer*  | Sets the default browser expiration time for cached assets, in seconds.
`corsHeaderEnabled`<br/>*Boolean* | Sets the Access-Control-Allow-Origin header to allow browsers to access this domain from other origins.
`allowedCorsOrigins`<br/>*String* | The strategy for allowing cors origins. Can be `SPECIFY_ORIGINS` or `ALL_ORIGINS`.
`originsToAllowCors`<br/>*Array[String]* | A list of origins to allow cors requests from. Only applies when attribute `allowedCorsOrigins` is set to `SPECIFY_ORIGINS`.
`http2SupportEnabled`<br/>*Boolean* | Whether or not to enable supporting applications using HTTP/2 protocol.
`http2ServerPushEnabled` <br/>*Boolean* | Whether or not to push assets to the client or browser (user) in advance (before the user requests these assets) which enables faster load times.
`linkHeader`<br/>*String* | The link header for `http2ServerPush`, only visible if `http2ServerPushEnabled` is true.
`canonicalHeaderEnabled`<br/>*Boolean* | Whether or not to enable setting Link: <http://{hostname}/URI>; rel="canonical" header on each response.
`canonicalHeader`<br/>*String* | The hostname for the canonicalHeader, only applies when attribute `canonicalHeaderEnabled` is true.
`urlCachingEnabled`<br/>*Boolean* | Whether or not to enable caching of URLs without file extensions.
`urlCachingTtl`<br/>*Integer* | The time to live for the url cache. Only applies when attribute `urlCachingEnabled` is true.

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
    "id": "1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36",
    "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
    "domain": "site.com",
    "apiUrls": [
      "/test/this/way"
    ],
    "ddosSettings": {
      "globalThreshold": 5000,
      "burstThreshold": 110,
      "subSecondBurstThreshold": 50
    },
    "monitoringEnabled": false,
    "owaspThreats": {
      "sqlInjection": false,
      "xssAttack": true,
      "remoteFileInclusion": true,
      "wordpressWafRuleset": true,
      "apacheStrutsExploit": true,
      "localFileInclusion": false,
      "commonWebApplicationVulnerabilities": true,
      "webShellExecutionAttempt": true,
      "responseHeaderInjection": true,
      "openRedirect": false,
      "shellInjection": false
    },
    "userAgents": {
      "blockInvalidUserAgents": false,
      "blockUnknownUserAgents": true
    },
    "csrf": true,
    "trafficSources": {
      "viaTorNodes": true,
      "viaProxyNetworks": true,
      "viaHostingServices": true,
      "viaVpn": true,
      "convictedBotTraffic": true,
      "suspiciousTrafficByLocalIpFormat": true
    },
    "antiAutomationBotProtection": {
      "forceBrowserValidationOnTrafficAnomalies": true,
      "challengeAutomatedClients": false,
      "challengeHeadlessBrowsers": false,
      "antiScraping": false
    },
    "spamAndAbuseForm": false,
    "behavioralWaf": {
      "spamProtection": true,
      "blockProbingAndForcedBrowsing": true,
      "obfuscatedAttacksAndZeroDayMitigation": true,
      "repeatedViolations": true,
      "bruteForceProtection": true
    },
    "cmsProtection": {
      "whiteListWordpress": false,
      "whiteListModx": false,
      "whiteListDrupal": false,
      "whiteListJoomla": false,
      "whiteMagento": false,
      "whiteListOriginIp": true,
      "whiteListUmbraco": false
    },
    "allowKnownBots": {
      "Internet Archive Bot": true,
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/wafsettings/<a href="#administration-sites">:site_id</a></code>

Retrieve WAF Settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the site that the WAF settings belongs to.
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`domain`<br/>*string* | The domain of the site.
`ddosSettings`<br/>*object* | The DDoS Setting containing the different threshold values.
`ddosSettings.globalThreshold`<br/>*Integer* | The number of overall requests per ten seconds that can trigger DDoS protection.
`ddosSettings.burstThreshold`<br/>*Integer* | The number of requests per two seconds that can trigger DDoS protection.
`ddosSettings.subSecondBurstThreshold`<br/>*Integer* | The number of requests per 0.1 seconds that can trigger DDoS protection.
`apiUrls`<br/>*array* | List of configured API urls.
`monitoringEnabled`<br/>*boolean* | If the monitoring mode is enabled.
`owaspThreats`<br/>*object* | StackPath’s core rule set & OWASP’s most critical Web application security risks.
`owaspThreats.sqlInjection`<br/>*boolean* | Block requests suspected of being a SQL injection attack attempt. SQL injection attacks attempt to exploit vulnerabilities in a Web application's code and seek to gain access and control over the database. A successful attack would typically result in stolen data or the site being defaced or taken down.
`owaspThreats.xssAttack`<br/>*boolean* | Block requests suspected of being a Cross-Site-Scripting attack attempt. Cross Site Scripting attacks attempt to exploit vulnerabilities in a Web application and seek to inject a client side script either across an entire site or to a specific user's session. A successful attack would typically allow forbidden access to a user's actions and data.
`owaspThreats.shellShockAttack`<br/>*boolean* | Block requests suspected of being a Shellshock attack attempt. A Shellshock attack is an attempt to exploit a server's vulnerabilities to gain full access and control over them. A successful attack would typically either abuse a server's resources or hack the website.
`owaspThreats.remoteFileInclusion`<br/>*boolean* | Block requests suspected of being a Remote File Inclusion attempt. Remote File Inclusion attempts to exploit vulnerabilities in a Web application (typically in PHP) to execute a script from a 3rd party server. RFI attacks provide a backdoor for the hacker to change the behaviour of a server and Web application.
`owaspThreats.wordpressWafRuleset`<br/>*boolean* | Enable a set of rules designed to block common Wordpress exploits.
`owaspThreats.apacheStrutsExploit`<br/>*boolean* | Patch known vulnerabilities in the Apache Struts framework by blocking requests suspected of exploiting these vulnerabilities.
`owaspThreats.localFileInclusion`<br/>*boolean* | Block requests suspected of a Local File Inclusion attempt. Local File Inclusion attempts seek to exploit vulnerabilities in a Web application to execute potentially harmful scripts on your servers.
`owaspThreats.commonWebApplicationVulnerabilities`<br/>*boolean* | Block attempts to access and potentially harm your servers through common backdoors, such as common control panels, configuration scripts etc. which may be accessible to unwanted users.
`owaspThreats.webShellExecutionAttempt`<br/>*boolean* | Block requests suspected of Web shell attempts. A Web shell is a script that can be uploaded to a Web server to enable remote administration of the machine. Infected Web servers can either be internet-facing or internal to the network, where the Web shell is used to further pivot to internal hosts.
`owaspThreats.responseHeaderInjection`<br/>*boolean* | Block requests suspected of Response header injection attempts. Response header injection attempts to inject a header via insufficient user input sanitation.
`owaspThreats.openRedirect`<br/>*boolean* | Block requests suspected of being an Open Redirect attempt. Open Redirect attempts to exploit vulnerabilities in a Web application to redirect a user to a new website without any validation of the target of redirect.
`owaspThreats.shellInjection`<br/>*boolean* | Block requests suspected of being a shell injection attack attempt. Shell Injection is an attack in which the goal is execution of arbitrary commands on the host operating system via a vulnerable application. Command injection attacks are possible when an application passes unsafe user supplied data (forms, cookies, HTTP headers etc.) to a system shell.
`userAgents`<br/>*object* | Block requests with missing or invalid user agent string.
`userAgents.blockInvalidUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid and cannot be translated to a known legitimate browser. Automated processes (bots) are most likely to have invalid user agents.
`userAgents.blockUnknownUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) is missing.
`csrf`<br/>*boolean* | StackPath WAF will generate a CSRF token that is added to forms. Requests without a valid CSRF token will be blocked.
`trafficSources`<br/>*object* | Real-time threat intelligence for IP addresses, source location, and information on malicious IPs.
`trafficSources.viaTorNodes`<br/>*boolean* | Challenge traffic from The Onion Ring exit nodes to block bots and known bad devices. While TOR is used sometimes purely for Web anonymity, it is commonly used by hackers, scrapers, and spammers to crawl or hack Web applications.
`trafficSources.viaProxyNetworks`<br/>*boolean* | Challenge traffic from any known proxy network to block bots and known bad devices. While proxy services are used sometimes purely for Web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack Web applications.
`trafficSources.viaHostingServices`<br/>*boolean* | Challenge traffic from IP addresses known to be of hosting service companies. This rule is unlikely to see legitimate human traffic on these IP spaces since they are typically used for server hosting. In most cases, traffic from these IP spaces originate from infected servers that are controlled by hackers.
`trafficSources.viaVpn`<br/>*boolean* | Challenge traffic from any known VPN to block bots and known bad devices. While VPNs are sometimes used purely for Web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack Web applications.
`trafficSources.convictedBotTraffic`<br/>*boolean* | Challenge traffic from IP addresses that have been convicted of automated activities (bots) on this site or on others. These IP addresses are used by malicious automated agents while no legitimate traffic has been observed on them.
`trafficSources.suspiciousTrafficByLocalIpFormat`<br/>*boolean* | Challenge traffic from suspicious NAT ranges.
`antiAutomationBotProtection`<br/>*object* | Block automated traffic from scanning and browsing your online application.
`antiAutomationBotProtection.forceBrowserValidationOnTrafficAnomalies`<br/>*boolean* | Challenge and block requests if the user or device behind them does not keep session cookies and does not execute JavaScripts correctly. Most malicious automated activities (bots) do not meet these conditions and will, therefore, effectively be blocked by the JavaScript challenge triggered in any suspected situation. Clients can also be blocked depending on whether they act in an abnormal to the specific domain—by scraping content in a way that most sessions on this domain don't—or clients that try to, for example, avoid detection by switching IPs.
`antiAutomationBotProtection.challengeAutomatedClients`<br/>*boolean* | Captcha-challenge and block sessions conducted by standard Web browsers if there is evidence that these sessions are being automated and not driven by a human user. Such automation is used primarily for screen scraping and other very targeted, site-specific malicious automation.
`antiAutomationBotProtection.challengeHeadlessBrowsers`<br/>*boolean* | Challenge requests if the user or device behind them uses an automation tool that initiates browsers but is actually an automation tool without real display—such as phantomJS, Selenium, or other. While such tools are favored by programmers, they are also extremely popular with scrapers, hackers and even in sophisticated DDoS attacks to circumvent standard anti-bot measures.
`antiAutomationBotProtection.antiScraping`<br/>*boolean* | A more hardened anti-automation policy that is meant to stop scrapers by using faster and harsher convictions.
`spamAndAbuseForm`<br/>*boolean* | Challenge and prevent automated tools from making HTTP/S Post requests without validating their session first.
`cmsProtection`<br/>*object* | Whitelist admin users.
`cmsProtection.whiteListWordpress`<br/>*boolean* | Enable whitelist WordPress admin logged-in users.
`cmsProtection.whiteListModx`<br/>*boolean* | Enable whitelist MODX admin logged-in users.
`cmsProtection.whiteListDrupal`<br/>*boolean* | Enable whitelist Drupal admin logged-in users.
`cmsProtection.whiteListJoomla`<br/>*boolean* | Enable whitelist Joomla admin logged-in users.
`cmsProtection.whiteMagento`<br/>*boolean* | Enable whitelist Magento admin logged-in users.
`cmsProtection.whiteListOriginIp`<br/>*boolean* | Enable this policy to whitelist requests coming from the origin for plugin updates and general CMS updates,
`cmsProtection.whiteListUmbraco`<br/>*boolean* | Enable whitelist Umbraco admin logged-in users.
`behavioralWaf`<br/>*object* | StackPath's sophisticated user behaviour and reputation analysis rules.
`behavioralWaf.spamProtection`<br/>*boolean* | Challenge and block user sessions and activities that seem to be aggressively using forms on your website to post spam content, generate new accounts, and more. Also, require a handshake (if not already provided) to clients making POST requests.
`behavioralWaf.blockProbingAndForcedBrowsing`<br/>*boolean* | Challenge or block sessions and users that seem to make brute-forced requests on random URLs seeking to discover a Web application's structure and hidden directories.
`behavioralWaf.obfuscatedAttacksAndZeroDayMitigation`<br/>*boolean* | Block clients performing multiple injection attacks.
`behavioralWaf.repeatedViolations`<br/>*boolean* | Challenge or block clients that failed to answer previous challenges.
`behavioralWaf.bruteForceProtection`<br/>*boolean* | Challenge and block attempts seeking to guess user names and passwords on Web login forms.
`allowKnownBots`<br/>*object* | An object containing known bots.

<!-------------------- Edit WAF Settings -------------------->

### Edit WAF Settings

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/wafsettings/c0ddc1b3-b390-4f39-b200-5c0323ca306e"
```

> Request body example:

```json
{
	"owaspThreats": {
      "localFileInclusion": false
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
`owaspThreats`<br/>*object* | StackPath’s core rule set & OWASP’s most critical Web application security risks.
`owaspThreats.sqlInjection`<br/>*boolean* | Block requests suspected of being a SQL injection attack attempt. SQL injection attacks attempt to exploit vulnerabilities in a Web application's code and seek to gain access and control over the database. A successful attack would typically result in stolen data or the site being defaced or taken down.
`owaspThreats.xssAttack`<br/>*boolean* | Block requests suspected of being a Cross-Site-Scripting attack attempt. Cross Site Scripting attacks attempt to exploit vulnerabilities in a Web application and seek to inject a client side script either across an entire site or to a specific user's session. A successful attack would typically allow forbidden access to a user's actions and data.
`owaspThreats.shellShockAttack`<br/>*boolean* | Block requests suspected of being a Shellshock attack attempt. A Shellshock attack is an attempt to exploit a server's vulnerabilities to gain full access and control over them. A successful attack would typically either abuse a server's resources or hack the website.
`owaspThreats.remoteFileInclusion`<br/>*boolean* | Block requests suspected of being a Remote File Inclusion attempt. Remote File Inclusion attempts to exploit vulnerabilities in a Web application (typically in PHP) to execute a script from a 3rd party server. RFI attacks provide a backdoor for the hacker to change the behaviour of a server and Web application.
`owaspThreats.wordpressWafRuleset`<br/>*boolean* | Enable a set of rules designed to block common Wordpress exploits.
`owaspThreats.apacheStrutsExploit`<br/>*boolean* | Patch known vulnerabilities in the Apache Struts framework by blocking requests suspected of exploiting these vulnerabilities.
`owaspThreats.localFileInclusion`<br/>*boolean* | Block requests suspected of a Local File Inclusion attempt. Local File Inclusion attempts seek to exploit vulnerabilities in a Web application to execute potentially harmful scripts on your servers.
`owaspThreats.commonWebApplicationVulnerabilities`<br/>*boolean* | Block attempts to access and potentially harm your servers through common backdoors, such as common control panels, configuration scripts etc. which may be accessible to unwanted users.
`owaspThreats.webShellExecutionAttempt`<br/>*boolean* | Block requests suspected of Web shell attempts. A Web shell is a script that can be uploaded to a Web server to enable remote administration of the machine. Infected Web servers can either be internet-facing or internal to the network, where the Web shell is used to further pivot to internal hosts.
`owaspThreats.responseHeaderInjection`<br/>*boolean* | Block requests suspected of Response header injection attempts. Response header injection attempts to inject a header via insufficient user input sanitation.
`owaspThreats.openRedirect`<br/>*boolean* | Block requests suspected of being an Open Redirect attempt. Open Redirect attempts to exploit vulnerabilities in a Web application to redirect a user to a new website without any validation of the target of redirect.
`owaspThreats.shellInjection`<br/>*boolean* | Block requests suspected of being a shell injection attack attempt. Shell Injection is an attack in which the goal is execution of arbitrary commands on the host operating system via a vulnerable application. Command injection attacks are possible when an application passes unsafe user supplied data (forms, cookies, HTTP headers etc.) to a system shell.
`userAgents`<br/>*object* | Block requests with missing or invalid user agent string.
`userAgents.blockInvalidUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid and cannot be translated to a known legitimate browser. Automated processes (bots) are most likely to have invalid user agents.
`userAgents.blockUnknownUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) is missing.
`csrf`<br/>*boolean* | StackPath WAF will generate a CSRF token that is added to forms. Requests without a valid CSRF token will be blocked.
`trafficSources`<br/>*object* | Real-time threat intelligence for IP addresses, source location, and information on malicious IPs.
`trafficSources.viaTorNodes`<br/>*boolean* | Challenge traffic from The Onion Ring exit nodes to block bots and known bad devices. While TOR is used sometimes purely for Web anonymity, it is commonly used by hackers, scrapers, and spammers to crawl or hack Web applications.
`trafficSources.viaProxyNetworks`<br/>*boolean* | Challenge traffic from any known proxy network to block bots and known bad devices. While proxy services are used sometimes purely for Web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack Web applications.
`trafficSources.viaHostingServices`<br/>*boolean* | Challenge traffic from IP addresses known to be of hosting service companies. This rule is unlikely to see legitimate human traffic on these IP spaces since they are typically used for server hosting. In most cases, traffic from these IP spaces originate from infected servers that are controlled by hackers.
`trafficSources.viaVpn`<br/>*boolean* | Challenge traffic from any known VPN to block bots and known bad devices. While VPNs are sometimes used purely for Web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack Web applications.
`trafficSources.convictedBotTraffic`<br/>*boolean* | Challenge traffic from IP addresses that have been convicted of automated activities (bots) on this site or on others. These IP addresses are used by malicious automated agents while no legitimate traffic has been observed on them.
`trafficSources.suspiciousTrafficByLocalIpFormat`<br/>*boolean* | Challenge traffic from suspicious NAT ranges.
`antiAutomationBotProtection`<br/>*object* | Block automated traffic from scanning and browsing your online application.
`antiAutomationBotProtection.forceBrowserValidationOnTrafficAnomalies`<br/>*boolean* | Challenge and block requests if the user or device behind them does not keep session cookies and does not execute JavaScripts correctly. Most malicious automated activities (bots) do not meet these conditions and will, therefore, effectively be blocked by the JavaScript challenge triggered in any suspected situation. Clients can also be blocked depending on whether they act in an abnormal to the specific domain—by scraping content in a way that most sessions on this domain don't—or clients that try to, for example, avoid detection by switching IPs.
`antiAutomationBotProtection.challengeAutomatedClients`<br/>*boolean* | Captcha-challenge and block sessions conducted by standard Web browsers if there is evidence that these sessions are being automated and not driven by a human user. Such automation is used primarily for screen scraping and other very targeted, site-specific malicious automation.
`antiAutomationBotProtection.challengeHeadlessBrowsers`<br/>*boolean* | Challenge requests if the user or device behind them uses an automation tool that initiates browsers but is actually an automation tool without real display—such as phantomJS, Selenium, or other. While such tools are favored by programmers, they are also extremely popular with scrapers, hackers and even in sophisticated DDoS attacks to circumvent standard anti-bot measures.
`antiAutomationBotProtection.antiScraping`<br/>*boolean* | A more hardened anti-automation policy that is meant to stop scrapers by using faster and harsher convictions.
`spamAndAbuseForm`<br/>*boolean* | Challenge and prevent automated tools from making HTTP/S Post requests without validating their session first.
`cmsProtection`<br/>*object* | Whitelist admin users.
`cmsProtection.whiteListWordpress`<br/>*boolean* | Enable whitelist WordPress admin logged-in users.
`cmsProtection.whiteListModx`<br/>*boolean* | Enable whitelist MODX admin logged-in users.
`cmsProtection.whiteListDrupal`<br/>*boolean* | Enable whitelist Drupal admin logged-in users.
`cmsProtection.whiteListJoomla`<br/>*boolean* | Enable whitelist Joomla admin logged-in users.
`cmsProtection.whiteMagento`<br/>*boolean* | Enable whitelist Magento admin logged-in users.
`cmsProtection.whiteListOriginIp`<br/>*boolean* | Enable this policy to whitelist requests coming from the origin for plugin updates and general CMS updates,
`cmsProtection.whiteListUmbraco`<br/>*boolean* | Enable whitelist Umbraco admin logged-in users.
`behavioralWaf`<br/>*object* | StackPath's sophisticated user behaviour and reputation analysis rules.
`behavioralWaf.spamProtection`<br/>*boolean* | Challenge and block user sessions and activities that seem to be aggressively using forms on your website to post spam content, generate new accounts, and more. Also, require a handshake (if not already provided) to clients making POST requests.
`behavioralWaf.blockProbingAndForcedBrowsing`<br/>*boolean* | Challenge or block sessions and users that seem to make brute-forced requests on random URLs seeking to discover a Web application's structure and hidden directories.
`behavioralWaf.obfuscatedAttacksAndZeroDayMitigation`<br/>*boolean* | Block clients performing multiple injection attacks.
`behavioralWaf.repeatedViolations`<br/>*boolean* | Challenge or block clients that failed to answer previous challenges.
`behavioralWaf.bruteForceProtection`<br/>*boolean* | Challenge and block attempts seeking to guess user names and passwords on Web login forms.
`allowKnownBots`<br/>*object* | An object containing known bots.

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
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin. "Dynamic" refers to using the requested domain name `(Host: %client.request.host%)` as the host header.
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
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin. "Dynamic" refers to using the requested domain name `(Host: %client.request.host%)` as the host header. 
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

