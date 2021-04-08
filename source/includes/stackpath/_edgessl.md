### EdgeSSL

View and manage SSL settings and certificates. 

<!-------------------- RETRIEVE EDGESSL SETTINGS -------------------->

#### Retrieve EdgeSSL settings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/edgesslsettings/eb3ecdbe-d73b-40e6-a263-166accba75ed"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
    "forceHttps": true,
    "minTlsVersion": "V1_2"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/edgesslsettings/:id</a></code>

Retrieve the EdgeSSL settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID*  | A site's unique identifier. 
`forceHttps`<br/>*boolean*  | Whether the site redirects all visitors to use HTTPS instead of HTTP. 
`minTlsVersion`<br/>*string*  | The minimum TLS version clients must have to access the application. 


#### Edit EdgeSSL settings

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/edgesslsettings/eb3ecdbe-d73b-40e6-a263-166accba75ed"
```

> The above command returns a JSON structured like this:

```json
{
    "forceHttps": "true",
    "minTlsVersion": "V1_2"
}
```

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/edgesslsettings/:id</a></code>

Edit the EdgeSSL settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`forceHttps`<br/>*boolean* | Whether the site redirects all visitors to use HTTPS instead of HTTP.
`minTlsVersion`<br/>*string* | The minimum TLS version clients must have to access the application.

One or both of these attributes can be updated at the same time.

<!-------------------- CREATE A CERTIFICATE -------------------->

#### Create a certificate

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/certificates?siteId=f9dea588-d7ab-4f42-b6e6-4b85f273f3db"
```
> Request body example for creating a certificate:

```json
{
  "certificate": "-----BEGIN CERTIFICATE----- X509 certificate content -----END CERTIFICATE-----",
  "key": "-----BEGIN PRIVATE KEY----- Private key of the certificate -----END PRIVATE KEY-----",
  "caBundle": "-----BEGIN CERTIFICATE----- Certificate authority bundle  -----END CERTIFICATE-----"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/certificates?siteId=<a href="#stackpath-sites">:siteId</a></code>

Create a certificate that will automatically be assigned to the site based on the hostnames of the certificate. 

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site. This parameter is required.

Required| &nbsp;
------------------------| -----------
`certificate`<br/>*string* | The X509 certificate.
`key`<br/>*string* | The private key of the certificate.

Optional| &nbsp;
----------------------- | -----------
`caBundle`<br/>*string* | The certificate authority bundle.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to creation of the Certificate.
`taskStatus` <br/>*string* | The status of the operation.


<!-------------------- DELETE A CERTIFICATE -------------------->

#### Delete a certificate

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/certificates/2318483?siteId=6f6c1724-c306-433c-9e09-95227edc7c6c"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/certificates/:id?siteId=:siteId</code>

Delete a certificate.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the certificate. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the certificate deletion.
`taskStatus` <br/>*string* | The status of the operation.
