### Custom Rules

Deploy and manage Custom Rules used to control and limit access to your sites. 

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
`action`<br/>*string* | Either ALLOW or BLOCK.
`actionDuration`<br/>*string* | How long a rule's block action will apply to subsequent requests.
`statusCode`<br/>*string* | A custom HTTP status code that the WAF returns if a rule blocks a request.
`nbRequest`<br/>*long* | Number of dynamic page requests made for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`duration`<br/>*long* | Duration of the session's lifetime for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`pathRegExp`<br/>*string* | The regex expression present in the path for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`httpMethods`<br/>*Array[string]* | List of HTTP methods that the rule will apply to. Only for rule of type `REQUEST_RATE`.
`ipAddresses`<br/>*Array[string]* | List of IP addresses that the rule will apply to.Only for rule of type `REQUEST_RATE`.
`conditions`<br/>*Array[Object]* | The conditions required for the WAF engine to trigger the rule. All conditions must pass for the rule to trigger.
`conditions.type`<br/>*string* | Type of condition, one of: `IP`, `IP_RANGE`, `URL`, `USER_AGENT`, `HEADER`, `HTTP_METHOD`, `FILE_EXTENSION`, `CONTENT_TYPE`, `COUNTRY` or `ORGANIZATION`.
`conditions.operation`<br/>*string* | Operation of the condition, one of: `EQUAL`, `NOT_EQUAL`, `CONTAINS`, `NOT_CONTAINS`, `BETWEEN` or `NOT_BETWEEN`.
`conditions.header`<br/>*string* | Value of the header. Only for condition operation of type `HEADER`.
`conditions.value`<br/>*string* | Value for which the condition holds.
`conditions.endValue`<br/>*string* | Second value of the condition. Only for condition operation of type `IP_RANGE`.


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
`action`<br/>*string* | Either ALLOW or BLOCK.
`actionDuration`<br/>*string* | How long a rule's block action will apply to subsequent requests.
`statusCode`<br/>*string* | A custom HTTP status code that the WAF returns if a rule blocks a request.
`nbRequest`<br/>*long* | Number of dynamic page requests made for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`duration`<br/>*long* | Duration of the session's lifetime for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`pathRegExp`<br/>*string* | The regex expression present in the path for the rule to trigger. Only for rule of type `REQUEST_RATE`.
`httpMethods`<br/>*Array[string]* | List of HTTP methods that the rule will apply to. Only for rule of type `REQUEST_RATE`.
`ipAddresses`<br/>*Array[string]* | List of IP addresses that the rule will apply to.Only for rule of type `REQUEST_RATE`.
`conditions`<br/>*Array[Object]* | The conditions required for the WAF engine to trigger the rule. All conditions must pass for the rule to trigger.
`conditions.type`<br/>*string* | Type of condition, one of: `IP`, `IP_RANGE`, `URL`, `USER_AGENT`, `HEADER`, `HTTP_METHOD`, `FILE_EXTENSION`, `CONTENT_TYPE`, `COUNTRY` or `ORGANIZATION`.
`conditions.operation`<br/>*string* | Operation of the condition, one of: `EQUAL`, `NOT_EQUAL`, `CONTAINS`, `NOT_CONTAINS`, `BETWEEN` or `NOT_BETWEEN`.
`conditions.header`<br/>*string* | Value of the header. Only for condition operation of type `HEADER`.
`conditions.value`<br/>*string* | Value for which the condition holds.
`conditions.endValue`<br/>*string* | Second value of the condition. Only for condition operation of type `IP_RANGE`.


<!-------------------- DELETE A SITE -------------------->

#### Delete a custom rule

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

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-site">:siteId</a></code>

Delete a custom rule

Query Params | &nbsp;
---- | -----------
`siteId`<br/>*UUID* | The ID of the site for which to delete the custom rule. This parameter is required.

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the custom rule deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE A RULE -------------------->

#### Enable a custom rule

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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-site">:siteId</a>&operation=enable</code>

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the operation.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- DISABLE A RULE -------------------->

#### Disable a custom rule

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

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/customrules/:id?siteId=<a href="#stackpath-site">:siteId</a>&operation=disable</code>

The following attributes are returned as part of the response.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the operation.
`taskStatus` <br/>*string* | The status of the operation.