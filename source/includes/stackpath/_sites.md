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
    "id": "1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36",
    "siteId": "1b1cd7e6-41ab-4e0f-a59a-5c4b89da1b36",
    "stackId": "1415650d-1d02-4097-a79a-8f6e4bb4f483",
    "domain": "site.com",
    "apiUrls": [
      "/test/this/way"
    ],
    "ddosSettings": {
      "globalThreshold": 5000,
      "burstThreshold": 110,
      "subSecondBurstThreshold": 50
    },
    "monitoringEnabled": false,
    "owaspThreats": {
      "sqlInjection": false,
      "xssAttack": true,
      "remoteFileInclusion": true,
      "wordpressWafRuleset": true,
      "apacheStrutsExploit": true,
      "localFileInclusion": false,
      "commonWebApplicationVulnerabilities": true,
      "webShellExecutionAttempt": true,
      "responseHeaderInjection": true,
      "openRedirect": false,
      "shellInjection": false
    },
    "userAgents": {
      "blockInvalidUserAgents": false,
      "blockUnknownUserAgents": true
    },
    "csrf": true,
    "trafficSources": {
      "viaTorNodes": true,
      "viaProxyNetworks": true,
      "viaHostingServices": true,
      "viaVpn": true,
      "convictedBotTraffic": true,
      "suspiciousTrafficByLocalIpFormat": true
    },
    "antiAutomationBotProtection": {
      "forceBrowserValidationOnTrafficAnomalies": true,
      "challengeAutomatedClients": false,
      "challengeHeadlessBrowsers": false,
      "antiScraping": false
    },
    "spamAndAbuseForm": false,
    "behavioralWaf": {
      "spamProtection": true,
      "blockProbingAndForcedBrowsing": true,
      "obfuscatedAttacksAndZeroDayMitigation": true,
      "repeatedViolations": true,
      "bruteForceProtection": true
    },
    "cmsProtection": {
      "whiteListWordpress": false,
      "whiteListModx": false,
      "whiteListDrupal": false,
      "whiteListJoomla": false,
      "whiteMagento": false,
      "whiteListOriginIp": true,
      "whiteListUmbraco": false
    },
    "allowKnownBots": {
      "Internet Archive Bot": true,
    }
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/wafsettings/<a href="#administration-sites">:site_id</a></code>

Attributes | &nbsp;
------- | -----------
`id`<br/>*string* | The ID of the site that the WAF settings belongs to.
`siteId`<br/>*string* | The ID of the site that the WAF settings belongs to.
`stackId`<br/>*string* | The ID of the stack that a site belongs to.
`domain`<br/>*string* | The domain of the site.
`ddosSettings`<br/>*object* | The DDoS Setting containing the different threshold values.
`ddosSettings.globalThreshold`<br/>*Integer* | The number of overall requests per ten seconds that can trigger DDoS protection.
`ddosSettings.burstThreshold`<br/>*Integer* | The number of requests per two seconds that can trigger DDoS protection.
`ddosSettings.subSecondBurstThreshold`<br/>*Integer* | The number of requests per 0.1 seconds that can trigger DDoS protection.
`apiUrls`<br/>*array* | List of configured API urls.
`monitoringEnabled`<br/>*boolean* | If the monitoring mode is enabled.
`owaspThreats`<br/>*object* | StackPath’s core rule set & OWASP’s most critical web-application security risks.
`owaspThreats.sqlInjection`<br/>*boolean* | Block requests suspected of being a SQL injection attack attempt. SQL injection attacks attempt to exploit vulnerabilities in a web application's code and seek to gain access and control over the database. A successful attack would typically result in stolen data or the site being defaced or taken down.
`owaspThreats.xssAttack`<br/>*boolean* | Block requests suspected of being a Cross-Site-Scripting attack attempt. Cross Site Scripting attacks attempt to exploit vulnerabilities in a web application and seek to inject a client side script either across an entire site or to a specific user's session. A successful attack would typically allow forbidden access to a user's actions and data.
`owaspThreats.shellShockAttack`<br/>*boolean* | Block requests suspected of being a Shellshock attack attempt. A Shellshock attack is an attempt to exploit a server's vulnerabilities to gain full access and control over them. A successful attack would typically either abuse a server's resources or hack the website.
`owaspThreats.remoteFileInclusion`<br/>*boolean* | Block requests suspected of being a Remote File Inclusion attempt. Remote File Inclusion attempts to exploit vulnerabilities in a web application (typically in PHP) to execute a script from a 3rd party server. RFI attacks provide a backdoor for the hacker to change the behavior of a server and web application.
`owaspThreats.wordpressWafRuleset`<br/>*boolean* | Enable a set of rules designed to block common Wordpress exploits.
`owaspThreats.apacheStrutsExploit`<br/>*boolean* | Patch known vulnerabilities in the Apache Struts framework by blocking requests suspected of exploiting these vulnerabilities.
`owaspThreats.localFileInclusion`<br/>*boolean* | Block requests suspected of a Local File Inclusion attempt. Local File Inclusion attempts seek to exploit vulnerabilities in a web application to execute potentially harmful scripts on your servers.
`owaspThreats.commonWebApplicationVulnerabilities`<br/>*boolean* | Block attempts to access and potentially harm your servers through common backdoors, such as common control panels, configuration scripts etc. which may be accessible to unwanted users.
`owaspThreats.webShellExecutionAttempt`<br/>*boolean* | Block requests suspected of web shell attempts. A web shell is a script that can be uploaded to a web server to enable remote administration of the machine. Infected web servers can either be internet-facing or internal to the network, where the web shell is used to further pivot to internal hosts.
`owaspThreats.responseHeaderInjection`: Block requests suspected of Response header injection attempts. Response header injection attempts to inject a header via insufficient user input sanitation.
`owaspThreats.openRedirect`<br/>*boolean* | Block requests suspected of being an Open Redirect attempt. Open Redirect attempts to exploit vulnerabilities in a web application to redirect a user to a new website without any validation of the target of redirect.
`owaspThreats.shellInjection`<br/>*boolean* | Block requests suspected of being a shell injection attack attempt. Shell Injection is an attack in which the goal is execution of arbitrary commands on the host operating system via a vulnerable application. Command injection attacks are possible when an application passes unsafe user supplied data (forms, cookies, HTTP headers etc.) to a system shell.
`userAgents`<br/>*object* | Block requests with missing or invalid user agent string.
`userAgents.blockInvalidUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid and cannot be translated to a known legitimate browser. Automated processes (bots) are most likely to have invalid user agents.
`userAgents.blockUnknownUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) is missing.
`csrf`<br/>*boolean* |StackPath WAF will generate a CSRF token that is added to forms. Requests without a valid CSRF token will be blocked.
`trafficSources`<br/>*object* | Real-time threat intelligence for IP addresses, source location, and information on malicious IPs.
`trafficSources.viaTorNodes`<br/>*boolean* | Challenge traffic from The Onion Ring exit nodes to block bots and known bad devices. While TOR is used sometimes purely for web anonymity, it is commonly used by hackers, scrapers, and spammers to crawl or hack web applications.
`trafficSources.viaProxyNetworks`<br/>*boolean* | Challenge traffic from any known proxy network to block bots and known bad devices. While proxy services are used sometimes purely for web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack web applications.
`trafficSources.viaHostingServices`<br/>*boolean* | Challenge traffic from IP addresses known to be of hosting service companies. This rule is unlikely to see legitimate human traffic on these IP spaces since they are typically used for server hosting. In most cases, traffic from these IP spaces originate from infected servers that are controlled by hackers.
`trafficSources.viaVpn`<br/>*boolean* | Challenge traffic from any known VPN to block bots and known bad devices. While VPNs are sometimes used purely for web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack web applications.
`trafficSources.convictedBotTraffic`<br/>*boolean* | Challenge traffic from IP addresses that have been convicted of automated activities (bots) on this site or on others. These IP addresses are used by malicious automated agents while no legitimate traffic has been observed on them.
`trafficSources.suspiciousTrafficByLocalIpFormat`<br/>*boolean* | Challenge traffic from suspicious NAT ranges.
`antiAutomationBotProtection`<br/>*object* | Block automated traffic from scanning and browsing your online application.
`antiAutomationBotProtection.forceBrowserValidationOnTrafficAnomalies`<br/>*boolean* | Challenge and block requests if the user or device behind them does not keep session cookies and does not execute Javascripts correctly. Most malicious automated activities (bots) do not meet these conditions and will, therefore, effectively be blocked by the Javascript challenge triggered in any suspected situation. Clients can also be blocked depending on whether they act in an abnormal to the specific domain—by scraping content in a way that most sessions on this domain don't—or clients that try to, for example, avoid detection by switching IPs.
`antiAutomationBotProtection.challengeAutomatedClients`<br/>*boolean* | Captcha-challenge and block sessions conducted by standard web browsers if there is evidence that these sessions are being automated and not driven by a human user. Such automation is used primarily for screen scraping and other very targeted, site-specific malicious automation.
`antiAutomationBotProtection.challengeHeadlessBrowsers`<br/>*boolean* | Challenge requests if the user or device behind them uses an automation tool that initiates browsers but is actually an automation tool without real display—such as phantomJS, Selenium, or other. While such tools are favored by programmers, they are also extremely popular with scrapers, hackers and even in sophisticated DDoS attacks to circumvent standard anti-bot measures.
`antiAutomationBotProtection.antiScraping`<br/>*boolean* | A more hardened anti-automation policy that is meant to stop scrapers by using faster and harsher convictions.
`spamAndAbuseForm`<br/>*boolean* | Challenge and prevent automated tools from making HTTP/S Post requests without validating their session first.
`cmsProtection`<br/>*object* | Whitelist admin users.
`cmsProtection.whiteListWordpress`<br/>*boolean* | Enable whitelist WordPress admin logged-in users.
`cmsProtection.whiteListModx`<br/>*boolean* | Enable whitelist MODX admin logged-in users.
`cmsProtection.whiteListDrupal`<br/>*boolean* | Enable whitelist Drupal admin logged-in users.
`cmsProtection.whiteListJoomla`<br/>*boolean* | Enable whitelist Joomla admin logged-in users.
`cmsProtection.whiteMagento`<br/>*boolean* | Enable whitelist Magento admin logged-in users.
`cmsProtection.whiteListOriginIp`<br/>*boolean* | Enable this policy to whitelist requests coming from the origin for plugin updates and general CMS updates,
`cmsProtection.whiteListUmbraco`<br/>*boolean* | Enable whitelist Umbraco admin logged-in users.
`behavioralWaf`<br/>*object* | StackPath's sophisticated user behavior and reputation analysis rules.
`behavioralWaf.spamProtection`<br/>*boolean* | Challenge and block user sessions and activities that seem to be aggressively using forms on your website to post spam content, generate new accounts, and more. Also, require a handshake (if not already provided) to clients making POST requests.
`behavioralWaf.blockProbingAndForcedBrowsing`<br/>*boolean* | Challenge or block sessions and users that seem to make brute-forced requests on random URLs seeking to discover a web application's structure and hidden directories.
`behavioralWaf.obfuscatedAttacksAndZeroDayMitigation`<br/>*boolean* | Block clients performing multiple injection attacks.
`behavioralWaf.repeatedViolations`<br/>*boolean* | Challenge or block clients that failed to answer previous challenges.
`behavioralWaf.bruteForceProtection`<br/>*boolean* | Challenge and block attempts seeking to guess user names and passwords on web login forms.
`allowKnownBots`<br/>*object* | An object containing known bots.

<!-------------------- Edit WAF Settings -------------------->

### Edit WAF Settings

```shell
curl -X PATCH \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/stackpath/test-area/wafsettings/c0ddc1b3-b390-4f39-b200-5c0323ca306e"
```

> Request body example:

```json
{
	"owaspThreats": {
      "localFileInclusion": false
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
`owaspThreats`<br/>*object* | StackPath’s core rule set & OWASP’s most critical web-application security risks"Block requests with missing or invalid user agent string.
`owaspThreats.sqlInjection`<br/>*boolean* | Block requests suspected of being a SQL injection attack attempt. SQL injection attacks attempt to exploit vulnerabilities in a web application's code and seek to gain access and control over the database. A successful attack would typically result in stolen data or the site being defaced or taken down.
`owaspThreats.xssAttack`<br/>*boolean* | Block requests suspected of being a Cross-Site-Scripting attack attempt. Cross Site Scripting attacks attempt to exploit vulnerabilities in a web application and seek to inject a client side script either across an entire site or to a specific user's session. A successful attack would typically allow forbidden access to a user's actions and data.
`owaspThreats.shellShockAttack`<br/>*boolean* | Block requests suspected of being a Shellshock attack attempt. A Shellshock attack is an attempt to exploit a server's vulnerabilities to gain full access and control over them. A successful attack would typically either abuse a server's resources or hack the website.
`owaspThreats.remoteFileInclusion`<br/>*boolean* | Block requests suspected of being a Remote File Inclusion attempt. Remote File Inclusion attempts to exploit vulnerabilities in a web application (typically in PHP) to execute a script from a 3rd party server. RFI attacks provide a backdoor for the hacker to change the behavior of a server and web application.
`owaspThreats.wordpressWafRuleset`<br/>*boolean* | Enable a set of rules designed to block common Wordpress exploits.
`owaspThreats.apacheStrutsExploit`<br/>*boolean* | Patch known vulnerabilities in the Apache Struts framework by blocking requests suspected of exploiting these vulnerabilities.
`owaspThreats.localFileInclusion`<br/>*boolean* | Block requests suspected of a Local File Inclusion attempt. Local File Inclusion attempts seek to exploit vulnerabilities in a web application to execute potentially harmful scripts on your servers.
`owaspThreats.commonWebApplicationVulnerabilities`<br/>*boolean* | Block attempts to access and potentially harm your servers through common backdoors, such as common control panels, configuration scripts etc. which may be accessible to unwanted users.
`owaspThreats.webShellExecutionAttempt`<br/>*boolean* | Block requests suspected of web shell attempts. A web shell is a script that can be uploaded to a web server to enable remote administration of the machine. Infected web servers can either be internet-facing or internal to the network, where the web shell is used to further pivot to internal hosts.
`owaspThreats.responseHeaderInjection`: Block requests suspected of Response header injection attempts. Response header injection attempts to inject a header via insufficient user input sanitation.
`owaspThreats.openRedirect`<br/>*boolean* | Block requests suspected of being an Open Redirect attempt. Open Redirect attempts to exploit vulnerabilities in a web application to redirect a user to a new website without any validation of the target of redirect.
`owaspThreats.shellInjection`<br/>*boolean* | Block requests suspected of being a shell injection attack attempt. Shell Injection is an attack in which the goal is execution of arbitrary commands on the host operating system via a vulnerable application. Command injection attacks are possible when an application passes unsafe user supplied data (forms, cookies, HTTP headers etc.) to a system shell.
`userAgents`<br/>*object* | Block requests with missing or invalid user agent string.
`userAgents.blockInvalidUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) seems invalid and cannot be translated to a known legitimate browser. Automated processes (bots) are most likely to have invalid user agents.
`userAgents.blockUnknownUserAgents`<br/>*boolean* | Block requests in which the HTTP header describing the user-agent (browser and platform) is missing.
`csrf`<br/>*boolean* |StackPath WAF will generate a CSRF token that is added to forms. Requests without a valid CSRF token will be blocked.
`trafficSources`<br/>*object* | Real-time threat intelligence for IP addresses, source location, and information on malicious IPs.
`trafficSources.viaTorNodes`<br/>*boolean* | Challenge traffic from The Onion Ring exit nodes to block bots and known bad devices. While TOR is used sometimes purely for web anonymity, it is commonly used by hackers, scrapers, and spammers to crawl or hack web applications.
`trafficSources.viaProxyNetworks`<br/>*boolean* | Challenge traffic from any known proxy network to block bots and known bad devices. While proxy services are used sometimes purely for web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack web applications.
`trafficSources.viaHostingServices`<br/>*boolean* | Challenge traffic from IP addresses known to be of hosting service companies. This rule is unlikely to see legitimate human traffic on these IP spaces since they are typically used for server hosting. In most cases, traffic from these IP spaces originate from infected servers that are controlled by hackers.
`trafficSources.viaVpn`<br/>*boolean* | Challenge traffic from any known VPN to block bots and known bad devices. While VPNs are sometimes used purely for web anonymity, they are also commonly used by hackers, scrapers, and spammers to crawl or hack web applications.
`trafficSources.convictedBotTraffic`<br/>*boolean* | Challenge traffic from IP addresses that have been convicted of automated activities (bots) on this site or on others. These IP addresses are used by malicious automated agents while no legitimate traffic has been observed on them.
`trafficSources.suspiciousTrafficByLocalIpFormat`<br/>*boolean* | Challenge traffic from suspicious NAT ranges.
`antiAutomationBotProtection`<br/>*object* | Block automated traffic from scanning and browsing your online application.
`antiAutomationBotProtection.forceBrowserValidationOnTrafficAnomalies`<br/>*boolean* | Challenge and block requests if the user or device behind them does not keep session cookies and does not execute Javascripts correctly. Most malicious automated activities (bots) do not meet these conditions and will, therefore, effectively be blocked by the Javascript challenge triggered in any suspected situation. Clients can also be blocked depending on whether they act in an abnormal to the specific domain—by scraping content in a way that most sessions on this domain don't—or clients that try to, for example, avoid detection by switching IPs.
`antiAutomationBotProtection.challengeAutomatedClients`<br/>*boolean* | Captcha-challenge and block sessions conducted by standard web browsers if there is evidence that these sessions are being automated and not driven by a human user. Such automation is used primarily for screen scraping and other very targeted, site-specific malicious automation.
`antiAutomationBotProtection.challengeHeadlessBrowsers`<br/>*boolean* | Challenge requests if the user or device behind them uses an automation tool that initiates browsers but is actually an automation tool without real display—such as phantomJS, Selenium, or other. While such tools are favored by programmers, they are also extremely popular with scrapers, hackers and even in sophisticated DDoS attacks to circumvent standard anti-bot measures.
`antiAutomationBotProtection.antiScraping`<br/>*boolean* | A more hardened anti-automation policy that is meant to stop scrapers by using faster and harsher convictions.
`spamAndAbuseForm`<br/>*boolean* | Challenge and prevent automated tools from making HTTP/S Post requests without validating their session first.
`cmsProtection`<br/>*object* | Whitelist admin users.
`cmsProtection.whiteListWordpress`<br/>*boolean* | Enable whitelist WordPress admin logged-in users.
`cmsProtection.whiteListModx`<br/>*boolean* | Enable whitelist MODX admin logged-in users.
`cmsProtection.whiteListDrupal`<br/>*boolean* | Enable whitelist Drupal admin logged-in users.
`cmsProtection.whiteListJoomla`<br/>*boolean* | Enable whitelist Joomla admin logged-in users.
`cmsProtection.whiteMagento`<br/>*boolean* | Enable whitelist Magento admin logged-in users.
`cmsProtection.whiteListOriginIp`<br/>*boolean* | Enable this policy to whitelist requests coming from the origin for plugin updates and general CMS updates,
`cmsProtection.whiteListUmbraco`<br/>*boolean* | Enable whitelist Umbraco admin logged-in users.
`behavioralWaf`<br/>*object* | StackPath's sophisticated user behavior and reputation analysis rules.
`behavioralWaf.spamProtection`<br/>*boolean* | Challenge and block user sessions and activities that seem to be aggressively using forms on your website to post spam content, generate new accounts, and more. Also, require a handshake (if not already provided) to clients making POST requests.
`behavioralWaf.blockProbingAndForcedBrowsing`<br/>*boolean* | Challenge or block sessions and users that seem to make brute-forced requests on random URLs seeking to discover a web application's structure and hidden directories.
`behavioralWaf.obfuscatedAttacksAndZeroDayMitigation`<br/>*boolean* | Block clients performing multiple injection attacks.
`behavioralWaf.repeatedViolations`<br/>*boolean* | Challenge or block clients that failed to answer previous challenges.
`behavioralWaf.bruteForceProtection`<br/>*boolean* | Challenge and block attempts seeking to guess user names and passwords on web login forms.
`allowKnownBots`<br/>*object* | An object containing known bots.