### DNS Records

Create and manage your DNS records associated to your zones.

<!-------------------- LIST DNS RECORDS -------------------->

#### List DNS Records

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnsrecords?zoneId=337c7c26-31f4-4b2e-83dc-126exxxxxxWr"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "4eea2e59-8d06-4f37-8fd1-035e3314dxxD",
      "stackId": "7fbea2c0-17d0-41df-b0b1-4d5c95234566",
      "zoneId": "337c7c26-31f4-4b2e-83dc-126exxxxxxWr",
      "name": "test1",
      "type": "A",
      "classCode": "IN",
      "ttl": 21600,
      "data": "127.0.0.0",
      "weight": 1,
      "created": "2021-07-28T17:14:07.928210Z",
      "updated": "2021-07-28T17:14:07.928210Z"
    },
    {
      "id": "0a18b323-72df-447a-af81-08a2ea62re45",
      "stackId": "7fbea2c0-17d0-41df-b0b1-4d5c95234566",
      "zoneId": "337c7c26-31f4-4b2e-83dc-126exxxxxxWr",
      "name": "test2",
      "type": "TXT",
      "classCode": "IN",
      "ttl": 300,
      "data": "123 312 12",
      "weight": 1,
      "created": "2021-07-28T17:14:25.229376Z",
      "updated": "2021-07-28T17:14:25.229376Z"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnsrecords?zoneId=:zoneId</code>

Retrieve a list of all DNS records in a given DNS zone in an [environment](#administration-environments).

Query Params | &nbsp;
---- | -----------
`zoneId`<br/>*UUID* | The ID of the zone for which we list the records. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A record's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a record belongs to.
`zoneId`<br/>*string* | The ID of zone that the record belongs to.
`name`<br/>*string* | The name of the record. Use the value "@" to denote current root domain name.
`type`<br/>*string* | A zone record's type. Zone record types describe the zone record's behavior.
`classCode`<br/>*string* | A zone record's class code. This is typically "IN" for Internet related resource records.
`ttl` <br/>*int* | A zone record's time to live. A record's TTL is the number of seconds that the record should be cached by DNS resolvers. Use lower TTL values if you expect zone records to change often. Use higher TTL values for records that won't change to prevent extra DNS lookups by clients.
`data`<br/>*string* | A zone record's value.
`weight` <br/>*int* | A zone record's priority. A resource record is replicated in StackPath's DNS infrastructure the number of times of the record's weight, giving it a more likely response to queries if a zone has records with the same name and type.
`created`<br/>*string* | The date on which the DNS record was created.
`updated`<br/>*string* | The date on which the DNS record was last updated.

<!-------------------- RETRIEVE A DNS RECORD -------------------->

#### Retrieve a DNS record

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnsrecords/0a18b323-72df-447a-af81-08a2ea62re45?zoneId=337c7c26-31f4-4b2e-83dc-126exxxxxxWr"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
      "id": "0a18b323-72df-447a-af81-08a2ea62re45",
      "stackId": "7fbea2c0-17d0-41df-b0b1-4d5c95234566",
      "zoneId": "337c7c26-31f4-4b2e-83dc-126exxxxxxWr",
      "name": "test2",
      "type": "TXT",
      "classCode": "IN",
      "ttl": 300,
      "data": "123 312 12",
      "weight": 1,
      "created": "2021-07-28T17:14:25.229376Z",
      "updated": "2021-07-28T17:14:25.229376Z"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnsrecords/:id?zoneId=:zoneId</code>

Retrieve a DNS record in a given DNS zone in an [environment](#administration-environments) .

Query Params | &nbsp;
---- | -----------
`zoneId`<br/>*UUID* | The ID of the zone for which we want to get the record. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | A record's unique identifier. 
`stackId`<br/>*string* | The ID of the stack that a record belongs to.
`zoneId`<br/>*string* | The ID of zone that the record belongs to.
`name`<br/>*string* | The name of the record. Use the value "@" to denote current root domain name.
`type`<br/>*string* | A zone record's type. Zone record types describe the zone record's behavior.
`classCode`<br/>*string* | A zone record's class code. This is typically "IN" for Internet related resource records.
`ttl` <br/>*int* | A zone record's time to live. A record's TTL is the number of seconds that the record should be cached by DNS resolvers. Use lower TTL values if you expect zone records to change often. Use higher TTL values for records that won't change to prevent extra DNS lookups by clients.
`data`<br/>*string* | A zone record's value.
`weight` <br/>*int* | A zone record's priority. A resource record is replicated in StackPath's DNS infrastructure the number of times of the record's weight, giving it a more likely response to queries if a zone has records with the same name and type.
`created`<br/>*string* | The date on which the DNS record was created.
`updated`<br/>*string* | The date on which the DNS record was last updated.

<!-------------------- CREATE A DNS RECORD -------------------->

#### Create a DNS record

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnsrecords?zoneId=337c7c26-31f4-4b2e-83dc-126exxxxxxWr"
```
> Request body example for creating a DNS record:

```json
{
  "name": "*",
  "type": "NS",
  "ttl": 3600,
  "data": "ns1.above.com.",
  "weight": 1
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnsrecords?zoneId=:zoneId</code>

Create a DNS record in a given [environment](#administration-environments).

Query Params | &nbsp;
---- | -----------
`zoneId`<br/>*UUID* | The ID of the zone for which we want to create the record. This parameter is required.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The name of the record. Use the value "@" to denote current root domain name.
`type`<br/>*string* | A DNS record's type. DNS record types describe the record's behavior.
`ttl` <br/>*int* | A DNS record's time to live. A record's TTL is the number of seconds that the record should be cached by DNS resolvers. Use lower TTL values if you expect zone records to change often. Use higher TTL values for records that won't change to prevent extra DNS lookups by clients.
`data`<br/>*string* | A DNS record's value.

Optional | &nbsp;
------- | -----------
`weight` <br/>*int* | A DNS record's priority. A resource record is replicated in StackPath's DNS infrastructure the number of times of the record's weight, giving it a more likely response to queries if a zone has records with the same name and type.

<!-------------------- UPDATE A DNS RECORD -------------------->

#### Update a DNS record

```shell
curl -X PUT \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnsrecords/0a18b323-72df-447a-af81-08a2ea62re45?zoneId=337c7c26-31f4-4b2e-83dc-126exxxxxxWr"
```
> Request body example for creating a DNS record:

```json
{
  "name": "*",
  "type": "NS",
  "ttl": 3600,
  "data": "ns1.above.com.",
  "weight": 1
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnsrecords?zoneId=:zoneId</code>

Update a DNS record in a given [environment](#administration-environments).

Query Params | &nbsp;
---- | -----------
`zoneId`<br/>*UUID* | The ID of the zone for which we want to update the record. This parameter is required.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The name of the record. Use the value "@" to denote current root domain name.
`type`<br/>*string* | A DNS record's type. DNS record types describe the record's behavior.
`ttl` <br/>*int* | A DNS record's time to live. A record's TTL is the number of seconds that the record should be cached by DNS resolvers. Use lower TTL values if you expect zone records to change often. Use higher TTL values for records that won't change to prevent extra DNS lookups by clients.
`data`<br/>*string* | A DNS record's value.

Optional | &nbsp;
------- | -----------
`weight` <br/>*int* | A DNS record's priority. A resource record is replicated in StackPath's DNS infrastructure the number of times of the record's weight, giving it a more likely response to queries if a zone has records with the same name and type.

<!-------------------- DELETE A DNS RECORD -------------------->

#### Delete a DNS record

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/dnsrecords/0a18b323-72df-447a-af81-08a2ea62re45?zoneId=337c7c26-31f4-4b2e-83dc-126exxxxxxWr"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "ef70cafa-0544-4709-a66a-c68595ee105a",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/dnsrecords/:id?zoneId=:zoneId</code>

Delete a DNS record.

Query Params | &nbsp;
---- | -----------
`zoneId`<br/>*UUID* | The ID of the zone for which we want to delete the record. This parameter is required.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the DNS zone deletion.
`taskStatus` <br/>*string* | The status of the operation.
