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

## Generating APIs using Goa Design 
The Goa tool accepts the Go design package import path as input and produces the
interface as well as the glue that binds the service and client code with the
underlying transport. The code is specific to the API so that for example there
is no need to cast or "bind" any data structure prior to using the request
payload or response result. The design may define validations in which case the
generated code takes care of validating the incoming request payload prior to
invoking the service method on the server, and validating the response prior to
invoking the client code.

## Installation
 
```bash
go install goa.design/goa/v3/cmd/goa@v3
```
Current Release: `v3.10.2`
 
The API Auto Generation are explained in detail below,

This repository manages all the microservices for Authnull support.


1. Design
Initiate the repository and enable Go modules support:

```bash
mkdir -p clients/design
cd clients
go mod init clients
```

Open the file clients/design/design.go and add the API spec for each module:
Please refer the design.go file under /design folder. (The below snippet is already added)
[https://github.com/authnull0/authnull-microservices/blob/development/clients/design/design.go](https://github.com/authnull0/authnull-microservices/blob/development/clients/design/design.go)

```
// Main API declaration
API("app_management", func() { #8 in design.go }
//Service declaration with all methods(add-app, list-all, edit-app, delete-app) and Swagger API specification file
var _ = Service("app", func() { Description("The App service allows access to app management modules") Method("add-app", func() { #19 in design.go }}
//Configure the custom types `var AppManagement = ResultType("application/vnd.app", func() { #60 in design.go
}
```

2. Implement
Run the below command to generate the wrapper /implementation codes.(This step to be added in docker file as well)
```
goa gen clients/design
```
This produces a gen directory with the following directory structure:

```
gen ├── calc │   ├── client.go │   ├── endpoints.go │   └── service.go └── 
http ├── calc │   ├── client │   │   ├── cli.go │   │   ├── client.go │   │
   ├── encode_decode.go │   │   ├── paths.go │   │   └── types.go │   └── server 
   │   ├── encode_decode.go │   ├── paths.go │   ├── server.go │   └── types.go
    ├── cli │   └── calc │   └── cli.go ├── openapi.json └── openapi.yaml 7 
```

directories, 15 files
* calc contains the service endpoints and interface as well as a service client.
* http contains the HTTP transport layer. This layer maps the service endpoints to HTTP handlers server side and HTTP client methods client side. The http directory also contains a complete OpenAPI 3.0 spec for the service.
The goa tool can also generate example implementations for both the service and client.

```
 goa example clients/design
```

3. Run
Please compile and run the service as below

```
cd authnull-microservices\clients
go build .\cmd\app_management\
./app_management
```
 



# Apps

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

# List All Apps

## List All
  List All gives us the entire list of Apps that are present.


```shell
curl "POST 'https://api.authnull.kloudlearn.com/api/v1/apps/listAll' \" \
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

# Delete Apps

## Delete
  Delete Apps removes the particular apps from the list. 


```shell
curl "DELETE 'https://api.authnull.kloudlearn.com/api/v1/apps/deleteApp' \" \
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
# User Groups

## Add Groups

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/instances/list" \
  -H "Authorization: AuthNull"
```


> The above command returns JSON structured like this:

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

`POST https://api.authnull.kloudlearn.com/api/v1/instances/list`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
DomainId | true | This is the unique ID assigned by the registry to the domain. .
GroupName | false | Name of the group.
Roles | true | Roles is the user is admin or user it signify.
Users | true | a person who uses or operates something..
OTPMethod | true | It is a one time password method.
Metadata | true | Data that provide information about other data.
Application | true | The action of putting something into operation.
Ou | true | An organizational unit (OU) is a container within a Microsoft Active Directory domain which can hold users, groups and computers.
cn | true | If set to true, the result will also include cats.
BaseDn | true | If set to true, the result will also include cats.

<aside class="success">
Remember — This is for Add Groups!
</aside>

## List All Groups

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/groups/listAll" \
  -H "Authorization: AuthNull"
```


> The above command returns JSON structured like this:

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

`POST https://api.authnull.kloudlearn.com/api/v1/groups/listAll`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
DomainId | true | This is the unique ID assigned by the registry to the domain. .
Filter | true | This help to search any parameter by their.
PageId | true | PageId is the similar to page number.
PageSize | true | Paper size standards govern the size of sheets of paper used as writing paper, stationery, cards, and for some printed documents.


<aside class="success">
Remember — This is for List All Groups!
</aside>

## Delete Group

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/groups/deleteGroup" \
  -H "Authorization: AuthNull"
```


> The above command returns JSON structured like this:

```json
[
{
    "groupId": 56
}
]
```

This will delete the users to Group.

### HTTP Request

`POST https://api.authnull.kloudlearn.com/api/v1/groups/deleteGroup`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
GroupID | false | Numbers of the group shows by group ID.


<aside class="success">
Remember — This is for Delete Groups!
</aside>

## Update Groups

```shell
curl "https://api.authnull.kloudlearn.com/api/v1/groups/updateGroup" \
  -H "Authorization: AuthNull"
```


> The above command returns JSON structured like this:

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

`PUT https://api.authnull.kloudlearn.com/api/v1/groups/updateGroup`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
DomainId | true | This is the unique ID assigned by the registry to the domain. .
GroupName | false | Name of the group.
Roles | true | Roles is the user is admin or user it signify.
Users | true | a person who uses or operates something..
OTPMethod | true | It is a one time password method.
Metadata | true | Data that provide information about other data.
Application | true | The action of putting something into operation.
Ou | true | An organizational unit (OU) is a container within a Microsoft Active Directory domain which can hold users, groups and computers.
cn | true | If set to true, the result will also include cats.
BaseDn | true | If set to true, the result will also include cats.

<aside class="success">
Remember — This is for Update Groups!
</aside>



