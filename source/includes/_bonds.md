# Bond management

<aside class="notice">
Most platforms do not require this module. Please speak to the Goji integrations team before using this API.
</aside>

The Goji Platform supports issuing bonds both via the API and whitelabel web platform.

Goji accumulates invested funds and send them to you in accordance with the frequency of the product. For example, if the bonds are issued monthly, the funds will be sent on a monthly basis.

The process flow is as follows:

1. Investors deposit funds
2. Investors make investments throughout month
3. On frequency configured against the bond product, invested funds are scooped up and sent to you. Bond certificates are issued to investors.
4. Goji calculates accrued interest on bonds.
5. On repayment events, Goji emails you to indicate the amount of interest/capital that must be repaid and the account this should be sent to.
6. You repay funds to a Goji account
7. Goji distributes funds to investor's Goji accounts.

The current funds that are due to be sent can be retrieved by calling `GET /bondManagement/current`.

When a repayment event (either capital or interest or both), an email will be sent to a preconfigured address. When these funds are sent to the specified Goji account, they will be automatically distributed to the investor's Goji account and an email sent to them.

## Making an investment

Once an investor has a positive account balance, they can invest in one of the available products.
The Goji Platform returns a list of available products.

Once an order is executed this is stored against the investor's
account.

Orders are settled per the configuration of the product at which point the invested funds are sent to the
Investment Manager for deployment and a bond certificate is issued to the investor.

![](/images/bond-management/images/make-investment.png "")

## Bond repayments

Depending on the configuration of the product, repayments may be made during the lifetime of the
bond eg quarterly interest repayments.

The Goji Platform calculates the funds that will be required for each repayment and will email the Investment Manager
to request payment to a specified account and reference. These details are also available via the API.

Once this payment is received, the funds are allocated to the investors' accounts and they are emailed to inform them
that their account has been credited.

![](/images/bond-management/images/bond-repayment.png "")

## Bond maturity

The Goji Platform calculates the funds that will be required at maturity of the bond and will email the Investment Manager
to request payment to a specified account and reference. These details are also available via the API.

Once this payment is received, the funds are allocated to the investors' accounts and they are emailed to inform them
that their account has been credited.

![](/images/bond-management/images/bond-maturity.png "")


## `POST /platformApi/bondManagement/product`

```http

POST /platformApi/bondManagement/product HTTP/1.1
Host: api-sandbox.goji.investments
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

```

```http 
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
| terms[].interestType        | string  | The type of interest to be returned. Possible values are: <br>`FIXED`<br>                                                                                                                                                    | required |
| terms[].interestRate        | number  | The interest rate of the product.                                                                                                                                                                                            | required |
| terms[].minimumInvestment   | ref     | The minimum individual investment allowed for the product.                                                                                                                                                                   | required |
| terms[].investmentDocuments | array   | The investment documents relating to the product.                                                                                                                                                                            | required |
| terms[].repaymentProfiles   | array   | The investment documents relating to the product.                                                                                                                                                                            | required |
### Response
| Name | Type   | Description                  |
| ---- | ------ | ---------------------------- |
| id   | string | The unique id of the product |

## `GET /platformApi/investments/products`

```http

GET /platformApi/investments/products HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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


## `POST /platformApi/investors/{clientId}/accounts/{accountType}/investments`

```http

POST /platformApi/investors/{clientId}/accounts/{accountType}/investments HTTP/1.1
Host: api-sandbox.goji.investments
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

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

{
  "id": "id"
}
```
### Description
Adds an investment to the account.
### Request
| Name               | Type    | Description                                 | Required |
| ------------------ | ------- | ------------------------------------------- | -------- |
| productTermId      | string  | The product code for the investment.        | required |
| repaymentProfileId | integer | The repayment profile ID.                   | required |
| amount             | ref     | The amount invested.                        | required |
| amount.amount      | number  | The amount.                                 | required |
| amount.currency    | string  | The ISO 4217 three character codes eg 'GBP' | required |
### Response
| Name | Type | Description |
| ---- | ---- | ----------- |
| id   | string | The ID of the created investment |


## `GET /platformApi/investors/{clientId}/accounts/{accountType}/investments`

```http

GET /platformApi/investors/{clientId}/accounts/{accountType}/investments HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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
| Name                                 | Type   | Description                                                                                                                                   |
| ------------------------------------ | ------ | --------------------------------------------------------------------------------------------------------------------------------------------- |
| investments                          | array  | The investments.                                                                                                                              |
| investments[].id                     | string | A unique ID for the investment.                                                                                                               |
| investments[].bondId                 | string | The id of the bond this investment is in. Not present if status is PENDING.                                                                   |
| investments[].productTermId          | string | The product code for the investment.                                                                                                          |
| investments[].status                 | string | The status of the investment. Possible values are: <br>`PENDING`<br>`PROCESSING`<br>`COMPLETED`<br>`MATURED`<br>`REDEEMED`<br>`CANCELLED`<br> |
| investments[].gainToDateAsPercentage | number | The gain to date as a percentage.                                                                                                             |
| investments[].creationDate           | string | The creation date of the investment.                                                                                                          |
| investments[].startDate              | string | The start date of the investment.                                                                                                             |
| investments[].endDate                | string | The end date of the investment.                                                                                                               |
| investments[].amountInvested         | ref    | The amount invested.                                                                                                                          |
| investments[].gainToDate             | ref    | The gain to date. Can be negative if the investment has decreased in value.                                                                   |

## `POST /platformApi/test/bondManagement/investmentCycle`

```http

POST /platformApi/test/bondManagement/investmentCycle HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "minimumRequiredForNewBond" : {
    "amount" : 2.15,
    "currency" : "currency"
  }
}

```

```http 
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
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
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
| bonds[].status                  | string | The status of the bond. Possible values are: <br>`QUEUED`<br>`LIVE`<br>`MATURED`<br>                            |
| bonds[].startDate               | string | The start date of the bond.                                                                                     |
| bonds[].maturity                | ref    | The maturity of the bond.                                                                                       |
| bonds[].totalAmount             | ref    | The total current invested amount. This can increase up to the start date of the bond.                          |
| bonds[].initialInvestmentAmount | ref    | The initial investment amount.                                                                                  |
| bonds[].totalInterestAmount     | ref    | The total amount of interest accrued. This also includes any interest that has been accrued but not yet repaid. |
| bonds[].nextRepaymentDate       | string | The date of the next repayment event.                                                                           |


## `GET /platformApi/bondManagement/current`

```http

GET /platformApi/bondManagement/current HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...



```

```http 
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
| bonds[].status                  | string | The status of the bond. Possible values are: <br>`QUEUED`<br>`LIVE`<br>`MATURED`<br>                            |
| bonds[].startDate               | string | The start date of the bond.                                                                                     |
| bonds[].maturity                | ref    | The maturity of the bond.                                                                                       |
| bonds[].totalAmount             | ref    | The total current invested amount. This can increase up to the start date of the bond.                          |
| bonds[].initialInvestmentAmount | ref    | The initial investment amount.                                                                                  |
| bonds[].totalInterestAmount     | ref    | The total amount of interest accrued. This also includes any interest that has been accrued but not yet repaid. |
| bonds[].nextRepaymentDate       | string | The date of the next repayment event.                                                                           |


## `POST /platformApi/test/bondManagement/investmentCycle/repaymentsAccrual`

```http

POST /platformApi/test/bondManagement/investmentCycle/repaymentsAccrual HTTP/1.1
Host: api-sandbox.goji.investments
Content-Type: application/json
Authorization: Basic ...

{
  "accrualDate" : "2000-01-23"
}

```

```http 
HTTP/1.1 200 OK
Content-Type: application/json

""
```
### Description
<aside class="notice">
Please note this is a test endpoint and is only available in the sandbox environment.
</aside>
Simulates interest repayment accruals.
### Request
| Name        | Type   | Description                                     | Required |
| ----------- | ------ | ----------------------------------------------- | -------- |
| accrualDate | string | The date up to which accruals will be generated | optional |
