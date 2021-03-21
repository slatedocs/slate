## Origin settings

Origin settings allow you to configure your site's primary and backup origins.

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
      "address": "www.test.com:80",
      "priority": "ZERO",
      "authenticationEnabled": false,
      "sslValidationEnabled": true,
      "commonCertificateName": "commonName"
    },
    "backupOriginEnabled": true,
    "backupOriginExcludeCodes": "415",
    "backupOrigin": {
      "id": "f6766ee9-680d-4c92-b77c-36c60a251061",
      "address": "1.2.3.4:443/path",
      "priority": "ONE",
      "authenticationEnabled": false,
      "sslValidationEnabled": false
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/originsettings/:siteId</a></code>

Retrieve origin settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`siteId`<br/>*UUID*  | A site's unique identifier. 
`stackId`<br/>*UUID*  | The ID of the stack that a site belongs to.
`scopeConfigurationId`<br/>*UUID*  | The ID of the scope of the site that the origins are connected to.
`domain`<br/>*string* | The domain of the site.
`webSocketsEnabled` <br/>*boolean* | Specifies if web socket connections to the origin server are enabled. 
`pullProtocol` <br/>*string* | The type of protocol used to pull content from the origin. Must be one of ["HTTP", "HTTPS", "MATCH"]. "MATCH" is equivalent to "HTTP or HTTPS".
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin.
`origin` <br/> *Object* | The primary origin that the CDN uses to pull content from. 
`origin.id` <br/> *UUID* | An origin's unique identifier. 
`origin.address` <br/> *string* | The address of the primary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`origin.priority` <br/> *string* | The origin's priority to the scope. Must be one of ["ZERO", "ONE"]. "ZERO" has the highest priority.  
`origin.authenticationEnabled` <br/> *boolean* | Specifies if the origin is using basic http authentication. 
`origin.username` <br/> *string* | Username to use when authenticating with the origin. 
`origin.password` <br/> *string* | Password to use when authenticating with the origin. 
`origin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the origin is enabled. 
`origin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`backupOriginEnabled`<br/>*boolean* | Specifies if a backup origin for the site is configured.
`backupOriginExcludeCodes` <br/>*string* | Requests are made to the backup origin on any 4xx or 5xx response codes returned from the primary origin. This property specifies the response status codes for which calls to the backup origin must not be made. Multiple response codes can be excluded. e.g: "410, 411, 412".  Asterisks can be used to cover a range of codes. e.g. All the 4xx codes can be covered using "4*".
`backupOrigin` <br/> *Object* | The secondary origin that the CDN uses to pull content from when the primary origin is not available.
`backupOrigin.id` <br/> *UUID* | A backup origin's unique identifier. 
`backupOrigin.address` <br/> *string* | The address of the secondary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.priority` <br/> *string* | The backup origin's priority to the scope. Must be one of ["ZERO", "ONE"]. "ZERO" has the highest priority.   
`backupOrigin.authenticationEnabled` <br/> *boolean* | Specifies if the backup origin is using basic http authentication. 
`backupOrigin.username` <br/> *string* | Username to use when authenticating with the backup origin. 
`backupOrigin.password` <br/> *string* | Password to use when authenticating with the backup origin. 
`backupOrigin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the backup origin is enabled. 
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
	"origin": {
        "sslValidationEnabled": true, 
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

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/originsettings/:siteId</a></code>

Edit origin settings for a site in a given [environment](#administration-environments).

Optional | &nbsp;
------- | -----------
`webSocketsEnabled` <br/>*boolean* | Specifies if web socket connections to the origin server are enabled. 
`pullProtocol` <br/>*string* | The type of protocol used to pull content from the origin. Must be one of ["HTTP", "HTTPS", "MATCH"]. "MATCH" is equivalent to "HTTP or HTTPS".
`hostHeader` <br/>*string* | The host header to be used to pull content from the origin.
`origin` <br/> *Object* | The primary origin that the CDN uses to pull content from. 
`origin.address` <br/> *string* | The address of the primary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`origin.authenticationEnabled` <br/> *boolean* | Specifies if the origin is using basic http authentication. To update origin.username and origin.password, this property must be set to true.
`origin.username` <br/> *string* | Username to use when authenticating with the origin. 
`origin.password` <br/> *string* | Password to use when authenticating with the origin. 
`origin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the origin is enabled. 
`origin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.
`backupOriginEnabled`<br/>*boolean* | Specifies if a backup origin for the site is configured. To configure backupOrigin's settings, this property must be set to true. 
`backupOriginExcludeCodes` <br/>*string* | Requests are made to the backup origin on any 4xx or 5xx response codes returned from the primary origin. This property specifies the response status codes for which calls to the backup origin must not be made. Multiple response codes can be excluded. e.g: "410, 411, 412".  Asterisks can be used to cover a range of codes. e.g. All the 4xx codes can be covered using "4*". 
`backupOrigin` <br/> *Object* | The secondary origin that the CDN uses to pull content from when the primary origin is not available. 
`backupOrigin.address` <br/> *string* | The address of the secondary origin that the CDN uses to pull content from. Can be a valid IPv4 address or a valid domain name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). Port must be one of [80, 8080, 443, 1935, 9091].
`backupOrigin.priority` <br/> *string* | The backup origin's priority to the scope. Must be one of ["ZERO", "ONE"]. "ZERO" has the highest priority.
`backupOrigin.authenticationEnabled` <br/> *boolean* | Specifies if the backup origin is using basic http authentication. To update backupOrigin.username and backupOrigin.password, this property must be set to true.
`backupOrigin.username` <br/> *string* | Username to use when authenticating with the backup origin. 
`backupOrigin.password` <br/> *string* | Password to use when authenticating with the backup origin. 
`backupOrigin.sslValidationEnabled` <br/> *boolean* | Specifies if SSL validation for the backup origin is enabled. 
`backupOrigin.commonCertificateName` <br/> *string* | Common name to validate SSL origin requests against.