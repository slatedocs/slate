---
title:

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - http

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Apps API
---
#AUTHNULL
Welcome to the authnull API documentation!

authnull is a company that specializes in providing secure authentication services. Our APIs allow you to easily integrate our authentication services into your application.

Our APIs follow the RESTful architecture, meaning that they are structured around the HTTP verbs (GET, POST, PUT, DELETE) and use the standard HTTP status codes to indicate success or failure.

We hope that our APIs will help you build more secure applications. If you have any questions or need further assistance, don't hesitate to reach out to us.

# Priviliged Access Management(PAM)
To use the authnull service and custom PAM modules to authenticate users and import users from LDAP to the authnull platform, you will need to follow the steps provided by authnull.
Here is a general outline of the steps you might need to follow:
1.Download and install the authnull agent and authnull daemon on your Linux system. You can find instructions for downloading and installing the authnull agent and authnull daemon in the authnull documentation.
2.Configure the authnull agent and authnull daemon to connect to the authnull service and your LDAP server. You will need to provide the authnull agent and authnull daemon with the necessary credentials and connection details to connect to the authnull service and your LDAP server.
3.Start the authnull daemon. The authnull daemon should automatically import users from your LDAP server to the authnull platform.
4.Restart the service that you want to authenticate users using the authnull service. The authnull agent should automatically configure PAM to use the custom PAM modules and the authnull service for authentication.
To authenticate users using the authnull service, users will need to provide their login credentials to the service using a method such as Webauthn, SMS OTP, MOTP, or DID. The authnull documentation should provide instructions for using these authentication methods.
# Endpoint Instance Management
1.Inventory / management of Endpoints or servers (windows, linux, macos and others).

2.Active Directory Sync for users (one way only).

3.Workflows to control permissions.

4.Linux user management through Linux User Management Service (LUMS).

## List All Instances
  List All Instances lists all the instances that are present .
  ```shell
  POST 'https://api.authnull.kloudlearn.com/api/v1/instances/list' \
```
```http
POST /api/v1/instances/list HTTP/1.1
```
```json
{
  "domainId": 1,
  "groupId":1
}
```
### HTTP Request
`
POST /api/v1/instances/list HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domainId | Domain Id of the Apps
 instance_name | Name of the instance
 os_id | Id of the OS used
public_ip | Public Ip of the instance
private_ip | Private Ip of the Instance
totalUser | Total number of Users
hostName | Name of the host
status | Status of the instances
### HTTP Response
<aside class="success">
All the instances listed below.
</aside>
```
{
    "domainId": 1,
    "groupId": 1,
    "instances": [
        {
            "totalUsers": 2,
            "instanceName": "lap",
            "osName": "RedHat",
            "publicIp": "qw12",
            "privateIp": "",
            "hostName": "",
            "status": "active",
            "instanceId": 1
        }
```
## Add Instances
Add Instances Adds particular instances to the existing list.
```shell
POST 'https://api.authnull.kloudlearn.com/api/v1/instances/add-instance' \
```
```http
POST /api/v1/instances/add-instance HTTP/1.1
```
```json
{
  "domain_id": 1,
  "instance_name": "abc-xyz",
  "os_id": 1,
  "public_ip": "192.168.1.1",
  "private_ip": "172.64.32.1"
}
```
### HTTP Request
`POST /api/v1/instances/add-instance HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 MachineKey| Machine Key of the instances
 os_id | Id of the OS used
publicIpAddress | Public Ip of the instance
privateIpAddress | Private Ip of the Instance
### HTTP Response
<aside class="success">
Instance added to the list.
</aside>
```json
{
    "Instance_id": "11",
    "Code": "201",
    "Message": "Success"
}
```
## Update Instances
It updates the instances that are present.
```shell
PUT 'https://api.authnull.kloudlearn.com/api/v1/instances/update-instance' \
```
```http
PUT /api/v1/instances/update-instance HTTP/1.1
```
```json
{
  "domain_id": 1,
  "instance_id": 2,
  "status": "updated"
}
```
### HTTP Request
`PUT /api/v1/instances/add-instance HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 instance_id | Instance Id of the used
status| status of the instances whether it is updated or not.
### HTTP Response
<aside class="success">
Instance updated.
</aside>
```json
{
    "domain_id": "11",
    "instance_id": "201",
    "status": "Success"
}
```
## Add Groups To Machines
```shell
PUT 'https://api.authnull.kloudlearn.com/api/v1/instances/addGroupsToMachines' \
```
```http
PUT /api/v1/instances/addGroupsToMachines HTTP/1.1
```
```json
{
  "domain_id": 1,
  "instance_id": 2,
  "group_id": 23,
  "actions":"added"
}
```
### HTTP Request
`PUT /api/v1/instances/addGroupsToMachines/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 instance_id | Instance Id of the used
group_id | Group Id
actions | whether Group is added to machines or not.
### HTTP Response
<aside class="success">
Group added to Machine
</aside>
```json
{
    "domain_id": "11",
    "instance_id": "201",
    "group_id": 23,
  "actions":"added"
}
```
# EPM Group Management
## List All EPM Group
```shell
POST 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/listAllEPMGroup' \
```
```http
POST /api/v1/epmGroupManagement/listAllEPMGroup HTTP/1.1
```
```json
{
  "domain_id": 1,
  "page_id": 2,
  "page_size": 23,
  "filter":"added"
  }
```
### HTTP Request
`POST /api/v1/epmGroupManagement/listAllEPMGroup HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 page_id | Page id
page_size | Size of the Page
filter | filter
### HTTP Response
<aside class="success">
EPM GRoup listed.
</aside>
```json
{
  "domain_id": 1,
  "page_id": 2,
  "page_size": 23,
  "filter":"added"
  }
```
## Add EPM Group
```shell
POST 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/addEPMGroup' \
```
```http
POST /api/v1/epmGroupManagement/addEPMGroup HTTP/1.1
```
```json
{
  "domain_id": 1,
  "group_name": "Blue",
  "Users":"Stephen"
  }
```
### HTTP Request
`POST /api/v1/epmGroupManagement/addEPMGroup HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 group_name | Name of the group
users | Name of the Users
### HTTP Response
<aside class="success">
EPM Group added.
</aside>
```json
{
  "domain_id": 1,
  "group_name": "Blue",
  "Users":"Stephen"
  }
```
## Delete EPM Group
```shell
DELETE 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/deleteEPMGroup' \
```
```http
DELETE /api/v1/epmGroupManagement/deleteEPMGroup HTTP/1.1
```
```json
{
  "domain_id": 1,
  "EPMGroupId": "3"
  }
```
### HTTP Request
`DELETE /api/v1/epmGroupManagement/deleteEPMGroup HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 EPMGroupId | Id of the group
### HTTP Response
<aside class="success">
EPM Group  deleted.
</aside>
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
  }
```
## Update EPM Group Users
```shell
PUT 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/updateEPMGroupUsers' \
```
```http
PUT /api/v1/epmGroupManagement/updateEPMGroupUsers HTTP/1.1
```
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
  "Users":["Shawn","ben"]
  }
```
### HTTP Request
`PUT /api/v1/epmGroupManagement/updateEPMGroupUsers HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 EPMGroupId | Id of the group
 Users | Arreys of users
### HTTP Response
<aside class="success">
EPM Group Users Updated.
</aside>
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
  "Users":["Shawn","ben"]
  }
```
## Update EPM Group Cred Escalation
```shell
PUT 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/updateEPMGroupCredEscalation' \
```
```http
PUT /api/v1/epmGroupManagement/updateEPMGroupCredEscalation HTTP/1.1
```
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
  "PrivilegedUsers":"Shawn"
  }
```
### HTTP Request
`PUT /api/v1/epmGroupManagement/updateEPMGroupCredEscalation HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 EPMGroupId | Id of the group
 PrivilegedUsers | Privileged users
### HTTP Response
<aside class="success">
EPM Group Cred Escalation Updated.
</aside>
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
 "PrivilegedUsers":"Shawn"
  }
```
## Update EPM Group Status
```shell
PUT 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/updateEPMGroupStatus' \
```
```http
PUT /api/v1/epmGroupManagement/updateEPMGroupStatus HTTP/1.1
```
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
  "Status":"Success"
  }
```
### HTTP Request
`PUT /api/v1/epmGroupManagement/updateEPMGroupStatus HTTP/1.1
`
### Query Parameter
Parameter  | Description
--------- | -----------
 domain_id| Domain Id of the instances
 EPMGroupId | Id of the group
 Status | Status
### HTTP Response
<aside class="success">
EPM Group Status Updated.
</aside>
```json
{
  "domain_id": 1,
  "EPMGroupId": "3",
  "Status":"Success"
  }
```
# Activity Session Management














# LUMS (Linux User Management)
This is a PRD for the Linux user management service (LUMS) covering the following use case:

1.Provision new users from a SSO console

2.Provision users with temporary passwords

3.Do password management of all local users with a secrets management service like Vault. 

4.Provision users with temporary ssh keys

5.Provision and manage users with Just In Time (JIT) entitlements., i.e. escalate privileges. 

## Add Linux User


```shell
curl "https://api.authnull.kloudlearn.com/api/v1/add-linux-user-info" 
  -H "Authorization: AuthNull"
```
```HTTP
POST /api/v1/add-linux-user-info HTTP/1.1




```json
[
{
    "Username":"sefali",
    "AuthMethod":"s",
    "UserType":"6",
    "CustomMapping":"6"
}
]
```

This will add the users to LUMs.

### HTTP Request

`POST /api/v1/add-linux-user-info HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
UserName | an identification used by a person with access to a computer, network, or online service..
AuthMethod | Authentication is the process of determining whether someone or something is, in fact, who or what it says it is..
UserType | Roles is the user is admin or user it signify.
CustomMapping | It expresses ideas, thoughts and relationships among and between different spatial elements in multiple dimensions..

### HTTP response

`successfully Added`


<aside class="success">
Remember — This is for Add in LUMs!
</aside>
 
## List All Linux User


```shell
curl "https://api.authnull.kloudlearn.com/api/v1/list-all-lums" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/list-all-lums HTTP/1.1




```json
[
{
    "CredentialType":"xyz",
     "HomeDir":"xyz", 
     "LinuxUserId":"1", 
     "LinuxUserName":"sefali", 
     "PasswordManaged":"xyz-xyz", 
     "PrivilegedUser":"xyz-xyz-xyz", 
     "Source":"xyz", 
     "Status":"active", 
     "SyncMethod":"xyz", 
     "TTLPassword":"xyz", 
     "TTLUser":"xyz", 
     "UserType":"zyx"
}
]
```
This will add the users to LUMs.

### HTTP Request

`POST /api/v1/list-all-lums HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
CredentialType |  Credentials refer to the verification of identity or tools for authentication.
HomeDir |  A home directory is a file system directory on a multiuser operating system containing files for a given user of the system.
LinuxUserId | A UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. 
LinuxUserName | A username is a distinctive alphabetical and numerical set of characters used to identify and gain access to a computing system.
PasswordManaged | Password management is a set of principles and best practices to be followed by users while storing and managing passwords in an efficient manner to secure passwords as much as they can to prevent unauthorized access.
PrivilegedUser | A user that is authorized (and therefore, trusted) to perform security-relevant functions that ordinary users are not authorized to perform.
Source | In general, a source is the location from which information is gathered. 
Status | Alternatively called state, status is the current condition a device or user.
SyncMethod | This module provides a portable way of using operating system dependent functionality.
TTLPassword | TTL.
TTLUser | A computer cluster is a set of computers that work together so that they can be viewed as a single system. 
UserType | A user type defines a class of users, such as administrators, ordinary users, operators, and so on.

### HTTP response

`successfully shown list of all linux user`


<aside class="success">
Remember — This is for Add in LUMs!
</aside>
 
## Delete Linux User

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/delete-user" 
  -H "Authorization: AuthNull"
```

```HTTP
DELETE /api/v1/delete-user HTTP/1.1




```json
[
{
    "linuxUserId": "1"
}
]
```

This will delete the users to LUMs.

### HTTP Request

`DELETE /api/v1/delete-user HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
LinuxUserId | A UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. 

### HTTP response

`successfully Deleted`

<aside class="success">
Remember — This is for Add in LUMs!
</aside>

## Add user to machine


```shell
curl "https://api.authnull.kloudlearn.com/api/v1/addUserToMachine" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/addUserToMachine HTTP/1.1




```json
[
{
    "domainId":"1", 
    "instanceId":"1", 
    "userIds":"1",
}
]
```

This will add User To Machine.

### HTTP Request

`POST /api/v1/addUserToMachine HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
domainId | Domain Id of the instances.
instanceId |Instance Id of the used
userIds | userId is used

### HTTP response

`successfully add user to machine`

<aside class="success">
Remember — This is for Add in LUMs!
</aside>


## EPM User Management
Welcome to the EPM User Management! You can use our API to access EPM User Management API endpoints, which can get information on various EPM User Management in our database.

We have language bindings in Shell and HTTP! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## updateEPMUserWallet

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/updateEPMUserWallet" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/updateEPMUserWallet HTTP/1.1




```json
[
{
    "linux_user_id":"1", 
    "server_group_name":"xyz-xyz-xyz", 
    "authnull_user_name":"abc-abc-abd", 
    "authnull_user_group":"xyz-xyz-xyz",
}
]
```

This will Update EPM User Wallet.

### HTTP Request

`POST /api/v1/updateEPMUserWallet HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
linux_user_id | linuxUserId is for linux user.
server_group_name |ServerGroupName is for lums.
authnull_user_name | AuthNull user name is the name.
authnull_user_group | AuthNull user group is for group.

### HTTP response

`successfully Update EPM User Wallet`

<aside class="success">
Remember — This is for Add in LUMs!
</aside>

## linuxEpmCredentialEscalation

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/linuxEpmCredentialEscalation" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/linuxEpmCredentialEscalation HTTP/1.1




```json
[
{
    "linux_user_id":"1", 
    "user_name":"xyz", 
    "privileged_user":"abc", 
    "escalation_time_limit":"10:00",
}
]
```

This will linux Epm CredentialEscalation.

### HTTP Request

`POST /api/v1/linuxEpmCredentialEscalation HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
linux_user_id | linuxUserId is for linux user.
user_name | user name is for lums.
privileged_user | AuthNull user name is the name.
escalation_time_limit | escalation time limit.

### HTTP response

`successfully Update EPM User Wallet`

<aside class="success">
Remember — This is for Add in LUMs!
</aside>


## updateEpmUserInfo

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/updateEpmUserInfo" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/updateEpmUserInfo HTTP/1.1




```json
[
{
    "linux_user_id":"1",
    "username":"xyz-xyz-xyz", 
    "auth_method":"abc", 
    "user_type":"abc", 
    "credential_type":"abc", 
    "custom_mapping":"asd";
}
]
```

This will update Epm User Information.

### HTTP Request

`POST /api/v1/updateEpmUserInfo HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
linux_user_id | linuxUserId is for linux user.
username | user name is for lums.
auth_method | AuthNull authentication methad.
user_type | Type of user.
credential_type | credential type.
custom_mapping | custom mapping.

### HTTP response

`successfully Update EPM User Information`

<aside class="success">
Remember — This is for Add in LUMs!
</aside>

# AuthNull App Management

Welcome to the Apps! You can use our API to access Apps API endpoints, which can get information on various apps in our database.

We have language bindings in Shell and HTTP! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.
> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here" \
  -H "Authorization: Authnull"
```

```http
Content-Type: application/json
Content-Length: 139
```

<aside class="notice">
You must replace <code>apps</code> with your personal API key.
</aside>

## List All Apps
  List All gives us the entire list of Apps that are present.


```shell
curl "POST 'https://api.authnull.kloudlearn.com/api/v1/apps/listAll' " 
  -H "Authorization: Authnull"
```

```HTTP
POST /api/v1/apps/listAll HTTP/1.1

```json
{
    "domainId": 1,
    "pageId" : 1,
    "pageSize" :10,
    "filter" :{
        "value": "",
        "filterBy":""

    }
    }
```

### HTTP Request

`POST /api/v1/apps/listAll HTTP/1.1`

### Query Parameters

Parameter  | Description
--------- | -----------
 domainId| Domain Id of the Apps
filter | Filter is used for Advanced Search
pageId | page Id represents the page Number
pageSize | page size represents the number of apps to be returned in the response

<aside class="success">
List All Apps.
</aside>

## Delete Apps
  Delete Apps removes the particular apps from the list. 


```shell
curl "DELETE 'https://api.authnull.kloudlearn.com/api/v1/apps/deleteApp' " 
  -H "Authorization: Authnull"
```

```HTTP
DELETE /api/v1/apps/deleteApp HTTP/1.1;


```json
{
    "id": 84,
    "domainId": 1
}
```

### HTTP Request

`DELETE /api/v1/apps/deleteApp HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | -----------
 id| Id of the App that needs to be deleted.
domainId | Domain Id in which the app belongs to.


<aside class="success">
App Deleted !
</aside>

# AuthNull Group Management
Welcome to the Groups! You can use our API to access Groups API endpoints, which can get information on various Groups in our database.

We have language bindings in Shell and HTTP! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## Add Groups


```shell
curl "https://api.authnull.kloudlearn.com/api/v1/instances/list" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/instances/list HTTP/1.1

```json
[
 {
    "domainId": 1,
    "groupName": "sefali",
    "roles": "Admin",
    "users": [],
    "otpMethod": "Email",
    "metaData": "Foo, Bar",
    "baseDn": "xxx",
    "applications": [],
    "ou": "abc",
    "cn": "xyz"
}
]
```

This will add the users to Group.

### HTTP Request

`POST api/v1/instances/list HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
DomainId | This is the unique ID assigned by the registry to the domain. .
GroupName | Name of the group.
Roles | Roles is the user is admin or user it signify.
Users | a person who uses or operates something..
OTPMethod | It is a one time password method.
Metadata | Data that provide information about other data.
Application | The action of putting something into operation.
Ou | An organizational unit (OU) is a container within a Microsoft Active Directory domain which can hold users, groups and computers.
cn | If set to true, the result will also include cats.
BaseDn | If set to true, the result will also include cats.

### HTTP response

`successfully Added`


<aside class="success">
Remember — This is for Add Groups!
</aside>

## List All Groups

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/groups/listAll" \
  -H "Authorization: AuthNull"
```

```HTTP

```json
[
 {
    "domainId": 1,
    "pageId": 1,
    "pageSize": 10,
    "filter": "sefali"
}
]
```

This is to show all list of Groups.

### HTTP Request

`POST /api/v1/groups/listAll HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | -----------
DomainId | This is the unique ID assigned by the registry to the domain. .
Filter | This help to search any parameter by their.
PageId | PageId is the similar to page number.
PageSize | Paper size standards govern the size of sheets of paper used as writing paper, stationery, cards, and for some printed documents.

### HTTP Response

`successfully shown allt the list of Groups`

<aside class="success">
Remember — This is for List All Groups!
</aside>

## Delete Groups

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/groups/deleteGroup" \
  -H "Authorization: AuthNull"
```

```HTTP
DELETE /api/v1/groups/deleteGroup HTTP/1.1

```json
[
{
    "groupId": 56
}
]
```

This will delete the users to Group.

### HTTP Request

`DELETE /api/v1/groups/deleteGroup HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
GroupID |Numbers of the group shows by group ID.

### HTTP Response

`successfully Group is Deleted`


<aside class="success">
Remember — This is for Delete Groups!
</aside>

## Update Groups

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/groups/updateGroup" \
  -H "Authorization: AuthNull"
```

```HTTP
PUT /api/v1/groups/updateGroup HTTP/1.1

```json
[
 {
    "groupId": 78,
    "domainId": 1,
    "groupName": "Sefali",
    "roles": "",
    "users": [112],
    "otpMethod": "DID",
    "metaData": "hello",
    "applications":[26],
    "ou": "xxx",
    "cn": "xxx"
}
]
```

This will Updated the users to Group.

### HTTP Request

`PUT /api/v1/groups/updateGroup HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | -----------
DomainId | This is the unique ID assigned by the registry to the domain. .
GroupName | Name of the group.
Roles | Roles is the user is admin or user it signify.
Users | a person who uses or operates something..
OTPMethod | It is a one time password method.
Metadata | Data that provide information about other data.
Application |The action of putting something into operation.
Ou | An organizational unit (OU) is a container within a Microsoft Active Directory domain which can hold users, groups and computers.
cn | If set to true, the result will also include cats.
BaseDn | If set to true, the result will also include cats.

###HTTP Response

`successfully shown the "Activate" and "De-activate" Groups`

<aside class="success">
Remember — This is for Update Groups!
</aside>

# LUMS Agent

# AD Agent (Daemon)
The Active Directory Agent is a Windows service that provides transparent user identification for Windows Active Directory-based networks. The Active Directory Agent (also called the "AD Agent") collects information from several sources simultaneously and populates a single session table that identifies the current user for each active workstation on the network
The Oracle Enterprise Manager Console works with Intelligent Agents and a Communication Daemon to gather information about the network environment, communicate with network objects, and manage jobs and events. Topics discussed in this chapter include:

1. Agents.

2.Communication Daemon.

3. Daemon Manager.

### Daemon
In multitasking computer operating systems, a daemon (/ˈdiːmən/ or /ˈdeɪmən/)[1] is a computer program that runs as a background process, rather than being under the direct control of an interactive user. Traditionally, the process names of a daemon end with the letter d, for clarification that the process is in fact a daemon, and for differentiation between a daemon and a normal computer program.
## Installation 
1. To install a new forest, you must be logged on as the local Administrator for the computer.

2. To install a new child domain or new domain tree, you must be logged on as a member of the Enterprise Admins group.

3. To install an additional domain controller in an existing domain, you must be a member of the Domain Admins group.


## Configuration File
1. The windows server of 2012 and above is needed.

2. You need access to window server to install okta Active Directory agent.

3.The agent host server must be a member of the same windows domain as your active directory.

4. The windows server where the agent reside must be on at all time.

## Save ActiveDirectory Configure

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/saveActiveDirectoryConfig" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/saveActiveDirectoryConfig HTTP/1.1

```json
[
 {
    "DirectoryName":"xyz-xyz-xyz", 
    "AccountName":"abc-abc-abc", 
    "App URL":"www.kloudlearn.com", 
    "DomainId":"1",
}
]
```

This will save ActiveDirectory Configure.

### HTTP Request

`POST api/v1/saveActiveDirectoryConfig HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
DirectoryName | Name of Directory.
App URL | App URL is url for app.
AccountName | Name of the Account.
DomainId | This is the unique ID assigned by the registry to the domain. 

### HTTP response

`successfully Save ActiveDirectory Configure`


<aside class="success">
Remember — This is for save ActiveDirectory Configure!
</aside>

## Restart the Agent
 For Restart the agent what will happen is the installation will complete and all the api incluging the Active Directory will configure and import the group and the user to active directory of the AuthNull.

## Import Users

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/importUsers" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/importUsers HTTP/1.1

```json
[
{
    "LDAPHost":"ldap.forumsys.com",
    "LDAPPort":"389",
    "BaseDN":"dc=example,dc=com",
    "Filter":"(ou=italians)",
    "BindDN":"BindDN",
    "DomainID":"91"
}
]
```

This will Import Users.

### HTTP Request

`POST api/v1/importUsers HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
LDAPHost | LDAPHost.
LDAPPort | LDAPPort.
BaseDN | BaseDN.
Filter | Filter. 
BindDN | BindDN. 
DomainID | DomainID. 

### HTTP response

`successfully Import Users`


<aside class="success">
Remember — This is for Import Users!
</aside>

## Get Import Status

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/getImportStatus" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/getImportStatus HTTP/1.1

```json
[
{
    "DirectoryName":"ldap.forumsys.com"
}
]
```

This will Get Import Status.

### HTTP Request

`POST api/v1/getImportStatus HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
DirectoryName | Name of the Directory.

### HTTP response

`successfully Get Import Status`


<aside class="success">
Remember — This is for Get Import Status!
</aside>

## Mapping api 
For mapping api we need to reconfigure the api:

## Reconfigure Active Directory

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/reConfigure" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/reConfigure HTTP/1.1

```json
[
FieldMappings: {

email “john@kloudone.com”,

slack: “JohnDoe”,

username: “John”,

department: “IT”,

group: “groupA”,

subgroup: “subgroupA”,

roles: “admin”,

location: “India”,

region: “United States”,

primaryApp: “kloudone”,

fax: “1234567890”

}
]
```

This will reConfigure Active Directory.

### HTTP Request

`POST api/v1/reConfigure HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
GroupID | GrouId is the id of group.
FieldMappings | FieldMappings is the mapping of the field.

### HTTP response

`successfully reConfigure Active Directory`


<aside class="success">
Remember — This is for reConfigure Active Directory!
</aside>

# CSV Agent

# Decentralized Identities
## Request Verificable Credential in Wallet
A verifiable credential can represent all of the same information that a physical credential represents. The addition of technologies, such as digital signatures, makes verifiable credentials more tamper-evident and more trustworthy than their physical counterparts. It also represent statements made by an issuer in a tamper-evident and privacy-respecting manner.A verifiable credential is a set of tamper-evident claims and metadata that cryptographically prove who issued it.
Examples of verifiable credentials include digital employee identification cards, digital birth certificates, and digital educational certificates.
### Query Parameters
Parameter | Description
--------- | -----------
context | set the context,which establishes the special terms used such as 'issuer'
id | specify the identifier for the credential
type | the credential type,which declare what to expect in the credential
issuer | the entity that issued the credential
issuanceDate | when the credential was issued
credentialSubject | claims about the subject of the credential
alumniOf | assertion about the only subject of the credential
proof | digital proof that makes the credential tamper-evident
created | the date the signature was created
proofOfPurpose | purpose of the proof
verificationMethod | the identifier of the public kry that can verify the signature
jws | the digital signature value
To illustrate this lifecycle, we will use the example of redeeming an alumni discount from a university. In the example below, Pat receives an alumni verifiable credential from a university, and Pat stores the verifiable credential in a digital wallet.

```
{
  "@context": [
    "https://www.kloudone.com/2018/credentials/v1",
  ],
  "id": "http://kloudlearn.edu/credentials/1872",
  "type": ["VerifiableCredential", "AlumniCredential"],
  "issuer": "https://kloudlearn.edu/issuers/565049",
  "issuanceDate": "2022-05-01T19:23:24Z",
  "credentialSubject": {
    "id": "did:kloudlearn:ebfeb1f712ebc6f1c276e12ec21",
    "alumniOf": {
      "id": "did:kloudlearn:c276e12ec21ebfeb1f712ebc6f1",
      "name": [{
        "value": "Example University",
        "lang": "en"
      }, {
        "value": "Exemple d'Université",
        "lang": "fr"
      }]
    }
  },
  "proof": {
    "type": "RsaSignature2018",
    "created": "2022-06-18T21:19:10Z",
    "proofPurpose": "assertionMethod",
    "verificationMethod": "https://kloudlearn.edu/issuers/565049#key-1",
    "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X
      sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc
      X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj
      PAYuNzVBAh4vGHSrQyHUdBBPM"
  }
}
```

## Create DID for Holder/Wallet User
### Holder:
A role an entity might perform by possessing one or more verifiable credentials and generating verifiable presentations from them.  A holder is usually, but not always, a subject of the verifiable credentials they are holding. Holders store their credentials in credential repositories.Example holders include students, employees, and customers.

### Query Parameters

A verifiable presentation is typically composed of the following properties:

Parameter | Description
--------- | -----------
 id| The id property is optional and MAY be used to provide a unique identifier for the presentation.
type | The type property is required and expresses the type of presentation, such as VerifiablePresentation.
verifiableCredential | If present, the value of the verifiableCredential property MUST be constructed from one or more verifiable credentials, or of data derived from verifiable credentials in a cryptographically verifiable format.
holder | If present, the value of the holder property is expected to be a URI for the entity that is generating the presentation.
proof | If present, the value of the proof property ensures that the presentation is verifiable.
The example below shows a verifiable presentation that embeds verifiable credentials.

```
 Basic structure of a presentation
{
  "@context": [
    "https://www.kloudone.com/2018/credentials/v1",
  ],
  "id": "urn:uuid:3978344f-8596-4c3a-a978-8fcaba3903c5",
  "type": ["VerifiablePresentation", "CredentialManagerPresentation"],
  "verifiableCredential": [{  }],
  "proof": [{  }]
}
```
##  Create DID for Issuer
This specification defines a property for expressing the issuer of a verifiable credential.
A verifiable credential MUST have an issuer property.
### Issuer
The value of the issuer property MUST be either a URI or an object containing an id property. It is RECOMMENDED that the URI in the issuer or its id be one which, if dereferenced, results in a document containing machine-readable information about the issuer that can be used to verify the information expressed in the credential.
It is also possible to express additional information about the issuer by associating an object with the issuer property.

### Query Parameters

Parameter | Description
--------- | -----------
id | The id property is optional and MAY be used to provide a unique identifier for the presentation.
type | The type property is required and expresses the type of presentation, such as VerifiablePresentation.
issuer | Name of the issuer
issuanceDate | Date of issue raised.
credentialSubject |  A set of objects that contain one or more properties that are each related to a subject of the verifiable credential.
Usage of issuer expanded property:

```
{
  "@context": [
    "https://www.kloudone.com/2018/credentials/v1",
  ],
  "id": "http://kloudlearn.edu/credentials/3732",
  "type": ["VerifiableCredential", "UniversityDegreeCredential"],
  "issuer": {
    "id": "did:kloudlearn:76e12ec712ebc6f1c221ebfeb1f",
    "name": "Example University"
  },
  "issuanceDate": "2010-01-01T19:23:24Z",
  "credentialSubject": {
    "id": "did:kloudone:ebfeb1f712ebc6f1c276e12ec21",
    "degree": {
      "type": "BachelorDegree",
      "name": "Bachelor of Science and Arts"
    }
  }
}
```
## Issue Verifiable Credential to Wallet
A verifiable credential contains claims about one or more subjects. This specification defines a credentialSubject property for the expression of claims about one or more subjects.
A verifiable credential MUST have a credentialSubject property.
### Credential Subject
The value of the credentialSubject property is defined as a set of objects that contain one or more properties that are each related to a subject of the verifiable credential. Each object MAY contain an id.

### Query Parameters

Parameter | Description
--------- | -----------
id | The id property is optional and MAY be used to provide a unique identifier for the presentation.
type | The type property is required and expresses the type of presentation, such as VerifiablePresentation.
issuer | Name of the issuer
issuanceDate | Date of issue raised.
credentialSubject |  A set of objects that contain one or more properties that are each related to a subject of the verifiable credential.
 Usage of the credentialSubject property:

```
{
  "@context": [
    "https://www.kloudone.com/2018/credentials/v1",
  ],
  "id": "http://kloudlearn.edu/credentials/3732",
  "type": ["VerifiableCredential", "UniversityDegreeCredential"],
  "issuer": "https://kloudlearn.edu/issuers/565049",
  "issuanceDate": "2022-01-01T00:00:00Z",
  "credentialSubject": {
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    "degree": {
      "type": "BachelorDegree",
      "name": "Bachelor of Science and Arts"
    }
  }
}
```
## Create Verifiable Credential in Authnull
A verifiable credential can represent all of the same information that a physical credential represents. The addition of technologies, such as digital signatures, makes verifiable credentials more tamper-evident and more trustworthy than their physical counterparts.

### Query Parameters
Parameter | Description
--------- | -----------
id | The id property is optional and MAY be used to provide a unique identifier for the presentation.
type | The type property is required and expresses the type of presentation, such as VerifiablePresentation.
issuer | Name of the issuer
issuanceDate | Date of issue raised.
credentialSubject |  A set of objects that contain one or more properties that are each related to a subject of the verifiable credential.

```
{
  
  "@context": [
    "https://www.kloudone.com/2018/credentials/v1",
  ],
  
  "id": "http://kloudlearn.edu/credentials/3732",
  
  "type":  ["VerifiableCredential", "UniversityDegreeCredential"],
  
  "issuer": "https://kloudlearn.edu/issuers/565049",
  
  "issuanceDate": "2010-01-01T19:23:24Z",
  
  "credentialSubject": {
    
    "id": "did:example:ebfeb1f712ebc6f1c276e12ec21",
    
    "alumniOf": {
      "id": "did:example:c276e12ec21ebfeb1f712ebc6f1",
      "name": [{
        "value": "kloudlearn",
        "lang": "en"
      }]
    }
  },
  
  
  "proof": {
    
    "type": "kloudelearn2022",
    
    "created": "2022-09-18T21:19:10Z",
    
    "proofPurpose": "assertionMethod",
    
    "verificationMethod": "https://kloudlearn.edu/issuers/565049",
    
    "jws": "eyJhbGciOiJSUzI1NiIsImI2NCI6ZmFsc2UsImNyaXQiOlsiYjY0Il19..TCYt5X
      sITJX1CxPCT8yAV-TVkIEq_PbChOMqsLfRoPsnsgw5WEuts01mq-pQy7UJiN5mgRxD-WUc
      X16dUEMGlv50aqzpqh4Qktb3rk-BuQy72IFLOqV0G_zS245-kronKb78cPN25DGlcTwLtj
      PAYuNzVBAh4vGHSrQyHUdBBPM"
  }
}
```

## Presentation Request (PR)
Presentations MAY be used to combine and present credentials. They can be packaged in such a way that the authorship of the data is verifiable. The data in a presentation is often all about the same subject, but there is no limit to the number of subjects or issuers in the data. The aggregation of information from multiple verifiable credentials is a typical use of verifiable presentations.

```
{
  "@context": [
    "hhttps://kloudlearn.edu/issuers/565049",
  ],
  "id": "urn:uuid:3978344f-8596-4c3a-a978-8fcaba3903c5",
  "type": ["VerifiablePresentation", "CredentialManagerPresentation"],
  "verifiableCredential": [{  }],
  "proof": [{  }]
}
```
### Query Parameters
Parameter | Description
--------- | -----------
id | The id property is optional and MAY be used to provide a unique identifier for the presentation.
type | The type property is required and expresses the type of presentation, such as VerifiablePresentation.
issuer | Name of the issuer
verifiableCredential | Date of issue raised.
proof |  A set of objects that contain one or more.

## Revoke Verifiable Credential (VC)
As part of the process of working with verifiable credentials (VCs), you not only have to issue credentials, but sometimes you also have to revoke them. In this article, we go over the Status property part of the VC specification and take a closer look at the revocation process, why we may want to revoke credentials and some data and privacy implications.


