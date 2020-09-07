# Errors

The following error types can be returned by the Goji Platform:

## Bad Request

This is returned as HTTP response code `400`

```
{
    "errors": [
        {
            "errorCode": "string",
            "message": "string"
        }
    ]
}
```

## Unauthorised

This is returned as HTTP response code `401`

```
{
    "errors": [
        {
            "errorCode": "string",
            "message": "string"
        }
    ]
}
```

## Internal Server Error

This is returned as HTTP response code `500`

```
{
    "errors": [
        {
            "errorCode": "string",
            "message": "string"
        }
    ]
}
```

## Create/Update Investor Error Codes

|Error Code | Message|
|:---------|:---------|
| INVALID_DATA | address.country cannot be null or empty |
| INVALID_DATA | address.lineOne cannot be null or empty |
| INVALID_DATA | address.postcode cannot be null or empty |
| INVALID_DATA | address.postcode must be in valid UK format. e.g. (A9 9ZZ &#124; A99 9ZZ &#124; AB9 9ZZ &#124; AB99 9ZZ &#124; A9C 9ZZ &#124; AD9E 9ZZ) |
| INVALID_DATA | address.townCity cannot be null or empty |
| INVALID_DATA | dateOfBirth cannot be null or empty and must be in valid ISO format (YYYY-MM-DD) |
| INVALID_DATA | emailAddress cannot be null or empty |
| INVALID_DATA | emailAddress must be in valid format |
| INVALID_DATA | firstName cannot be null or empty |
| INVALID_DATA | lastName cannot be null or empty |
| INVALID_NAME | First and last names must be longer than one character |
| INVALID_ADDRESS | Address cannot be a PO Box |
| INVALID_COUNTRY | Country is invalid |
| UNDER_18 | Cannot create account for person under the age of 18 |
| OVER_100 | Cannot create account for person over the age of 100 |

## Add ISA Error Codes

|Error Code | Message|
|:---------|:---------|
| INVESTOR_ISA_EXISTS | Investor with this N.I number already has an IF-ISA account with this originator |
| TAX_YEAR_ISA_EXISTS | Investor with this N.I number has previously created an IF-ISA within this tax year |
| UNDER_18 | Cannot create account for person under the age of 18 |
| INVALID_DATA | nationalInsuranceNumber is in invalid format. Must be in NI number format e.g. (AB123456C) |
| INVALID_DATA | nationalInsuranceNumber cannot be null or empty |

## Add KYC Documents For An Investor Error Codes

|Error Code | Message|
|:---------|:---------|
| INVALID_DATA | Documents are required |


## Add Bank Details Error Codes

|Error Code | Message|
|:---------|:---------|
| DETAILS_ALREADY_EXIST | Only one set of bank details allowed |
| INVALID_DATA | Bank number, name and sort code are all required |
| INVALID_DATA | Sort code should be 6 digits|
| INVALID_DATA  | Account number should be 8 digits |

## Replace Bank Details Error Codes

|Error Code | Message|
|:---------|:---------|
| DETAILS_DONT_EXIST | A set of bank details must exist for an update |
| INVALID_DATA | Bank number, name and sort code are all required |
| INVALID_DATA | Sort code should be 6 digits|
| INVALID_DATA  | Account number should be 8 digits |


## Add Investment Error Codes

|Error Code | Message|
|:---------|:---------|
| INVALID_DATA | Cannot find product term with id={} |
| ACCOUNT_REQUIRED | Invested account must be specified |
| PRODUCT_TERM_ID_REQUIRED | The investment product term must be provided |
| PRODUCT_TERM_INVALID | The investment product term is not available |
| INVALID_AMOUNT | The specified amount is too big for the selected product |
| INSUFFICIENT_BALANCE | Insufficient funds available to invest |


## Withdraw Cash Error Codes

|Error Code | Message|
|:---------|:---------|
| INVALID_DATA | The account must be specified |
| INVALID_DATA | The withdrawal amount must be greater than zero |
| INVALID_DATA | Insufficient balance to perform |

## Transfer Cash To Another Account Error Codes

|Error Code | Message|
|:---------|:---------|
| INVALID_DATA | Insufficient balance to perform |
