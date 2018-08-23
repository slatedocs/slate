---
title: TransferWise Payouts API

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

search: true

includes:
  - recipients

---
# Payouts API
## Before you start


### 1. Learn about TransferWise borderless account. 
Borderless account features and pricing are best explained here

[https://transferwise.com/gb/borderless/pricing](https://transferwise.com/gb/borderless/pricing)


### 2. Signup for TransferWise borderless account
Get hands-on experience before you start with API integration as it will help you understand how our payment flow works. 
Just follow these three simple steps. 

* Sign up for TransferWise borderless account. [https://transferwise.com/gb/borderless](https://transferwise.com/gb/borderless)

* Make a transfer — check [our video guide](https://transferwise.com/help/article/1779442/creating-a-transfer/video-guide-make-a-transfer) for a step-by-step guide.

* Verify that our coverage includes your currency route(s).


### 3. Choose the best tool for you

There are two ways you can execute large number of payouts:

* *Batch payments.* Prepare CSV file and upload this using our Batch Payments tool: [https://transferwise.com/batch](https://transferwise.com/batch)

* *API integration.* Automate your payment process fully by sending payment orders via TransferWise API. 






## API access
```shell
curl "https://api.sandbox.transferwise.tech/v1/profiles"
  -H "Authorization: Bearer <your api token>"
```

### Authentication
Signup for developer account to get API token for sandbox. [https://sandbox.transferwise.tech/register](https://sandbox.transferwise.tech/register)

Your developer account will have some test money so you can start making payments in same way as in LIVE environment.  You will find your API tokens in the Settings page. 

Add token as header parameter to every API call like this:

*Authorization: Bearer xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx*

### TEST and LIVE environments

* Sandbox API is located at https://api.sandbox.transferwise.tech
* LIVE API is located at https://api.transferwise.com


## Find your profile id


> Example Request:

```shell
curl "https://api.sandbox.transferwise.tech/v1/profiles"
  -H "Authorization: Bearer <your api token>"
```

> Example Response:

```json

[
  {
    "id": 217896,
    "type": "personal",
    "details": {
      "firstName": "Oliver",
      "lastName": "Wilson",
      "dateOfBirth": "1977-07-01",
      "phoneNumber": "+3725064992",
      "avatar": "https://lh6.googleusercontent.com/-XzeFZ2PJE1A/AAAAAAAI/AAAAAAAAAAA/RvuvhXFsqs0/photo.jpg",
      "occupation": null,
      "primaryAddress": 236532
    }
  },
  {
    "id": 220192,
    "type": "business",
    "details": {
      "name": "ABC Logistics Ltd",
      "registrationNumber": "12144939",
      "acn": null,
      "abn": null,
      "arbn": null,
      "companyType": "LIMITED",
      "companyRole": "OWNER",
      "descriptionOfBusiness": "Information and communication",
      "primaryAddress": 240402,
      "webpage": "https://abc-logistics.com"
    }
  }
]


```

You only need to call this endpoint once to obtain your user profile id.
Your personal and business profiles have different IDs. You would need to use appropriate profile.id value when submitting further calls. 

### Request

`GET https://api.sandbox.transferwise.tech/v1/profiles`

### Response

Personal Profile Fields

Field | Description | Format
--------- | ------- | -----------
id | Personal profile id | Integer
type | Profile type | Text
details.firstName | Person first name | Text
details.lastName | Person last name | Text
details.dateOfBirth | Date of birth | "yyyy-mm-dd"
details.phoneNumber | Phone number | Text
details.avatar | Link to avatar image | Text
details.occupation | Occupation | Text
details.primaryAddress  |  Address object id | Integer


Business Profile Fields

Field | Description | Format
--------- | ------- | -----------
id | Business profile id | Integer
type | Profile type | Text
details.name | Business name | Text
details.registrationNumber | Business registration number| Text
details.acn | ACN (only applicable for Australian business) | "yyyy-mm-dd"
details.abn | ABN (only applicable for Australian business) | Text
details.arbn | ARBN (only applicable for Australian business)  | Text
details.companyType | Company legal type | Text
details.companyRole  | Person's role in the company | Text
details.descriptionOfBusiness  |  Business description | Text
details.primaryAddress  |  Address object id | Integer
details.webpage  |  Webpage URL | Text



## Create quote


V2 version of quote !?

## Create recipient



### Send payments to email recipients. 
TransferWise will email your recipient and collect their bank account details to complete your payment.
This way all you need to know is recipient name and email address to send funds.





## Create transfer

## Fund transfer


## Get transfer delivery time 


## Get transfer status


## Check account balance


## Download account statement



## Go Live



