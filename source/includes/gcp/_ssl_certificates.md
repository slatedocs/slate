#### SSL Certificates

Represents an SSL Certificate resource.

<!-------------------- LIST SSL CERTIFICATE -------------------->

##### List ssl certificate

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/sslcertificates"

# Example:
```

```json
{
  "data": [
    {
      "certificate": "-----BEGIN CERTIFICATE-----MIIDnDCCAoQCCQDQz2lClG3ipTANBgkqhkiG9w0BAQsFADCBjzELMAkGA1UEBhMCQ0ExDzANBgNVBAgMBlF1ZWJlYzERMA8GA1UEBwwITW9udHJlYWwxEzARBgNVBAoMCkV4YW1wbGVPcmcxFDASBgNVBAsMC0V4YW1wbGVVbml0MQ8wDQYDVQQDDAZZb2dlc2gxIDAeBgkqhkiG9w0BCQEWEWV4YW1wbGVAZ21haWwuY29tMB4XDTE5MTAwMTE3NDgxNFoXDTIwMDkzMDE3NDQBatUVaR88KgmSt8B1vPS0BRyN06jAzzwaJU79yF62qh5mdXXz4dm3mwncrL4vNxdDo+4HREsmdePwmcMT1f7f7gNRMe2OQfnntIYjkuDvuzxhBgdfqXEr2s
      -----END CERTIFICATE-----",
      "creationTimestamp": "2019-10-02T10:36:39.138-07:00",
      "id": "6911678730387654321",
      "kind": "compute#sslCertificate",
      "name": "ssl-root-ozv",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/cmc-gcpenvironment-rjb/global/sslCertificates/ssl-root-ozv",
      "domain": "ApiDocsDomain",
      "organization": "ApiDocsOrg",
      "validUntil": "2020-09-30",
      "validFrom": "2019-10-01",
      "issuerName": "ApiDocs",
      "uploadDate": "2019-10-02"
    },
    {
      "certificate": "-----BEGIN CERTIFICATE-----MIIDnDCCAoQCCQDQz2lClG3ipTANBgkqhkiG9w0BAQsFAELMAkGA1UEBhMCIL6BLzjFCyeJ6nMLGwC0v/ptdkT+N4XvfjRjrO1t7B8jOzZy7gqfxElXA5XLpwrWT6AASg9M5IWd87r8Cor/hCuJ25bZbHECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAFoe0Y8qU0nTBMexn/QBatUVaR88KgmSt8B1vPS0BRyN06jAzzwaJU79yF62qh5mdXXz4dm3mwncrL4v+4HREsmdePwmcMT1f7f7gNRMe2OQfnntIYjkuDvuzxhBgdfqXEr2s
      -----END CERTIFICATE-----",
      "creationTimestamp": "2019-10-01T13:33:36.409-07:00",
      "id": "2973924929495238351",
      "kind": "compute#sslCertificate",
      "name": "ssl-root-tcs",
      "selfLink": "https://www.googleapis.com/compute/v1/projects/cmc-gcpenvironment-rjb/global/sslCertificates/ssl-root-tcs",
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
   "https://cloudmc_endpoint/v1/services/gcp/test-area/sslcertificates/6911678730334723784"

# Example:
```

```json
{
  "data": {
    "certificate": "-----BEGIN CERTIFICATE-----MIIDnDCCAoQCCQDQz2lClG3ipTANBgkqhkiG9w0BAQsFADCBjzELMAkGA1UEBhMCQ0ExDzANBgNVBAgMBlF1ZWJlYzERMA8GA1UEBwwITW9udHJlYWwxEzARBgNVBAoMCkV4YW1wbGVPcmcxFDASBgNVBAsMC0V4YW1wbGVVbml0MQ8wDQYDVQQDDAZZb2dlc2gxIDAeBgkqhkiG9w0BCQEWEWV4YW1wbGVAZ21haWwuY29tMB4XDTE5MTAwMTE3NDgxNFoXDTIwMDkzMDE3NDgxNFowgY8xCzAJBgNVBAYTAkNBMQ8wDQYDVQQIDAZRdWViZWMxETAPBgNVBAcMCE1vbnRyZWFsMRMwEQYDVQQKDApFeGFtcGxlT3JnMRQwEgYDVQQLDAtFeGFtcGxlVW5pdDEPMA0GA1UEAwwGWW9nZXNoMSAwHgYJKoZIhvcNAQkBFhFleGFtcGxlQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMi44rlaD/Lu0Zq8FjD8elGWIBJMB99AZ
    -----END CERTIFICATE-----",
    "creationTimestamp": "2019-10-02T10:36:39.138-07:00",
    "id": "6911678730334723784",
    "kind": "compute#sslCertificate",
    "name": "ssl-root-ozv",
    "selfLink": "https://www.googleapis.com/compute/v1/projects/cmc-gcpenvironment-rjb/global/sslCertificates/ssl-root-ozv",
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
   "https://cloudmc_endpoint/v1/services/gcp/test-area/sslcertificates"

# Example:
```

```json
{
	"name":"ssl-root-rny",
	"privateKey":"-----BEGIN RSA PRIVATE KEY-----MIIEpAIBAAKCAQEAyLjiuVoP8u7RmrwWMPx6UZYgEkwH30Bk137ldEfeV66QuHPW1NZYhthfEw8e8/q/zpVy80mcKmUVRWKYwjKo9t3NQRzDwKFoQB7GGEiqPRztuA24Q6dFoXrWkS/wb8GVVepcjx/n5vgqq3redENRyNXVzz/XfrqYImLydL2izOqdthjw2ksvn7q9LvoKpkKczqJpUzYGggBYL3H0C2kLQ0166nPE0pel34voE6KYGya6oFBRzknIIJwgvoEvOMULJ4nqcwsbALS/+m12RP43he9+NGOs7W3sHyM7NnLuCp/ESVcDlcunCtZPoABKD0zkhZ3zuvwKiv+EK4nbltlscQIDAQABAoIBAQC3O-----END RSA PRIVATE KEY-----",
	"certificate":"-----BEGIN CERTIFICATE-----hCuJ25bZbHECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAFoe0Y8qU0nTBMexn/QBatUVaR88KgmSt8B1vPS0BRyN06jAzzwaJU79yF62qh5mdXXz4dm3mwncrL4vNxdDo+4HREsmdePwmcMT1f7f7gNRMe2OQfnntIYjkuDvuzxhBgdfqXEr2s+ZLHRCtMbn41KH1aNQ33XA0oJR9ou6dPFQ34YOyKcFwdBB8OouUA8KyDYZnKAn6yYcsXSCDD1/x9Sw0+P/-----END CERTIFICATE-----",
	"chainCertificate":"-----BEGIN CERTIFICATE-----MIIDnDCCAoQCCQDQz2lClG3ipTANBgkqhkiG9w0BAQsFADCBjzELMAkGA1UEBhMCQ0ExDzANBgNVBAgMBlF1ZWJlYzERMA8GA1UEBwwITW9udHJlYWwxEzARBgNVBAoMCkV4YW1wbGVPcmcxFDASBgNVBAsMC0V4YW1wbGVVbml0MQ8wDQYDVQQDDAZZb2dlc2gxIDAeBgkqhkiG9w0BCQEWEWV4YW1wbGVAZ21haWwuY29tMB4XDTE5MTAwMTE3NDgxNFoXDTIwMDkzMDE3NDgxNFowgY8xCzAJBgNVBAYTAkNBMQ8wDQYDVQQIDAZRdWViZWMxETAPBgNVBAcMCE1vbnRyZWFsMRMwEQYDVQQKDApFeGFtcGxlT3JnMRQwEgYDVQQLDAtFeGFtcGxlVW5pdDEPMA0GA1UEAwwGWW9nZXNoMSAwHgYJKoZIhvcNAQkBFhFleGF-----END CERTIFICATE-----",
	"description":"Api docs demo certificate"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sslcertificates</code>

Create a new ssl certificate

| Required | &nbsp;|
| --- | --- |
| `certificate`<br/>*string* | Public key certificate in PEM format |
| `chainCertificate`<br/>*string* | Chain certificates in PEM format, if there are any. Also total number of certificates, including main certificate cannot be more than 5. |
| `description`<br/>*string* | A short description of this certificate. |
| `name`<br/>*string* | The display name of the ssl certificate |
| `privateKey`<br/>*string* | The privateKey associated to certificate in PEM format. |
