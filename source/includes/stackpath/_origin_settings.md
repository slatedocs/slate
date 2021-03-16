## Origin settings

Origin Settings allow you to configure your site's origin and backup origin settings

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
    "siteId": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
    "stackId": "144c3d16-2879-4286-82b6-75e58a6ec1cb",
    "scopeConfigurationId": "45ab2429-ca8d-4145-acc3-f6aea6e8dbef",
    "domain": "bluegreen.com",
    "webSocketsEnabled": false,
    "pullProtocol": "MATCH",
    "hostHeader": "Host: marvel.com",
    "origin": {
      "id": "d92531f4-28f5-456d-9b5f-d1cbb17ccfee",
      "stackId": "144c3d16-2879-4286-82b6-75e58a6ec1cb",
      "dedicated": true,
      "siteId": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
      "authenticationEnabled": false,
      "sslValidationEnabled": true,
      "commonCertificateName": "",
      "path": "/",
      "hostname": "www.test.com",
      "port": 80,
      "securePort": 8080,
      "priority": "ZERO"
    },
    "backupOriginEnabled": true,
    "backupOriginExcludeCodes": "415",
    "backupOrigin": {
      "id": "f6766ee9-680d-4c92-b77c-36c60a251061",
      "stackId": "144c3d16-2879-4286-82b6-75e58a6ec1cb",
      "dedicated": true,
      "siteId": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
      "authenticationEnabled": false,
      "sslValidationEnabled": false,
      "path": "/",
      "hostname": "1.2.3.4",
      "port": 80,
      "securePort": 443,
      "priority": "ONE"
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/originsettings/:siteId</a></code>

Retrieve origin settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`siteId`<br/>*UUID*  | A sites's unique identifier. 
`stackId`<br/>*UUID*  | The ID of the stack that a site belongs to.
`scopeConfigurationId`<br/>*UUID*  | The ID of the scope of the site.
`domain`<br/>*string* | The domain of the site.
`webSocketsEnabled` <br/>*boolean* | Specifies if web socket connections to the origin server is enabled. 
`pullProtocol` <br/>*string* | The type of protocol used to pull content from the origin. Must be "HTTP", "HTTPS" or "MATCH" which is equivalent to "HTTP" or "HTTPS".
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin.
`origin` <br/> *Object* | The primary origin that the CDN uses to pull content from. 
`origin.id` <br/> *UUID* | An origin's unique identifier. 
`origin.stackId` <br/> *UUID*  | The ID of the stack that a site belongs to.
`origin.dedicated` <br/> *boolean* | Specifies if an origin is dedicated to a CDN site. 
`origin.siteId` <br/> *UUID*  | A sites's unique identifier. 
`origin.authenticationEnabled` <br/> *boolean* | Specifies if the origin is using basic http authentication. 
`origin.username` <br/> *string* | Username to use when authenticating with the origin. 
`origin.password` <br/> *string* | Password to use when authenticating with the origin. 
`origin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the origin is enabled. 
`origin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`origin.path` <br/> *string* | The origin's HTTP request path.
`origin.hostname` <br/> *string* | The origin's HTTP request hostname. Can be a valid IPv4 address or a valid domain name. 
`origin.port` <br/> *int* | The origin's HTTP port. Must be one of [80, 8080, 443, 1935, 9091].
`origin.securePort` <br/> *int* | The origin's HTTPS port. Must be one of [80, 8080, 443, 1935, 9091].
`origin.priority` <br/> *string* | The origin's priority to the scope. Must be one of ["ZERO" (highest priority), "ONE"].  
`backupOriginEnabled`<br/>*boolean* | Specifies if a backup origin for the site is configured.
`backupOriginExcludeCodes` <br/>*string* | Requests are made to the backup origin on any 4xx or 5xx response codes returned from the primary origin. This property specifies the response status codes for which calls to the backup origin must not be made. Multiple response codes can be excluded. e.g: "410, 411, 412".  Asterisks can be used to cover a range of codes. e.g. All the 4xx codes can be covered using "4*".
`backupOrigin` <br/> *Object* | The secondary origin to pull content from when primary origin is not available.
`backupOrigin.id` <br/> *UUID* | A backup origin's unique identifier. 
`backupOrigin.stackId` <br/> *UUID*  | The ID of the stack that a site belongs to.
`backupOrigin.dedicated` <br/> *boolean* | Specifies if a backup origin is dedicated to a CDN site. 
`backupOrigin.siteId` <br/> *UUID*  | A sites's unique identifier. 
`backupOrigin.authenticationEnabled` <br/> *boolean* | Specifies if the backup origin is using basic http authentication. 
`backupOrigin.username` <br/> *string* | Username to use when authenticating with the backup origin. 
`backupOrigin.password` <br/> *string* | Password to use when authenticating with the backup origin. 
`backupOrigin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the backup origin is enabled. 
`backupOrigin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`backupOrigin.path` <br/> *string* | The backup origin's HTTP request path.
`backupOrigin.hostname` <br/> *string* | The backup origin's HTTP request hostname. Can be a valid IPv4 address or a valid domain name. 
`backupOrigin.port` <br/> *int* | The backup origin's HTTP port. Must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.securePort` <br/> *int* | The backup origin's HTTPS port. Must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.priority` <br/> *string* | The backup origin's priority to the scope. Must be one of ["ZERO" (highest priority), "ONE"].  

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
    "siteId": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
    "stackId": "144c3d16-2879-4286-82b6-75e58a6ec1cb",
    "scopeConfigurationId": "45ab2429-ca8d-4145-acc3-f6aea6e8dbef",
	"pullProtocol": "MATCH",
	"hostHeader": "marvel.com",
	"origin": {
        "id": "d92531f4-28f5-456d-9b5f-d1cbb17ccfee"
	    "sslValidationEnabled": true, 
        "commonCertificateName": "commonName"
	}, 
    "backupOriginEnabled": true, 
    "backupOrigin": {
	    "hostname": "1.2.3.4"
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

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/originsettings/:siteId</a></code>

Edit origin settings for a site in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`siteId`<br/>*UUID*  | A sites's unique identifier. 
`stackId`<br/>*UUID*  | The ID of the stack that a site belongs to.
`scopeConfigurationId`<br/>*UUID*  | The ID of the scope of the site.

Attributes | &nbsp;
------- | -----------
`webSocketsEnabled` <br/>*boolean* | Specifies if web socket connections to the origin server is enabled. 
`pullProtocol` <br/>*string* | The type of protocol used to pull content from the origin. Must be "HTTP", "HTTPS" or "MATCH" which is equivalent to "HTTP" or "HTTPS".
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin.
`origin` <br/> *Object* | The primary origin that the CDN uses to pull content from. 
`origin.id` <br/> *UUID* | An origin's unique identifier. 
`origin.stackId` <br/> *UUID*  | The ID of the stack that a site belongs to.
`origin.dedicated` <br/> *boolean* | Specifies if an origin is dedicated to a CDN site. 
`origin.siteId` <br/> *UUID*  | A sites's unique identifier. 
`origin.authenticationEnabled` <br/> *boolean* | Specifies if the origin is using basic http authentication. To update origin.username and origin.password, this property must be set to true.
`origin.username` <br/> *string* | Username to use when authenticating with the origin. 
`origin.password` <br/> *string* | Password to use when authenticating with the origin. 
`origin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the origin is enabled. 
`origin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`origin.path` <br/> *string* | The origin's HTTP request path.
`origin.hostname` <br/> *string* | The origin's HTTP request hostname. Can be a valid IPv4 address or a valid domain name. 
`origin.port` <br/> *int* | The origin's HTTP port. Must be one of [80, 8080, 443, 1935, 9091].
`origin.securePort` <br/> *int* | The origin's HTTPS port. Must be one of [80, 8080, 443, 1935, 9091].
`origin.priority` <br/> *string* | The origin's priority to the scope. Must be one of ["ZERO" (highest priority), "ONE"]. 
`backupOriginEnabled`<br/>*boolean* | Specifies if a backup origin for the site is configured. To configure backupOrigin's settings, this property must be set to true. 
`backupOriginExcludeCodes` <br/>*string* | Requests are made to the backup origin on any 4xx or 5xx response codes returned from the primary origin. This property specifies the response status codes for which calls to the backup origin must not be made. Multiple response codes can be excluded. e.g: "410, 411, 412".  Asterisks can be used to cover a range of codes. e.g. All the 4xx codes can be covered using "4*". 
`backupOrigin` <br/> *Object* | The secondary origin to pull content from when primary origin is not available. 
`backupOrigin.id` <br/> *UUID* | A backup origin's unique identifier. 
`backupOrigin.stackId` <br/> *UUID*  | The ID of the stack that a site belongs to.
`backupOrigin.dedicated` <br/> *boolean* | Specifies if a backup origin is dedicated to a CDN site. 
`backupOrigin.siteId` <br/> *UUID*  | A sites's unique identifier. 
`backupOrigin.authenticationEnabled` <br/> *boolean* | Specifies if the backup origin is using basic http authentication. To update backupOrigin.username and backupOrigin.password, this property must be set to true.
`backupOrigin.username` <br/> *string* | Username to use when authenticating with the backup origin. 
`backupOrigin.password` <br/> *string* | Password to use when authenticating with the backup origin. 
`backupOrigin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the backup origin is enabled. 
`backupOrigin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`backupOrigin.path` <br/> *string* | The backup origin's HTTP request path.
`backupOrigin.hostname` <br/> *string* | The backup origin's HTTP request hostname. Can be a valid IPv4 address or a valid domain name. 
`backupOrigin.port` <br/> *int* | The backup origin's HTTP port. Must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.securePort` <br/> *int* | The backup origin's HTTPS port. Must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.priority` <br/> *string* | The backup origin's priority to the scope. Must be one of ["ZERO" (highest priority), "ONE"].  