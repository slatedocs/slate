### Security group rules

Security group rules define the type of traffic that can access the instances associated with a security group.

#### List security group rules within a security group

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/securitygrouprules?securitygroupid=f54f050b-01b2-4a73-b6e1-4e13a5566323"
```
```json
{
    "data": [
        {
          "id": "655d3bcb-3f8a-4738-b50a-53bca43469b5",
          "remoteAddress": "0.0.0.0/0",
          "startPort": 1,
          "endPort": 65535,
          "etherType": "IPv4",
          "protocol": "UDP",
          "ingress": true,
          "securityGroupId": "f54f050b-01b2-4a73-b6e1-4e13a5566323"
        },
        {
          "id": "8d92b22b-b7d2-4584-865d-a9929cb1a24c",
          "remoteAddress": "0.0.0.0/0",
          "startPort": 15,
          "endPort": 30,
          "etherType": "IPv4",
          "protocol": "TCP",
          "ingress": true,
          "securityGroupId": "f54f050b-01b2-4a73-b6e1-4e13a5566323"
        }
    ],
    "metadata": {
        "recordCount": 2
    }
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/securitygrouprules?securitygroupid=<a href="#security-groups">:securityGroupId</a></code>

Retrieve a list of all security group rules in a security group.

 Attribute                      | Description                          
 ---------------------------    | ------------------------------------
 `id`<br/>*UUID*                | The security group rule's id         
 `remoteAddress`<br/>*string*   | Remote IPs or CIDRs associated with this rule     
 `startPort`<br/>*int*          | Minimum port that is matched by this rule             
 `endPort`<br/>*int*            | Maximum port that is matched by this rule             
 `etherType`<br/>*string*       | IP type, either IPv4 or IPv6              
 `protocol`<br/>*string*        | The IP protocol, either ICMP, TCP or UDP             
 `ingress`<br/>*boolean*        | Direction in which the rule is applied, false implies egress            
 `securityGroupId`<br/>*UUID*   | The ID of the parent security group             


#### Retrieve a security group rule

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/securitygrouprules/655d3bcb-3f8a-4738-b50a-53bca43469b5"
```
```json
{
	 "data": {
		   "id": "655d3bcb-3f8a-4738-b50a-53bca43469b5",
		   "remoteAddress": "0.0.0.0/0",
		   "startPort": 1,
		   "endPort": 65535,
		   "etherType": "IPv4",
		   "protocol": "ICMP",
		   "ingress": true,
		   "securityGroupId": "f54f050b-01b2-4a73-b6e1-4e13a5566323"
	  }
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/securitygrouprules/:id</code>

Retrieve information about a security group rule.

Attribute                      | Description                          
---------------------------    | ------------------------------------
`id`<br/>*UUID*                | The security group rule's id         
`remoteAddress`<br/>*string*   | Remote IPs or CIDRs associated with this rule     
`startPort`<br/>*int*          | Minimum port that is matched by this rule             
`endPort`<br/>*int*            | Maximum port that is matched by this rule             
`etherType`<br/>*string*       | IP type, either IPv4 or IPv6              
`protocol`<br/>*string*        | The IP protocol, either ICMP, TCP or UDP             
`ingress`<br/>*boolean*        | Direction in which the rule is applied, false implies egress             
`securityGroupId`<br/>*UUID*   | The ID of the parent security group             



#### Create a security group rule

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://api.your.cloudmc/v1/services/compute-os/devel/securitygrouprules"
# Request should look like this:
```
```json
{
    "ingress": true,
  	"protocol": "UDP",
  	"startPort": 10,
  	"endPort": 20,
  	"remoteAddress": "0.0.0.0/0",
    "securityGroupId": "f54f050b-01b2-4a73-b6e1-4e13a5566323",
}
```

<code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/securitygrouprules</code>

Create a security group rule for a security group.

 Required attributes          | Description                          
 --------------------------   | ------------------------------------
 `securityGroupId`<br/>*UUID* | The ID of the parent security group            

 Optional attributes          | Description                          
 --------------------------   | ------------------------------------
 `ingress`<br/>*boolean*      | Direction in which the rule is applied, false implies egress             
 `protocol`<br/>*string*      | The IP protocol, either ICMP, TCP or UDP
 `startPort`<br/>*int*        | Minimum port that is matched by this rule, required if end port specified
 `endPort`<br/>*int*          | Maximum port that is matched by this rule
 `remoteAddress`<br/>*string* | Remote IPs or CIDRs associated with this rule

#### Delete a security group rule

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key"
    "https://api.your.cloudmc/v1/services/compute-os/devel/securitygrouprules/655d3bcb-3f8a-4738-b50a-53bca43469b5"
```

<code>DELETE /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/securitygrouprules/:id</code>

Delete a security group rule.
