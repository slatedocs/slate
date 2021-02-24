## Sites

Create and manage your CDN, WAF, and/or Serverless Scripting Delivery sites. 

<!-------------------- LIST SITES -------------------->

### List sites

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
      "domain": "slow-test.com",
      "createdAt": "2021-02-19T19:29:58.713874Z",
      "updatedAt": "2021-02-19T19:30:04.656652Z",
      "services": [
        "CDN",
        "SERVERLESS_EDGE_ENGINE",
        "WAF"
      ],
      "id": "9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5",
      "status": "ACTIVE"
    },
    {
      "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
      "domain": "speedytest.com",
      "createdAt": "2021-02-08T14:57:01.576395Z",
      "updatedAt": "2021-02-08T14:57:09.861832Z",
      "services": [
        "CDN",
        "WAF"
      ],
      "id": "04deb6d1-ad84-425f-8f10-92106a22c3b4",
      "status": "ACTIVE"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites</code>

Retrieve a list of all sites in a given [environment](#administration-environments).

Optional | &nbsp;
------ | -----------
`status`<br/>*string* | Setting the status parameter will return only the **stackpath sites** with that particular status. The site's status can either be `ACTIVE`, `PENDING`, or `PROVISIONING`.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A sites's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`domain`<br/>*string* | The domain of the site.
`status`<br/>*string* | The status of the site. It can either be `ACTIVE`, `PENDING`, or `PROVISIONING`.
`createdAt`<br/>*string* | The date on which the site was created.
`updatedAt`<br/>*string* | The date on which the site was last updated.
`services`<br/>*array* | List of services running on the site.

<!-------------------- RETRIEVE A SITE -------------------->

### Retrieve a site

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
    "domain": "slow-test.com",
    "createdAt": "2021-02-19T19:29:58.713874Z",
    "updatedAt": "2021-02-19T19:30:04.656652Z",
    "services": [
      "CDN",
      "SERVERLESS_EDGE_ENGINE",
      "WAF"
    ],
    "id": "9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5",
    "status": "ACTIVE"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id</code>

Retrieve a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A sites's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`domain`<br/>*string* | The domain of the site.
`status`<br/>*string* | The status of the site. It can either be `ACTIVE`, `PENDING`, or `PROVISIONING`.
`createdAt`<br/>*string* | The date on which the site was created.
`updatedAt`<br/>*string* | The date on which the site was last updated.
`services`<br/>*array* | List of services running on the site.