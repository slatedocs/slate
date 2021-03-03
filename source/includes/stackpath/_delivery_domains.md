## Delivery domains

Delivery domains allow the CDN to recognize an HTTP request and associate it with a site.

<!-------------------- LIST DELIVERY DOMAINS -------------------->

### List delivery domains

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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliverydomains?siteId=<a href="#stackpath-sites">:siteId</a></code>

Retrieve a list of all delivery domains in a given [environment](#administration-environments) for a [site] (#stackpath-sites).

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to list delivery domains. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The delivery domain unique identifier.
`domain`<br/>*string* | The site's domain name.
`siteId`<br/>*UUID* | The ID of the site that a the delivery domain belongs to.
`stackId`<br/>*UUID* | The ID of the stack that the site belongs to.
`updatedAt`<br/>*string* | The date the domain was validated to be pointing to Stackpath.