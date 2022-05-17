#### Certificates

Add Secure Socket Layer (SSL) features to a site.

<!-------------------- LIST CERTIFICATES -------------------->

##### List certificates

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/certificates?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:
```json
{
  "data": [
    {
      "id": "2a12237d-c388-4c19-bff1-b019b837e8f1",
      "issuer": "Let's Encrypt",
      "caBundle": "-----BEGIN CERTIFICATE----- MIIEZTCCA02gAwIBAgIQQAF1BIMUpMghjISpDBbN3zANBgkqhkiG9w0BAQsFADA/ MSQwIgY...",
      "status": "failed",
      "expiresAt": "2021-04-01T18:11:11.903458Z",
      "commonName": "helloworld.com",
      "createdAt": "2021-04-01T18:11:11.904285Z",
      "isManaged": true,
      "trusted": false,
      "updatedAt": "2021-04-04T18:30:32.021842Z"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/certificates?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
--- | ---
`siteId`<br/>*UUID* | The ID of the site for which the certificate is applied to. This parameter is required.

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The unique identifier of the certificate.
`siteId`<br/>*UUID* | The unique identifier of the site for which the certificate is applied to.
`issuer`<br/>*string* | The authority who issued the certificate.
`caBundle`<br/>*string* | A PEM PKCS #7 formatted certificate authority bundle.
`status`<br/>*string* | A SSL certificate status.
`expiresAt`<br/>*string* | The date the certificate will expire and the status updated to EXPIRED.
`commonName`<br/>*string* | A certificate's common name, or the primary domain name the certificate is used for.
`createdAt`<br/>*string* | The date the certificate was created.
`updatedAt`<br/>*string* | The last time a certificate was updated by the provisioning process.
`isManaged`<br/>*boolean* | Whether a certificate is managed by StackPath or the end user.
`trusted`<br/>*boolean* | Whether or not the certificate's authority is trusted by a web browser.

List of possible values for the `status` attribute:

`status` | &nbsp;
--- | ---
`UNKNOWN` | StackPath is unable to determine the certificate's status. This is the default status for end-user provided certificates.
`PENDING` | The certificate is provisioning.
`EXPIRED` | The certificate has expired.
`FAILED` | The certificate failed to provision.
`PENDING_VERIFICATION` | The certificate is pending domain verification by the end user.
`ACTIVE` | The certificate is valid and is in use by one or more hosts.
`INACTIVE` | The certificate is valid but is not in use by any hosts.

<!-------------------- RETRIEVE A CERTIFICATE -------------------->

##### Retrieve a certificate

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/certificates/2a12237d-c388-4c19-bff1-b019b837e8f1?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:
```json
{
  "data": {
    "id": "2a12237d-c388-4c19-bff1-b019b837e8f1",
    "issuer": "Let's Encrypt",
    "caBundle": "-----BEGIN CERTIFICATE----- MIIEZTCCA02gAwIBAgIQQAF1BIMUpMghjISpDBbN3zANBgkqhkiG9w0BAQsFADA/ MSQwIgY...",
    "status": "failed",
    "expiresAt": "2021-04-01T18:11:11.903458Z",
    "commonName": "helloworld.com",
    "createdAt": "2021-04-01T18:11:11.904285Z",
    "isManaged": true,
    "trusted": false,
    "updatedAt": "2021-04-04T18:30:32.021842Z"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/certificates/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
--- | ---
`siteId`<br/>*UUID* | The ID of the site for which the certificate is applied to. This parameter is required.

Attributes | &nbsp;
--- | ---
`id`<br/>*UUID* | The unique identifier of the certificate.
`siteId`<br/>*UUID* | The unique identifier of the site for which the certificate is applied to.
`issuer`<br/>*string* | The authority who issued the certificate.
`caBundle`<br/>*string* | A PEM PKCS #7 formatted certificate authority bundle.
`status`<br/>*string* | A SSL certificate status.
`expiresAt`<br/>*string* | The date the certificate will expire and the status updated to EXPIRED.
`commonName`<br/>*string* | A certificate's common name, or the primary domain name the certificate is used for.
`createdAt`<br/>*string* | The date the certificate was created.
`updatedAt`<br/>*string* | The last time a certificate was updated by the provisioning process.
`isManaged`<br/>*boolean* | Whether a certificate is managed by StackPath or the end user.
`trusted`<br/>*boolean* | Whether or not the certificate's authority is trusted by a web browser.

List of possible values for the `status` attribute:

`status` | &nbsp;
--- | ---
`UNKNOWN` | StackPath is unable to determine the certificate's status. This is the default status for end-user provided certificates.
`PENDING` | The certificate is provisioning.
`EXPIRED` | The certificate has expired.
`FAILED` | The certificate failed to provision.
`PENDING_VERIFICATION` | The certificate is pending domain verification by the end user.
`ACTIVE` | The certificate is valid and is in use by one or more hosts.
`INACTIVE` | The certificate is valid but is not in use by any hosts.

<!-------------------- CREATE A CERTIFICATE -------------------->

##### Create a certificate

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
`taskId` <br/>*string* | The task id related to creation of the certificate.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- REQUEST A CERTIFICATE -------------------->

##### Request a certificate

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/certificates?operation=request&siteId=f9dea588-d7ab-4f42-b6e6-4b85f273f3db"
```
> Request body example for requesting a certificate:

```json
{
  "hosts": [
        {"domain": "helloworld.com"},
        {"domain": "www.helloworld.com"}
    ],
    "verificationMethod": "DNS"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/certificates?operation=request&siteId=<a href="#stackpath-sites">:siteId</a></code>

Request a certificate that will automatically be assigned to the site.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site. This parameter is required.

Required | &nbsp;
--- | ---
`verificationMethod`<br/>*Enum* | The verification method used to validate a requested certificate on a site. Possible values are: `DNS` and `HTTP`.

Optional| &nbsp;
----------------------- | -----------
`hosts`<br/>*Array[string]* | A list of delivery domains that will be included as subject alternative names on the certificate. If no hosts are provided, all delivery domains on the site will be included with the first one in the list being used as the common name. If hosts are provided, the first entry will be used as the common name. If the first host in the list is over 63 characters the shortest host provided will be used as the common name.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to creation of the certificate.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- DELETE A CERTIFICATE -------------------->

##### Delete a certificate

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
