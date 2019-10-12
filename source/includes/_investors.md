# Investors
The Investors API allows you to onboard, conduct KYC checks, open general/ISA accounts for your investors. You can also retrieve and update investor data.

## Creating an investor
To create an investor, the investor must first agree to the terms and conditions and optionally the ISA declaration if the investor is opening an ISA.

The terms and conditions can be hosted by Goji, in which case they can be retrieved by calling [GET https://api-sandbox.goji.investments/platformApi/terms](/#get-terms).

The ISA Declaration can be retrieved by calling [GET https://api-sandbox.goji.investments/platformApi/isaDeclaration](/#get-isadeclaration)

> Create investor

```
{
    "title": "MS",
    "firstName": "Jane",
    "lastName": "Doe",
    "accountTypes": [
        "GOJI_INVESTMENT", "ISA"
    ],
    "address": {
        "country": "GBR",
        "lineOne": "1 The High Street",
        "lineTwo": "",
        "lineThree": "",
        "postcode": "AA1 1AA",
        "region": "County",
        "townCity": "Town"
    },
    "contactDetails": {
        "emailAddress": "me@email.com",
        "telephoneNumber": "01234567890"
    },
    "dateOfBirth": "1970-01-01",
    "entityType": "INDIVIDUAL",
    "investorDeclarationType": "RESTRICTED",
    "nationalInsuranceNumber": "JT123456D"
}
```

An investor is created by posting to [https://api-sandbox.goji.investments/platformApi/investors](/#post-investors) with example `POST` body:

The Goji Platform will generate a `clientId` which should be persisted as this is used for subsequent calls.

## Checking the KYC details
Once the investor has been created, a KYC check is done in the background and the status can be checked by calling [GET https://api-sandbox.goji.investments/platformApi/investors/{clientId}/kyc](/#get-investors-clientid-kyc)

In the sandbox environment, all investors are considered verified unless the `lastName` contains `referred`.

## GET /terms

```http

GET /terms HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "version" : "version",
  "termsAndConditions" : "termsAndConditions"
}
```
### Description
Loads the current set of terms and conditions.
### Response
| Name               | Type   | Description                              |
| ------------------ | ------ | ---------------------------------------- |
| termsAndConditions | string | The terms and conditions in HTML format. |
| version            | string | The version of the terms and conditions. |
## GET /isaDeclaration

```http

GET /isaDeclaration HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "declaration" : "declaration",
  "version" : "version"
}

```
### Description
Loads the current ISA declaration.
### Response
| Name        | Type   | Description                         |
| ----------- | ------ | ----------------------------------- |
| declaration | string | The ISA declaration in HTML format. |
| version     | string | The version of the ISA declaration. |

## POST /investors

```http

POST /investors HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "lastName" : "lastName",
  "corporateDetails" : {
    "companyType" : "companyType",
    "registrationNumber" : "registrationNumber",
    "companyName" : "companyName"
  },
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "entityType" : "INDIVIDUAL",
  "employmentDetails" : {
    "jobTitle" : "jobTitle",
    "employmentStatus" : "EMPLOYED_FULL_TIME"
  },
  "dateOfBirth" : "2000-01-23",
  "migrationDetails" : {
    "existingClientId" : "existingClientId"
  },
  "title" : "MISS",
  "investorDeclarationType" : "RESTRICTED",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "firstName" : "firstName",
  "nationality" : "nationality",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "accountTypes" : [ { }, { } ]
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "lastName" : "lastName",
  "corporateDetails" : {
    "companyType" : "companyType",
    "registrationNumber" : "registrationNumber",
    "companyName" : "companyName"
  },
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "entityType" : "INDIVIDUAL",
  "employmentDetails" : {
    "jobTitle" : "jobTitle",
    "employmentStatus" : "EMPLOYED_FULL_TIME"
  },
  "dateOfBirth" : "2000-01-23",
  "title" : "MISS",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "firstName" : "firstName",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "accountTypes" : "GOJI_INVESTMENT",
  "investmentDeclarationType" : "RESTRICTED"
}
```
### Description
Creates an investor and triggers a KYC check.
### Request
| Name                                | Type   | Description                                                                                                                                                                                        | Required |
| ----------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| title                               | string | The title of the investor. Possible values are: `MISS` `MR` `MRS` `MS` `DR`                                                                                                                        | optional |
| nationality                         | string | The nationality of the investor in 2 character ISO country code eg. GB for British.                                                                                                                | required |
| firstName                           | string | The first name of the investor.                                                                                                                                                                    | required |
| lastName                            | string | The last name of the investor.                                                                                                                                                                     | required |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                 | required |
| address                             | ref    |                                                                                                                                                                                                    | required |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           ||
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           ||
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         ||
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      ||
| address.region                      | string | The region of the address eg county.                                                                                                                                                               ||
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      ||
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| contactDetails                      | ref    |                                                                                                                                                                                                    | required |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                              ||
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                 ||
| nationalInsuranceNumber             | string | The national insurance number of the investor. Only required if opening an ISA.                                                                                                                    | optional |
| employmentDetails                   | ref    |                                                                                                                                                                                                    | optional |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                     ||
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: `EMPLOYED_FULL_TIME` `EMPLOYED_PART_TIME` `SELF_EMPLOYED` `UNEMPLOYED` `HOUSE_PERSON` `EDUCATION` `RETIRED` `NOT_WORKING_ILLNESS_DISABILITY`           ||
| entityType                          | string | The entity type. Possible values are: `INDIVIDUAL` `CORPORATE`                                                                                                                                                                                                    | required |
| investorDeclarationType             | string | All investors must complete a declaration to confirm the kind of investor they are. Possible values are: `RESTRICTED` `HIGH_NET_WORTH` `INVESTMENT_PROFESSIONAL` `SOPHISTICATED`                    required |
| accountTypes                        | array  | Possible values are: `GOJI_INVESTMENT` `ISA` Defaults to `[GOJI_INVESTMENT, ISA]` if not provided for a INDIVIDUAL entityType. Defaults to [GOJI_INVESTMENT] for CORPORATE entityType. ISA invalid for CORPORATE entityType                       | optional |
| corporateDetails                    | ref    | Only required for CORPORATE entityType.                                                                                                                                                            | optional |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                  ||
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                  ||
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                   ||
| migrationDetails                    | ref    | Optional. Only required if migrating an investor.                                                                                                                                                  | optional |
| migrationDetails.existingClientId   | string | The existing client ID for the investor to be migrated                                                                                                                                             ||
### Response
| Name                                | Type   | Description                                                                                                                                                                                        |
| ----------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                   |
| title                               | string | The title of the investor.                                                                                                                                                                         |
| firstName                           | string | The first name of the investor.                                                                                                                                                                    |
| lastName                            | string | The last name of the investor.                                                                                                                                                                     |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                 |
| address                             | ref    |                                                                                                                                                                                                    |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      |
| address.region                      | string | The region of the address eg county.                                                                                                                                                               |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| contactDetails                      | ref    |                                                                                                                                                                                                    |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                              |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                 |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                     |
| employmentDetails                   | ref    |                                                                                                                                                                                                    |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                     |
| employmentDetails.employmentStatus  | string | The employment status.                                                                                                                                                                             |
| entityType                          | string |                                                                                                                                                                                                    |
| accountTypes                        | string | Investor's account types                                                                                                                                                                           |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                            |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                  |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                  |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                   |
| investmentDeclarationType           | string | The investor type declared by the investor                                                                                                                                                         |
## GET /investors/{clientId}

```http

GET /investors/{clientId} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "lastName" : "lastName",
  "corporateDetails" : {
    "companyType" : "companyType",
    "registrationNumber" : "registrationNumber",
    "companyName" : "companyName"
  },
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "entityType" : "INDIVIDUAL",
  "employmentDetails" : {
    "jobTitle" : "jobTitle",
    "employmentStatus" : "EMPLOYED_FULL_TIME"
  },
  "dateOfBirth" : "2000-01-23",
  "title" : "MISS",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "firstName" : "firstName",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "accountTypes" : "GOJI_INVESTMENT",
  "investmentDeclarationType" : "RESTRICTED"
}
```
### Description
Retrieves an investor.
### Response
| Name                                | Type   | Description                                                                                                                                                                                        |
| ----------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                   |
| title                               | string | The title of the investor.                                                                                                                                                                         |
| firstName                           | string | The first name of the investor.                                                                                                                                                                    |
| lastName                            | string | The last name of the investor.                                                                                                                                                                     |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                 |
| address                             | ref    |                                                                                                                                                                                                    |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      |
| address.region                      | string | The region of the address eg county.                                                                                                                                                               |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| contactDetails                      | ref    |                                                                                                                                                                                                    |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                              |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                 |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                     |
| employmentDetails                   | ref    |                                                                                                                                                                                                    |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                     |
| employmentDetails.employmentStatus  | string | The employment status.                                                                                                                                                                             |
| entityType                          | string |                                                                                                                                                                                                    |
| accountTypes                        | string | Investor's account types                                                                                                                                                                           |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                            |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                  |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                  |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                   |
| investmentDeclarationType           | string | The investor type declared by the investor                                                                                                                                                         |
## PUT /investors/{clientId}

```http

PUT /investors/{clientId} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "firstName" : "firstName",
  "lastName" : "lastName",
  "corporateDetails" : {
    "companyType" : "companyType",
    "registrationNumber" : "registrationNumber",
    "companyName" : "companyName"
  },
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "entityType" : "INDIVIDUAL",
  "employmentDetails" : {
    "jobTitle" : "jobTitle",
    "employmentStatus" : "EMPLOYED_FULL_TIME"
  },
  "dateOfBirth" : "2000-01-23",
  "title" : "MISS",
  "investorDeclarationType" : "RESTRICTED",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "lastName" : "lastName",
  "corporateDetails" : {
    "companyType" : "companyType",
    "registrationNumber" : "registrationNumber",
    "companyName" : "companyName"
  },
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "entityType" : "INDIVIDUAL",
  "employmentDetails" : {
    "jobTitle" : "jobTitle",
    "employmentStatus" : "EMPLOYED_FULL_TIME"
  },
  "dateOfBirth" : "2000-01-23",
  "title" : "MISS",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "firstName" : "firstName",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "accountTypes" : "GOJI_INVESTMENT",
  "investmentDeclarationType" : "RESTRICTED"
}
```
### Description
Updates an investor.
### Request
| Name                                | Type   | Description                                                                                                                                                                                        | Required |
| ----------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| title                               | string | The title of the investor.                                                                                                                                                                         | required |
| firstName                           | string | The first name of the investor.                                                                                                                                                                    | required |
| lastName                            | string | The last name of the investor.                                                                                                                                                                     | required |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                 | required |
| address                             | ref    |                                                                                                                                                                                                    | required |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           ||
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           ||
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         ||
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      ||
| address.region                      | string | The region of the address eg county.                                                                                                                                                               ||
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      ||
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| contactDetails                      | ref    |                                                                                                                                                                                                    | required |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                              ||
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                 ||
| nationalInsuranceNumber             | string | The national insurance number of the investor. Only required if opening an ISA.                                                                                                                    | optional |
| employmentDetails                   | ref    |                                                                                                                                                                                                    | optional |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                     ||
| employmentDetails.employmentStatus  | string | The employment status.                                                                                                                                                                             ||
| entityType                          | string |                                                                                                                                                                                                    | optional |
| investorDeclarationType             | string | must be SOPHISTICATED for an investor with entityType CORPORATE                                                                                                                                    | optional |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                            | optional |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                  ||
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                  ||
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                   ||
### Response
| Name                                | Type   | Description                                                                                                                                                                                        |
| ----------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                   |
| title                               | string | The title of the investor.                                                                                                                                                                         |
| firstName                           | string | The first name of the investor.                                                                                                                                                                    |
| lastName                            | string | The last name of the investor.                                                                                                                                                                     |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                 |
| address                             | ref    |                                                                                                                                                                                                    |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      |
| address.region                      | string | The region of the address eg county.                                                                                                                                                               |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| contactDetails                      | ref    |                                                                                                                                                                                                    |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                              |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                 |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                     |
| employmentDetails                   | ref    |                                                                                                                                                                                                    |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                     |
| employmentDetails.employmentStatus  | string | The employment status.                                                                                                                                                                             |
| entityType                          | string |                                                                                                                                                                                                    |
| accountTypes                        | string | Investor's account types                                                                                                                                                                           |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                            |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                  |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                  |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                   |
| investmentDeclarationType           | string | The investor type declared by the investor                                                                                                                                                         |
## GET /investors/{clientId}/kyc

```http

GET /investors/{clientId}/kyc HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "status" : "IN_PROGRESS"
}
```
### Description
Retrieves an investor's KYC status.
### Response
| Name   | Type   | Description                    |
| ------ | ------ | ------------------------------ |
| status | string | The KYC status of the investor |
## GET /investors/{clientId}/kyb

```http

GET /investors/{clientId}/kyb HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "status" : "DOCUMENTS_REQUIRED"
}
```
### Description
Retrieves an investor's KYB status - this is only applicable for corporates.
### Response
| Name   | Type   | Description                            |
| ------ | ------ | -------------------------------------- |
| status | string | The KYB status of a corporate investor |
## POST /investors/{clientId}/kyc/documents

```http

POST /investors/{clientId}/kyc/documents HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "documents" : [ {
    "fileName" : "fileName",
    "data" : "data"
  }, {
    "fileName" : "fileName",
    "data" : "data"
  } ]
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Add an investor's KYC documents.
### Request
| Name                 | Type   | Description                        | Required |
| -------------------- | ------ | ---------------------------------- | -------- |
| documents            | array  | The documents.                     | required |
| documents[].fileName | string | The file name eg passport.pdf.     | required |
| documents[].data     | string | The file to upload Base64 encoded. | required |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{clientId}/accounts/ISA

```http

POST /investors/{clientId}/accounts/ISA HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "nationalInsuranceNumber" : "nationalInsuranceNumber"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "lastName" : "lastName",
  "corporateDetails" : {
    "companyType" : "companyType",
    "registrationNumber" : "registrationNumber",
    "companyName" : "companyName"
  },
  "clientId" : "clientId",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "entityType" : "INDIVIDUAL",
  "employmentDetails" : {
    "jobTitle" : "jobTitle",
    "employmentStatus" : "EMPLOYED_FULL_TIME"
  },
  "dateOfBirth" : "2000-01-23",
  "title" : "MISS",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "firstName" : "firstName",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "accountTypes" : "GOJI_INVESTMENT",
  "investmentDeclarationType" : "RESTRICTED"
}
```
### Description
Add an ISA account.
### Request
| Name                    | Type   | Description                                    | Required |
| ----------------------- | ------ | ---------------------------------------------- | -------- |
| nationalInsuranceNumber | string | The national insurance number of the investor. | required |
### Response
| Name                                | Type   | Description                                                                                                                                                                                        |
| ----------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                   |
| title                               | string | The title of the investor.                                                                                                                                                                         |
| firstName                           | string | The first name of the investor.                                                                                                                                                                    |
| lastName                            | string | The last name of the investor.                                                                                                                                                                     |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                 |
| address                             | ref    |                                                                                                                                                                                                    |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      |
| address.region                      | string | The region of the address eg county.                                                                                                                                                               |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| contactDetails                      | ref    |                                                                                                                                                                                                    |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                              |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                 |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                     |
| employmentDetails                   | ref    |                                                                                                                                                                                                    |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                     |
| employmentDetails.employmentStatus  | string | The employment status.                                                                                                                                                                             |
| entityType                          | string |                                                                                                                                                                                                    |
| accountTypes                        | string | Investor's account types                                                                                                                                                                           |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                            |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                  |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                  |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                   |
| investmentDeclarationType           | string | The investor type declared by the investor                                                                                                                                                         |
## GET /investors/{clientId}/accounts/ISA/transferIn/UI

```http

GET /investors/{clientId}/accounts/ISA/transferIn/UI HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "apiUrl" : "apiUrl",
  "styleSrc" : "styleSrc",
  "scriptSrc" : "scriptSrc",
  "token" : "token"
}
```
### Description
Retrieve data to initialise the transfer in widget. See the documentation for details on how to embed the widget.
### Response
| Name      | Type   | Description |
| --------- | ------ | ----------- |
| apiUrl    | string |             |
| styleSrc  | string |             |
| scriptSrc | string |             |
| token     | string |             |
## GET /transferIn/open/summary

```http

GET /transferIn/open/summary HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Returns аll opened transfers in.
### Response
| Name | Type | Description |
| ---- | ---- | ----------- |

## GET /investors/{clientId}/transferOut

```http

GET /investors/{clientId}/transferOut HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Lists transfers out for the investor.
### Response
| Name | Type | Description |
| ---- | ---- | ----------- |

## GET /investors/{clientId}/transferIn

```http

GET /investors/{clientId}/transferIn HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Lists transfers in for the investor.
### Response
| Name | Type | Description |
| ---- | ---- | ----------- |

## GET /investors/{clientId}/transferIn/{transferInId}

```http

GET /investors/{clientId}/transferIn/{transferInId} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalTransferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferInDate" : "2000-01-23",
  "clientId" : "clientId",
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "bankReference" : "bankReference",
  "fundsTransferType" : "fundsTransferType",
  "id" : "id"
}
```
### Description
Gets a specific transfer in for the investor.
### Response
| Name                         | Type   | Description                                             |
| ---------------------------- | ------ | ------------------------------------------------------- |
| id                           | string | The ID of the transfer in                               |
| clientId                     | string | The ID of client                                        |
| totalTransferAmount          | ref    | The total amount being transferred                      |
| totalTransferAmount.amount   | number | The amount                                              |
| totalTransferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| repairAmount                 | ref    | The repair amount                                       |
| repairAmount.amount          | number | The amount                                              |
| repairAmount.currency        | string | The currency in ISO 4217 three character codes eg 'GBP' |
| fundsTransferType            | string | The funds transfer type                                 |
| bankReference                | string | The bank reference                                      |
| transferInDate               | string | The date stated on the transfer history form            |
## GET /transferIn/deposits/{date}

```http

GET /transferIn/deposits/{date} HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalValue" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "numberCheques" : 2.68,
  "products" : [ {
    "clientId" : "clientId",
    "id" : "id"
  }, {
    "clientId" : "clientId",
    "id" : "id"
  } ]
}
```
### Description
Lists deposits for transfer in for a given date
### Response
| Name                | Type   | Description                                             |
| ------------------- | ------ | ------------------------------------------------------- |
| numberCheques       | number | The number of cheques included in the summary           |
| totalValue          | ref    | The total value of cheque transfers in                  |
| totalValue.amount   | number | The amount                                              |
| totalValue.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| products            | array  |                                                         |
| products[].id       | string | The transfer in ID                                      |
| products[].clientId | string | The ID of the investor for the transfer in              |
## GET /transfersOut

```http

GET /transfersOut HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Lists all transfers out for all investors.
### Response
| Name | Type | Description |
| ---- | ---- | ----------- |

