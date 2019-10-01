# Bond management

## GET /bondManagement/current

```http

GET /bondManagement/current HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "bonds" : [ {
    "totalAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "totalInterestAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "maturity" : {
      "date" : "2000-01-23",
      "months" : 2,
      "maturityType" : "FIXED"
    },
    "productTermId" : "productTermId",
    "nextRepaymentDate" : "2000-01-23",
    "initialInvestmentAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "id" : "id",
    "startDate" : "2000-01-23",
    "status" : "QUEUED"
  }, {
    "totalAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "totalInterestAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "maturity" : {
      "date" : "2000-01-23",
      "months" : 2,
      "maturityType" : "FIXED"
    },
    "productTermId" : "productTermId",
    "nextRepaymentDate" : "2000-01-23",
    "initialInvestmentAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "id" : "id",
    "startDate" : "2000-01-23",
    "status" : "QUEUED"
  } ]
}
```
### Description
Returns details of the current bonds
### Response
| Name                            | Type   | Description                                                                                                     |
| ------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------- |
| bonds                           | array  |                                                                                                                 |
| bonds[].id                      | string | The ID of the Bond.                                                                                             |
| bonds[].productTermId           | string | The product term id of the bond.                                                                                |
| bonds[].status                  | string | The status of the bond.                                                                                         |
| bonds[].startDate               | string | The start date of the bond.                                                                                     |
| bonds[].maturity                | ref    | The maturity of the bond.                                                                                       |
| bonds[].totalAmount             | ref    | The total current invested amount. This can increase up to the start date of the bond.                          |
| bonds[].initialInvestmentAmount | ref    | The initial investment amount.                                                                                  |
| bonds[].totalInterestAmount     | ref    | The total amount of interest accrued. This also includes any interest that has been accrued but not yet repaid. |
| bonds[].nextRepaymentDate       | string | The date of the next repayment event.                                                                           |
## POST /bondManagement/product

```http

POST /bondManagement/product HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "terms" : [ {
    "interestRate" : 1.12,
    "investmentDocuments" : [ {
      "investmentDocumentType" : "INVESTMENT_BROCHURE",
      "fileName" : "fileName",
      "fileUrl" : "fileUrl"
    }, {
      "investmentDocumentType" : "INVESTMENT_BROCHURE",
      "fileName" : "fileName",
      "fileUrl" : "fileUrl"
    } ],
    "fixedLiveDate" : "2000-01-23",
    "maximumFundingLimit" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "interestType" : "FIXED",
    "term" : 7,
    "fixedMaturityDate" : "2000-01-23",
    "minimumInvestment" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "repaymentProfiles" : [ "STANDARD_ANNUALLY_REINVESTMENT", "STANDARD_ANNUALLY_REINVESTMENT" ]
  }, {
    "interestRate" : 1.12,
    "investmentDocuments" : [ {
      "investmentDocumentType" : "INVESTMENT_BROCHURE",
      "fileName" : "fileName",
      "fileUrl" : "fileUrl"
    }, {
      "investmentDocumentType" : "INVESTMENT_BROCHURE",
      "fileName" : "fileName",
      "fileUrl" : "fileUrl"
    } ],
    "fixedLiveDate" : "2000-01-23",
    "maximumFundingLimit" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "interestType" : "FIXED",
    "term" : 7,
    "fixedMaturityDate" : "2000-01-23",
    "minimumInvestment" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "repaymentProfiles" : [ "STANDARD_ANNUALLY_REINVESTMENT", "STANDARD_ANNUALLY_REINVESTMENT" ]
  } ],
  "name" : "name"
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "id" : "id"
}
```
### Description
Creates an investment product.
### Request
| Name                        | Type    | Description                                                                                                                                                                                                                  | Required |
| --------------------------- | ------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| name                        | string  | The name of the product.                                                                                                                                                                                                     | required |
| terms                       | array   | The product terms.                                                                                                                                                                                                           | required |
| terms[].term                | integer | The term length of the product in months. <b>Note: term or fixedMaturityDate must be specified</b>                                                                                                                           | optional |
| terms[].fixedMaturityDate   | string  | A fixed date at which point the product matures. <b>Note: fixedMaturityDate or term must be specified</b>                                                                                                                    | optional |
| terms[].fixedLiveDate       | string  | A fixed date in the future when the product goes live. If this is not set, and the maximum funding limit is not specified, the bond will run according to the schedule you agree with Goji.                                  | optional |
| terms[].maximumFundingLimit | ref     | The maximum amount allowed for the product before it goes live. <b>Note: The bond will NOT run until this limit is reached. ie. this is both a maximum limit and also the amount that must be filled for the bond to run.</> | optional |
| terms[].interestType        | string  | The type of interest to be returned.                                                                                                                                                                                         | required |
| terms[].interestRate        | number  | The interest rate of the product.                                                                                                                                                                                            | required |
| terms[].minimumInvestment   | ref     | The minimum individual investment allowed for the product.                                                                                                                                                                   | required |
| terms[].investmentDocuments | array   | The investment documents relating to the product.                                                                                                                                                                            | required |
| terms[].repaymentProfiles   | array   | The investment documents relating to the product.                                                                                                                                                                            | required |
### Response
| Name | Type   | Description                  |
| ---- | ------ | ---------------------------- |
| id   | string | The unique id of the product |
## POST /test/bondManagement/investmentCycle

```http

POST /test/bondManagement/investmentCycle HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "minimumRequiredForNewBond" : {
    "amount" : 2.15,
    "currency" : "currency"
  }
}

HTTP/1.1 200 OK
Content-Type: application/json

{
  "bonds" : [ {
    "totalAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "totalInterestAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "maturity" : {
      "date" : "2000-01-23",
      "months" : 2,
      "maturityType" : "FIXED"
    },
    "productTermId" : "productTermId",
    "nextRepaymentDate" : "2000-01-23",
    "initialInvestmentAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "id" : "id",
    "startDate" : "2000-01-23",
    "status" : "QUEUED"
  }, {
    "totalAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "totalInterestAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "maturity" : {
      "date" : "2000-01-23",
      "months" : 2,
      "maturityType" : "FIXED"
    },
    "productTermId" : "productTermId",
    "nextRepaymentDate" : "2000-01-23",
    "initialInvestmentAmount" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "id" : "id",
    "startDate" : "2000-01-23",
    "status" : "QUEUED"
  } ]
}
```
### Description
Runs a simulated investment cycle. This simulates funds being invested and being sent to the investment manager.
### Request
| Name                               | Type   | Description                                   | Required |
| ---------------------------------- | ------ | --------------------------------------------- | -------- |
| minimumRequiredForNewBond          | ref    | The minimum amount required for the new bond. | optional |
| minimumRequiredForNewBond.amount   | number | The amount.                                   ||
| minimumRequiredForNewBond.currency | string | The ISO 4217 three character codes eg 'GBP'   ||
### Response
| Name                            | Type   | Description                                                                                                     |
| ------------------------------- | ------ | --------------------------------------------------------------------------------------------------------------- |
| bonds                           | array  |                                                                                                                 |
| bonds[].id                      | string | The ID of the Bond.                                                                                             |
| bonds[].productTermId           | string | The product term id of the bond.                                                                                |
| bonds[].status                  | string | The status of the bond.                                                                                         |
| bonds[].startDate               | string | The start date of the bond.                                                                                     |
| bonds[].maturity                | ref    | The maturity of the bond.                                                                                       |
| bonds[].totalAmount             | ref    | The total current invested amount. This can increase up to the start date of the bond.                          |
| bonds[].initialInvestmentAmount | ref    | The initial investment amount.                                                                                  |
| bonds[].totalInterestAmount     | ref    | The total amount of interest accrued. This also includes any interest that has been accrued but not yet repaid. |
| bonds[].nextRepaymentDate       | string | The date of the next repayment event.                                                                           |
## POST /test/bondManagement/investmentCycle/repaymentsAccrual

```http

POST /test/bondManagement/investmentCycle/repaymentsAccrual HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "accrualDate" : "2000-01-23"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Simulates interest repayment accruals.
### Request
| Name        | Type   | Description                                     | Required |
| ----------- | ------ | ----------------------------------------------- | -------- |
| accrualDate | string | The date up to which accruals will be generated | optional |
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investors/{clientId}/accounts/{accountType}/investments

```http

GET /investors/{clientId}/accounts/{accountType}/investments HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "investments" : [ {
    "bondId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "endDate" : "2000-01-23",
    "productTermId" : "productTermId",
    "amountInvested" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "creationDate" : "2000-01-23",
    "gainToDateAsPercentage" : 7.24,
    "startDate" : "2000-01-23",
    "status" : "PENDING",
    "gainToDate" : {
      "amount" : 2.15,
      "currency" : "currency"
    }
  }, {
    "bondId" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "endDate" : "2000-01-23",
    "productTermId" : "productTermId",
    "amountInvested" : {
      "amount" : 2.15,
      "currency" : "currency"
    },
    "id" : "046b6c7f-0b8a-43b9-b35d-6489e6daee91",
    "creationDate" : "2000-01-23",
    "gainToDateAsPercentage" : 7.24,
    "startDate" : "2000-01-23",
    "status" : "PENDING",
    "gainToDate" : {
      "amount" : 2.15,
      "currency" : "currency"
    }
  } ]
}
```
### Description
Lists the investments for the account.
### Response
| Name                                 | Type   | Description                                                                 |
| ------------------------------------ | ------ | --------------------------------------------------------------------------- |
| investments                          | array  | The investments.                                                            |
| investments[].id                     | string | A unique ID for the investment.                                             |
| investments[].bondId                 | string | The id of the bond this investment is in. Not present if status is PENDING. |
| investments[].productTermId          | string | The product code for the investment.                                        |
| investments[].status                 | string | The status of the investment.                                               |
| investments[].gainToDateAsPercentage | number | The gain to date as a percentage.                                           |
| investments[].creationDate           | string | The creation date of the investment.                                        |
| investments[].startDate              | string | The start date of the investment.                                           |
| investments[].endDate                | string | The end date of the investment.                                             |
| investments[].amountInvested         | ref    | The amount invested.                                                        |
| investments[].gainToDate             | ref    | The gain to date. Can be negative if the investment has decreased in value. |
## POST /investors/{clientId}/accounts/{accountType}/investments

```http

POST /investors/{clientId}/accounts/{accountType}/investments HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...

{
  "amount" : {
    "amount" : 2.15,
    "currency" : "currency"
  },
  "repaymentProfileId" : 0,
  "productTermId" : "productTermId"
}

HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
Adds an investment to the account.
### Request
| Name               | Type    | Description                                 | Required |
| ------------------ | ------- | ------------------------------------------- | -------- |
| productTermId      | string  | The product code for the investment.        | required |
| repaymentProfileId | integer | The repayment profile ID.                   | required |
| amount             | ref     | The amount invested.                        | required |
| amount.amount      | number  | The amount.                                 ||
| amount.currency    | string  | The ISO 4217 three character codes eg 'GBP' ||
### Response
| Name | Type | Description || ---- | ---- | ----------- |

## GET /investments/products

```http

GET /investments/products HTTP/1.1
Host: api-sandbox.goji.investments/platformApi
Content-Type: application/json
Authorization: Basic ...



HTTP/1.1 200 OK
Content-Type: application/json

{
  "availableProducts" : [ {
    "name" : "name",
    "id" : "id",
    "availableTerms" : [ {
      "interestRate" : 8.34,
      "investmentDocuments" : [ {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      }, {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      } ],
      "fixedLiveDate" : "2000-01-23",
      "maximumFundingLimit" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "maturityDateType" : "FIXED",
      "interestType" : "FIXED",
      "term" : 8,
      "id" : "id",
      "fixedMaturityDate" : "2000-01-23",
      "minimumInvestment" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "repaymentProfiles" : [ {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      }, {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      } ]
    }, {
      "interestRate" : 8.34,
      "investmentDocuments" : [ {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      }, {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      } ],
      "fixedLiveDate" : "2000-01-23",
      "maximumFundingLimit" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "maturityDateType" : "FIXED",
      "interestType" : "FIXED",
      "term" : 8,
      "id" : "id",
      "fixedMaturityDate" : "2000-01-23",
      "minimumInvestment" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "repaymentProfiles" : [ {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      }, {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      } ]
    } ]
  }, {
    "name" : "name",
    "id" : "id",
    "availableTerms" : [ {
      "interestRate" : 8.34,
      "investmentDocuments" : [ {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      }, {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      } ],
      "fixedLiveDate" : "2000-01-23",
      "maximumFundingLimit" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "maturityDateType" : "FIXED",
      "interestType" : "FIXED",
      "term" : 8,
      "id" : "id",
      "fixedMaturityDate" : "2000-01-23",
      "minimumInvestment" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "repaymentProfiles" : [ {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      }, {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      } ]
    }, {
      "interestRate" : 8.34,
      "investmentDocuments" : [ {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      }, {
        "investmentDocumentType" : "INVESTMENT_BROCHURE",
        "fileName" : "fileName",
        "fileUrl" : "fileUrl"
      } ],
      "fixedLiveDate" : "2000-01-23",
      "maximumFundingLimit" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "maturityDateType" : "FIXED",
      "interestType" : "FIXED",
      "term" : 8,
      "id" : "id",
      "fixedMaturityDate" : "2000-01-23",
      "minimumInvestment" : {
        "amount" : 2.15,
        "currency" : "currency"
      },
      "repaymentProfiles" : [ {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      }, {
        "interestPayoutDescription" : "interestPayoutDescription",
        "interestPayoutLabel" : "interestPayoutLabel",
        "id" : "id"
      } ]
    } ]
  } ]
}
```
### Description
Lists the investment products that are available.
### Response
| Name                               | Type   | Description                     |
| ---------------------------------- | ------ | ------------------------------- |
| availableProducts                  | array  |                                 |
| availableProducts[].id             | string | The product code.               |
| availableProducts[].name           | string | The name of the product.        |
| availableProducts[].availableTerms | array  | The available terms, in months. |
