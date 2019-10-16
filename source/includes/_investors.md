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

## Opening an Innovative Finance ISA

An Investor can open an ISA either as part of their initial registration, or as a second step later on.

To open an ISA, the investor has to provide their National Insurance Number and agree to an ISA declaration.
Once this is completed, Goji will validate the data and check that the investor is eligible for an ISA.
If these checks are successful, the ISA is opened immediately and isavailable to deposit funds into.

![](/images/investors/images/add-isa.png "")

## Onboarding investors

### Registration

To register an investor, `POST /investors` is called.

The investor must have previously agreed to the terms and conditions which can be accessed by calling `GET /platformApi/terms`.

An ISA account can be opened at this stage by providing the National Insurance Number and ensuring they have agreed to the ISA declaration which can be accessed by calling `GET /platformApi/isaDeclaration`.

Alternatively, the ISA account can be added later by calling `POST /investors/{clientId}/accounts/ISA`.

### KYC process

Once the investor has been registered, the KYC process will be initiated asynchronously.

You can verify the KYC details by calling `GET /investors/{clientId}/kyc`. Alternatively, you can register a webhook and a call will be made to your system when the KYC status changes.

When there are documents required, identity documents must be uploaded. Supported formats are pdf, png and jpeg. The documents are uploaded as `Base64` encoded strings (maximum size 10MB) using `POST /investors/{clientId}/kyc/documents`.

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

   _Please note: The inclusion of the script import must be made after inclusion of the HTML in the previous step._

   e.g `<script src="{{uiData.scriptSrc}}"></script>`

   Optionally do the same for the CSS file if you wish to have a basic layout.

   e.g `<link rel="stylesheet" href="{{uiData.styleSrc}}">`

3). The component will then render when the document's body has fully loaded.

## Migrating Investors
If you are upgrading from using the Goji ISA Administration API to the Goji Platform API, then you need to
migrate existing investors.

This can be performed by onboarding an investor in the usual way and specifying the `migrationDetails`.

If `migrationDetails` is specified, then the system looks for an investor with the `existingClientId` and upgrades the investor. This involves:

* Generating a new client ID
* Performing a KYC check
* Generating an account number for depositing funds

Any existing ISA data is preserved.

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
| address.lineOne                     | string | Line one of the address.                                                                                                                                                                           | required |
| address.lineTwo                     | string | Line two of the address.                                                                                                                                                                           ||
| address.lineThree                   | string | Line three of the address.                                                                                                                                                                         ||
| address.townCity                    | string | The town/city of the address.                                                                                                                                                                      | required |
| address.region                      | string | The region of the address eg county.                                                                                                                                                               | required |
| address.postcode                    | string | The post code of the address.                                                                                                                                                                      | required |
| address.country                     | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. | required |
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
| status | string | The KYC status of the investor. |
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
| status | string | The KYB status of a corporate investor.|
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

{
  "overallStatus":"overallStatus",
  "documentsRequired":["documentsRequired"],
  "documentsPendingApproval":["documentsPendingApproval"],
  "documentsApproved":["documentsApproved"],
  "lastFailure": {
    "failureDate":"failureDate",
    "rejectedDocuments": [{
      "type":"type",
      "reason":"reason",
      "notes":"notes"
    }]
  },
  "requirements":[{
    "requirementType":"requirementType",
    "status":"status",
    "checkType":"checkType",
    "workflowId":"workflowId"
  }]
}

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
| Name | Type | Description |
| ---- | ---- | ----------- |
| overallStatus | string | The overall status of the KYC status of the investor |
| documentsRequired | array | The documents that are required |
| documentsPendingApproval | array | The documents that have been uploaded and are pending approval. |
| documentsApproved | array | The documents that have been approved. |
| lastFailure | ref | The most recent failed document upload |
| lastFailure.failureDate | string | The date of the failed upload |
| lastFailure.rejectedDocuments | array | List of rejected documents |
| lastFailure.rejectedDocuments[].type | string | The type of document that was rejected |
| lastFailure.rejectedDocuments[].reason | string | The reason for the rejection |
| lastFailure.rejectedDocuments[].notes | string | Accompanying notes to the rejection reason |
| requirements | array | The documents that are required |
| requirements[].requirementType | string | The type of the requirement |
| requirements[].status | string | The status of this requirement |
| requirements[].checkType | string | The type of the check |
| requirements[].workflowId | string | The ID of the attached workflow |

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

