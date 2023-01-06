---
title:

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - http

toc_footers:
  - <a href='https://github.com/slatedocs/slate'>Documentation Powered by Authnull</a>

includes:
  - errors

search: true

code_clipboard: true

meta:
  - name: description
    content: Documentation for the Apps API
---

# Introduction

##AUTHNULL 

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

Endpoint management is the process of actively monitoring, detecting, and preventing malware attacks on devices that are connected to a network. This is typically done to implement security policies and monitor suspicious activities on endpoints.Its can be done by

1.Inventory / management of Endpoints or servers (windows, linux, macos and others) 

2.Active Directory Sync for users (one way only). 

3.Workflows to control permissions

4.Linux user management through Linux User Management Service (LUMS)


## List All Instances 

  List All Instances lists all the instances that are present .  

  ```shell
  curl --location --request POST 'https://api.authnull.kloudlearn.com/api/v1/instances/list' \
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
 instanceName | Name of the instance
 osId | Id of the OS used
publicIp | Public Ip of the instance
privateIp | Private Ip of the Instance
totalUser | Total number of Users
hostName | Name of the host
status | Status of the instances

### HTTP Response
`All the instances listed below.`
<aside class="success">
All the instances listed below.
</aside>

```json
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

Add Instances adds particular instances to the existing list.

```shell
curl --location --request POST 'https://api.authnull.kloudlearn.com/api/v1/instances/add-instance' \
```

```http
POST /api/v1/instances/add-instance HTTP/1.1
```

```json
{
  "domainId": 1,
  "instanceName": "abc-xyz",
  "osId": 1,
  "publicIp": "192.168.1.1",
  "privateIp": "172.64.32.1"
}
```

### HTTP Request
`POST /api/v1/instances/add-instance HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 machineKey| Machine Key of the instances
 osId | Id of the OS used
publicIpAddress | Public Ip of the instance
privateIpAddress | Private Ip of the Instance

### HTTP Response
`Instance added to the list.`
<aside class="success">
Instance added to the list.
</aside>

```json
{
    "instanceId": "11",
    "code": "201",
    "message": "Success"
}
```

## Update Instances

It updates the instances that are present.

```shell
curl --location --request PUT 'https://api.authnull.kloudlearn.com/api/v1/instances/update-instance' \
```

```http
PUT /api/v1/instances/update-instance HTTP/1.1
```

```json
{
  "domainId": 1,
  "instanceId": 2,
  "status": "updated"
}
```

### HTTP Request
`PUT /api/v1/instances/add-instance HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 instanceId | Instance Id of the used
status| status of the instances whether it is updated or not.

### HTTP Response
`Instance updated.`

<aside class="success">
Instance updated.
</aside>

```json
{
    "domainId": "11",
    "instanceId": "201",
    "status": "Success"
}
```

## Add Groups To Machines
It adds groups to existing machines.

```shell
curl --location --request PUT 'https://api.authnull.kloudlearn.com/api/v1/instances/addGroupsToMachines' \
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
 domainId| Domain Id of the instances
 instanceId | Instance Id of the used
groupId | Group Id 
actions | whether Group is added to machines or not.

### HTTP Response
`Group added to Machine`

<aside class="success">
Group added to Machine
</aside>

```json
{
    "domainId": "11",
    "instanceId": "201",
    "groupId": 23,
  "actions":"added"
}
```



# Endpoint Group Management

Enterprise Performance Management (EPM)  helps you analyze, understand, and report on your business. EPM refers to the processes designed to help organizations plan, budget, forecast, and report on business performance as well as consolidate and finalize financial results 

## List All Endpoint

It list all the Endpoint that are present.

```shell
curl --location --request POST 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/listAllEPMGroup' \
```

```http
POST /api/v1/epmGroupManagement/listAllEPMGroup HTTP/1.1
```

```json
{
  "domainId": 1,
  "pageId": 2,
  "pageSize": 23,
  "filter":"added"
  }
```

### HTTP Request
`POST /api/v1/epmGroupManagement/listAllEPMGroup HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 pageId | Page id
pageSize | Size of the Page
filter | filter

### HTTP Response
`Endpoint listed.`

<aside class="success">
Endpoint listed.
</aside>

```json
{
  "domainId": 1,
  "pageId": 2,
  "pageSize": 23,
  "filter":"added"
  }
```


## Add Endpoint

It adds the Endpoint to the present list.

```shell
curl --location --request POST 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/addEPMGroup' \
```

```http
POST /api/v1/epmGroupManagement/addEPMGroup HTTP/1.1
```

```json
{
  "domainId": 1,
  "groupName": "Blue",
  "users":"Stephen"
  }
```

### HTTP Request
`POST /api/v1/epmGroupManagement/addEPMGroup HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 groupName | Name of the group
users | Name of the Users

### HTTP Response
`Endpoint added.`
<aside class="success">
Endpoint added.
</aside>

```json
{
  "domainId": 1,
  "groupName": "Blue",
  "users":"Stephen"
  }
```


## Delete Endpoint

It is used to delete the Endpoint from the existing list.

```shell
curl --location --request DELETE 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/deleteEPMGroup' \
```

```http
DELETE /api/v1/epmGroupManagement/deleteEPMGroup HTTP/1.1
```

```json
{
  "domainId": 1,
  "epmroupId": "3"
  }
```

### HTTP Request
`DELETE /api/v1/epmGroupManagement/deleteEPMGroup HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 epmGroupId | Id of the group

### HTTP Response
`Endpoint`
<aside class="success">
Endpoint  deleted.
</aside>

```json
{
  "domainId": 1,
  "epmGroupId": "3",
  }
```

## Update Endpoint Users

It updates Endpoint Users.

```shell
curl --location --request PUT 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/updateEPMGroupUsers' \
```

```http
PUT /api/v1/epmGroupManagement/updateEPMGroupUsers HTTP/1.1
```

```json
{
  "domainId": 1,
  "epmGroupId": "3",
  "users":["Shawn","ben"]
  }
```

### HTTP Request
`PUT /api/v1/epmGroupManagement/updateEPMGroupUsers HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 epmGroupId | Id of the group
 users | Arreys of users

### HTTP Response
Endpoint Users Updated.

<aside class="success">
Endpoint Users Updated.
</aside>

```json
{
  "domainId": 1,
  "epmGroupId": "3",
  "users":["Shawn","ben"]
  }
```

## Update Endpoint Cred Escalation

It updates Endpoint Cred escalation.

```shell
curl --location --request PUT 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/updateEPMGroupCredEscalation' \
```

```http
PUT /api/v1/epmGroupManagement/updateEPMGroupCredEscalation HTTP/1.1
```

```json
{
  "domainId": 1,
  "epmGroupId": "3",
  "privilegedUsers":"Shawn"
  }
```

### HTTP Request
`PUT /api/v1/epmGroupManagement/updateEPMGroupCredEscalation HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 epmGroupId | Id of the group
 privilegedUsers | Privileged users

### HTTP Response
Endpoint Cred Escalation Updated.
<aside class="success">
Endpoint Cred Escalation Updated.
</aside>

```json
{
  "domainId": 1,
  "epmGroupId": "3",
 "privilegedUsers":"Shawn"
  }
```


## Update Endpoint Status

It updates Endpoint status.

```shell
curl-- PUT 'https://api.authnull.kloudlearn.com/api/v1/epmGroupManagement/updateEPMGroupStatus' \
```

```http
PUT /api/v1/epmGroupManagement/updateEPMGroupStatus HTTP/1.1
```

```json
{
  "domainId": 1,
  "epmGroupId": "3",
  "status":"Success"
  }
```

### HTTP Request
`PUT /api/v1/epmGroupManagement/updateEPMGroupStatus HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 domainId| Domain Id of the instances
 epmGroupId | Id of the group
 status | Status

### HTTP Response
`Endpoint Status Updated.`

<aside class="success">
Endpoint Status Updated.
</aside>

```json
{
  "domainId": 1,
  "epmGroupId": "3",
  "status":"Success"
  }
```



# Linux User Management
This is a PRD for the Linux user management service (LUMS) covering the following use case:

1.Provision new users from a SSO console

2.Provision users with temporary passwords

3.Do password management of all local users with a secrets management service like Vault. 

4.Provision users with temporary ssh keys

5.Provision and manage users with Just In Time (JIT) entitlements., i.e. escalate privileges. 

## Add Linux User
It adds Linux user to the list.

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/add-linux-user-info" 
  -H "Authorization: AuthNull"
```
```HTTP
POST /api/v1/add-linux-user-info HTTP/1.1
```



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
userName | an identification used by a person with access to a computer, network, or online service..
authMethod | Authentication is the process of determining whether someone or something is, in fact, who or what it says it is..
userType | Roles is the user is admin or user it signify.
customMapping | It expresses ideas, thoughts and relationships among and between different spatial elements in multiple dimensions..

### HTTP response

`Linux user added successfully`


<aside class="success">
Linux User added successfully.
</aside>
 
## List All Linux User
It list all the Linux user.

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/list-all-lums" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/list-all-lums HTTP/1.1
```



```json
[
{
    "credentialType":"xyz",
     "homeDir":"xyz", 
     "linuxUserId":"1", 
     "linuxUserName":"sefali", 
     "passwordManaged":"xyz-xyz", 
     "privilegedUser":"xyz-xyz-xyz", 
     "source":"xyz", 
     "status":"active", 
     "syncMethod":"xyz", 
     "ttlPassword":"xyz", 
     "ttlUser":"xyz", 
     "userType":"zyx"
}
]
```
This will add the users to LUMs.

### HTTP Request

`POST /api/v1/list-all-lums HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
credentialType |  Credentials refer to the verification of identity or tools for authentication.
homeDir |  A home directory is a file system directory on a multiuser operating system containing files for a given user of the system.
linuxUserId | A UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. 
linuxUserName | A username is a distinctive alphabetical and numerical set of characters used to identify and gain access to a computing system.
passwordManaged | Password management is a set of principles and best practices to be followed by users while storing and managing passwords in an efficient manner to secure passwords as much as they can to prevent unauthorized access.
privilegedUser | A user that is authorized (and therefore, trusted) to perform security-relevant functions that ordinary users are not authorized to perform.
source | In general, a source is the location from which information is gathered. 
status | Alternatively called state, status is the current condition a device or user.
syncMethod | This module provides a portable way of using operating system dependent functionality.
ttlPassword | TTL.
ttlUser | A computer cluster is a set of computers that work together so that they can be viewed as a single system. 
userType | A user type defines a class of users, such as administrators, ordinary users, operators, and so on.

### HTTP response

`successfully shown list of all linux user`


<aside class="success">
Linux User listed.
</aside>
 
## Delete Linux User


```shell
curl --location --request DELETE "https://api.authnull.kloudlearn.com/api/v1/delete-user" 
  -H "Authorization: AuthNull"
```

```HTTP
POST /api/v1/delete-user HTTP/1.1
```



```json
[
{
    "linuxUserId": "1"
}
]
```

This will delete the users to LUMs.

### HTTP Request

`POST /api/v1/delete-user HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
linuxUserId | A UID (user identifier) is a number assigned by Linux to each user on the system. This number is used to identify the user to the system and to determine which system resources the user can access. 

### HTTP response

`Linux User successfully deleted.`

<aside class="success">
Linux User deleted.
</aside>




# Decentralized Identities

## Authenticating to a Linux Endpoint with Authnull

Authnull allows you to use Decentralized Identifiers (DIDs) to authenticate to a Linux endpoint using your mobile device. With Authnull, your DID and associated credentials are stored in a secure wallet app on your Android or iOS device.

### Prerequisites

- An Android or iOS device with the Authnull wallet app installed
- A Linux endpoint configured to accept DID-based authentication

### Procedure

1. When prompted to authenticate to a Linux endpoint, open the Authnull wallet app on your mobile device.
2. The wallet app will send a notification to your device, asking you to confirm the authentication request.
3. Confirm the request in the wallet app.
4. The wallet app will securely transfer your DID and credentials to the Linux endpoint, which will use them to authenticate you.
5. You are now authenticated and logged in to the Linux endpoint.

### Troubleshooting

- If you do not receive the notification in the wallet app, check that your device is connected to the internet and that the wallet app is running.
- If you do not see your DID listed in the wallet app, you may need to add it first. Consult the wallet app documentation for instructions on how to do this.
- If the Linux endpoint is not configured to accept DID-based authentication, you will not be able to log in using this method. Consult the endpoint documentation for instructions on how to enable this feature.
React
Reply



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



```json
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
I

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

```json
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

```json
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

```json
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

```json
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

```json
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

```json
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

```json
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

# AuthNull Apps Management

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




## List All
  List All gives us the entire list of Apps that are present.


```shell
curl --location --request "POST 'https://api.authnull.kloudlearn.com/api/v1/apps/listAll' \" \
  -H "Authorization: Authnull"
```

```http
POST /api/v1/apps/listAll HTTP/1.1
```

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

### HTTP Response
All the apps are listed.
<aside class="success">
List ALL Apps
</aside>

```json
{
    "totalApps": 54,
    "totalPages": 6,
    "applications": [
        {
            "id": 26,
            "name": "inam",
            "url": "hjabsajd",
            "fieldMappings": null,
            "createdAt": "",
            "typeRegistration": "Client",
            "logo": ""
        },
    ]
}
```

## Delete
  Delete Apps removes the particular apps from the list. 


```shell
curl --location --request "DELETE 'https://api.authnull.kloudlearn.com/api/v1/apps/deleteApp' \" \
  -H "Authorization: Authnull"
```

```HTTP
DELETE /api/v1/apps/deleteApp HTTP/1.1;
```


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

###HTTP Response
The selected app deleted.
<aside class="success">
App Deleted !
</aside>



# AuthNull Group Management
Welcome to the Groups! You can use our API to access Groups API endpoints, which can get information on various Groups in our database.

We have language bindings in Shell and HTTP! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## Add Groups
It adds group to the existing list.

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/instances/list" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/instances/list HTTP/1.1
```

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
domainId | This is the unique ID assigned by the registry to the domain. .
groupName | Name of the group.
roles | Roles is the user is admin or user it signify.
users | a person who uses or operates something..
otpMethod | It is a one time password method.
metadata | Data that provide information about other data.
application | The action of putting something into operation.
ou | An organizational unit (OU) is a container within a Microsoft Active Directory domain which can hold users, groups and computers.
cn | If set to true, the result will also include cats.
baseDn | If set to true, the result will also include cats.

### HTTP response

`Group added successfully`


<aside class="success">
Group added successfully.
</aside>

## List All Groups
It lists all the groups.

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/groups/listAll" \
  -H "Authorization: AuthNull"
```

```http
POST /api/v1/groups/listAll HTTP/1.1
```

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
domainId | This is the unique ID assigned by the registry to the domain. .
filter | This help to search any parameter by their.
pageId | PageId is the similar to page number.
pageSize | Paper size standards govern the size of sheets of paper used as writing paper, stationery, cards, and for some printed documents.

### HTTP Response

`group deleted successfully`

<aside class="success">
Group listed successfully.
</aside>

## Delete Groups

```shell
curl --location --request DELETE "https://api.authnull.kloudlearn.com/api/v1/groups/deleteGroup" \
  -H "Authorization: AuthNull"
```

```HTTP
DELETE /api/v1/groups/deleteGroup HTTP/1.1
```

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
groupID |Numbers of the group shows by group ID.

### HTTP Response

`Group Deleted successfully`


<aside class="success">
Group deleted successfully
</aside>

## Update Groups

```shell
curl --location --request PUT "https://api.authnull.kloudlearn.com/api/v1/groups/updateGroup" \
  -H "Authorization: AuthNull"
```

```HTTP
PUT /api/v1/groups/updateGroup HTTP/1.1
```

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
domainId | This is the unique ID assigned by the registry to the domain. .
groupName | Name of the group.
roles | Roles is the user is admin or user it signify.
users | a person who uses or operates something..
otpMethod | It is a one time password method.
metadata | Data that provide information about other data.
application |The action of putting something into operation.
ou | An organizational unit (OU) is a container within a Microsoft Active Directory domain which can hold users, groups and computers.
cn | If set to true, the result will also include cats.
baseDn | If set to true, the result will also include cats.

### HTTP Response

`Groups updated successfully.`

<aside class="success">
Groups updated successfully.
</aside>

# LUMS Agent

## Installation Steps 
(How to Install/ Download)

### Helm install lumsAgent.chart

Helm helps you manage Kubernetes applications — Helm Charts help you define, install, and upgrade even the most complex Kubernetes application.

Charts are easy to create, version, share, and publish



Install Helm with a package manager, or download a binary.

`
brew install helm
`

```
brew install helm
```

Once installed, unpack the helm binary and add it to your PATH and you are good to go! Check the docs for further installation and usage instructions.

## Configuration File 
(How to setup)

1.Now generate API key from authnull,after the generation of the API Key save the config file and restart the LUMS Agent.


4.Register API triggers from agent

## Add Machine Api

Add Machine Api adds particular instances to the existing list.

```shell
curl --location --request POST 'https://api.authnull.kloudlearn.com/api/v1/machine/add-machine' \
```

```http
POST /api/v1/instances/add-instance HTTP/1.1
```

```json
{
  "domainId": 1,
  "instanceName": "abc-xyz",
  "osId": 1,
  "publicIp": "192.168.1.1",
  "privateIp": "172.64.32.1"
}
```

### HTTP Request
`POST /api/v1/machine/add-machine HTTP/1.1
`

### Query Parameter
Parameter  | Description
--------- | -----------
 machineKey| Machine Key of the instances
 osId | Id of the OS used
publicIpAddress | Public Ip of the instance
privateIpAddress | Private Ip of the Instance

### HTTP Response

<aside class="success">
Instance added to the list.
</aside>

```json
{
    "instanceId": "11",
    "code": "201",
    "message": "Success"
}
```

5.Send new Key API and periodically check new key from agent if there are any .

## Maintenance
LUMS Agents maintained by checking Privilige Status API, this happens periodically to check whether the users/groups priviliges are updatedor not.


# AD Agent 
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
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/saveActiveDirectoryConfig" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/saveActiveDirectoryConfig HTTP/1.1
```

```json
[
 {
    "directoryName":"xyz-xyz-xyz", 
    "accountName":"abc-abc-abc", 
    "appUrl":"www.kloudlearn.com", 
    "domainId":"1",
}
]
```

This will save ActiveDirectory Configure.

### HTTP Request

`POST api/v1/saveActiveDirectoryConfig HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
directoryName | Name of Directory.
appUrl | App URL is url for app.
accountName | Name of the Account.
domainId | This is the unique ID assigned by the registry to the domain. 

### HTTP response

` ActiveDirectory Configure successfully saved`


<aside class="success">
ActiveDirectory Configure successfully saved
</aside>

## Restart the Agent
 For Restart the agent what will happen is the installation will complete and all the api incluging the Active Directory will configure and import the group and the user to active directory of the AuthNull.

## Import Users

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/importUsers" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/importUsers HTTP/1.1
```

```json
[
{
    "ldapHost":"ldap.forumsys.com",
    "ldapPort":"389",
    "baseDN":"dc=example,dc=com",
    "filter":"(ou=italians)",
    "bindDN":"BindDN",
    "domainID":"91"
}
]
```

This will Import Users.

### HTTP Request

`POST api/v1/importUsers HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
ldapHost | LDAPHost.
ldapPort | LDAPPort.
baseDN | BaseDN.
filter | Filter. 
bindDN | BindDN. 
domainID | DomainID. 

### HTTP response

`successfully Imported Users`


<aside class="success">
successfully Imported Users
</aside>

## Get Import Status

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/getImportStatus" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/getImportStatus HTTP/1.1
```

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
directoryName | Name of the Directory.

### HTTP response

`Imported status successfully`


<aside class="success">
Imported status successfully
</aside>

## Mapping api 
For mapping api we need to reconfigure the api:

## Reconfigure Active Directory

```shell
curl --location --request POST "https://api.authnull.kloudlearn.com/api/v1/reConfigure" \
  -H "Authorization: AuthNull"
```

```HTTP
POST api/v1/reConfigure HTTP/1.1
```

```json
[
FieldMappings: {

email "john@kloudone.com",

slack: "JohnDoe",

username: "John",

department: "IT",

group: "groupA",

subgroup: "subgroupA",

roles: "admin",

location: "India",

region: "United States",

primaryApp: "kloudone",

fax: "1234567890"

}
]
```

This will reConfigure Active Directory.

### HTTP Request

`POST api/v1/reConfigure HTTP/1.1`

### Query Parameters

Parameter | Description
--------- | ------- | -----------
groupID | GrouId is the id of group.
fieldMappings | FieldMappings is the mapping of the field.

### HTTP response

`successfully reConfigured Active Directory`


<aside class="success">
successfully reConfigured Active Directory
</aside>

# CSV Agent

The CSV Agent is a tool that allows you to import users to the Authnull system and add them to the Authnull LDAP server. It also enables these users to authenticate to multiple Linux endpoints within an organization using passwordless authentication through Authnull.



## Prerequisites

- A CSV file containing the user information to be imported
- Multiple Linux endpoints configured to accept passwordless authentication through Authnull

## Procedure

1. Log in to the Authnull portal.
2. Navigate to the "Users" page.
3. Click on the "Import" button.
4. Select the CSV file you want to upload and click "Import".
5. The CSV Agent will automatically detect the CSV file and begin the import process.
6. The CSV Agent will create new user accounts in Authnull and add them to the Authnull LDAP server.
7. The CSV Agent will also enable these new users to authenticate to multiple Linux endpoints within the organization using passwordless authentication through Authnull.

## Troubleshooting

- If the CSV Agent is not detecting the CSV file, check that it is placed in the correct location and that the CSV Agent is running.
- If a Linux endpoint is not accepting passwordless authentication, check that it is properly configured to do so. Consult the endpoint documentation for instructions on how to enable this feature.

```http
POST /api/v1/import-csv HTTP/1.1
```
```shell
curl --location --request POST 'https://api.authnull.kloudlearn.com/api/v1/import-csv' \
```




