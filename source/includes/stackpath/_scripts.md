## Scripts

Deploy and manage Serverless Scripts used to interact with requests made to the site.

<!-------------------- LIST SCIPTS -------------------->

### List scripts

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/scripts/4d13a920-79b7-4129-957b-bd4f006b1ac8?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "4d13a920-79b7-4129-957b-bd4f006b1ac8",
      "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "scriptName",
      "createdAt": "2021-03-15T19:05:45.157987Z",
      "updatedAt": "2021-03-15T19:05:45.157987Z",
      "version": "1",
      "routes": [
        "v1/api"
      ]
    },
    {
      "id": "28e6b0c7-ee5d-4bd3-abfb-13dfc6e15c0d",
      "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "scriptName2",
      "createdAt": "2021-03-15T18:53:18.587749Z",
      "updatedAt": "2021-03-15T18:53:18.587749Z",
      "version": "1",
      "routes": [
        "v1/api",
        "v2/api"
      ]
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to list the scripts. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The unique identifier for the script.
`stackId`<br/>*string* | The ID of the stack that the script belongs to.
`siteId`<br/>*string* | The ID of the site that the script belongs to.
`name`<br/>*string* | The display name of the script.
`createdAt`<br/>*string* | Creation timestamp of the script.
`updatedAt`<br/>*string* | The date on which the script was last updated.
`version`<br/>*string* | The version number of the script.
`routes`<br/>*Array[string]* | The routes that incoming requests should respond with a script.

<!-------------------- RETRIEVE A SCRIPT --------------------->

### Retrieve a script

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/scripts/439b145a-7c55-4a73-8cf2-d8faabfe6d22/test-domain.com"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "4d13a920-79b7-4129-957b-bd4f006b1ac8",
    "stackId": "87e22df5-cac9-4e42-9b75-02996af95566",
    "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
    "name": "scriptName1",
    "createdAt": "2021-03-15T19:05:45.157987Z",
    "updatedAt": "2021-03-15T19:05:45.157987Z",
    "code": "Ly8gc2FtcGxlIHNjcmlwdAphZGRFdmVudExpc3RlbmVyKCJmZXRjaCIsIGV2ZW50ID0+IHsKICBldmVudC5yZXNwb25kV2l0aChoYW5kbGVSZXF1ZXN0KGV2ZW50LnJlcXVlc3QpKTsKfSk7CgovKioKICogRmV0Y2ggYW5kIHJldHVybiB0aGUgcmVxdWVzdCBib2R5CiAqIEBwYXJhbSB7UmVxdWVzdH0gcmVxdWVzdAogKi8KYXN5bmMgZnVuY3Rpb24gaGFuZGxlUmVxdWVzdChyZXF1ZXN0KSB7CiAgLy8gV3JhcCB5b3VyIHNjcmlwdCBpbiBhIHRyeS9jYXRjaCBhbmQgcmV0dXJuIHRoZSBlcnJvciBzdGFjayB0byB2aWV3IGVycm9yIGluZm9ybWF0aW9uCiAgdHJ5IHsKICAgIC8qIFRoZSByZXF1ZXN0IGNhbiBiZSBtb2RpZmllZCBoZXJlIGJlZm9yZSBzZW5kaW5nIGl0IHdpdGggZmV0Y2ggKi8KCiAgICBjb25zdCByZXNwb25zZSA9IGF3YWl0IGZldGNoKHJlcXVlc3QpOwoKICAgIC8qIFRoZSByZXNwb25zZSBjYW4gYmUgbW9kaWZpZWQgaGVyZSBiZWZvcmUgcmV0dXJuaW5nIGl0ICovCgogICAgcmV0dXJuIHJlc3BvbnNlOwogIH0gY2F0Y2ggKGUpIHsKICAgIHJldHVybiBuZXcgUmVzcG9uc2UoZS5zdGFjayB8fCBlLCB7IHN0YXR1czogNTAwIH0pOwogIH0KfQ==",
    "version": "1",
    "routes": [
      "v1/api"
    ]
  }
}
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/scripts/:id/?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to list the scripts. This parameter is required.

Retrieve a script of a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The unique identifier for the script.
`stackId`<br/>*string* | The ID of the stack that the script belongs to.
`siteId`<br/>*string* | The ID of the site that the script belongs to.
`name`<br/>*string* | The display name of the script.
`createdAt`<br/>*string* | Creation timestamp of the script.
`updatedAt`<br/>*string* | The date on which the script was last updated.
`code`<br/>*string* | Base64 encoded contents of a script.
`version`<br/>*string* | The version number of the script.
`routes`<br/>*Array[string]* | The routes that incoming requests should respond with a script.


