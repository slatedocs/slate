### Delivery domains

Delivery domains allow the CDN to recognize an HTTP request and associate it with a site.

<!-------------------- LIST DELIVERY DOMAINS -------------------->

#### List delivery domains

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliverydomains?siteId=439b145a-7c55-4a73-8cf2-d8faabfe6d22"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "439b145a-7c55-4a73-8cf2-d8faabfe6d22/test-domain.com",
      "stackId": "3deddcbd-3757-44cf-a4a6-93028fc4649a",
      "siteId": "439b145a-7c55-4a73-8cf2-d8faabfe6d22",
      "domain": "test-domain.com"
    },
    {
      "id": "439b145a-7c55-4a73-8cf2-d8faabfe6d22/u7f7rXXX.stackpathcdn.com",
      "stackId": "3deddcbd-3757-44cf-a4a6-93028fc4649a",
      "siteId": "439b145a-7c55-4a73-8cf2-d8faabfe6d22",
      "domain": "u7f7rXXX.stackpathcdn.com",
      "validatedAt": "2021-02-26T19:00:15.177411Z"
    },
    {
      "id": "439b145a-7c55-4a73-8cf2-d8faabfe6d22/www.test-domain.com",
      "stackId": "3deddcbd-3757-44cf-a4a6-93028fc4649a",
      "siteId": "439b145a-7c55-4a73-8cf2-d8faabfe6d22",
      "domain": "www.test-domain.com"
    }
  ],
  "metadata": {
    "recordCount": 3
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliverydomains?siteId=<a href="#stackpath-site"><a href="#stackpath-site">:siteId</a></a></code>

Retrieve a list of all delivery domains in a given [environment](#administration-environments) for a [site] (#stackpath-site).

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to list delivery domains. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The delivery domain unique identifier.
`domain`<br/>*string* | The site's domain name.
`siteId`<br/>*UUID* | The ID of the site that the delivery domain belongs to.
`stackId`<br/>*UUID* | The ID of the stack that the site belongs to.
`updatedAt`<br/>*string* | The date the domain was validated to be pointing to Stackpath.

<!-------------------- RETRIEVE A DELIVERY DOMAIN -------------------->

#### Retrieve a delivery domain

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliverydomains/439b145a-7c55-4a73-8cf2-d8faabfe6d22/test-domain.com"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "439b145a-7c55-4a73-8cf2-d8faabfe6d22/test-domain.com",
    "stackId": "3deddcbd-3757-44cf-a4a6-93028fc4649a",
    "siteId": "439b145a-7c55-4a73-8cf2-d8faabfe6d22",
    "domain": "test-domain.com"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliverydomains/:id</code>

Retrieve a delivery domain of a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The delivery domain unique identifier.
`domain`<br/>*string* | The site's domain name.
`siteId`<br/>*UUID* | The ID of the site that the delivery domain belongs to.
`stackId`<br/>*UUID* | The ID of the stack that the site belongs to.
`updatedAt`<br/>*string* | The date the domain was validated to be pointing to Stackpath.

<!-------------------- DELETE A DELIVERY DOMAIN -------------------->

#### Delete a delivery domain

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliverydomains/439b145a-7c55-4a73-8cf2-d8faabfe6d22/test-domain.com"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliverydomains/:id</code>

Delete a delivery domain of a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- CREATE A DELIVERY DOMAIN -------------------->

#### Create a delivery domain

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliverydomains?siteId=a2fefb15-7e31-4c72-87e0-5a892e91c8d9"
```

> Request body example:

```json
{
  "domain": "new-domain.com",
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliverydomains?siteId=:id</code>

Create a delivery domain of a site in a given [environment](#administration-environments).

Required | &nbsp;
---------- | -----------
`domain`<br/>*string* | The site's domain name.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the domain creation.
`taskStatus` <br/>*string* | The status of the operation.