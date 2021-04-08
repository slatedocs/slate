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
`forceHttps`<br/>*boolean* | Whether the site redirects all visitors to use HTTPS instead of HTTP.
`minTlsVersion`<br/>*string* | The minimum TLS version clients must have to access the application.

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