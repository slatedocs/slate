# ISA administration

## GET /terms

```http

GET /terms HTTP/1.1
Host: api-sandbox.goji.investments
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
Returns the Terms and Conditions to show to the investor.
#### Investor Lifecycle
This endpoint should be called to return the Terms and Conditions that the investor must agree to before they can open an IF ISA.
### Response
| Name               | Type   | Description                                      |
| ------------------ | ------ | ------------------------------------------------ |
| termsAndConditions | string | The terms and conditions                         |
| version            | string | The version of the terms and conditions eg 1.0.0 |
## POST /terms

```http

POST /terms HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "termsAndConditions" : "termsAndConditions"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "version" : "version",
  "termsAndConditions" : "termsAndConditions"
}
```
### Description
Creates or updates the Terms and Conditions to show to the investor.
#### Investor Lifecycle
This endpoint should be called to create or update the Terms and Conditions that the investor must agree to before they can open an IF ISA.
### Request
| Name               | Type   | Description                                | Required |
| ------------------ | ------ | ------------------------------------------ | -------- |
| termsAndConditions | string | The new Terms and Conditions HTML content. | required |
### Response
| Name               | Type   | Description                                      |
| ------------------ | ------ | ------------------------------------------------ |
| termsAndConditions | string | The terms and conditions                         |
| version            | string | The version of the terms and conditions eg 1.0.0 |
## POST /terms/agreement

```http

POST /terms/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "termsAndConditionsVersion" : "termsAndConditionsVersion",
  "dateTimeSigned" : "2000-01-23T04:56:07.000+00:00"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "token" : "token"
}
```
### Description
Issues a token that indicates that the investor has read and agreed to the specified version of the terms and conditions. The returned token can then be used as part of the create investor request or when the investor is signing a new version of the terms and conditions.
#### Investor Lifecycle
This endpoint should be called before creating the investor and when the investor signs a new version of the terms and conditions.
#### Possible Error Codes:
Please see [sign terms errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                      | Type   | Description                                                                               | Required |
| ------------------------- | ------ | ----------------------------------------------------------------------------------------- | -------- |
| termsAndConditionsVersion | string | The version of the Terms and Conditions the user has signed, as returned in GET response. | required |
| dateTimeSigned            | string | The date and time the conditions were signed                                              | required |
### Response
| Name  | Type   | Description                                                                             |
| ----- | ------ | --------------------------------------------------------------------------------------- |
| token | string | A token identifying the signing of the Ts & Cs. To be used on the POST /investors call. |
## GET /investors/{clientId}/terms/status

```http

GET /investors/{clientId}/terms/status HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "status" : "UNSIGNED"
}
```
### Description
Loads the investor's terms and conditions status which can be used to determine if they have signed the latest terms and conditions.
### Response
| Name   | Type   | Description |
| ------ | ------ | ----------- |
| status | string | The status. |
## PUT /investors/{clientId}/terms/agreement/token

```http

PUT /investors/{clientId}/terms/agreement/token HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "token" : "token"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
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
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Applicable when the terms and conditions are updated and the investor must accept the latest version. The token is obtained from the 'terms/agreement' request. Note that this should not be called on investor registration, this is only applicable if an existing investor is signing a new version of the terms and conditions.
### Request
| Name  | Type   | Description                                                                             | Required |
| ----- | ------ | --------------------------------------------------------------------------------------- | -------- |
| token | string | A token identifying the signing of the Ts & Cs. To be used on the POST /investors call. | optional |
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## GET /declaration

```http

GET /declaration HTTP/1.1
Host: api-sandbox.goji.investments
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
Returns the ISA Declaration to show to the investor.
#### Investor Lifecycle
This endpoint should be called to return the ISA Declaration that the investor must agree to before they can open an IF ISA.
### Response
| Name        | Type   | Description                                                     |
| ----------- | ------ | --------------------------------------------------------------- |
| declaration | string | The declaration                                                 |
| version     | string | A unique identifier of the version of this declaration eg. 0.11 |
## POST /declaration/agreement

```http

POST /declaration/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "declarationVersion" : 2.68,
  "dateTimeSigned" : "2000-01-23T04:56:07.000+00:00"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "token" : "token"
}
```
### Description
Records an investor agreeing to the ISA Declaration.
#### Investor Lifecycle
This endpoint should be called before creating the investor.
#### Possible Error Codes:
Please see [sign declaration errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name               | Type   | Description                                                                      | Required |
| ------------------ | ------ | -------------------------------------------------------------------------------- | -------- |
| declarationVersion | number | The version of the Declaration the user has signed, as returned in GET response. | required |
| dateTimeSigned     | string | The date and time the conditions were signed                                     | required |
### Response
| Name  | Type   | Description                                                                                 |
| ----- | ------ | ------------------------------------------------------------------------------------------- |
| token | string | A token identifying the signing of the Declaration. To be used on the POST /investors call. |
## POST /investors

```http

POST /investors HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "firstName" : "firstName",
  "lastName" : "lastName",
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
  "declarationToken" : "declarationToken",
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "termsAndConditionsToken" : "termsAndConditionsToken",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
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
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Creates a new investor and an accompanying ISA.
This creates an investor on the Goji platform and allocates it to the P2P platform that sent the request.
#### Investor Lifecycle
This endpoint should be called whenever an investor wishes to create an IF ISA.
#### Validation
In addition to checking the format of the supplied data, the following validation is applied:
* ensure the investor has not already created an IF ISA via the Goji platform.
* ensure the National Insurance number is valid.
* ensure the user complies with the ISA UK residency checks
#### Possible Error Codes
Please see [create investor errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                           | Type   | Description                                                                                                                                                                                        | Required |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       | required |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         | required |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        | optional |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          | required |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      | required |
| contactDetails                 | ref    |                                                                                                                                                                                                    | required |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      ||
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   ||
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          | required |
| address                        | ref    |                                                                                                                                                                                                    | required |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          ||
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 ||
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  ||
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                ||
| address.region                 | string | The region of the investor's address.                                                                                                                                                              ||
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           ||
| termsAndConditionsToken        | string | A token returned by POST /terms to identify that the user has signed the Ts & Cs.                                                                                                                  | required |
| declarationToken               | string | A token returned by POST /declaration to identify that the user has signed the Declaration.                                                                                                        | required |
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## POST /investors/validIsaApplication

```http

POST /investors/validIsaApplication HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
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
  "dateOfBirth" : "2000-01-23"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Validates the details of an investor to allow a P2PP to verify whether an investor is ellgibile for an ISA.
Checks performed:
* UK residency check against the address
* Age of investor
#### Possible Error Codes
Please see [validate investor errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                    | Type   | Description                                                                                                                                                                                        | Required |
| ----------------------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| dateOfBirth             | string | The date of birth of the investor in yyyy-MM-dd format                                                                                                                                             | required |
| address                 | ref    |                                                                                                                                                                                                    | required |
| address.lineOne         | string | The first line of the investor's address.                                                                                                                                                          ||
| address.lineTwo         | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 ||
| address.lineThree       | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  ||
| address.townCity        | string | The town of the investor's address.                                                                                                                                                                ||
| address.region          | string | The region of the investor's address.                                                                                                                                                              ||
| address.country         | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| address.postcode        | string | The Post Code of the investor's address.                                                                                                                                                           ||
| nationalInsuranceNumber | string | Optionally check to see if the National Insurance number has already been registered                                                                                                               | required |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investors/{investorId}

```http

GET /investors/{investorId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
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
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Retrieves the details of an investor.
#### Investor Lifecycle
This endpoint should be called when the non-financial details of an investor need to be accessed.
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## PUT /investors/{investorId}

```http

PUT /investors/{investorId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "firstName" : "firstName",
  "lastName" : "lastName",
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
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "firstName" : "firstName",
  "lastName" : "lastName",
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
  "nationalInsuranceNumber" : "nationalInsuranceNumber",
  "middleName" : "middleName",
  "dateOfBirth" : "2000-01-23",
  "contactDetails" : {
    "emailAddress" : "emailAddress",
    "telephoneNumber" : "telephoneNumber"
  }
}
```
### Description
Updates the details of an investor.
#### Investor Lifecycle
This endpoint should be called whenever the details of an investor change.
### Request
| Name                           | Type   | Description                                                                                                                                                                                        | Required |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         | required |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        | optional |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          | required |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      | required |
| contactDetails                 | ref    |                                                                                                                                                                                                    | required |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      ||
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   ||
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          | required |
| address                        | ref    |                                                                                                                                                                                                    | optional |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          ||
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 ||
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  ||
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                ||
| address.region                 | string | The region of the investor's address.                                                                                                                                                              ||
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. ||
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           ||
### Response
| Name                           | Type   | Description                                                                                                                                                                                        |
| ------------------------------ | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| clientId                       | string | The ID assigned to this investor by the client P2P platform.                                                                                                                                       |
| firstName                      | string | The investor's first name as it appears on their passport.                                                                                                                                         |
| middleName                     | string | The investor's middle name as it appears on their passport.                                                                                                                                        |
| lastName                       | string | The investor's last name as it appears on their passport.                                                                                                                                          |
| dateOfBirth                    | string | The investor's date of birth.                                                                                                                                                                      |
| contactDetails                 | ref    |                                                                                                                                                                                                    |
| contactDetails.emailAddress    | string | The investor's email address.                                                                                                                                                                      |
| contactDetails.telephoneNumber | string | The investor's telephone number.                                                                                                                                                                   |
| nationalInsuranceNumber        | string | The investor's National Insurance number.                                                                                                                                                          |
| address                        | ref    |                                                                                                                                                                                                    |
| address.lineOne                | string | The first line of the investor's address.                                                                                                                                                          |
| address.lineTwo                | string | The second line of the investor's address. NOT the town or region.                                                                                                                                 |
| address.lineThree              | string | The third line of the investor's address. NOT the town or region.                                                                                                                                  |
| address.townCity               | string | The town of the investor's address.                                                                                                                                                                |
| address.region                 | string | The region of the investor's address.                                                                                                                                                              |
| address.country                | string | The country of the investor's address in 3 character ISO code. Must be GBR to be valid for ISA subscriptions. If a different country code is supplied, current year subscriptions will be blocked. |
| address.postcode               | string | The Post Code of the investor's address.                                                                                                                                                           |
## GET /investors/{investorId}/isa

```http

GET /investors/{investorId}/isa HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



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
Returns details of the investor's ISA.
#### Investor Lifecycle
This endpoint should be called whenever up to date details of the investor's ISA are required eg remaining subscription amount etc.
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## GET /investors/{investorId}/isa/summary

```http

GET /investors/{investorId}/isa/summary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



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
Returns summary details of the investor's ISA.
#### Investor Lifecycle
This endpoint should be called whenever summary details of the investor's ISA are required eg remaining subscription amount etc.
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
## GET /transferIn/investors/{clientId}/open

```http

GET /transferIn/investors/{clientId}/open HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Used to find an overview of all transfer in workflows for a particular investor. It should be understood that the existence of the TransferDate determines whether the transfer history form has been submitted
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investors/{clientId}/isa/subscriptionStatus

```http

GET /investors/{clientId}/isa/subscriptionStatus HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "subscriptionStatus" : "VALID"
}
```
### Description
Used to retrieve the subscription status of an investor's ISA. Can be used for tax year breaks.
### Response
| Name               | Type   | Description                                                            |
| ------------------ | ------ | ---------------------------------------------------------------------- |
| subscriptionStatus | string | Indicates if anything is preventing further subscriptions to this ISA. |
## PUT /investors/{investorId}/isa/status

```http

PUT /investors/{investorId}/isa/status HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "isaSubscriptionStatus" : "VALID"
}

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
Updates the status of an investor's ISA.  This can aid testing by placing an ISA into an invalid status.
### Request
| Name                  | Type   | Description                                             | Required |
| --------------------- | ------ | ------------------------------------------------------- | -------- |
| dateTime              | string | The date time the residual income payment was received. | required |
| isaSubscriptionStatus | string | The status to change this ISA to.                       | required |
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
## PUT /investors/{clientId}/transferIn/{transferInId}/transferHistory

```http

PUT /investors/{clientId}/transferIn/{transferInId}/transferHistory HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "adjustedAmounts" : {
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
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Updates the transfer history for an investor's Transfer In
### Request
| Name                                   | Type   | Description                                                            | Required |
| -------------------------------------- | ------ | ---------------------------------------------------------------------- | -------- |
| transferAmount                         | ref    | The total transfer amount                                              | required |
| transferAmount.amount                  | number | The amount                                                             ||
| transferAmount.currency                | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| currentYearSubscriptionAmount          | ref    | The total amount subscribed within the current tax year                | required |
| currentYearSubscriptionAmount.amount   | number | The amount                                                             ||
| currentYearSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| transferInDate                         | string | The date specified by the ISA manager for the transfer to be completed | required |
| firstSubscriptionDateInCurrentYear     | string | The date of the first ISA subscription within the current tax year     | required |
### Response
| Name                                     | Type   | Description                                                                      |
| ---------------------------------------- | ------ | -------------------------------------------------------------------------------- |
| transferAmount                           | ref    | The total transfer amount                                                        |
| transferAmount.amount                    | number | The amount                                                                       |
| transferAmount.currency                  | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| currentYearSubscriptionAmount            | ref    | The total amount subscribed within the current tax year                          |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| transferInDate                           | string | The date specified by the ISA manager for the transfer to be completed           |
| firstSubscriptionDateInCurrentYear       | string | The date of the first ISA subscription within the current tax year               |
| adjustedAmounts                          | ref    | The calculated amounts to be used to determine how to allocate the cash received |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| previousYearsSubscriptionAmount.amount   | number | The amount                                                                       |
| previousYearsSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| repairAmount.amount                      | number | The amount                                                                       |
| repairAmount.currency                    | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| totalIsaTransferAmount.amount            | number | The amount                                                                       |
| totalIsaTransferAmount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
## POST /investors/{clientId}/transferIn/{transferInId}/transferHistory

```http

POST /investors/{clientId}/transferIn/{transferInId}/transferHistory HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "transferInDate" : "2000-01-23",
  "firstSubscriptionDateInCurrentYear" : "2000-01-23",
  "adjustedAmounts" : {
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
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "currentYearSubscriptionAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}
```
### Description
Creates the transfer history for an investor's Transfer In
### Request
| Name                                   | Type   | Description                                                            | Required |
| -------------------------------------- | ------ | ---------------------------------------------------------------------- | -------- |
| transferAmount                         | ref    | The total transfer amount                                              | required |
| transferAmount.amount                  | number | The amount                                                             ||
| transferAmount.currency                | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| currentYearSubscriptionAmount          | ref    | The total amount subscribed within the current tax year                | required |
| currentYearSubscriptionAmount.amount   | number | The amount                                                             ||
| currentYearSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                ||
| transferInDate                         | string | The date specified by the ISA manager for the transfer to be completed | required |
| firstSubscriptionDateInCurrentYear     | string | The date of the first ISA subscription within the current tax year     | required |
### Response
| Name                                     | Type   | Description                                                                      |
| ---------------------------------------- | ------ | -------------------------------------------------------------------------------- |
| transferAmount                           | ref    | The total transfer amount                                                        |
| transferAmount.amount                    | number | The amount                                                                       |
| transferAmount.currency                  | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| currentYearSubscriptionAmount            | ref    | The total amount subscribed within the current tax year                          |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| transferInDate                           | string | The date specified by the ISA manager for the transfer to be completed           |
| firstSubscriptionDateInCurrentYear       | string | The date of the first ISA subscription within the current tax year               |
| adjustedAmounts                          | ref    | The calculated amounts to be used to determine how to allocate the cash received |
| currentYearSubscriptionAmount.amount     | number | The amount                                                                       |
| currentYearSubscriptionAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| previousYearsSubscriptionAmount.amount   | number | The amount                                                                       |
| previousYearsSubscriptionAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| repairAmount.amount                      | number | The amount                                                                       |
| repairAmount.currency                    | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
| totalIsaTransferAmount.amount            | number | The amount                                                                       |
| totalIsaTransferAmount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                          |
## POST /investors/{investorId}/declaration/agreement

```http

POST /investors/{investorId}/declaration/agreement HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

""

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
Used to record an investor agreeing to the ISA declaration after the ISA has been opened. Can be used for tax year breaks.
### Request
| Name | Type | Description | Required || ---- | ---- | ----------- | -------- |

### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## GET /audit/investors/{investorId}

```http

GET /audit/investors/{investorId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Returns an audit record of HTTP requests relating to the investor.
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{investorId}/investment

```http

POST /investors/{investorId}/investment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "clientInvestmentId" : "clientInvestmentId",
  "expectedInterest" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "termOfInvestment" : 7.54,
  "originalAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
  "investmentType" : "LOAN"
}

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
Adds an investment to the investor's ISA.
#### Investor Lifecycle
This endpoint should be called whenever monies are drawn down from the investor's account to fund an investment. This creates the investment on the Goji platform and decreases the cash balance of the ISA.
#### Validation
The ISA must have a cash balance equal or greater to the amount of the investment.
#### Possible Error Codes
Please see [create investment errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                      | Type   | Description                                                       | Required |
| ------------------------- | ------ | ----------------------------------------------------------------- | -------- |
| clientInvestmentId        | string | The ID of the loan defined by the P2P platform                    | required |
| investmentType            | string | The type of the investment. Currently only loans are supported.   | required |
| originalAmount            | ref    | The original capital amount of the investment.                    | required |
| originalAmount.amount     | number | The amount                                                        ||
| originalAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'           ||
| dateOfInvestment          | string | The date the investment started                                   | required |
| termOfInvestment          | number | The term of the investment in months                              | required |
| expectedInterest          | ref    | The expected interest to receive over the life of the investment. | optional |
| expectedInterest.amount   | number | The amount                                                        ||
| expectedInterest.currency | string | The currency in ISO 4217 three character codes eg 'GBP'           ||
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## DELETE /investors/{investorId}/investment

```http

DELETE /investors/{investorId}/investment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "fromDateTime" : "2000-01-23T04:56:07.000+00:00",
  "toDateTime" : "2000-01-23T04:56:07.000+00:00"
}

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
Deletes all, or a matched set of, investments belonging to the ISA.

Currently if the investment has been previously modified this won't work and this test endpoint shouldn't be used.

**For testing use only.**
### Request
| Name         | Type   | Description                                                                                                                           | Required |
| ------------ | ------ | ------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| fromDateTime | string | Investments created on or after this date are considered for deletion. If no date is supplied, no earliest date filtering is applied. | optional |
| toDateTime   | string | Investments created on or before this date are considered for deletion. If no date is supplied, no latest date filtering is applied.  | optional |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## PUT /investors/{investorId}/investment/{investmentId}

```http

PUT /investors/{investorId}/investment/{investmentId} HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
  "term" : 1.12
}

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
Updates an investment in the investor's ISA. This call is normally not required. Please discuss with Goji before using it.
#### Investor Lifecycle
This endpoint should be called whenever the captial amount of an investment needs to be updated. It acts in an upsert manner.
#### Validation
The ISA must have a cash balance equal or greater to the amount of the investment.
#### Possible Error Codes
Please see [create investment errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name             | Type   | Description                                                  | Required |
| ---------------- | ------ | ------------------------------------------------------------ | -------- |
| amount           | ref    | The amount to increase the capital amount of the investment. | required |
| amount.amount    | number | The amount                                                   ||
| amount.currency  | string | The currency in ISO 4217 three character codes eg 'GBP'      ||
| dateOfInvestment | string | The date the investment started                              | required |
| term             | number | The term of the investment in months                         | required |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## POST /investors/{investorId}/investment/{investmentId}/repayment

```http

POST /investors/{investorId}/investment/{investmentId}/repayment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTimeOfRepayment" : "2000-01-23T04:56:07.000+00:00",
  "interestAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientRepaymentId" : "clientRepaymentId",
  "capitalAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Records a repayment against a specific investment.
#### Investor Lifecycle
This endpoint should be called whenever a repayment is received from the borrower against an investor's investment. This repayment increases the cash balance of the ISA as it is not automatically reinvested by the P2P Platform.
#### Possible Error Codes
Please see [create repayment errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                    | Type   | Description                                                 | Required |
| ----------------------- | ------ | ----------------------------------------------------------- | -------- |
| clientRepaymentId       | string | The P2P platform assigned ID for the repayment transaction. | required |
| capitalAmount           | ref    | The capital amount being repaid                             | required |
| capitalAmount.amount    | number | The amount                                                  ||
| capitalAmount.currency  | string | The currency in ISO 4217 three character codes eg 'GBP'     ||
| interestAmount          | ref    | The interest amount being repaid                            | required |
| interestAmount.amount   | number | The amount                                                  ||
| interestAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'     ||
| dateTimeOfRepayment     | string | The date and time of the repayment                          | required |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{investorId}/investment/{investmentId}/reinvestment

```http

POST /investors/{investorId}/investment/{investmentId}/reinvestment HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "clientReinvestmentId" : "clientReinvestmentId",
  "interestAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "investments" : [ {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 7.54,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "investmentType" : "LOAN"
  }, {
    "clientInvestmentId" : "clientInvestmentId",
    "expectedInterest" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "termOfInvestment" : 7.54,
    "originalAmount" : {
      "amount" : 123.45,
      "currency" : "currency"
    },
    "dateOfInvestment" : "2000-01-23T04:56:07.000+00:00",
    "investmentType" : "LOAN"
  } ],
  "capitalAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateTimeOfReinvestment" : "2000-01-23T04:56:07.000+00:00"
}

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
Records a reinvestment against a specific investment.
#### Investor Lifecycle
This endpoint should be called whenever a repayment is received from the borrower against an investor's investment. This amount is automatically reinvested by the P2P Platform and so does not increase the cash balance of the ISA, however the ISA balance is increased by the interest component of the reinvestment.
This endpoint creates the new investment associated with the reinvestment.
#### Possible Error Codes
Please see [create reinvestment errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                             | Type   | Description                                                       | Required |
| -------------------------------- | ------ | ----------------------------------------------------------------- | -------- |
| clientReinvestmentId             | string | The P2P platform assigned ID for the reinvestment transaction.    | required |
| capitalAmount                    | ref    | The capital amount being repaid that is being reinvested          | required |
| capitalAmount.amount             | number | The amount                                                        ||
| capitalAmount.currency           | string | The currency in ISO 4217 three character codes eg 'GBP'           ||
| interestAmount                   | ref    | The interest amount being repaid that is being reinvested         | required |
| interestAmount.amount            | number | The amount                                                        ||
| interestAmount.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'           ||
| dateTimeOfReinvestment           | string | The date and time of the reinvestment                             | required |
| investments                      | array  | The new investments to create from this reinvestment              | required |
| investments[].clientInvestmentId | string | The ID of the loan defined by the P2P platform                    | required |
| investments[].investmentType     | string | The type of the investment. Currently only loans are supported.   | required |
| investments[].originalAmount     | ref    | The original capital amount of the investment.                    | required |
| investments[].dateOfInvestment   | string | The date the investment started                                   | required |
| investments[].termOfInvestment   | number | The term of the investment in months                              | required |
| investments[].expectedInterest   | ref    | The expected interest to receive over the life of the investment. | optional |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## POST /investors/{investorId}/investment/{investmentId}/sale

```http

POST /investors/{investorId}/investment/{investmentId}/sale HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "saleAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "repaymentId" : "repaymentId",
  "dateTimeOfSale" : "2000-01-23T04:56:07.000+00:00"
}

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
Records the sale of a specific investment.
#### Investor Lifecycle
This endpoint should be called if an investment should be marked as sold. The amount of the sale may be more or less than the remaining capital amount on the investment.
### Request
| Name                | Type   | Description                                             | Required |
| ------------------- | ------ | ------------------------------------------------------- | -------- |
| repaymentId         | string | A unique reference for the transaction                  | required |
| saleAmount          | ref    | The total amount the investment is being sold for.      | required |
| saleAmount.amount   | number | The amount                                              ||
| saleAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTimeOfSale      | string |                                                         | required |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## POST /investors/{investorId}/investment/{investmentId}/writeOff

```http

POST /investors/{investorId}/investment/{investmentId}/writeOff HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "writeOffAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "dateTimeOfWriteOff" : "2000-01-23T04:56:07.000+00:00"
}

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
Records a write-off amount against a specific investment.
#### Investor Lifecycle
This endpoint should be called if an investment is in default and some or all of the remaining capital amount should be written off.
### Request
| Name                    | Type   | Description                                             | Required |
| ----------------------- | ------ | ------------------------------------------------------- | -------- |
| writeOffAmount          | ref    |                                                         | required |
| writeOffAmount.amount   | number | The amount                                              ||
| writeOffAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTimeOfWriteOff      | string |                                                         | required |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## POST /investors/{investorId}/cash

```http

POST /investors/{investorId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId",
  "type" : "CUSTOMER_DEPOSIT",
  "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
}

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
Records a cash transaction into the ISA.
#### Investor Lifecycle
This endpoint should be called whenever the user deposits or withdraws cash from the ISA.
#### Validation
* There must be a cash balance greater than or equal to any amount being withdrawn (debited).
* The amount deposited must not exceed the annual subscription amount
#### Possible Error Codes
Please see [cash transaction errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                  | Type   | Description                                             | Required |
| --------------------- | ------ | ------------------------------------------------------- | -------- |
| clientTransactionId   | string | The ID of the transaction assigned by the P2P platform  | required |
| amount                | ref    | The amount of the cash transaction                      | required |
| amount.amount         | number | The amount                                              ||
| amount.currency       | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTimeOfTransaction | string | The date and time of the transaction                    | required |
| type                  | string | Indicates the type of the cash transaction.             | required |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## DELETE /investors/{investorId}/cash

```http

DELETE /investors/{investorId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "typesToInclude" : [ { }, { } ],
  "fromDateTime" : "2000-01-23T04:56:07.000+00:00",
  "typesToExclude" : [ null, null ],
  "toDateTime" : "2000-01-23T04:56:07.000+00:00"
}

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
Deletes all, or a matched set of, cash transactions belonging to the ISA.

**For testing use only.**
### Request
| Name           | Type   | Description                                                                                                                                | Required |
| -------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| fromDateTime   | string | Transactions created on or after this date are considered for deletion. If no date is supplied, no earliest date filtering is applied.     | optional |
| toDateTime     | string | Transactions created on or before this date are considered for deletion. If no date is supplied, no latest date filtering is applied.      | optional |
| typesToInclude | array  | Types for transactions that should be considered for deletion. Defaults to all types if no 'typesToInclude' attribute or null is supplied. | optional |
| typesToExclude | array  | Types for transactions that should be excluded from the deletion. Defaults to none if no 'typesToExclude' attribute or null is supplied.   | optional |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## POST /investors/{investorId}/cashCorrection

```http

POST /investors/{investorId}/cashCorrection HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId",
  "type" : "INTEREST_REPAYMENT_CORRECTION",
  "dateTimeOfTransaction" : "2000-01-23T04:56:07.000+00:00"
}

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
Records a cash correction transaction into the ISA.
#### Investor Lifecycle
This endpoint should be called whenever the Platform needs to manually correct a cash transaction amount. Currently only interest repayment corrections are supported. This call will not be needed if the Originator will not need to alter interest amounts.
### Request
| Name                  | Type   | Description                                             | Required |
| --------------------- | ------ | ------------------------------------------------------- | -------- |
| clientTransactionId   | string | The ID of the transaction assigned by the P2P platform  | required |
| amount                | ref    | The amount of the corrective cash transaction           | required |
| amount.amount         | number | The amount                                              ||
| amount.currency       | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTimeOfTransaction | string | The date and time of the transaction                    | required |
| type                  | string | Indicates the type of the corrective cash transaction.  | required |
### Response
| Name                                               | Type   | Description                                                                                                   |
| -------------------------------------------------- | ------ | ------------------------------------------------------------------------------------------------------------- |
| totalIsaBalance                                    | ref    | The total current balance in the ISA, inclusive of all years.                                                 |
| totalIsaBalance.amount                             | number | The amount                                                                                                    |
| totalIsaBalance.currency                           | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| remainingSubscriptionAmount                        | ref    | The amount remaining that can be invested in the ISA in the current tax year.                                 |
| remainingSubscriptionAmount.amount                 | number | The amount                                                                                                    |
| remainingSubscriptionAmount.currency               | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalCashBalance                                   | ref    | The total amount of cash in the ISA that is not currently invested.                                           |
| totalCashBalance.amount                            | number | The amount                                                                                                    |
| totalCashBalance.currency                          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| dateCreated                                        | string | Date the ISA was created                                                                                      |
| coolingOffPeriodEnds                               | string | Date the cooling off period ends                                                                              |
| investments                                        | array  | The list of investments that make up the ISA                                                                  |
| investments[].id                                   | string | The ID of the loan defined by Goji                                                                            |
| investments[].clientInvestmentId                   | string | The ID of the loan defined by the P2P platform                                                                |
| investments[].investmentType                       | string | The type of the investment. Currently only loans are supported.                                               |
| investments[].originalAmount                       | ref    | The original capital amount of the investment.                                                                |
| investments[].expectedInterest                     | ref    | The expected interest to receive over the life of the investment.                                             |
| investments[].dateTimeOfInvestment                 | string | The date and time the investment started                                                                      |
| investments[].termOfInvestment                     | number | The term of the investment in months                                                                          |
| investments[].repayments                           | array  | Repayments that have been made against the investment by the borrower that were not reinvested automatically. |
| investments[].reinvestments                        | array  | Repayments that have been made against the instruments by the borrower that were reinvested automatically.    |
| cashTransactions                                   | array  | Cash transactions on the ISA                                                                                  |
| cashTransactions[].clientTransactionId             | string | The ID of the transaction assigned by the P2P platform                                                        |
| cashTransactions[].amount                          | ref    | The amount of the cash transaction                                                                            |
| cashTransactions[].dateTimeOfTransaction           | string | The date and time of the transaction                                                                          |
| cashTransactions[].type                            | ref    | Indicates the type of the cash transaction.                                                                   |
| totalInterestReceived                              | ref    |                                                                                                               |
| totalInterestReceived.amount                       | number | The amount                                                                                                    |
| totalInterestReceived.currency                     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInterestReceivedThisTaxYear                   | ref    |                                                                                                               |
| totalInterestReceivedThisTaxYear.amount            | number | The amount                                                                                                    |
| totalInterestReceivedThisTaxYear.currency          | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| totalInvestedBalance                               | ref    |                                                                                                               |
| totalInvestedBalance.amount                        | number | The amount                                                                                                    |
| totalInvestedBalance.currency                      | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
| subscriptionStatus                                 | string | Indicates if anything is preventing further subscriptions to this ISA.                                        |
| remainingAdditionalPermittedSubscriptions          | ref    | The remaining amount that can be subscribed as an Additional Permitted Subscription.                          |
| remainingAdditionalPermittedSubscriptions.amount   | number | The amount                                                                                                    |
| remainingAdditionalPermittedSubscriptions.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                       |
## POST /investors/{investorId}/transferIn/{transferInId}/cash

```http

POST /investors/{investorId}/transferIn/{transferInId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "subscribedAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
This endpoint should be called by the P2PP when they have received the deposit for a transfer in and have confirmed the split between current/prior year subscriptions. The transfer amount is the value of the total amount received from the previus ISA manager. Either the repair amount or the subscribed amount needs to be specified. The subscribed amount is the portion allocated to the ISA. The repair amount is the amount that had to be credited to the non-ISA account. Please see the integration guide for more details.
#### Possible Error Codes
Please see [transfer cash errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                      | Type   | Description                                                                                                                                                                          | Required |
| ------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| clientTransactionId       | string | The transaction ID for the transfer cash                                                                                                                                             | required |
| transferAmount            | ref    | The total transfer amount                                                                                                                                                            | optional |
| transferAmount.amount     | number | The amount                                                                                                                                                                           ||
| transferAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| repairAmount              | ref    | The amount that was transferred that had to be immediately repaired and transferred to their standard investment account. Specify either the repair amount or the subscribed amount. | optional |
| repairAmount.amount       | number | The amount                                                                                                                                                                           ||
| repairAmount.currency     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| subscribedAmount          | ref    | The amount that was transferred and was credited to the ISA account. Specify either the repair amount or the subscribed amount.                                                      | optional |
| subscribedAmount.amount   | number | The amount                                                                                                                                                                           ||
| subscribedAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{investorId}/transferIn/{transferInId}/residualIncome

```http

POST /investors/{investorId}/transferIn/{transferInId}/residualIncome HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "amount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
This endpoint should be called by the P2PP when they have received a residual income payment for a transfer in. Please see the integration guide for more details.
#### Possible Error Codes
Please see [transfer cash errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                | Type   | Description                                             | Required |
| ------------------- | ------ | ------------------------------------------------------- | -------- |
| clientTransactionId | string | A unique ID for the transaction                         | optional |
| amount              | ref    | The amount of the residual income payment               | optional |
| amount.amount       | number | The amount                                              ||
| amount.currency     | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTime            | string | The date time the residual income payment was received. | optional |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{investorId}/transferIn/{transferInId}/cash/validation

```http

POST /investors/{investorId}/transferIn/{transferInId}/cash/validation HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "subscribedAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "repairAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "clientTransactionId" : "clientTransactionId"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
This endpoint should be called by the P2PP when they want to validate the transfer in cash transaction before processing it.
#### Possible Error Codes
Please see [transfer cash errors](/isa-administration-api/guides/Error%20Codes)
### Request
| Name                      | Type   | Description                                                                                                                                                                          | Required |
| ------------------------- | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| clientTransactionId       | string | The transaction ID for the transfer cash                                                                                                                                             | required |
| transferAmount            | ref    | The total transfer amount                                                                                                                                                            | optional |
| transferAmount.amount     | number | The amount                                                                                                                                                                           ||
| transferAmount.currency   | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| repairAmount              | ref    | The amount that was transferred that had to be immediately repaired and transferred to their standard investment account. Specify either the repair amount or the subscribed amount. | optional |
| repairAmount.amount       | number | The amount                                                                                                                                                                           ||
| repairAmount.currency     | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
| subscribedAmount          | ref    | The amount that was transferred and was credited to the ISA account. Specify either the repair amount or the subscribed amount.                                                      | optional |
| subscribedAmount.amount   | number | The amount                                                                                                                                                                           ||
| subscribedAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP'                                                                                                                              ||
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investors/{clientId}/transferInSummary

```http

GET /investors/{clientId}/transferInSummary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Returns the in progress transfers in for the specified investor
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investors/{clientId}/transferIn/{transferInId}/summary

```http

GET /investors/{clientId}/transferIn/{transferInId}/summary HTTP/1.1
Host: api-sandbox.goji.investments
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
Returns the in progress transfers in for the specified investor
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
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "totalValue" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "numberCheques" : 7,
  "transfersIn" : [ {
    "clientId" : "clientId",
    "id" : "id"
  }, {
    "clientId" : "clientId",
    "id" : "id"
  } ]
}
```
### Description
Returns the transfer in cheque deposits for a given date.
### Response
| Name                   | Type    | Description                                                           |
| ---------------------- | ------- | --------------------------------------------------------------------- |
| numberCheques          | integer | The number of cheques included in the batch                           |
| totalValue             | ref     | The total value of the cheques deposited                              |
| totalValue.amount      | number  | The amount                                                            |
| totalValue.currency    | string  | The currency in ISO 4217 three character codes eg 'GBP'               |
| transfersIn            | array   |                                                                       |
| transfersIn[].id       | string  | The ID of the transfer in                                             |
| transfersIn[].clientId | string  | The ID assigned by the platform of the investor for this transfer in. |
## GET /transferIn/open/summary

```http

GET /transferIn/open/summary HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Returns аll opened transfers in.
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /isaReconciliation

```http

GET /isaReconciliation HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Returns a reconciliation summary for all investors
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investorReconciliation

```http

GET /investorReconciliation HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Returns a reconciliation summary of investor name and address data
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investors/{investorId}/transferIn/uiData

```http

GET /investors/{investorId}/transferIn/uiData HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "apiUrl" : "apiUrl",
  "hostedUrl" : "hostedUrl",
  "styleSrc" : "styleSrc",
  "investorId" : "investorId",
  "scriptSrc" : "scriptSrc",
  "token" : "token"
}
```
### Description
Initialisation data for the Transfer In widget
### Response
| Name       | Type   | Description |
| ---------- | ------ | ----------- |
| apiUrl     | string |             |
| hostedUrl  | string |             |
| styleSrc   | string |             |
| scriptSrc  | string |             |
| investorId | string |             |
| token      | string |             |
## GET /investors/{investorId}/transferOut

```http

GET /investors/{investorId}/transferOut HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Lists transfers out for the investor.
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /transfersOut

```http

GET /transfersOut HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Lists all transfers out for all investors.
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{investorId}/transferOut/{transferOutId}/cash

```http

POST /investors/{investorId}/transferOut/{transferOutId}/cash HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateOfTransfer" : "2000-01-23",
  "transferAmount" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Records the funds transfer for a Transfer Out.
### Request
| Name                    | Type   | Description                                             | Required |
| ----------------------- | ------ | ------------------------------------------------------- | -------- |
| dateOfTransfer          | string | The date the funds were transferred.                    | required |
| transferAmount          | ref    | The amount transferred.                                 | required |
| transferAmount.amount   | number | The amount                                              ||
| transferAmount.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## POST /investors/{investorId}/transferOut/{transferOutId}/fee

```http

POST /investors/{investorId}/transferOut/{transferOutId}/fee HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "transferOutFee" : {
    "amount" : 123.45,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "dateTime" : "2000-01-23T04:56:07.000+00:00",
  "transferOutFee" : {
    "amount" : 123.45,
    "currency" : "currency"
  },
  "transferOutId" : "transferOutId"
}
```
### Description
Records that a fee related to a transfer out has been collected from an Investor's account.
### Request
| Name                    | Type   | Description                                             | Required |
| ----------------------- | ------ | ------------------------------------------------------- | -------- |
| transferOutFee          | ref    | The amount of the fee.                                  | optional |
| transferOutFee.amount   | number | The amount                                              ||
| transferOutFee.currency | string | The currency in ISO 4217 three character codes eg 'GBP' ||
| dateTime                | string | The date time the fee was collected.                    | optional |
### Response
| Name                    | Type   | Description                                                     |
| ----------------------- | ------ | --------------------------------------------------------------- |
| transferOutId           | string | The ID of the transfer out.                                     |
| transferOutFee          | ref    | The amount of the fee.                                          |
| transferOutFee.amount   | number | The amount                                                      |
| transferOutFee.currency | string | The currency in ISO 4217 three character codes eg 'GBP'         |
| dateTime                | string | The date time the fee was collected. Null if not collected yet. |

