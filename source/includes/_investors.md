# Investors
The Investors API allows you to onboard investors, run KYC/AML checks and open an ISA account.

## Introduction to the Investors API

When onboarding a new investor, they need to pass through the usual registration flow on your platform to capture name,
address etc as well as complete any investor declarations that may be appropriate and sign Ts and Cs etc.

Once this is complete, the investor can be onboarded onto the Goji Platform. The investor's details are validated and subject to Goji's KYC checks.
This is initially an automated process and only requires manual involvement if the automated checks are inconclusive or the investor is deemed high risk.
If the KYC checks pass, a unique bank account number is created for the investor and a success message returned.

![](/images/investors/images/onboarding-investors-success.png "")

If the KYC for a customer cannot be successfully completed immediately, a member of the Goji operations team will review
the workflow case and perform whatever additional checks may be necessary.

If further information is required from the customer, Goji will contact the customer directly via email (in your branding)
or over the phone. A full audit of all emails are kept in the admin console.

Once the customer has been approved , a unique account number is created for the investor and a success email is sent.

Until the customer has been approved, they cannot deposit funds and invest.

![](/images/investors/images/onboarding-investors-refer.png "")

## Onboarding investors

### Registration

To register an investor, `POST /investors` is called. Note that if the investor is being migrated to the Goji system from an existing record, the dedicated [investor migration endpoint](#investors-post-platformapi-migrate) should be used instead.

The investor must have previously agreed to the terms and conditions which can be accessed by calling `GET /platformApi/terms`.

An ISA account can be opened at this stage by providing the National Insurance Number and ensuring they have agreed to the ISA declaration which can be accessed by calling `GET /platformApi/isaDeclaration`.

Alternatively, the ISA account can be added later by calling `POST /investors/{clientId}/accounts/ISA`.

### KYC process

Once the investor has been registered, the KYC process will be initiated asynchronously.

You can verify the KYC details by calling `GET /investors/{clientId}/kyc`. Alternatively, you can register a webhook and a call will be made to your system when the KYC status changes.

When documents are required, identity documents must be uploaded. Supported formats are pdf, png and jpeg. The documents are uploaded as `Base64` encoded strings (maximum size 10MB) using `POST /investors/{clientId}/kyc/documents`.

The supported documents are:

* Passport
* Driving licence (front side only)
* Bank statement less than three months old 
* Utility bill less than three months old

If the KYC documents are rejected (eg low quality, wrong address) then a webhook will be fired and a member of the Goji Platform Support team will contact you. The KYC status will remain as `ENHANCED_VERIFICATION_REQUIRED`.

The customer is restricted from performing certain actions until they have completed the KYC process.

These restricted actions include:

* Accessing the bank transfer details for making deposits
* Making investments

#### KYC details

An investor can be one of the following statuses:

`AWAITING_CREDIT_AGENCY_CHECK` Investor is still being electronically verified.

`ELECTRONICALLY_VERIFIED` The investor has been verified.

`ENHANCED_VERIFICATION_REQUIRED` The investor is undergoing enhanced verification .

`ENHANCED_VERIFIED` The investor has passed enhanced verification. All corporate and international investors are subject to enhanced verification.

To simulate different KYC statuses in sandbox create an investor with last name that contains:
 - By default all investors will get `ELECTRONICALLY_VERIFIED` status.
 - `REFERRED` or `DECLINED` for `ENHANCED_VERIFICATION_REQUIRED` status
 - `INPROGRESS` for `AWAITING_CREDIT_AGENCY_CHECK` status

For `ENHANCED_VERIFIED` are required intervention from goji admin. After uploading the documents, goji admin will to approve the uploaded documents.

A detailed target operating model will be shared with you as part of the operational onboarding.

## `GET /terms`

```http

GET /platformApi/terms HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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

## `GET /investorIds`

```http

GET /investorIds HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

["INVESTOR-ID-1", "INVESTOR-ID-2"]

```

### Description
Returns all the client ids of the investors on the platform. Intended for use in bulk tasks such as reconciliation, allowing the caller to first get the full list of investors and then call out to other endpoints for information on each investor.

### Request
No body required.

### Response
An array of strings.

## `POST /platformApi/investors`

```http

POST /platformApi/investors HTTP/1.1
Host: api-sandbox.goji.investments
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
  "nationalities" : [ {
    "nationality" : "GB"
  }, {
    "nationality" : "CH"
  } ],
  "dateOfBirth" : "2000-01-23",
  "title" : "MISS",
  "investorDeclarationType" : "RESTRICTED",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "firstName" : "firstName",
  "nationality (DEPRECATED)" : "nationality (DEPRECATED)",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "accountTypes" : [ { }, { } ]
}

```

```http 
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
Creates a new investor and triggers a KYC check when appliable.

<aside class="warning">

When migrating existing investors over to the Goji platform, the dedicated <a href="#investors-post-platformapi-migrate">investor migration endpoint</a> should be used instead.

</aside>

### Request
| Name                                | Type   | Description                                                                                                                                                                                                           | Required |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       | optional |
| nationalities                       | array  | The list of nationalities associated with an investor. More than one nationality can be specified for a given investor i.e. if they are dual-nationality.                                                             | optional |
| nationalities[].nationality         | string | The ISO country code. e.g GB.                                                                                                                                                                                         | optional |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       | required |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        | required |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    | required |
| address                             | ref    |                                                                                                                                                                                                                       | required |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              ||
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              ||
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            ||
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         ||
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  ||
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         ||
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    ||
| contactDetails                      | ref    |                                                                                                                                                                                                                       | required |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 ||
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    ||
| nationalInsuranceNumber             | string | The national insurance number of the investor. Only required if opening an ISA.                                                                                                                                       | optional |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       | optional |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        ||
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> ||
| entityType                          | string |  Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             | required |
| investorDeclarationType             | string | All investors must complete a declaration to confirm the kind of investor they are. Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                     | required |
| accountTypes                        | array  | Defaults to [GOJI_INVESTMENT, ISA] if not provided for a INDIVIDUAL entityType. Defaults to [GOJI_INVESTMENT] for CORPORATE entityType. ISA invalid for CORPORATE entityType                                          | optional |
| corporateDetails                    | ref    | Only required for CORPORATE entityType.                                                                                                                                                                               | optional |
| corporateDetails.companyName        | string | The company name. Only required for CORPORATE entityType.                                                                                                                                                             ||
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     ||
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      ||
### Response
| Name                                | Type   | Description                                                                                                                                                                                                           |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                                      |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    |
| address                             | ref    |                                                                                                                                                                                                                       |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         |
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    |
| contactDetails                      | ref    |                                                                                                                                                                                                                       |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                                        |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        |
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> |
| entityType                          | string |  Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             |
| accountTypes                        | string | Investor's account types Possible values are: <br>`GOJI_INVESTMENT`<br>`ISA`<br>                                                                                                                                      |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                                               |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                                     |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      |
| investmentDeclarationType           | string | The investor type declared by the investor Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                                                              |

## `GET /platformApi/investors/{clientId}`

```http

GET /platformApi/investors/{clientId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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
| Name                                | Type   | Description                                                                                                                                                                                                           |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                                      |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    |
| address                             | ref    |                                                                                                                                                                                                                       |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         |
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    |
| contactDetails                      | ref    |                                                                                                                                                                                                                       |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                                        |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        |
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> |
| entityType                          | string |  Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             |
| accountTypes                        | string | Investor's account types Possible values are: <br>`GOJI_INVESTMENT`<br>`ISA`<br>                                                                                                                                      |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                                               |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                                     |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      |
| investmentDeclarationType           | string | The investor type declared by the investor Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                                                              |
## `PUT /platformApi/investors/{clientId}`

```http

PUT /platformApi/investors/{clientId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "title" : "MISS",
  "firstName" : "firstName",
  "middleName" : "middleName",
  "lastName" : "lastName",
  "dateOfBirth" : "2000-01-23",
  "address" : {
    "country" : "country",
    "lineTwo" : "lineTwo",
    "townCity" : "townCity",
    "postcode" : "postcode",
    "lineOne" : "lineOne",
    "lineThree" : "lineThree",
    "region" : "region"
  },
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  },
  "nationalInsuranceNumber" : "nationalInsuranceNumber"
}

```

```http 
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
| Name                                | Type   | Description                                                                                                                                                                                                           | Required |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       | required |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       | required |
| middleName                          | string | The middle name of the investor.                                                                                                                                                                                      ||
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        | required |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    | required |
| address                             | ref    |                                                                                                                                                                                                                       | required |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              ||
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              ||
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            ||
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         ||
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  ||
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         ||
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    ||
| contactDetails                      | ref    |                                                                                                                                                                                                                       | required |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 ||
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    ||
| nationalInsuranceNumber             | string | The national insurance number of the investor. Only required if opening an ISA.                                                                                                                                       | optional |
### Response
| Name                                | Type   | Description                                                                                                                                                                                                           |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                                      |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       |
| middleName                          | string | The middle name of the investor.                                                                                                                                                                                      |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    |
| address                             | ref    |                                                                                                                                                                                                                       |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         |
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    |
| contactDetails                      | ref    |                                                                                                                                                                                                                       |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                                        |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        |
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> |
| entityType                          | string |  Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             |
| accountTypes                        | string | Investor's account types Possible values are: <br>`GOJI_INVESTMENT`<br>`ISA`<br>                                                                                                                                      |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                                               |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                                     |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      |
| investmentDeclarationType           | string | The investor type declared by the investor Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                                                              |

## `PUT /platformApi/investors/{clientId}/updateInvestmentDeclarationAgreement`

```http

GET /platformApi/investors/{clientId}/updateInvestmentDeclarationAgreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
	"type": "SOPHISTICATED",
	"dateTimeSigned": "2019-12-13T14:10:30.00Z",
	"reason": "reason of the change"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

"SUCCESS"
```
### Description
Updates the investor's classification.
### Request
| Name                                | Type   | Description                                                                                                                                                                                                           | Required |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| type                                | string | The investor type declared by the investor. Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                                                             | required |
| dateTimeSigned                      | string | The date and time the new declaration was been signed                                                                                                                                                                 | required |
| reason                              | string | The reason for the change. Up to 300 characters.                                                                                                                                                                      | required |

## <em>Diligence</em>

## `GET /platformApi/investors/{clientId}/kyc`

```http

GET /platformApi/investors/{clientId}/kyc HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "documentsRequired" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
  "documentsPendingApproval" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
  "documentsApproved" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
  "lastFailure" : {
    "rejectedDocuments" : [ {
      "reason" : "reason",
      "notes" : "notes",
      "type" : "type"
    }, {
      "reason" : "reason",
      "notes" : "notes",
      "type" : "type"
    } ],
    "failureDate" : "failureDate"
  },
  "status" : "AWAITING_CREDIT_AGENCY_CHECK",
  "clientId" : "GOJI-1234"
}
```
### Description
Retrieves an investor's KYC details.
### Response
| Name                                                | Type   | Description                                                                                                                                                                                                        |
| --------------------------------------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clientId                                            | string | The clientId of the investor                                                                                                                                                                                       |
| status                                              | string | The KYC details of the investor. Possible values are: <br>`AWAITING_CREDIT_AGENCY_CHECK`<br>`ELECTRONICALLY_VERIFIED`<br>`ENHANCED_VERIFICATION_REQUIRED`<br>`ENHANCED_VERIFIED`<br>                               |
| documentsRequired.[]                                | array  |  Required documents for upload. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>            |
| documentsPendingApproval.[]                         | array  |  Uploaded documents that require approving. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>|
| documentsApproved.[]                                | array  |  Approved documents. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>                       |
| {}.lastFailure                                      | ref    |                                                                                                                                                                                                                    |
| {}.lastFailure.failureDate                          | string | Date of rejection                                                                                                                                                                                                  |
| {}.lastFailure.rejectedDocuments                    | array  | The rejected documents.                                                                                                                                                                                            |

## `GET /platformApi/investors/{clientId}/kyb`

```http

GET /platformApi/investors/{clientId}/kyb HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json
{
    "documentsRequired" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
    "documentsApproved" : [ ],
    "requirements" : [
      {
        "requirementType" : "",
        "status" : "",
        "checkType" : ""
      }
    ]
    "overallStatus" : "DOCUMENTS_REQUIRED",
    "status" : "DOCUMENTS_REQUIRED",
    "clientId" : "GOJI-1234"
}
```
### Description
Retrieves an investor's KYB status - this is only applicable for corporates.
### Response
| Name                                                | Type   | Description                                                                                                                                                                                                          |
| --------------------------------------------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clientId                                            | string | The clientId of the investor                                                                                                                                                                                         |
| status                                              | string | The KYB status of the investor. Possible values are: <br>`DOCUMENTS_REQUIRED`<br>`VERIFIED`<br>                                                                                                                       |
| overallStatus                                       | string | The overall KYB status of the investor. Possible values are: <br>`IN_PROGRESS`<br>`PASSED`<br>`DECLINED`<br>`                                                                                                         |
| documentsRequired.[]                                | array  | Required documents for upload. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>               |
| documentsPendingApproval.[]                         | array  | Uploaded documents that require approving. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>   |
| documentsApproved.[]                                | array  | Approved documents. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>                          |
| requirements                                        | ref    |                                                                                                                                                                                                                      |
| requirements.[].{}.requirementType                  | string |                                                                                                                                                                                                                      |
| requirements.[].{}.status                           | string | Possible values are: <br>`IN_PROGRESS`<br>`PASSED`<br>`DECLINED`<br>                                                                                                                                                 |
| requirements.[].{}.checkType                        | string | Possible values are: `IDENTITY_CHECK`<br>`MANUAL_IDENTITY_CHECK`<br>`DEPOSIT_LIMIT_CHECK`<br>`PEP_CHECK`<br>`SANCTIONS_CHECK`<br>`BWA_CHECK`<br>`MANUAL_VERIFICATION_CHECK`<br>`NO_WORKFLOW_CREATED_CHECK`<br>`NONE` |

## `POST /platformApi/investors/{clientId}/kyc/documents`

```http

POST /platformApi/investors/{clientId}/kyc/documents HTTP/1.1
Host: api-sandbox.goji.investments
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

```

```http 
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

## `GET /reports/investors/kyc`

```http

GET /reports/investors/kyc?id={clientId}&id={clientId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "documentsRequired" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
    "documentsPendingApproval" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
    "documentsApproved" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
    "lastFailure" : {
      "rejectedDocuments" : [ {
        "reason" : "reason",
        "notes" : "notes",
        "type" : "type"
      }, {
        "reason" : "reason",
        "notes" : "notes",
        "type" : "type"
      } ],
      "failureDate" : "failureDate"
    },
    "status" : "AWAITING_CREDIT_AGENCY_CHECK",
    "clientId" : "GOJI-1234"
  },
  {
      "documentsRequired" : [ ],
      "documentsPendingApproval" : [ ],
      "documentsApproved" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
      "lastFailure" : {
        "rejectedDocuments" : [ {
          "reason" : "reason",
          "notes" : "notes",
          "type" : "type"
        }, {
          "reason" : "reason",
          "notes" : "notes",
          "type" : "type"
        } ],
        "failureDate" : "failureDate"
      },
      "status" : "VERIFIED",
      "clientId" : "GOJI-4567"
    }
]
```
### Description
Retrieves investor's KYC details. Intended for use in combination with `GET /investorIds` to fetch large numbers of investor kyc statuses for purposes such as reconciliation.

The `id` query parameter may repeated up to 100 times. If more than 100 ids are specified, a `400` error is returned.
If no `id` query parameters are specified and empty array is returned.

### Response
| Name                                                | Type   | Description                                                                                                                                                                                                        |
| --------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| [].clientId                                         | string | The clientId of the investor                                                                                                                                                                                       |
| [].status                                           | string | The KYC details of the investor. Possible values are: <br>`AWAITING_CREDIT_AGENCY_CHECK`<br>`ELECTRONICALLY_VERIFIED`<br>`ENHANCED_VERIFICATION_REQUIRED`<br>`ENHANCED_VERIFIED`<br>                               |
| [].documentsRequired.[]                             | array  | Required documents for upload. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>             |
| [].documentsPendingApproval.[]                      | array  | Uploaded documents that require approving. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br> |
| [].documentsApproved.[]                             | array  | Approved documents. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>                        |
| [].{}.lastFailure                                   | ref    |                                                                                                                                                                                                                    |
| [].{}.lastFailure.failureDate                       | string | Date of rejection                                                                                                                                                                                                  |
| [].{}.lastFailure.rejectedDocuments                 | array  | The rejected documents.                                                                                                                                                                                            |

## `GET /reports/investors/kyb`

```http

GET /reports/investors/kyb?id={clientId}&id={clientId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

```

```http
HTTP/1.1 200 OK
Content-Type: application/json

[
  {
    "documentsRequired" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
    "documentsApproved" : [ ],
    "requirements" : [
      {
        "requirementType" : "",
        "status" : "",
        "checkType" : ""
      }
    ]
    "overallStatus" : "DOCUMENTS_REQUIRED",
    "status" : "DOCUMENTS_REQUIRED",
    "clientId" : "GOJI-1234"
  },
  {
    "documentsRequired" : [ ],
    "documentsApproved" : [ "PROOF_OF_ADDRESS", "PROOF_OF_IDENTITY" ],
    "requirements" : [
      {
        "requirementType" : "",
        "status" : "",
        "checkType" : ""
      }
    ]
    "overallStatus" : "VERIFIED",
    "status" : "VERIFIED",
    "clientId" : "GOJI-4567"
    }
]
```
### Description
Retrieves corporate investors KYB details. Intended for use in combination with `GET /investorIds` to fetch large numbers of corporate kyb statuses for purposes such as reconciliation.

The `id` query parameter may repeated up to 100 times. If more than 100 ids are specified, a `400` error is returned.
If no `id` query parameters are specified and empty array is returned.

### Response
| Name                                                | Type   | Description                                                                                                                                                                                                         |
| --------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [].clientId                                         | string | The clientId of the investor                                                                                                                                                                                        |
| [].status                                           | string | The KYB status of the investor. Possible values are: <br>`DOCUMENTS_REQUIRED`<br>`VERIFIED`<br>                                                                                                                     |
| [].overallStatus                                    | string | The overall KYB status of the investor. Possible values are: <br>`IN_PROGRESS`<br>`PASSED`<br>`DECLINED`<br>`                                                                                                       |
| [].documentsRequired.[]                             | array  | Required documents for upload. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>              |
| [].documentsPendingApproval.[]                      | array  | Uploaded documents that require approving. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>  |
| [].documentsApproved.[]                             | array  | Approved documents. Possible values are: <br>`PROOF_OF_ADDRESS`<br>`PROOF_OF_IDENTITY`<br>`COVI`<br>`PASS_CERTIFICATE`<br>`RISK_ASSESSMENT`<br>`CLIENT_QUESTIONNAIRE`<br>`KYB_DOCUMENT`<br>                         |
| [].requirements                                     | ref    |                                                                                                                                                                                                                     |
| [].requirements.[].{}.requirementType               | string |                                                                                                                                                                                                                     |
| [].requirements.[].{}.status                        | string | Possible values are: <br>`IN_PROGRESS`<br>`PASSED`<br>`DECLINED`<br>                                                                                                                                                |
| [].requirements.[].{}.checkType                     | string | Possible values are: `IDENTITY_CHECK`<br>`MANUAL_IDENTITY_CHECK`<br>`DEPOSIT_LIMIT_CHECK`<br>`PEP_CHECK`<br>`SANCTIONS_CHECK`<br>`BWA_CHECK`<br>`MANUAL_VERIFICATION_CHECK`<br>`NO_WORKFLOW_CREATED_CHECK`<br>`NONE`|

## <em>ISAs</em>

## Opening an Innovative Finance ISA

An Investor can open an ISA either as part of their initial registration, or as a second step later on.

To open an ISA, the investor has to provide their National Insurance Number and agree to an ISA declaration.
Once this is completed, Goji will validate the data and check that the investor is eligible for an ISA.
If these checks are successful, the ISA is opened immediately and isavailable to deposit funds into.

![](/images/investors/images/add-isa.png "")

## ISA Transfers In

Investors can request to transfer funds from other ISAs they hold with other providers to their Goji ISA.

Investment Managers can embed a javascript widget into their web platform to guide investors through completing the form.
Once the form is complete, they download and sign the form and return it to Goji. Goji liaises with the existing
manager to arrange transfer of the funds.

Once the funds are received, they are credited to the investor's accounts and can be invested as normal.

![](/images/investors/images/isa-transfers.png "")

The Goji Transfer In application exposes an ISA transfer in form intended for an investor to complete.

It supports ISA transfers of the following types:

- Cash
- Stocks and Shares
- Innovative Finance

### Workflow

1. The investor creates a transfer in request by using the widget that we provide. You should embed this in your site according to the instructions below.

2. Once the form has been completed the investor will download and print the form (or optionally receive it in the mail) and return it to Goji via a PO Box.

3. Goji will liaise with the existing ISA manager to arrange the transfer.

4. Once the funds have been received they will be credited to the investor's ISA balance. An email is sent to the investor and a webhook fired.

5. In the case where the received funds would exceed the current year's allowance, then the surplus will be credited to their standard account.

### Embedding the Transfer In Widget

The Goji Transfer In application is a JavaScript component which can be integrated in a number of ways.
For each possible way of integrating with the application, you will need to first obtain a one time security token.

#### Obtaining the _uiData_ and the security token

To obtain the application's asset URLs one time security token, make an authenticated request to the following URL:

   `/investors/{clientId}/accounts/ISA/transferIn/uiData`

   The response will be structured like so:

   _(Please note that you should never hard-code the URLs returned since they are subject to change)_

               {
                 "apiUrl": "https://api.gojip2p.net",
                 "styleSrc": "https://goji-assets-domain/transfer-in/assets/goji-transfer-in-123456.css",
                 "scriptSrc": "https://goji-assets-domain/transfer-in/assets/goji-transfer-in-123456.js",
                 "investorId": "<investorId>",
                 "token": "<oneTimeToken>"
               }

   With this data you are then able to bootstrap the application using any of the methods outlined below.

  If your front-end application uses Ember, using as an Ember Addon makes sense. Alternatively, the suggested approach would be to
  embed as a standalone JavaScript component on your existing pages - this enables full control over the application's styling.

#### Application Arguments

Four arguments are required for the application to function fully, these are described below:

- `apiUrl`: [Specified in the _uiData_ response] The API URL the front-end application should use when interacting with the Goji service
- `investorId`: [Specified in the _uiData_ response] The ID of the active investor
- `token`: [Specified in the _uiData_ response] The security token used to authenticate the active investor's requests
- `accountUrl`: The URL used when an investor chooses to return to their account page having successfully completed a transfer in request

#### Using as a Standalone JavaScript Component

To include the application in your existing page as a JavaScript component, you will need to do the following:

1). In the body of your HTML include the following:

    `<div id="goji-application">`
      `<div data-component="goji-transfer-in"`
                             `data-attrs='{ "apiUrl": "<uiData.apiUrl>", "accountUrl": "<platform-manage-account-url>",`
                                           `"investorId": "<uiData.investorId>", "token": "<uiData.token>" }'>`
      `</div>`
    `</div>`

2). Extract the JavaScript asset's URL from the request above and include it in your page.

   _Please note that the inclusion of the script import must be made after inclusion of the HTML in the previous step._

   e.g `<script src="{{uiData.scriptSrc}}"></script>`

   Optionally do the same for the CSS file if you wish to have a basic layout.

   e.g `<link rel="stylesheet" href="{{uiData.styleSrc}}">`

3). The component will then render when the document's body has fully loaded.

## `GET /platformApi/isaDeclaration`

```http

GET /platformApi/isaDeclaration HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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

## `POST /platformApi/investors/{clientId}/accounts/ISA`

```http

POST /platformApi/investors/{clientId}/accounts/ISA HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "nationalInsuranceNumber" : "nationalInsuranceNumber"
}

```

```http 
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
| Name                                | Type   | Description                                                                                                                                                                                                           |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                                      |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    |
| address                             | ref    |                                                                                                                                                                                                                       |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         |
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    |
| contactDetails                      | ref    |                                                                                                                                                                                                                       |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                                        |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        |
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> |
| entityType                          | string |  Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             |
| accountTypes                        | string | Investor's account types Possible values are: <br>`GOJI_INVESTMENT`<br>`ISA`<br>                                                                                                                                      |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                                               |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                                     |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      |
| investmentDeclarationType           | string | The investor type declared by the investor Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                                                              |

## `GET /platformApi/investors/{clientId}/isa`

```http

GET /platformApi/investors/{clientId}/isa HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Returns details of the investor's ISA if applicable.
### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |

## `GET /platformApi/investors/{clientId}/isa/subscriptionStatus`

```http

GET /platformApi/investors/{clientId}/isa/subscriptionStatus HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...


```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "subscriptionStatus" : "VALID"
}
```
### Description
Used to retrieve the subscription status of an investor's ISA. 

Most useful for checking if the investor has entered a tax year break status whereby subscriptions are no longer allowed until redeclaration has taken place.

#### Tax Year Breaks

A tax year break occurs when an investor has not subscribed for a whole tax year and is therefore required to re-open an ISA before they can make further subscriptions.

For example, Investor A opens an ISA on 1st April 2016 (ie in the 2015/16 tax year) and subscribes £10,000.

The investor does not subscribe between 6th April 2016 and 5th April 2017.

This is considered a tax year break and so the investor will have to re-open their ISA to subscribe in the 2017/18 tax year.

To re-open the ISA, the investor has to [agree to the ISA declaration](#investors-post-platformapi-investors-investorid-declaration-agreement).

### Response
| Name               | Type   | Description                                                                                                                                                                                                                                                                             |
| ------------------ | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| subscriptionStatus | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |

## `PUT /platformApi/investors/{investorId}/isa/subscriptionStatus`

```http

PUT /platformApi/investors/{investorId}/isa/status HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "isaSubscriptionStatus" : "VALID"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalAmountInvested" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Updates the status of an investor's ISA. This can aid testing by placing an ISA into an invalid status.
### Request
| Name                  | Type   | Description                                                                                                                                                                                                                                        | Required |
| --------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| dateTime              | string | The date time the residual income payment was received.                                                                                                                                                                                            | required |
| isaSubscriptionStatus | string | The status to change this ISA to. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> | required |
### Response
| Name                                 | Type   | Description                                                                   |
| ------------------------------------ | ------ | ----------------------------------------------------------------------------- |
| totalCashBalance                     | ref    | The total amount of cash in the ISA that is not currently invested.           |
| totalCashBalance.amount              | number | The amount                                                                    |
| totalCashBalance.currency            | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| totalAmountInvested                  | ref    | The total amount of the ISA that is currently invested.                       |
| totalAmountInvested.amount           | number | The amount                                                                    |
| totalAmountInvested.currency         | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| totalIsaBalance                      | ref    | The total current balance in the ISA, inclusive of all years.                 |
| totalIsaBalance.amount               | number | The amount                                                                    |
| totalIsaBalance.currency             | string | The currency in ISO 4217 three character codes eg 'GBP'                       |
| remainingSubscriptionAmount          | ref    | The amount remaining that can be invested in the ISA in the current tax year. |
| remainingSubscriptionAmount.amount   | number | The amount                                                                    |
| remainingSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                       |

## `POST /platformApi/investors/{investorId}/declaration/agreement`

```http

POST /platformApi/investors/{investorId}/declaration/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

""

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalInterestReceived" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "remainingSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateCreated" : "2000-01-23",
  "remainingAdditionalPermittedSubscriptions" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "cashTransactions" : [ {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  }, {
    "amount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "clientTransactionId" : "clientTransactionId",
    "type" : { },
    "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
  } ],
  "subscriptionStatus" : "VALID",
  "totalIsaBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalInterestReceivedThisTaxYear" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "totalCashBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 2.15,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "reinvestments" : [ {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    }, {
      "clientReinvestmentId" : "clientReinvestmentId",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
    } ],
    "id" : "id",
    "investmentType" : "LOAN",
    "dateTimeOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "repayments" : [ {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    }, {
      "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
      "interestAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      },
      "id" : "id",
      "clientRepaymentId" : "clientRepaymentId",
      "capitalAmount" : {
        "amount" : 123.45,
        "currency" : "currency"
      }
    } ]
  } ],
  "coolingOffPeriodEnds" : "2000-01-23",
  "totalInvestedBalance" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Used to record an investor agreeing to the ISA declaration after the ISA has been opened. Can be used to re-enable ISAs in a tax year break status for example.

### Response
| Name                                               | Type   | Description                                                                                                                                                                                                                                                                             |
| -------------------------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                                                                                                                                                                                           |
| totalIsaBalance.amount                             | number | The amount                                                                                                                                                                                                                                                                              |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                                                                                                                                                                                           |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                                                                                                                                                                                              |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                                                                                                                                                                                                     |
| totalCashBalance.amount                            | number | The amount                                                                                                                                                                                                                                                                              |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| dateCreated                                        | string | Date the ISA was created                                                                                                                                                                                                                                                                |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                                                                                                                                                                                                        |
| investments                                        | array  | The list of investments that make up the ISA                                                                                                                                                                                                                                            |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                                                                                                                                                                                                      |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                                                                                                                                                                                          |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported. Possible values are: <br>`LOAN`<br>                                                                                                                                                                                     |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                                                                                                                                                                                          |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                                                                                                                                                                                                       |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                                                                                                                                                                                                |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                                                                                                                                                                                                    |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically.                                                                                                                                                                           |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.                                                                                                                                                                              |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                                                                                                                                                                                            |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                                                                                                                                                                                                  |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                                                                                                                                                                                                      |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                                                                                                                                                                                                    |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                                                                                                                                                                                             |
| totalInterestReceived                              | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceived.amount                       | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                                                                                                                                                                                                         |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                                                                                                                                                                                              |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| totalInvestedBalance                               | ref    |                                                                                                                                                                                                                                                                                         |
| totalInvestedBalance.amount                        | number | The amount                                                                                                                                                                                                                                                                              |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA. Possible values are: <br>`VALID`<br>`INVALID_CROWN_DEPENDENCY`<br>`INVALID_NON_UK`<br>`INVALID_LOCKED_DEATH`<br>`INVALID_LOCKED_BANKRUPTCY`<br>`UNLOCKED`<br>`INVALID_CANCELLED`<br>`INVALID_TAX_YEAR_BREAK`<br> |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                                                                                                                                                                                                    |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                                                                                                                                                                                              |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                                                                                                                 |


## `GET /platformApi/investors/{clientId}/accounts/ISA/transferIn/UI`

```http

GET /platformApi/investors/{clientId}/accounts/ISA/transferIn/UI HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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
## `GET /platformApi/transferIn/open/summary`

```http

GET /platformApi/transferIn/open/summary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
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
} ]
```
### Description
Returns аll opened transfers in.
### Response
| Name                            | Type   | Description                                             |
| ------------------------------- | ------ | ------------------------------------------------------- |
| [].id                           | string | The ID of the transfer in                               |
| [].clientId                     | string | The ID of client                                        |
| [].totalTransferAmount          | ref    | The total amount being transferred                      |
| [].totalTransferAmount.amount   | number | The amount                                              |
| [].totalTransferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].repairAmount                 | ref    | The repair amount                                       |
| [].repairAmount.amount          | number | The amount                                              |
| [].repairAmount.currency        | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].fundsTransferType            | string | The funds transfer type                                 |
| [].bankReference                | string | The bank reference                                      |
| [].transferInDate               | string | The date stated on the transfer history form            |
## `GET /platformApi/investors/{clientId}/transferOut`

```http

GET /platformApi/investors/{clientId}/transferOut HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "dateFundsTransferred" : "2000-01-23",
  "amountToTransfer" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "isaManager" : {
    "address" : {
      "country" : "country",
      "lineTwo" : "lineTwo",
      "townCity" : "townCity",
      "postcode" : "postcode",
      "lineOne" : "lineOne",
      "lineThree" : "lineThree",
      "region" : "region"
    },
    "bankReference" : "bankReference",
    "name" : "name",
    "accountNumber" : "accountNumber",
    "sortCode" : "sortCode"
  },
  "transferDetails" : {
    "transferCurrentYearSubscriptions" : true,
    "transferAllPriorYearSubscriptions" : true,
    "transferAll" : true,
    "transferDateFromNewIsaManager" : "2000-01-23",
    "transferPriorYearSubscriptions" : true,
    "priorYearAmountToTransfer" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateTAFReceived" : "2000-01-23"
  },
  "id" : "id",
  "amountToTransferAlert" : true
} ]
```
### Description
Lists transfers out for the investor.
### Response
| Name                                                 | Type    | Description                                                                                                                                                                                        |
| ---------------------------------------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [].id                                                | string  | The ID Goji assigns to the Transfer Out request.                                                                                                                                                   |
| [].isaManager                                        | ref     |                                                                                                                                                                                                    |
| [].isaManager.name                                   | string  | The name of the ISA manager.                                                                                                                                                                       |
| [].address.lineOne                                   | string  | Line one of the address.                                                                                                                                                                           |
| [].address.lineTwo                                   | string  | Line two of the address.                                                                                                                                                                           |
| [].address.lineThree                                 | string  | Line three of the address.                                                                                                                                                                         |
| [].address.townCity                                  | string  | The town/city of the address.                                                                                                                                                                      |
| [].address.region                                    | string  | The region of the address eg county.                                                                                                                                                               |
| [].address.postcode                                  | string  | The post code of the address.                                                                                                                                                                      |
| [].address.country                                   | string  | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| [].isaManager.accountNumber                          | string  | The account number to transfer the funds to.                                                                                                                                                       |
| [].isaManager.sortCode                               | string  | The sort code to transfer the funds to.                                                                                                                                                            |
| [].isaManager.bankReference                          | string  | The reference to use for the bank transfer.                                                                                                                                                        |
| [].transferDetails                                   | ref     |                                                                                                                                                                                                    |
| [].transferDetails.dateTAFReceived                   | string  | The date the transfer authority form was received from the ISA manager.                                                                                                                            |
| [].transferDetails.transferDateFromNewIsaManager     | string  | The date the ISA manager has said they will accept subscriptions from.                                                                                                                             |
| [].transferDetails.transferCurrentYearSubscriptions  | boolean | True if current year subscriptions should be transferred.                                                                                                                                          |
| [].transferDetails.transferPriorYearSubscriptions    | boolean | True if prior year subscriptions should be transferred.                                                                                                                                            |
| [].transferDetails.transferAllPriorYearSubscriptions | boolean | True if all prior year subscriptions should be transferred.                                                                                                                                        |
| [].transferDetails.transferAll                       | boolean | True if all ISA subscriptions should be transferred.                                                                                                                                               |
| [].priorYearAmountToTransfer.amount                  | number  | The amount                                                                                                                                                                                         |
| [].priorYearAmountToTransfer.currency                | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransfer                                  | ref     |                                                                                                                                                                                                    |
| [].amountToTransfer.amount                           | number  | The amount                                                                                                                                                                                         |
| [].amountToTransfer.currency                         | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransferAlert                             | boolean | True if the amount requested to be transferred cannot be satisfied. If this is true, the transfer cannot be processed until it is resolved.                                                        |
| [].dateFundsTransferred                              | string  | The date the funds were transferred to the new ISA manager.                                                                                                                                        |
## `GET /platformApi/investors/{clientId}/transferIn`

```http

GET /platformApi/investors/{clientId}/transferIn HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
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
} ]
```
### Description
Lists transfers in for the investor.
### Response
| Name                            | Type   | Description                                             |
| ------------------------------- | ------ | ------------------------------------------------------- |
| [].id                           | string | The ID of the transfer in                               |
| [].clientId                     | string | The ID of client                                        |
| [].totalTransferAmount          | ref    | The total amount being transferred                      |
| [].totalTransferAmount.amount   | number | The amount                                              |
| [].totalTransferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].repairAmount                 | ref    | The repair amount                                       |
| [].repairAmount.amount          | number | The amount                                              |
| [].repairAmount.currency        | string | The currency in ISO 4217 three character codes eg 'GBP' |
| [].fundsTransferType            | string | The funds transfer type                                 |
| [].bankReference                | string | The bank reference                                      |
| [].transferInDate               | string | The date stated on the transfer history form            |
## `GET /platformApi/investors/{clientId}/transferIn/{transferInId}`

```http

GET /platformApi/investors/{clientId}/transferIn/{transferInId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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

## `GET /transferIn/investors/{clientId}/open`

```http

GET /transferIn/investors/{clientId}/open HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "isaManagerName" : "isaManagerName",
  "transferSummary" : {
    "previousYearsSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "totalIsaTransferAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "repairAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "currentYearSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    }
  },
  "cashArrived" : true,
  "previousYearsAmountType" : "previousYearsAmountType",
  "id" : "id",
  "isaType" : "isaType",
  "transferDate" : "2000-01-23",
  "includeCurrentYear" : true,
  "fundsTransferType": "BANK_TRANSFER"
} ]
```
### Description
Returns an overview of all open transfers in for a particular investor. 
The `transferDate` is only non-null if the transfer history form has been received.
### Response
| Name                                        | Type    | Description                                                                    |
| ------------------------------------------- | ------- | ------------------------------------------------------------------------------ |
| [].id                                       | string  | The id                                                                         |
| [].isaType                                  | string  | The type of ISA the investor holds                                             |
| [].isaManagerName                           | string  | The name of the ISA manager involved with the Transfer In                      |
| [].transferSummary                          | ref     | Details of the amounts being transferred                                       |
| [].currentYearSubscriptionAmount.amount     | number  | The amount                                                                     |
| [].currentYearSubscriptionAmount.currency   | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].previousYearsSubscriptionAmount.amount   | number  | The amount                                                                     |
| [].previousYearsSubscriptionAmount.currency | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].repairAmount.amount                      | number  | The amount                                                                     |
| [].repairAmount.currency                    | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].totalIsaTransferAmount.amount            | number  | The amount                                                                     |
| [].totalIsaTransferAmount.currency          | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].includeCurrentYear                       | boolean | True if current year subscriptions should be transferred                       |
| [].previousYearsAmountType                  | string  | Determines how much prior year subscription should be included in the transfer |
| [].transferDate                             | string  | The date on which the transfer should occur                                    |
| [].cashArrived                              | boolean | True if the cash for the Transfer In has arrived                                                            |
| [].fundsTransferType                        | string  | The funds transfer type. Possible values are: <br>`CHEQUE`<br>`BANK_TRANSFER`<br>|

## `GET /transferIn/investors/{clientId}/closed`

```http

GET /transferIn/investors/{clientId}/closed HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "isaManagerName" : "isaManagerName",
  "transferSummary" : {
    "previousYearsSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "totalIsaTransferAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "repairAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "currentYearSubscriptionAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    }
  },
  "cashArrived" : true,
  "previousYearsAmountType" : "previousYearsAmountType",
  "id" : "id",
  "isaType" : "isaType",
  "transferDate" : "2000-01-23",
  "includeCurrentYear" : true,
  "fundsTransferType": "BANK_TRANSFER"
} ]
```
### Description
Returns an overview of all closed transfers in for a particular investor.
### Response
| Name                                        | Type    | Description                                                                    |
| ------------------------------------------- | ------- | ------------------------------------------------------------------------------ |
| [].id                                       | string  | The id                                                                         |
| [].isaType                                  | string  | The type of ISA the investor holds                                             |
| [].isaManagerName                           | string  | The name of the ISA manager involved with the Transfer In                      |
| [].transferSummary                          | ref     | Details of the amounts being transferred                                       |
| [].currentYearSubscriptionAmount.amount     | number  | The amount                                                                     |
| [].currentYearSubscriptionAmount.currency   | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].previousYearsSubscriptionAmount.amount   | number  | The amount                                                                     |
| [].previousYearsSubscriptionAmount.currency | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].repairAmount.amount                      | number  | The amount                                                                     |
| [].repairAmount.currency                    | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].totalIsaTransferAmount.amount            | number  | The amount                                                                     |
| [].totalIsaTransferAmount.currency          | string  | The currency in ISO 4217 three character codes eg 'GBP'                        |
| [].includeCurrentYear                       | boolean | True if current year subscriptions should be transferred                       |
| [].previousYearsAmountType                  | string  | Determines how much prior year subscription should be included in the transfer |
| [].transferDate                             | string  | The date on which the transfer should occur                                    |
| [].cashArrived                              | boolean | True if the cash for the Transfer In has arrived                               |
| [].fundsTransferType                        | string  | The funds transfer type. Possible values are: <br>`CHEQUE`<br>`BANK_TRANSFER`<br>|

## `GET /platformApi/transferIn/deposits/{date}`

```http

GET /platformApi/transferIn/deposits/{date} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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
## `GET /platformApi/transfersOut`

```http

GET /platformApi/transfersOut HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

[ {
  "dateFundsTransferred" : "2000-01-23",
  "amountToTransfer" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "isaManager" : {
    "address" : {
      "country" : "country",
      "lineTwo" : "lineTwo",
      "townCity" : "townCity",
      "postcode" : "postcode",
      "lineOne" : "lineOne",
      "lineThree" : "lineThree",
      "region" : "region"
    },
    "bankReference" : "bankReference",
    "name" : "name",
    "accountNumber" : "accountNumber",
    "sortCode" : "sortCode"
  },
  "transferDetails" : {
    "transferCurrentYearSubscriptions" : true,
    "transferAllPriorYearSubscriptions" : true,
    "transferAll" : true,
    "transferDateFromNewIsaManager" : "2000-01-23",
    "transferPriorYearSubscriptions" : true,
    "priorYearAmountToTransfer" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateTAFReceived" : "2000-01-23"
  },
  "id" : "id",
  "amountToTransferAlert" : true
} ]
```
### Description
Lists all transfers out for all investors.
### Response
| Name                                                 | Type    | Description                                                                                                                                                                                        |
| ---------------------------------------------------- | ------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [].id                                                | string  | The ID Goji assigns to the Transfer Out request.                                                                                                                                                   |
| [].isaManager                                        | ref     |                                                                                                                                                                                                    |
| [].isaManager.name                                   | string  | The name of the ISA manager.                                                                                                                                                                       |
| [].address.lineOne                                   | string  | Line one of the address.                                                                                                                                                                           |
| [].address.lineTwo                                   | string  | Line two of the address.                                                                                                                                                                           |
| [].address.lineThree                                 | string  | Line three of the address.                                                                                                                                                                         |
| [].address.townCity                                  | string  | The town/city of the address.                                                                                                                                                                      |
| [].address.region                                    | string  | The region of the address eg county.                                                                                                                                                               |
| [].address.postcode                                  | string  | The post code of the address.                                                                                                                                                                      |
| [].address.country                                   | string  | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| [].isaManager.accountNumber                          | string  | The account number to transfer the funds to.                                                                                                                                                       |
| [].isaManager.sortCode                               | string  | The sort code to transfer the funds to.                                                                                                                                                            |
| [].isaManager.bankReference                          | string  | The reference to use for the bank transfer.                                                                                                                                                        |
| [].transferDetails                                   | ref     |                                                                                                                                                                                                    |
| [].transferDetails.dateTAFReceived                   | string  | The date the transfer authority form was received from the ISA manager.                                                                                                                            |
| [].transferDetails.transferDateFromNewIsaManager     | string  | The date the ISA manager has said they will accept subscriptions from.                                                                                                                             |
| [].transferDetails.transferCurrentYearSubscriptions  | boolean | True if current year subscriptions should be transferred.                                                                                                                                          |
| [].transferDetails.transferPriorYearSubscriptions    | boolean | True if prior year subscriptions should be transferred.                                                                                                                                            |
| [].transferDetails.transferAllPriorYearSubscriptions | boolean | True if all prior year subscriptions should be transferred.                                                                                                                                        |
| [].transferDetails.transferAll                       | boolean | True if all ISA subscriptions should be transferred.                                                                                                                                               |
| [].priorYearAmountToTransfer.amount                  | number  | The amount                                                                                                                                                                                         |
| [].priorYearAmountToTransfer.currency                | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransfer                                  | ref     |                                                                                                                                                                                                    |
| [].amountToTransfer.amount                           | number  | The amount                                                                                                                                                                                         |
| [].amountToTransfer.currency                         | string  | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                                            |
| [].amountToTransferAlert                             | boolean | True if the amount requested to be transferred cannot be satisfied. If this is true, the transfer cannot be processed until it is resolved.                                                        |
| [].dateFundsTransferred                              | string  | The date the funds were transferred to the new ISA manager.                                                                                                                                        |

## <em>Migration</em>

## Migrating Investors

If you are migrating your existing investors over to Goji, then you need to onboard the existing investors using the dedicated [investor migration endpoint](#investors-post-platformapi-migrate) and include `migrationDetails` data.

The `migrationDetails` allows the platform to provide an existing investor ID where applicable and provide the diligence status as agreed with Goji before migration takes place. 

### Upgrading investors currently using the ISA Administration API

When upgrading from using the Goji ISA Administration API to the Goji Platform API, the `existingClientId` in the 
`migrationDetails` prompts the system to upgrade the existing investor with the relevant ID. 

This involves:

* Generating a new client ID
* Performing a KYC check
* Generating an account number for depositing funds

Any existing ISA data is preserved.

## `POST /platformApi/migrate`

```http
POST /platformApi/investors HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "title": "MS",
  "firstName": "Jane",
  "lastName": "Doe",
  "address": {
    "country": "GBR",
    "lineOne": "1 The High Street",
    "lineTwo": "",
    "lineThree": "",
    "postcode": "AA1 1AA",
    "townCity": "London",
    "region": "Greater London"
  },
  "nationalInsuranceNumber": "MG442319A",
  "accountTypes": [
    "GOJI_INVESTMENT",
    "ISA"
  ],
  "entityType": "INDIVIDUAL",
  "employmentDetails": {
    "jobTitle": "Accountant",
    "employmentStatus": "EMPLOYED_FULL_TIME"
  },
  "nationalities": [
    {"nationality": "GB"},
    {"nationality": "CH"}
  ],
  "dateOfBirth": "1990-01-19",
  "migrationDetails": {
    "existingClientId": "existingClientId",
    "diligenceMigrationOption": "FULL_CHECK",
    "previousCheckDate": "2000-01-23"
  },
  "investorDeclarationType": "RESTRICTED",
  "contactDetails": {
    "emailAddress": "example@example.com",
    "telephoneNumber": "07123456789"
  }
}
```

```http

POST /platformApi/investors HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "title": "MS",
  "firstName": "Jane",
  "lastName": "Doe",
  "corporateDetails": {
    "companyType": "LLC",
    "registrationNumber": "AB123456",
    "companyName": "Fake company"
  },
  "address": {
    "country": "GBR",
    "lineOne": "1 The High Street",
    "lineTwo": "",
    "lineThree": "",
    "postcode": "AA1 1AA",
    "townCity": "London",
    "region": "Greater London"
  },
  "accountTypes": [
    "GOJI_INVESTMENT",
  ],
  "entityType": "CORPORATE",
  "nationalities": [
    {"nationality": "GB"},
    {"nationality": "CH"}
  ],
  "dateOfBirth": "1990-01-19",
  "migrationDetails": {
    "existingClientId": "existingClientId",
    "diligenceMigrationOption": "FULL_CHECK",
    "previousCheckDate": "2000-01-23"
  },
  "investorDeclarationType": "HIGH_NET_WORTH",
  "contactDetails": {
    "emailAddress": "example@example.com",
    "telephoneNumber": "07123456789"
  }
}
```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "title": "MS",
  "firstName": "Jane",
  "lastName": "Doe",
  "corporateDetails": {
    "companyType": "LLC",
    "registrationNumber": "AB123456",
    "companyName": "Fake company"
  },
  "address": {
    "country": "GBR",
    "lineOne": "1 The High Street",
    "lineTwo": "",
    "lineThree": "",
    "postcode": "AA1 1AA",
    "townCity": "London",
    "region": "Greater London"
  },
  "accountTypes": [
    "GOJI_INVESTMENT",
  ],
  "entityType": "CORPORATE",
  "nationalities": [
    {"nationality": "GB"},
    {"nationality": "CH"}
  ],
  "dateOfBirth": "1990-01-19",
  "migrationDetails": {
    "existingClientId": "existingClientId",
    "diligenceMigrationOption": "FULL_CHECK",
    "previousCheckDate": "2000-01-23"
  },
  "investorDeclarationType": "HIGH_NET_WORTH",
  "contactDetails": {
    "emailAddress": "example@example.com",
    "telephoneNumber": "07123456789"
  }
}
```
### Description
Migrates an existing investor onto the Goji system.

<aside class="notice">
The required <code>migrationDetails</code> allows the platform to provide an existing investor ID where applicable and provide the diligence status as agreed with Goji before migration takes place. 
</aside>

### Request
| Name                                | Type   | Description                                                                                                                                                                                                           | Required |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       | optional |
| nationalities                       | array  | The list of nationalities associated with an investor. More than one nationality can be specified for a given investor i.e. if they are dual-nationality.                                                             | optional |
| nationalities[].nationality         | string | The ISO country code. e.g GB.                                                                                                                                                                                         | optional |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       | required |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        | required |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    | required |
| address                             | ref    |                                                                                                                                                                                                                       | required |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              ||
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              ||
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            ||
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         ||
| address.region                      | string | The region of the address eg county.                                                                                                                                                                                  ||
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         ||
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    ||
| contactDetails                      | ref    |                                                                                                                                                                                                                       | required |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 ||
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    ||
| nationalInsuranceNumber             | string | The national insurance number of the investor. Only required if opening an ISA.                                                                                                                                       | optional |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       | optional |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        ||
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> ||
| entityType                          | string |  Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             | required |
| investorDeclarationType             | string | All investors must complete a declaration to confirm the kind of investor they are. Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                     | required |
| accountTypes                        | array  | Defaults to [GOJI_INVESTMENT, ISA] if not provided for a INDIVIDUAL entityType. Defaults to [GOJI_INVESTMENT] for CORPORATE entityType. ISA invalid for CORPORATE entityType                                          | optional |
| corporateDetails                    | ref    | only required for CORPORATE entityType.                                                                                                                                                                               | optional |
| corporateDetails.companyName        | string | The company name.  Only required for CORPORATE entityType.                                                                                                                                                            ||
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     ||
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      ||
| migrationDetails                    | ref    |                                                                                                                                                                                                                       | required |
| migrationDetails.existingClientId   | string | The existing client ID for the investor to be migrated which can be useful for referencing any investor should issues occur or indeed must reference any ISA Administration investor's existing ID when applicable    | required |
| migrationDetails.diligenceMigrationOption| string | The agreed KYC/B check requirements for the investor - Goji will work with the platform to review historical checks and determine what value should be specified. Possible values are: <br>`FULL_CHECK`: Goji will perform a full diligence check<br>`HISTORICAL_RELIANCE_WITH_MONITORING`: Goji will place reliance on previous checks (only when agreed beforehand) and perform ongoing monitoring<br>`EVENT_BASED_FULL_CHECK`: Goji will only perform a full diligence check at the point the investor becomes active (most applicable for migrated who have a zero portfolio balance and are considered inactive)<br>`EVENT_BASED_WITH_MONITORING`: Goji will place reliance on previous checks (only when agreed beforehand) but will only commence ongoing monitoring when  the investor becomes active (most applicable for migrated who have a zero portfolio balance and are considered inactive)<br>`FULL_RELIANCE`: As agreed beforehand where Goji performs no upfront diligence checks and the platform takes on responsibility here| required |
| migrationDetails.previousCheckDate| string | The optional date when the previous diligence checks were performed against the investor if Goji is placing reliance on the historical checks                                                                          | optional |
### Response
| Name                                | Type   | Description                                                                                                                                                                                                           |
| ----------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                            | string | The ID of the investor assigned by the platform.                                                                                                                                                                      |
| title                               | string | The title of the investor. Possible values are: <br>`MISS`<br>`MR`<br>`MRS`<br>`MS`<br>`DR`<br>                                                                                                                       |
| firstName                           | string | The first name of the investor.                                                                                                                                                                                       |
| lastName                            | string | The last name of the investor.                                                                                                                                                                                        |
| dateOfBirth                         | string | The date of birth of the investor.                                                                                                                                                                                    |
| address                             | ref    |                                                                                                                                                                                                                       |
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                                              |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                                              |
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                                            |
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                                         |
| address.region                      | string | The region of the address, e.g. county.                                                                                                                                                                                  |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                                         |
| address.country                     | string | The country of the investor's address as a 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked.                    |
| contactDetails                      | ref    |                                                                                                                                                                                                                       |
| contactDetails.telephoneNumber      | string | The telephone number.                                                                                                                                                                                                 |
| contactDetails.emailAddress         | string | The email address.                                                                                                                                                                                                    |
| nationalInsuranceNumber             | string | The national insurance number of the investor.                                                                                                                                                                        |
| employmentDetails                   | ref    |                                                                                                                                                                                                                       |
| employmentDetails.jobTitle          | string | The job title.                                                                                                                                                                                                        |
| employmentDetails.employmentStatus  | string | The employment status. Possible values are: <br>`EMPLOYED_FULL_TIME`<br>`EMPLOYED_PART_TIME`<br>`SELF_EMPLOYED`<br>`UNEMPLOYED`<br>`HOUSE_PERSON`<br>`EDUCATION`<br>`RETIRED`<br>`NOT_WORKING_ILLNESS_DISABILITY`<br> |
| entityType                          | string | Possible values are: <br>`INDIVIDUAL`<br>`CORPORATE`<br>                                                                                                                                                             |
| accountTypes                        | string | Investor's account types. Possible values are: <br>`GOJI_INVESTMENT`<br>`ISA`<br>                                                                                                                                      |
| corporateDetails                    | ref    | Only required for CORPORATE entityType.                                                                                                                                                                               |
| corporateDetails.companyName        | string | The company name.                                                                                                                                                                                                     |
| corporateDetails.companyType        | string | The company type.                                                                                                                                                                                                     |
| corporateDetails.registrationNumber | string | The company registration number.                                                                                                                                                                                      |
| investmentDeclarationType           | string | The investor type declared by the investor. Possible values are: <br>`RESTRICTED`<br>`HIGH_NET_WORTH`<br>`INVESTMENT_PROFESSIONAL`<br>`SOPHISTICATED`<br>                                                              |
