## DNS Zones

Create and manage your DNS zones.

<!-------------------- LIST DNS ZONES -------------------->

### List DNS Zones

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnszones"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
      "accountId": "69b60c67-6175-4515-bb66-033108306X66",
      "domain": "mydomain.com",
      "version": "3",
      "created": "2021-07-28T17:13:42.863239Z",
      "updated": "2021-07-28T17:14:25.246331Z",
      "nameservers": [
        "xx2xx0.stackpathdns.net",
        "ss3xx3.stackpathdns.net"
      ],
      "disabled": false,
      "id": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
      "verified": "2021-07-28T17:14:25.246331Z",
      "status": "ACTIVE"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnszones</code>

Retrieve a list of all DNS zones in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A zone's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`accountId`<br/>*string* | The ID of the StackPath account that owns a zone.
`domain`<br/>*string* | The name of the zone.
`version`<br/>*string* | The version of the zone. Version numbers are incremented automatically when a zone is updated.
`created`<br/>*string* | The date on which the DNS zone was created.
`updated`<br/>*string* | The date on which the DNS zone was last updated.
`nameservers`<br/>*Array[string]* | The hostnames of the StackPath resolvers that host a zone. Every zone has multiple name servers assigned by StackPath upon creation for redundancy purposes.
`disabled`<br/>*boolean* | Whether or not a zone has been disabled by the user.
`verified`<br/>*string* | The date a zone's nameservers were last audited by StackPath.
`status`<br/>*string* | The status of the zone. It can either be `ACTIVE`, `INACTIVE`.

<!-------------------- RETRIEVE A DNS ZONE -------------------->

### Retrieve a DNS zone

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnszones/9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
    "accountId": "69b60c67-6175-4515-bb66-033108306X66",
    "domain": "mydomain.com",
    "version": "3",
    "created": "2021-07-28T17:13:42.863239Z",
    "updated": "2021-07-28T17:14:25.246331Z",
    "nameservers": [
      "xx2xx0.stackpathdns.net",
      "ss3xx3.stackpathdns.net"
    ],
    "disabled": false,
    "id": "eb3ecdbe-d73b-40e6-a263-166accba75ed",
    "verified": "2021-07-28T17:14:25.246331Z",
    "status": "ACTIVE"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnszones/:id</code>

Retrieve a DNS zone in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A zone's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`accountId`<br/>*string* | The ID of the StackPath account that owns a zone.
`domain`<br/>*string* | The name of the zone.
`version`<br/>*string* | The version of the zone. Version numbers are incremented automatically when a zone is updated.
`created`<br/>*string* | The date on which the DNS zone was created.
`updated`<br/>*string* | The date on which the DNS zone was last updated.
`nameservers`<br/>*Array[string]* | The hostnames of the StackPath resolvers that host a zone. Every zone has multiple name servers assigned by StackPath upon creation for redundancy purposes.
`disabled`<br/>*boolean* | Whether or not a zone has been disabled by the user.
`verified`<br/>*string* | The date a zone's nameservers were last audited by StackPath.
`status`<br/>*string* | The status of the zone. It can either be `ACTIVE`, `INACTIVE`.

<!-------------------- DELETE A DNS ZONE -------------------->

#### Delete a DNS zone

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnszones/9ae3717a-006a-4aa7-b64b-8bc8d2f2d6e5"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnszones/:id</code>

Delete a DNS zone

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the DNS zone deletion.
`taskStatus` <br/>*string* | The status of the operation.