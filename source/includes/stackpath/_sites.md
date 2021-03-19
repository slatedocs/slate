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

<!-------------------- CREATE A SITE -------------------->

### Create a site

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites"
```
> Request body example for a site with basic authentication:

```json
{
  "domain": "www.rpgfan.com",
  "services": [
    "CDN",
    "SERVERLESS_EDGE_ENGINE",
    "WAF"
  ],
  "protocol": "HTTPS",
  "hostname": "199.250.204.212",
  "authMethod": "BASIC",
  "username": "alavoie",
  "password": "123456"
}
```

> Request body example for a site with no authentication:

```json
{
  "domain": "www.rpgfan.com",
  "services": [
    "CDN",
    "SERVERLESS_EDGE_ENGINE",
    "WAF"
  ],
  "protocol": "HTTPS",
  "hostname": "199.250.204.212"
}
```
> The above commands return a JSON structured like this:

```json
{
  "taskId": "7135ae25-8488-4bc5-a289-285c84a00a84",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites</code>

Create a site in a given [environment](#administration-environments).

Required | &nbsp;
------- | -----------
`domain`<br/>*string* | The domain name that will be used for the site.
`services`<br/>*Array[string]* | Services list that will be used on the site. Possibles values are `CDN`,`SERVERLESS_EDGE_ENGINE` or  `WAF`.
`protocol`<br/>*string* | Protocol that will be used to communicate with the hostname. Possibles values are `HTTP` or `HTTPS`.
`hostname`<br/>*string* | The hostname to that will be used to get the information from. The hostname can be an IP or a name. It may include a specific port and a precise path as well (e.g. 199.250.204.212:80/test). 
 
 Optional | &nbsp;
 ------- | -----------
`authMethod`<br/>*string* | The authentication method to communicate with the hostname. Possibles values are `NONE` or `BASIC`. If not provided, it will default to `NONE` unless the username or password is provided. It would then default to `BASIC`.
`username`<br/>*Array[Object]* | The username for the basic authentication. Required if authMethod is `BASIC` or if the password id provided. 
`password`<br/>*string* | The password for the basic authentication. Required if authMethod is `BASIC` or if the password id provided.


<!-------------------- DELETE A SITE -------------------->

### Delete a site

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id</code>

Delete a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE CDN -------------------->

### Enable CDN

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=enable_cdn"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=enable_cdn</code>

Enable CDN for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- Disable CDN -------------------->

### Disable CDN

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=disable_cdn"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=disable_cdn</code>

Disable CDN for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE WAF -------------------->

### Enable WAF

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=enable_waf"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=enable_waf</code>

Enable WAF for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- Disable WAF -------------------->

### Disable WAF

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=disable_waf"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=disable_waf</code>

Disable WAF for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- ENABLE Serverless Scripts -------------------->

### Enable Serverless Scripts

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=enable_scripts"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=enable_scripts</code>

Enable Serverless Scripts for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- Disable Serverless Scripts -------------------->

### Disable Serverless Scripts

```shell
curl -X POST \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/sites/f8ad8351-4f07-4b52-92ec-fd2983873853?operation=disable_scripts"
```
> The above command returns a JSON structured like this:

```json
{
  "taskId": "57fc8d89-6f13-451b-8b66-fcd96e1fedbd",
  "taskStatus": "SUCCESS"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sites/:id?operation=disable_scripts</code>

Disable Serverless Scripts for a given site.

Attributes | &nbsp;
------- | -----------
`taskId` <br/>*string* | The task id related to the site deletion.
`taskStatus` <br/>*string* | The status of the operation.

<!-------------------- List WAF Settings -------------------->

### Retrieve WAF Settings

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/wafsettings/1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "siteId": "1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36",
    "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
    "apiUrls": [
      "/test/this/way"
    ],
    "ddosSettings": {
      "globalThreshold": 5000,
      "burstThreshold": 110,
      "subSecondBurstThreshold": 50
    },
    "monitoringEnabled": false,
    "listPolicyGroups": {
      "policyGroups": [
        {
          "id": "8365e00f-a6c4-43a4-9f07-b830759737b8",
          "name": "User Agents",
          "policies": [
            {
              "name": "Invalid User Agent Prevention",
              "description": "Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid as it does not fit the client's properties.",
              "action": "BLOCK",
              "id": "S28158056",
              "enabled": false
            },
            {
              "name": "Unknown User Agent Prevention",
              "description": "Challenge requests in which the HTTP header describing the user-agent (browser and platform) is missing or unknown.",
              "action": "HANDSHAKE",
              "id": "S28158057",
              "enabled": false
            }
          ]
        },
        {
          "id": "d694f10e-7faf-4517-bc5b-265e95c04442",
          "name": "SPAM and Abuse",
          "policies": [
            {
              "name": "Form Submission Validation",
              "description": "Challenge user sessions and activities that seem to be aggressively using forms on your website to post spam content, generate new accounts, and more.",
              "action": "HANDSHAKE",
              "id": "S28158209",
              "enabled": false
            }
          ]
        },
        {
          "id": "379521f9-5d82-499e-a1b2-18f23800af1c",
          "name": "Allow Known Bots",
          "policies": [
            {
              "name": "Google bot",
              "description": "Google bot",
              "action": "ALLOW",
              "id": "S28158095",
              "enabled": true
            },
            {
              "name": "Google ads bot",
              "description": "Google ads bot",
              "action": "ALLOW",
              "id": "S28158096",
              "enabled": true
            }
          ]
        }
      ]
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/wafsettings/<a href="#administration-sites">:site_id</a></code>

Retrieve WAF Settings.

Attributes | &nbsp;
------- | -----------
`siteId`<br/>*string* | The ID of the site that the WAF settings belongs to.
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`ddosSettings`<br/>*object* | The DDoS Setting containing the different threshold values.
`ddosSettings.globalThreshold`<br/>*Integer* | The number of overall requests per ten seconds that can trigger DDoS protection.
`ddosSettings.burstThreshold`<br/>*Integer* | The number of requests per two seconds that can trigger DDoS protection.
`ddosSettings.subSecondBurstThreshold`<br/>*Integer* | The number of requests per 0.1 seconds that can trigger DDoS protection.
`apiUrls`<br/>*array* | List of configured API urls.
`monitoringEnabled`<br/>*boolean* | If the monitoring mode is enabled.
`listPolicyGroups`<br/>*object* | An object containing the list of policy groups.
`policyGroups`<br/>*array[object]* | A list of policy group object.
`policyGroups.id`<br/>*string* | The ID of the policy group.
`policyGroups.name`<br/>*string* | The name of the policy group.
`policyGroups.policies`<br/>*array[object]* | A list of policies in a policy group.
`policyGroups.policies.name`<br/>*string* | A WAF policy's name.
`policyGroups.policies.id`<br/>*string* | A WAF policy's ID.
`policyGroups.policies.description`<br/>*string* | A WAF policy's description.
`policyGroups.policies.action`<br/>*string* | The potential actions that the WAF will take when a policy is triggered. It can either be `ALLOW`, `BLOCK`, `HANDSHAKE`, `MONITOR` or `CAPTCHA`.
`policyGroups.policies.enabled`<br/>*boolean* | If the WAF policy is enabled.

<!-------------------- Edit WAF Settings for a Site -------------------->

### Edit WAF Settings for a Site

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/wafsettings/c0ddc1b3-b390-4f39-b200-5c0323ca306e"
```

> Request body example:

```json
{
  "listPolicyGroups": {
    "policyGroups": [
      {
        "id": "8365e00f-a6c4-43a4-9f07-b830759737b8",
        "name": "User Agents",
        "policies": [
          {
            "name": "Invalid User Agent Prevention",
            "description": "Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid as it does not fit the client's properties.",
            "action": "BLOCK",
            "id": "S28259696",
            "enabled": false
          },
          {
            "name": "Unknown User Agent Prevention",
            "description": "Challenge requests in which the HTTP header describing the user-agent (browser and platform) is missing or unknown.",
            "action": "HANDSHAKE",
            "id": "S28259697",
            "enabled": false
          }
        ]
      }
    ]
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "573ca8fa-c5ad-4b19-a315-8ddbbc78d7c0",
  "taskStatus": "SUCCESS"
}
```

<code>PATCH /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/wafsettings/<a href="#administration-sites">:site_id</a></code>

Edit the WAF settings for a site in a given [environment](#administration-environments).

Attributes | &nbsp;
------- | -----------
`ddosSettings`<br/>*object* | The DDoS Setting containing the different threshold values.
`ddosSettings.globalThreshold`<br/>*Integer* | The number of overall requests per ten seconds that can trigger DDoS protection.
`ddosSettings.burstThreshold`<br/>*Integer* | The number of requests per two seconds that can trigger DDoS protection.
`ddosSettings.subSecondBurstThreshold`<br/>*Integer* | The number of requests per 0.1 seconds that can trigger DDoS protection.
`apiUrls`<br/>*array* | List of configured API urls.
`monitoringEnabled`<br/>*boolean* | If the monitoring mode is enabled.
`listPolicyGroups`<br/>*object* | An object containing the list of policy groups.
`policyGroups`<br/>*array[object]* | A list of policy group object.
`policyGroups.id`<br/>*string* | The ID of the policy group.
`policyGroups.name`<br/>*string* | The name of the policy group.
`policyGroups.policies`<br/>*array[object]* | A list of policies in a policy group.
`policyGroups.policies.name`<br/>*string* | A WAF policy's name.
`policyGroups.policies.id`<br/>*string* | A WAF policy's ID.
`policyGroups.policies.description`<br/>*string* | A WAF policy's description.
`policyGroups.policies.action`<br/>*string* | The potential actions that the WAF will take when a policy is triggered. It can either be `ALLOW`, `BLOCK`, `HANDSHAKE`, `MONITOR` or `CAPTCHA`.
`policyGroups.policies.enabled`<br/>*boolean* | If the WAF policy is enabled.