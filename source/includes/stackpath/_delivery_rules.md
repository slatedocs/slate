#### Delivery Rules

Set up delivery rules to improve access, security and set custom rules.

<!-------------------- LIST DELIVERY_RULE -------------------->

##### List delivery rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliveryrules?siteId=dcc2771d-a524-4f8c-a666-f699985d6961"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "fc72c60a-d411-4b35-9deb-9dbc889faf7e",
      "name": "addHeader",
      "slug": "portal-ui-custom-1617310238955",
      "stackId": "fd157f7c-e5cd-439b-b6c5-5864583a8ce8",
      "siteId": "dcc2771d-a524-4f8c-a666-f699985d6961"
    },
    {
      "id": "d411c60a-d411-4b35-9deb-f699985d6961",
      "name": "removeHeader",
      "slug": "portal-ui-custom-1617310238955",
      "stackId": "fd157f7c-e5cd-439b-b6c5-5864583a8ce8",
      "siteId": "dcc2771d-a524-4f8c-a666-f699985d6961"  
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliveryrules?siteId=<a href="#stackpath-site">:siteId</a></code>

Retrieve a list of all delivery rules in a given [environment](#administration-environments) within a site.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | A delivery rule's unique identifier. 
`name`<br/>*string* | The name of the delivery rule.
`slug`<br/>*string* | A delivery rule's programmatic name.
`stackId`<br/>*string* | The ID of the stack that the delivery rule belongs to.
`siteId`<br/>*string* | The ID of the site that the delivery rule is applied to.

<!-------------------- CREATE A DELIVERY RULE -------------------->

##### Create a delivery rule

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliveryrules?siteId=f9dea588-d7ab-4f42-b6e6-4b85f273f3db"
```

> Request body example for creating a delivery rule:

```js
{
 "name": "rule",
  "conditions": [
  {
    "trigger": "HEADER",
    "operator": "MATCHES",
    "target": "my-header"
  }],
  "actions": [
    {
      "actionType": "REDIRECT",
      "redirectUrl": "https://my-url.com"
    }]
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliveryrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to create the delivery rule. This parameter is required.

Required| &nbsp;
------------------------| -----------
`name`<br/>*string* | The name of the delivery rule.
`conditions`<br/>*Array[[Condition](#stackpath-condition)]* | At least one condition.
`actions`<br/>*Array[[Action](#stackpath-action)]* | At least one action.

<!-------------------- UPDATE A DELIVERY RULE -------------------->

##### Update a delivery rule

```shell
curl -X PUT \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliveryrules/d065db45-1eba-4c62-a017-d51f2d473d4a?siteId=f9dea588-d7ab-4f42-b6e6-4b85f273f3db"
```

> Request body example for updating a delivery rule:

```js
{
  "conditions": [
  {
    "trigger": "HEADER",
    "operator": "MATCHES",
    "target": "my-header"
  }],
  "actions": [
    {
      "actionType": "REDIRECT",
      "redirectUrl": "https://my-url.com"
    }]
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```
<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliveryrules/:ruleId?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to update the delivery rule. This parameter is required.

Required| &nbsp;
------------------------| -----------
`conditions`<br/>*Array[[Condition](#stackpath-condition)]* | At least one condition.
`actions`<br/>*Array[[Action](#stackpath-action)]* | At least one action.

<!-------------------- DELETE A DELIVERY RULE -------------------->

##### Delete a delivery rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/deliveryrules/90d6a6ed-05a5-4b45-8d5a-e8229f535149?siteId=1c6c127a-bfa4-4c85-a329-13c0581b41eb"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "2c7429dc-64c2-492d-a767-f18c990af164",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/deliveryrules/:id?siteId=<a href="#stackpath-site">:siteId</a></code>

Delete a delivery rule.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the delivery rule. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the delivery rule deletion.
`taskStatus` <br/>*string* | The status of the operation.


###### Condition

Required| &nbsp;
------------------------| -----------
`trigger`<br/>*Enum* | Trigger for the condition. Possible values: `COOKIE`, `HEADER`, `HTTP_METHOD`, `STATUS_CODE`, and `URL`.
`operator`<br/>*Enum* | Operator for the condition. Possible values: `EQUALS`, `MATCHES`, and `MATCHES_REGULAR_EXPRESSION`.
`target`<br/>*String* | The target of the condition.
`httpMethods`<br/>*Array[Enum]* | HTTP methods for the condition. Possible values are: `GET`, `POST`, `PUT`, `DELETE`, `HEAD`, `PATCH`, and `OPTIONS`. This fields is only used when `trigger` is set to `HTTP_METHOD`.

###### Action

The action attributes needed to be passed will vary depending on the condition being specified.

Possible Attributes| &nbsp;
------------------------| -----------
`actionType`<br/>*Enum* | The type of action. Possible values: `ADD_RESPONSE_HEADER`, `ADD_HEADER_TO_ORIGIN`,`ADD_HEADER_TO_CDN`, `NEVER_EXPIRE`, `DO_NOT_CACHE`, `CACHE`, `REDIRECT`, `HIDE_HEADER`, `MODIFY_HEADER`, `SIGN_URL`, and `BYPASS_CACHE`.
`responseHeaders`<br/>*Array* | Headers for the actions expressed as a key-value pair.
`originHeaders`<br/>*Array* | Headers for the actions expressed as a key-value pair.
`cdnHeaders`<br/>*Array* | Headers for the actions expressed as a key-value pair.
`cacheTtl`<br/>*Number* | Time to live of the cache.
`redirectUrl`<br/>*String* | The url to redirect to.
`headerPattern`<br/>*String* | The header to set the modifier in the response.
`passphrase`<br/>*String* | The passphrase for signing the url.
`passphraseField`<br/>*String* | The passphrase field for signing the url.
`md5TokenField`<br/>*String* | The MD5 token field for signing the url.
`ipAddressFilter`<br/>*String* | The ip address filter for signing the url.
`urlSignaturePathLength`<br/>*String* | The url signature path length for signing the url.
