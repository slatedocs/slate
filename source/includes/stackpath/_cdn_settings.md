## CDN settings

CDN settings allow you to configure your site's CDN properties.

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
`varyHeaderEnabled`<br/>*Boolean* | Whether or not to enable honor the vary header in a request.
`browserCacheTtl`<br/>*Integer*  | Sets the default browser expiration time for cached assets. 
`corsHeaderEnabled`<br/>*Boolean* | Sets the Access-Control-Allow-Origin header to allow browsers to access this domain from other origins.
`allowedCorsOrigins`<br/>*String* | The strategy for allowing cors origins. Can be `SPECIFY_ORIGINS` or `ALL_ORIGINS`.
`originsToAllowCors`<br/>*Array[String]* | A list of origins to allow cors requests from. Only visible if `allowedCorsOrigins` is set to `SPECIFY_ORIGINS`.
`http2SupportEnabled`<br/>*Boolean* | Whether or not to enable supporting applications using HTTP/2 protocol.
`http2ServerPushEnabled`<br/>*Boolean* | Whether or not to push assets to the client or browser (user) in advance (before the user requests these assets) which enables faster load times.
`linkHeader`<br/>*String* | The link header for http2ServerPush, only visible is `http2ServerPushEnabled`<br/>*Boolean* is enabled. 
`canonicalHeaderEnabled`<br/>*Boolean* | Whether or not to enable setting Link: <http://{hostname}/URI>; rel="canonical" header on each response.
`canonicalHeader`<br/>*String* | The hostname for the canonicalHeader, only visible if `canonicalHeaderEnabled` is enabled. 
`urlCachingEnabled`<br/>*Boolean* | Whether or not to enable caching of URLs without file extensions.
`urlCachingTtl`<br/>*Integer* | The time to live for the url cache. Only visible if `urlCachingEnabled` is enabled. 