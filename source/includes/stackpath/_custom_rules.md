#### Custom Rules

Manage custom rules used to control and limit access to your sites. 

<!-------------------- LIST CUSTOM RULES -------------------->

##### List custom rules

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "1580676",
      "stackId": "7fbea2c0-17d0-41df-b0b1-4d5c95cXXX",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "testrequestrate",
      "notes": "test-note",
      "type": "WAF",
      "enabled": true,
      "action": "BLOCK",
      "actionDuration": "0s",
      "statusCode": "FORBIDDEN_403",
      "conditions": [
        {
          "type": "IP",
          "operation": "EQUAL",
          "value": "120.1.1.1"
        }
      ]
    },
    {
      "id": "1580692",
      "stackId": "7fbea2c0-17d0-41df-b0b1-4d5c95cXXX",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "testipwafrule",
      "notes": "",
      "type": "REQUEST_RATE",
      "enabled": true,
      "action": "ALLOW",
      "actionDuration": "0s",
      "statusCode": "TOO_MANY_REQUESTS_429",
      "nbRequest": 20,
      "duration": 60,
      "pathRegExp": "/",
      "httpMethods": [],
      "ipAddresses": []
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The unique identifier for the rule.
`stackId`<br/>*UUID* | The ID of the stack for which the custom rule is applied to.
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to.
`name`<br/>*string* | The name of the rule.
`notes`<br/>*string* | The description notes of the rule.
`type`<br/>*string* | Type of custom rule. One of `REQUEST_RATE` or `WAF`. The fields returned are different based on the type, `REQUEST_RATE` will not return a list of conditions.
`enabled`<br/>*boolean* | Whether or not the rule is enabled.
`action`<br/>*string* | Action to be taken when the rule is met. Possible values are `ALLOW`, `BLOCK`, `CAPTCHA`,`HANDSHAKE` or `MONITOR`.
`actionDuration`<br/>*string* | How long a rule's block action will apply to subsequent requests in case of the action `BLOCK`. Format is a string with a integer followed by the unit (s for seconds, m for minutes and h for hours e.g. 30s). Default is `0s`
`statusCode`<br/>*string* | A custom HTTP status code that the WAF returns if a rule blocks a request. Possible values are `FORBIDDEN_403` and `TOO_MANY_REQUESTS_429`. Default is `FORBIDDEN_403`.
`nbRequest`<br/>*long* | Number of dynamic page requests made for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`duration`<br/>*long* | Number of seconds that the WAF measures incoming requests over for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`pathRegExp`<br/>*string* | The regex expression present in the path for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`httpMethods`<br/>*Array[string]* | List of HTTP methods that the rule will apply to. Only for rule of type `REQUEST_RATE`. Possible values are: `GET`, `POST`, `PUT`, `DELETE`, `HEAD`, `PATCH`, `OPTION`, `CONNECT`, `TRACE`.
`ipAddresses`<br/>*Array[string]* | List of IP addresses that the rule will apply to. Only for rule of type `REQUEST_RATE`.
`conditions`<br/>*Array[Object]* | The conditions required for the WAF engine to trigger the rule. All conditions must pass for the rule to trigger. Only for rule of type `WAF`.
`conditions.type`<br/>*string* | Type of condition, one of: `IP`, `IP_RANGE`, `URL`, `USER_AGENT`, `HEADER`, `HTTP_METHOD`, `FILE_EXTENSION`, `CONTENT_TYPE`, `COUNTRY` or `ORGANIZATION`.
`conditions.operation`<br/>*string* | Operation of the condition, one of: <ul><li>`EQUAL`, `NOT_EQUAL` for all condition type except `IP_RANGE`</li>, <li>`CONTAINS`, `NOT_CONTAINS` for condition type `HEADER`, `URL` and `USER_AGENT`</li><li>`BETWEEN` or `NOT_BETWEEN` only for condition type `IP_RANGE`</li></ul>.
`conditions.header`<br/>*string* | Value of the header. Only for condition of type `HEADER`.
`conditions.value`<br/>*string* | Value for which the condition holds.
`conditions.endValue`<br/>*string* | Second value of the condition. Only for condition of type `IP_RANGE`.


<!-------------------- RETRIEVE A RULE -------------------->

##### Retrieve a custom rule 

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules/1580676?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
      "id": "1580676",
      "stackId": "7fbea2c0-17d0-41df-b0b1-4d5c95cXXX",
      "siteId": "0a57855b-26d8-4e8f-8b77-429997c7c5fb",
      "name": "testrequestrate",
      "notes": "test-note",
      "type": "WAF",
      "enabled": true,
      "action": "BLOCK",
      "actionDuration": "0s",
      "statusCode": "FORBIDDEN_403",
      "conditions": [
        {
          "type": "IP",
          "operation": "EQUAL",
          "value": "120.1.1.1"
        }
      ]
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>


Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to. This parameter is required.

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The unique identifier for the rule.
`stackId`<br/>*UUID* | The ID of the stack for which the custom rule is applied to.
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to.
`name`<br/>*string* | The name of the rule.
`notes`<br/>*string* | The description notes of the rule.
`type`<br/>*string* | Type of custom rule. One of `REQUEST_RATE` or `WAF`. The fields returned are different based on the type, `REQUEST_RATE` will not return a list of conditions.
`enabled`<br/>*boolean* | Whether or not the rule is enabled.
`action`<br/>*string* | Action to be taken when the rule is met. Possible values are `ALLOW`, `BLOCK`, `CAPTCHA`,`HANDSHAKE` or `MONITOR`.
`actionDuration`<br/>*string* | How long a rule's block action will apply to subsequent requests in case of the action `BLOCK`. Format is a string with a integer followed by the unit (s for seconds, m for minutes and h for hours e.g. 30s). Default is `0s`
`statusCode`<br/>*string* | A custom HTTP status code that the WAF returns if a rule blocks a request. Possible values are `FORBIDDEN_403` and `TOO_MANY_REQUESTS_429`. Default is `FORBIDDEN_403`. 
`nbRequest`<br/>*long* | Number of dynamic page requests made for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`duration`<br/>*long* | Number of seconds that the WAF measures incoming requests over for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`pathRegExp`<br/>*string* | The regex expression present in the path for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`httpMethods`<br/>*Array[string]* | List of HTTP methods that the rule will apply to. Only for rule of type `REQUEST_RATE`. Possible values are: `GET`, `POST`, `PUT`, `DELETE`, `HEAD`, `PATCH`, `OPTION`, `CONNECT`, `TRACE`.
`ipAddresses`<br/>*Array[string]* | List of IP addresses that the rule will apply to. Only for rule of type `REQUEST_RATE`.
`conditions`<br/>*Array[Object]* | The conditions required for the WAF engine to trigger the rule. All conditions must pass for the rule to trigger. Only for rule of type `WAF`.
`conditions.type`<br/>*string* | Type of condition, one of: `IP`, `IP_RANGE`, `URL`, `USER_AGENT`, `HEADER`, `HTTP_METHOD`, `FILE_EXTENSION`, `CONTENT_TYPE`, `COUNTRY` or `ORGANIZATION`.
`conditions.operation`<br/>*string* | Operation of the condition, one of: <ul><li>`EQUAL`, `NOT_EQUAL` for all condition type except `IP_RANGE`</li>, <li>`CONTAINS`, `NOT_CONTAINS` for condition type `HEADER`, `URL` and `USER_AGENT`</li><li>`BETWEEN` or `NOT_BETWEEN` only for condition type `IP_RANGE`</li></ul>.
`conditions.header`<br/>*string* | Value of the header. Only for condition of type `HEADER`.
`conditions.value`<br/>*string* | Value for which the condition holds.
`conditions.endValue`<br/>*string* | Second value of the condition. Only for condition of type `IP_RANGE`.


<!-------------------- CREATE A CUSTOM RULE -------------------->

##### Create a custom rule

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> Request body example for a custom rule with conditions:

```json
{
  "name": "firewall.allow",
  "notes": "some firewall note",
  "type": "WAF",
  "action": "BLOCK",
  "actionDuration": "0s",
  "statusCode": "FORBIDDEN_403",
  "conditions": [
    {
      "type": "IP",
      "operation": "EQUAL",
      "value": "120.1.1.1"
    }
  ]
}
```

> Request body example for a custom role with request rate:

```json
{
  "name": "firewall.deny",
  "notes": "Deny rule",
  "type": "REQUEST_RATE",
  "action": "BLOCK",
  "actionDuration": "0s",
  "statusCode": "TOO_MANY_REQUESTS_429",
  "nbRequest": 20,
  "duration": 60,
  "pathRegExp": "/",
  "httpMethods": ["GET"],
  "ipAddresses": ["192.168.2.1"]
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules?siteId=<a href="#stackpath-sites">:siteId</a></code>

Create a custom rule for a site in a given [environment](#administration-environments).

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to. This parameter is required.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The name of the rule.
`type`<br/>*string* | Type of custom rule. One of `REQUEST_RATE` or `WAF`. The fields returned are different based on the type, `REQUEST_RATE` will not return a list of conditions.
`action`<br/>*string* | Action to be taken when the rule is met. Possible values are `ALLOW`, `BLOCK`, `CAPTCHA`,`HANDSHAKE` or `MONITOR`.
`nbRequest`<br/>*long* | Number of dynamic page requests made for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`duration`<br/>*long* | Number of seconds that the WAF measures incoming requests over for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`conditions`<br/>*Array[Object]* | The conditions required for the WAF engine to trigger the rule. All conditions must pass for the rule to trigger. Only for rule of type `WAF`.
`conditions.type`<br/>*string* | Type of condition, one of: `IP`, `IP_RANGE`, `URL`, `USER_AGENT`, `HEADER`, `HTTP_METHOD`, `FILE_EXTENSION`, `CONTENT_TYPE`, `COUNTRY` or `ORGANIZATION`.
`conditions.operation`<br/>*string* | Operation of the condition, one of: <ul><li>`EQUAL`, `NOT_EQUAL` for all condition type except `IP_RANGE`</li>, <li>`CONTAINS`, `NOT_CONTAINS` for condition type `HEADER`, `URL` and `USER_AGENT`</li><li>`BETWEEN` or `NOT_BETWEEN` only for condition type `IP_RANGE`</li></ul>.
`conditions.header`<br/>*string* | Value of the header. Only for condition of type `HEADER`.
`conditions.value`<br/>*string* | Value for which the condition holds.
`conditions.endValue`<br/>*string* | Second value of the condition. Only for condition of type `IP_RANGE`.

Optional | &nbsp;
------- | -----------
`notes`<br/>*string* | The description notes of the rule.
`actionDuration`<br/>*string* | How long a rule's block action will apply to subsequent requests in case of the action `BLOCK`. Format is a string with a integer followed by the unit (s for seconds, m for minutes and h for hours e.g. 30s). Default is `0s`
`statusCode`<br/>*string* | A custom HTTP status code that the WAF returns if a rule blocks a request. Possible values are `FORBIDDEN_403` and `TOO_MANY_REQUESTS_429`. Default is `FORBIDDEN_403`. 
`pathRegExp`<br/>*string* | The regex expression that the path must match for the rule to trigger. Default is '/'. Only for rule of type `REQUEST_RATE`.
`httpMethods`<br/>*Array[string]* | List of HTTP methods that the rule will apply to. Only for rule of type `REQUEST_RATE`.
`ipAddresses`<br/>*Array[string]* | List of IP addresses that the rule will apply to. Only for rule of type `REQUEST_RATE`.

<!-- CREATE A CUSTOM RULE BASED ON A WAF REQUEST -->

##### Create a WAF rule based on a request made to an existing site

```
POST "https://cloudmc_endpoint/api/v1/services/{serviceCode}/{environment}/wafrequests/{wafrequestId}?operation=create_rule&siteId={siteId}"
```

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v1/services/stackpath-aaaa/env-1/wafrequests/197d190d415bea5ea1385a0de6f3bceb-452444?operation=create_rule&siteId=5ea00192-30f0-4da0-b9d9-461baa3dde89"
```
> Request body example for the custom rule:

```json
{
    "action": "MONITOR",
    "clientIp": "66.249.82.90"
}
```

> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

Path Params | &nbsp;
---- | -----------
`serviceCode`<br/>*string* | The globally unique serviceCode that identifies the service connection.
`wafrequestId`<br/>*UUID* | The ID of the WAF request made to the site. The WAF rule created must map to an existing request made to the site.
`environment`<br/>*UUID* | The name of the environment containing the site.

Query Params | &nbsp;
---- | -----------
`operation`<br/>*string* | The operation executed. This must be `create_rule`.
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to. This parameter is required.

Required | &nbsp;
------- | -----------
`action`<br/>*string* | The action to be taken on the provided IP address. The action must be one of ALLOW, BLOCK, MONITOR, CAPTCHA, or HANDSHAKE.
`clientIp`<br/>*string* | The IP address the WAF request specified was made from.


<!-------------------- EDIT A CUSTOM RULE -------------------->

##### Edit a custom rule

```shell
curl -X PUT \
  -H "MC-Api-Key: your_api_key" \
  -d "request_body" \
  "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules/1576836?siteId=1c6c127a-bfa4-4c85-a329-13c0581b41eb"
```
> Request body example for a custom rule with conditions:

```json
{
  "name": "firewalldeny",
  "notes": "Deny rule",
  "type": "WAF",
  "enabled": false,
  "action": "BLOCK",
  "actionDuration": "10s",
  "statusCode": "FORBIDDEN_403",
  "conditions": [
    {
      "type": "IP",
      "operation": "EQUAL",
      "value": "172.16.254.14"
    }
  ]
}
```

> Request body example for a custom role with request rate:

```json
{
  "name": "firewalldeny",
  "notes": "Deny rule",
  "type": "REQUEST_RATE",
  "action": "BLOCK",
  "actionDuration": "0s",
  "statusCode": "TOO_MANY_REQUESTS_429",
  "nbRequest": 20,
  "duration": 60,
  "pathRegExp": "/",
  "httpMethods": ["GET"],
  "ipAddresses": ["192.168.2.1"]
}
```
> The above commands returns a JSON structured like this:

```json
{
  "taskId": "8fcf30b0-1644-474d-b150-ac0c6f51bf98",
  "taskStatus": "PENDING"
}
```

<code>PUT /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Edit a custom rule.

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the custom rule is applied to. This parameter is required.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The name of the rule.
`type`<br/>*string* | Type of custom rule. One of `REQUEST_RATE` or `WAF`. The fields returned are different based on the type, `REQUEST_RATE` will not return a list of conditions.
`action`<br/>*string* | Action to be taken when the rule is met. Possible values are `ALLOW`, `BLOCK`, `CAPTCHA`,`HANDSHAKE` or `MONITOR`.
`nbRequest`<br/>*long* | Number of dynamic page requests made for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`duration`<br/>*long* | Number of seconds that the WAF measures incoming requests over for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`conditions`<br/>*Array[Object]* | The conditions required for the WAF engine to trigger the rule. All conditions must pass for the rule to trigger. Only for rule of type `WAF`.
`conditions.type`<br/>*string* | Type of condition, one of: `IP`, `IP_RANGE`, `URL`, `USER_AGENT`, `HEADER`, `HTTP_METHOD`, `FILE_EXTENSION`, `CONTENT_TYPE`, `COUNTRY` or `ORGANIZATION`.
`conditions.operation`<br/>*string* | Operation of the condition, one of: <ul><li>`EQUAL`, `NOT_EQUAL` for all condition type except `IP_RANGE`</li>, <li>`CONTAINS`, `NOT_CONTAINS` for condition type `HEADER`, `URL` and `USER_AGENT`</li><li>`BETWEEN` or `NOT_BETWEEN` only for condition type `IP_RANGE`</li></ul>.
`conditions.header`<br/>*string* | Value of the header. Only for condition of type `HEADER`.
`conditions.value`<br/>*string* | Value for which the condition holds.
`conditions.endValue`<br/>*string* | Second value of the condition. Only for condition of type `IP_RANGE`.

Optional | &nbsp;
------- | -----------
`notes`<br/>*string* | The description notes of the rule.
`actionDuration`<br/>*string* | How long a rule's block action will apply to subsequent requests in case of the action `BLOCK`. Format is a string with a integer followed by the unit (s for seconds, m for minutes and h for hours e.g. 30s). Default is `0s`
`statusCode`<br/>*string* | A custom HTTP status code that the WAF returns if a rule blocks a request. Possible values are `FORBIDDEN_403` and `TOO_MANY_REQUESTS_429`. Default is `FORBIDDEN_403`. 
`pathRegExp`<br/>*string* | The regex expression that the path must match for the rule to trigger. Default is '/'. Only for rule of type `REQUEST_RATE`.
`httpMethods`<br/>*Array[string]* | List of HTTP methods that the rule will apply to. Only for rule of type `REQUEST_RATE`.
`ipAddresses`<br/>*Array[string]* | List of IP addresses that the rule will apply to. Only for rule of type `REQUEST_RATE`.

<!-------------------- DELETE A CUSTOM RULE -------------------->

##### Delete a custom rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules/1585477?siteId=1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "c39f0c66-04a0-40cf-aa2e-485f50a27561",
  "taskStatus": "SUCCESS"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-sites">:siteId</a></code>

Delete a custom rule

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the custom rule. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the custom rule deletion.
`taskStatus` <br/>*string* | The status of the operation.


<!-------------------- ENABLE A CUSTOM RULE -------------------->

##### Enable a custom rule

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules/1585477?siteId=1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36&operation=enable"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-sites">:siteId</a>&operation=enable</code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the rule belongs to. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the operation.
`taskStatus` <br/>*string* | The status of the operation.


<!-------------------- DISABLE A CUSTOM RULE -------------------->

##### Disable a custom rule

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules/1585477?siteId=1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36&operation=disable"
```
> The above command returns a JSON structured like this:
```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-sites">:siteId</a>&operation=disable</code>

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which the rule belongs to. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the operation.
`taskStatus` <br/>*string* | The status of the operation.
