#### SSL Certificates

Represents an SSL Certificate resource.

<!-------------------- LIST SSL CERTIFICATE -------------------->

##### List ssl certificate

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sslcertificates"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "certificate": "-----BEGIN CERTIFICATE-----
      (encoded certificate body in here)
      -----END CERTIFICATE-----",
      "creationTimestamp": "2019-10-02T10:36:39.138-07:00",
      "id": "6911678730387654321",
      "kind": "compute#sslCertificate",
      "name": "ssl-root-ozv",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/sslCertificates/ssl-root-ozv",
      "domain": "ApiDocsDomain",
      "organization": "ApiDocsOrg",
      "validUntil": "2020-09-30",
      "validFrom": "2019-10-01",
      "issuerName": "ApiDocs",
      "uploadDate": "2019-10-02"
    },
    {
      "certificate": "-----BEGIN CERTIFICATE-----
      (encoded certificate body in here)
      -----END CERTIFICATE-----",
      "creationTimestamp": "2019-10-01T13:33:36.409-07:00",
      "id": "2973924929495238351",
      "kind": "compute#sslCertificate",
      "name": "ssl-root-tcs",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/sslCertificates/ssl-root-tcs",
      "domain": "ApiDocsDomain",
      "organization": "ApiDocsOrg",
      "validUntil": "2020-09-30",
      "validFrom": "2019-10-01",
      "issuerName": "ApiDocs",
      "uploadDate": "2019-10-01"
    },
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sslcertificates</code>

Retrieve a list of all ssl certificates in an [environment](#administration-environments).

| Attributes                          | &nbsp; |
| ----------------------------------- | ------ |
| `certificate`<br/>*String* | A local certificate file. The certificate must be in PEM format. The certificate chain must be no greater than 5 certs long. The chain must include at least one intermediate cert.|
| `creationTimestamp`<br/>*String*             | Creation timestamp in RFC3339 text format.|
| `domain`<br/>*string*           | The domain name on certificate. |
| `id`<br/>*String*   | The id of the ssl certificate. |
| `issuerName`<br/>*string*           | Name of the issuer. |
| `kind`<br/>*string*                 | Type of the resource. Always compute#sslCertificate for ssl certificate.|
| `name`<br/>*string*                 | Name of the resource. |
| `organization`<br/>*string*           | The organization to which certificate belongs. |
| `selfLink`<br/>*string*             | Server-defined URL for the resource. |
| `uploadDate`<br/>*string*           | Date when certificate is uploaded. |
| `validFrom`<br/>*string*           | Date from when certificate is valid. |
| `validUntil`<br/>*string*           | Date up until which certificate is valid. |

<!-------------------- RETRIEVE A SSL CERTIFICATE -------------------->

##### Retrieve a ssl certificate

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sslcertificates/6911678730334723784"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "certificate": "-----BEGIN CERTIFICATE-----
    (encoded certificate body in here)
    -----END CERTIFICATE-----",
    "creationTimestamp": "2019-10-02T10:36:39.138-07:00",
    "id": "6911678730334723784",
    "kind": "compute#sslCertificate",
    "name": "ssl-root-ozv",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/test-area/global/sslCertificates/ssl-root-ozv",
    "domain": "ApiDocsDomain",
    "organization": "ApiDocsOrg",
    "validUntil": "2020-09-30",
    "validFrom": "2019-10-01",
    "issuerName": "ApiDocs",
    "uploadDate": "2019-10-02"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sslcertificates/:id</code>

Retrieve a ssl certificate in an [environment](#administration-environments).

| Attributes                          | &nbsp; |
| ----------------------------------- | ------ |
| `certificate`<br/>*String* | A local certificate file. The certificate must be in PEM format. The certificate chain must be no greater than 5 certs long. The chain must include at least one intermediate cert.|
| `creationTimestamp`<br/>*String*             | Creation timestamp in RFC3339 text format.|
| `domain`<br/>*string*           | The domain name on certificate. |
| `id`<br/>*String*   | The id of the ssl certificate. |
| `issuerName`<br/>*string*           | Name of the issuer. |
| `kind`<br/>*string*                 | Type of the resource. Always compute#sslCertificate for ssl certificate.|
| `name`<br/>*string*                 | Name of the resource. |
| `organization`<br/>*string*           | The organization to which certificate belongs. |
| `selfLink`<br/>*string*             | Server-defined URL for the resource. |
| `uploadDate`<br/>*string*           | Date when certificate is uploaded. |
| `validFrom`<br/>*string*           | Date from when certificate is valid. |
| `validUntil`<br/>*string*           | Date up until which certificate is valid. |

<!-------------------- CREATE A SSL CERTIFICATE -------------------->

##### Create ssl certificate

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sslcertificates"
```
> Request body example:

```json
{
	"name": "ssl-root-rny",
	"privateKey": "-----BEGIN RSA PRIVATE KEY-----
  (encoded private key body in here)
  -----END RSA PRIVATE KEY-----",
	"certificate": "-----BEGIN CERTIFICATE-----
  (encoded certificate body in here)
  -----END CERTIFICATE-----",
	"chainCertificate": "-----BEGIN CERTIFICATE-----
  (encoded chain certificate body in here)
  -----END CERTIFICATE-----",
	"description": "Api docs demo certificate"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sslcertificates</code>

Create a new ssl certificate.

| Required | &nbsp;|
| --- | --- |
| `certificate`<br/>*string* | Public key certificate in PEM format. |
| `chainCertificate`<br/>*string* | Chain certificates in PEM format, if there are any. Also total number of certificates, including main certificate cannot be more than 5. |
| `description`<br/>*string* | A short description of this certificate. |
| `name`<br/>*string* | The display name of the ssl certificate. |
| `privateKey`<br/>*string* | The privateKey associated to certificate in PEM format. |

<!-------------------- DELETE A SSL CERTIFICATE -------------------->

##### Delete a ssl certificate

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sslcertificates/2973924929495212345"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sslcertificates/:id</code>

Delete an existing SSL certificate. SSL certificate can only be deleted if it is not used in any [target proxy](#gcp-target-proxies).