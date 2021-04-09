### CDN

<!-------------------- RETRIEVE CDN SETTINGS -------------------->

#### Retrieve CDN settings

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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/<a href="#stackpath-site">:siteId</a></a></code>

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

#### Edit CDN settings

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

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/<a href="#stackpath-site">:siteId</a></a></code>

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

#### Purge all CDN cached content

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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/<a href="#stackpath-site">:siteId</a>?operation=purgeAll</a></code>

Purge all CDN cached content of a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the purge operation.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- PURGE CUSTOM CDN CACHED CONTENT -------------------->

#### Purge custom CDN cached content

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/cdnsettings/9f236f19-55db-411f-9f05-bd79dc91a69b?operation=purge"
```

> Request body example:

```json
{
  "purgeType":"PATH",
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/cdnsettings/<a href="#stackpath-site">:siteId</a>?operation=purge</a></code>

Purge custom CDN cached content of a site in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`items`<br/>*Array[Object]* | The items to purge from the CDN.
`items.url`<br/>*String* | The URL or path at which to delete content.
 
 Optional | &nbsp;
 ------- | -----------
`purgeType`<br/>*String* | The type of cache purge. Can be `URL` or `PATH`. Default value is `URL`.
`items.recursive`<br/>*Boolean* | Whether or not to recursively delete content from the CDN.
`items.invalidateOnly`<br/>*Boolean* | Whether or not to mark the asset as expired and re-validate instead of deleting.
`items.purgeAllDynamic`<br/>*Boolean* | Whether or not to purge dynamic versions of assets.
`items.headers`<br/>*Array[String]* | A list of HTTP request headers used to construct a cache key to purge content by. These headers must be configured in the site configuration's DynamicContent.headerFields property.
`items.purgeSelector`<br/>*Array[Object]* | A key/value pair definition of content to purge from the CDN.
`items.purgeSelector.selectorType`<br/>*String* | The kinds of content that can be purged from the CDN. One of: HEADER (Purge content based on an HTTP response header), TAG (Purge content based on an X-TAG HTTP header value. Purging by tag can be useful when content on the origin is tagged).
`items.purgeSelector.selectorName`<br/>*String* | The name of the type of content to purge. For example, the name of the HTTP response header. Names are case sensitive.
`items.purgeSelector.selectorValue`<br/>*String* | The value of the content to purge. For example, the value of the HTTP response header. Values are case sensitive and may be wild-carded, but cannot match a "/".
`items.purgeSelector.selectorValueDelimiter`<br/>*String* | The delimiter to separate multiple values with. Defaults to ",".
