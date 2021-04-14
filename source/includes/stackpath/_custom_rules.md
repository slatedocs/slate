### Custom Rules

Manage custom rules used to control and limit access to your sites. 

<!-------------------- LIST CUSTOM RULES -------------------->

#### List custom rules

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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules?siteId=<a href="#stackpath-site">:siteId</a></code>

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

#### Retrieve a custom rule 

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

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-site">:siteId</a></code>


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

#### Create a custom rule

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/customrules?siteId=0a57855b-26d8-4e8f-8b77-429997c7c5fb"
```
> Request body example for a custom rule with conditions:

```json
{
  "name": "firewall-allow",
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
  "name": "firewall-deny",
  "notes": "Deny rule",
  "type": "REQUEST_RATE",
  "enabled": true,
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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules?siteId=<a href="#stackpath-site">:siteId</a></code>

Create a custom rule in a given [environment](#administration-environments).

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
