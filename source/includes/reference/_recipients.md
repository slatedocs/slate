# Recipient Accounts

## Create

> Example Request (Create GBP recipient):

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/accounts \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "currency": "GBP", 
          "type": "sort_code", 
          "profile": <your profile id>, 
          "accountHolderName": "Ann Johnson",
           "details": { 
              "legalType": "PRIVATE",
              "sortCode": "231470", 
              "accountNumber": "28821822" 
           } 
         }'

```

> Example Response (Create GBP recipient):

```json
{
    "id": 13967081,
    "business": null,
    "profile": <your profile id>,
    "accountHolderName": "Ann Johnson",
    "currency": "GBP",
    "country": "GB",
    "type": "sort_code",
    "details": {
        "address": {
            "country": null,
            "countryCode": null,
            "firstLine": null,
            "postCode": null,
            "city": null,
            "state": null
        },
        "email": null,
        "legalType": "PRIVATE",
        "accountNumber": "28821822",
        "sortCode": "231470",
        "abartn": null,
        "accountType": null,
        "bankgiroNumber": null,
        "ifscCode": null,
        "bsbCode": null,
        "institutionNumber": null,
        "transitNumber": null,
        "phoneNumber": null,
        "bankCode": null,
        "russiaRegion": null,
        "routingNumber": null,
        "branchCode": null,
        "cpf": null,
        "cardNumber": null,
        "idType": null,
        "idNumber": null,
        "idCountryIso3": null,
        "idValidFrom": null,
        "idValidTo": null,
        "clabe": null,
        "swiftCode": null,
        "dateOfBirth": null,
        "clearingNumber": null,
        "bankName": null,
        "branchName": null,
        "businessNumber": null,
        "province": null,
        "city": null,
        "rut": null,
        "token": null,
        "cnpj": null,
        "payinReference": null,
        "pspReference": null,
        "orderId": null,
        "idDocumentType": null,
        "idDocumentNumber": null,
        "targetProfile": null,
        "taxId": null,
        "iban": null,
        "bic": null,
        "IBAN": null,
        "BIC": null
    },
    "user": <your user ID>,
    "active": true
}
```

Recipient is a person or institution  who is the ultimate beneficiary of your payment. 

Recipient data includes three data blocks.

**1) General Data**
<ul>
<li>Recipient full name</li>
<li>Legal type (private/business)</li>
<li>Currency</li>
</ul>

**2) Bank account data**

There are many different variations of bank account details needed depending on recipient target currency. For example:
<ul>
<li>GBP — sort code and account number </li>
<li>BGN CHF, DKK, EUR, GEL, GBP, NOK, PKR, PLN, RON, SEK — IBAN</li>
<li>USD — routing number, account number, account type</li>
<li>INR — IFSC code, account number</li>
<li>...</li>
</ul>

**3) Address data**
 Recipient address data is required only if target currency is USD, PHP, THB or TRY, or if the source currency is USD or AUD. 
<ul>
<li>Country</li>
<li>State (US, Canada, Brazil)</li>
<li>City</li>
<li>Address line</li>
<li>Zip code</li>
</ul>

When creating recipient, the following general rules should be applied to "accountHolderName" field:
1. Full names for personal recipients.  They must include more than one name, and both first and last name must have more than one character.
2. Business names must be in full, but can be just a single name, and can include single characters.  But must have more than one character in any one word.
3. Digits are not allowed, except in business names.
These requirements may vary depending of recipient type.
A GBP example is provided here. You can find other currency examples below.<br/>
As you can see many of the fields are `null`, in order to know which fields are required for which currency we expose the [Recipients.Requirements](#recipient-accounts-requirements) endpoint.

### Request

**`POST https://api.sandbox.transferwise.tech/v1/accounts`**

Field                 | Description                                   | Format
---------             | -------                                       | -----------
currency              | 3 character currency code                     | Text
type                  | Recipient type                                | Text
profile               | Personal or business profile id               | Integer
accountHolderName     | Recipient full name                           | Text
details               | Currency specific fields                      | Object
details.legalType     | Recipient legal type: PRIVATE or BUSINESS     | Text
details.sortCode      | Recipient bank sort code (GBP example)        | Text
details.accountNumber | Recipient bank account no (GBP example)       | Text


### Response

Recipient account id is needed for creating transfers in step 3.

Field                 | Description                                   | Format
---------             | -------                                       | -----------
id                    | accountId                                     | Integer
profile               | Personal or business profile id               | Integer
acccountHolderName    | Recipient full name                           | Text
currency              | 2 character country code                      | Text
country               | 3 character currency code                     | Text
type                  | Recipient type                                | Text
details               | Currency specific fields                      | Object
details.legalType     | Recipient legal type                          | Text
details.sortCode      | Recipient bank sort code (GBP example)        | Text
details.accountNumber | Recipient bank account no (GBP example)       | Text


## Create Email Recipient

> Example Request (Create email recipient):

```shell
curl -X POST https://api.sandbox.transferwise.tech/v1/accounts \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>, 
          "accountHolderName": "Ann Johnson",
          "currency": "EUR", 
          "type": "email", 
           "details": { 
              "email": "ann.johnson@gmail.com"
           } 
         }'
```

> Example Response (Lookup email recipient):

```json
{
    "id": 13967196,
    "business": null,
    "profile": <your profile id>,
    "accountHolderName": "Ann Johnson",
    "currency": "EUR",
    "country": null,
    "type": "email",
    "details": {
        "address": {
            "country": null,
            "countryCode": null,
            "firstLine": null,
            "postCode": null,
            "city": null,
            "state": null
        },
        "email": "ann.johnson@gmail.com",
        "legalType": "PRIVATE",
        "accountNumber": null,
        "sortCode": null,
        "abartn": null,
        "accountType": null,
        "bankgiroNumber": null,
        "ifscCode": null,
        "bsbCode": null,
        "institutionNumber": null,
        "transitNumber": null,
        "phoneNumber": null,
        "bankCode": null,
        "russiaRegion": null,
        "routingNumber": null,
        "branchCode": null,
        "cpf": null,
        "cardNumber": null,
        "idType": null,
        "idNumber": null,
        "idCountryIso3": null,
        "idValidFrom": null,
        "idValidTo": null,
        "clabe": null,
        "swiftCode": null,
        "dateOfBirth": null,
        "clearingNumber": null,
        "bankName": null,
        "branchName": null,
        "businessNumber": null,
        "province": null,
        "city": null,
        "rut": null,
        "token": null,
        "cnpj": null,
        "payinReference": null,
        "pspReference": null,
        "orderId": null,
        "idDocumentType": null,
        "idDocumentNumber": null,
        "targetProfile": null,
        "taxId": null,
        "iban": null,
        "bic": null,
        "IBAN": null,
        "BIC": null
    },
    "user": <your user id>,
    "active": true
}

```
If you don't know recipient bank account details you can set up **email recipient** so that TransferWise will collect bank details directly from the recipient. 

TransferWise will email your recipient with a link to collect their bank account details. 
Once your recipient provides bank account details securely to Transferwise we are able to complete your transfer.


<aside class="warning">
<b>Please read through the support article referenced below to understand how this works and what are known constraints.</b>
</aside>
[https://transferwise.com/help/article/1740912/creating-a-transfer/transfers-to-an-email-address-transferwise-users]
(https://transferwise.com/help/article/1740912/creating-a-transfer/transfers-to-an-email-address-transferwise-users)


## Get By Id
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/accounts/{accountId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
    "id": 13967081,
    "profile": <your profile id>, 
    "accountHolderName": "Ann Johnson",
    "type": "sort_code", 
    "country": "GB", 
    "currency": "GBP",
    "details": {
        "address": {
            "country": null,
            "countryCode": null,
            "firstLine": null,
            "postCode": null,
            "city": null,
            "state": null
        },
        "email": null,
        "legalType": "PRIVATE",
        "accountNumber": "28821822",
        "sortCode": "231470",
        "abartn": null,
        "accountType": null,
        "bankgiroNumber": null,
        "ifscCode": null,
        "bsbCode": null,
        "institutionNumber": null,
        "transitNumber": null,
        "phoneNumber": null,
        "bankCode": null,
        "russiaRegion": null,
        "routingNumber": null,
        "branchCode": null,
        "cpf": null,
        "cardNumber": null,
        "idType": null,
        "idNumber": null,
        "idCountryIso3": null,
        "idValidFrom": null,
        "idValidTo": null,
        "clabe": null,
        "swiftCode": null,
        "dateOfBirth": null,
        "clearingNumber": null,
        "bankName": null,
        "branchName": null,
        "businessNumber": null,
        "province": null,
        "city": null,
        "rut": null,
        "token": null,
        "cnpj": null,
        "payinReference": null,
        "pspReference": null,
        "orderId": null,
        "idDocumentType": null,
        "idDocumentNumber": null,
        "targetProfile": null,
        "taxId": null,
        "iban": null,
        "bic": null,
        "IBAN": null,
        "BIC": null
    },
    "user": <your user ID>,
    "active": true
}
```

Get recipient account info by id.
### Request
**`GET https://api.sandbox.transferwise.tech/v1/accounts/{accountId}`**




## List
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/accounts?profile=<profileId>&currency=GBP \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
      "id": 13967081,
      "profile": <your profile id>, 
      "accountHolderName": "Ann Johnson",
      "type": "sort_code", 
      "country": "GB", 
      "currency": "GBP",
      "details": {
          "address": {
              "country": null,
              "countryCode": null,
              "firstLine": null,
              "postCode": null,
              "city": null,
              "state": null
          },
          "email": null,
          "legalType": "PRIVATE",
          "accountNumber": "28821822",
          "sortCode": "231470",
          "abartn": null,
          "accountType": null,
          "bankgiroNumber": null,
          "ifscCode": null,
          "bsbCode": null,
          "institutionNumber": null,
          "transitNumber": null,
          "phoneNumber": null,
          "bankCode": null,
          "russiaRegion": null,
          "routingNumber": null,
          "branchCode": null,
          "cpf": null,
          "cardNumber": null,
          "idType": null,
          "idNumber": null,
          "idCountryIso3": null,
          "idValidFrom": null,
          "idValidTo": null,
          "clabe": null,
          "swiftCode": null,
          "dateOfBirth": null,
          "clearingNumber": null,
          "bankName": null,
          "branchName": null,
          "businessNumber": null,
          "province": null,
          "city": null,
          "rut": null,
          "token": null,
          "cnpj": null,
          "payinReference": null,
          "pspReference": null,
          "orderId": null,
          "idDocumentType": null,
          "idDocumentNumber": null,
          "targetProfile": null,
          "taxId": null,
          "iban": null,
          "bic": null,
          "IBAN": null,
          "BIC": null
      },
      "user": <your user ID>,
      "active": true
  },
  {
      "id": 31273090,
      "profile": <your profile id>, 
      "accountHolderName": "George Johnson",
      "type": "sort_code", 
      "country": "GB", 
      "currency": "GBP",
      "details": {
          "address": {
              "country": null,
              "countryCode": null,
              "firstLine": null,
              "postCode": null,
              "city": null,
              "state": null
          },
          "email": null,
          "legalType": "PRIVATE",
          "accountNumber": "29912211",
          "sortCode": "231470",
          "abartn": null,
          "accountType": null,
          "bankgiroNumber": null,
          "ifscCode": null,
          "bsbCode": null,
          "institutionNumber": null,
          "transitNumber": null,
          "phoneNumber": null,
          "bankCode": null,
          "russiaRegion": null,
          "routingNumber": null,
          "branchCode": null,
          "cpf": null,
          "cardNumber": null,
          "idType": null,
          "idNumber": null,
          "idCountryIso3": null,
          "idValidFrom": null,
          "idValidTo": null,
          "clabe": null,
          "swiftCode": null,
          "dateOfBirth": null,
          "clearingNumber": null,
          "bankName": null,
          "branchName": null,
          "businessNumber": null,
          "province": null,
          "city": null,
          "rut": null,
          "token": null,
          "cnpj": null,
          "payinReference": null,
          "pspReference": null,
          "orderId": null,
          "idDocumentType": null,
          "idDocumentNumber": null,
          "targetProfile": null,
          "taxId": null,
          "iban": null,
          "bic": null,
          "IBAN": null,
          "BIC": null
      },
      "user": <your user ID>,
      "active": true
  }
]

```
Fetch a list of your recipient accounts. Use the `currency` and `profile` parameters to filter by currency and/or user profile Id.
This list does not currently support pagination, therefore if you have many recipient accounts defined in your business profile then please filter by currency to ensure a reasonable response time.


### Request
**`GET https://api.sandbox.transferwise.tech/v1/accounts?profile=<profileId>&currency=<currencyCode>`**

Both query parameters are optional.

Field                             | Description                                   | Format
---------                         | -------                                       | -----------
profileId                         | Personal or business profile id               | Integer
currency                          | Currency code                                 | Text

## Delete

> Example Request:

```shell
curl -X DELETE https://api.sandbox.transferwise.tech/v1/accounts/{accountId} \
     -H "Authorization: Bearer <your api token>"
```


Deletes a recipient by changing its status to inactive. Only active recipients can be deleted and a recipient cannot be reactivated, however you can create a new recipient with the same details instead.

Response is empty if delete succeeds.

Requesting to delete recipient that is already inactive will return an http status 403 (forbidden).

### Request
**`DELETE https://api.sandbox.transferwise.tech/v1/accounts/{accountId}`**


## Requirements
> Example Request:

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/quotes/{quoteId}/account-requirements \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
[
  {
    "type": "aba",
     "fields": [
          {
            "name": "Legal type",
            "group": [
              {
                "key": "legalType",
                "type": "select",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "",
                "minLength": null,
                "maxLength": null,
                "validationRegexp": null,
                "validationAsync": null,
                "valuesAllowed": [
                  {
                    "key": "PRIVATE",
                    "name": "Private"
                  },
                  {
                    "key": "BUSINESS",
                    "name": "Business"
                  }
                ]
              }
            ]
          },
          {
            "name": "Routing Number",
            "group": [
              {
                "key": "abartn",
                "type": "text",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "111000025",
                "minLength": 9,
                "maxLength": 9,
                "validationRegexp": "\\d{9}",
                "validationAsync": {
                  "url": "https://test-restgw.transferwise.com/v1/validators/abartn",
                  "params": [
                    {
                      "key": "abartn",
                      "parameterName": "abartn",
                      "required": true
                    }
                  ]
                },
                "valuesAllowed": null
              }
            ]
          },
          {
            "name": "Account number",
            "group": [
              {
                "key": "accountNumber",
                "type": "text",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "12345678",
                "minLength": 4,
                "maxLength": null,
                "validationRegexp": "\\d{4,17}",
                "validationAsync": {
                  "url": "https://test-restgw.transferwise.com/v1/validators/aba-account-number",
                  "params": [
                    {
                      "key": "accountNumber",
                      "parameterName": "accountNumber",
                      "required": true
                    }
                  ]
                },
                "valuesAllowed": null
              }
            ]
          },
          {
            "name": "Account type",
            "group": [
              {
                "key": "accountType",
                "type": "radio",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "",
                "minLength": null,
                "maxLength": null,
                "validationRegexp": null,
                "validationAsync": null,
                "valuesAllowed": [
                  {
                    "key": "CHECKING",
                    "name": "Checking"
                  },
                  {
                    "key": "SAVINGS",
                    "name": "Savings"
                  }
                ]
              }
            ]
          },
          {
            "name": "Country",
            "group": [
              {
                "key": "address.country",
                "type": "select",
                "refreshRequirementsOnChange": true,
                "required": true,
                "displayFormat": null,
                "example": "Germany",
                "minLength": null,
                "maxLength": null,
                "validationRegexp": null,
                "validationAsync": null,
                "valuesAllowed": [
                  {
                    "key": "AX",
                    "name": "Åland Islands"
                  },
                  {
                    "key": "AL",
                    "name": "Albania"
                  },
                  {
                  ...
                  }
                ]
              }
            ]
          },
          {
            "name": "City",
            "group": [
              {
                "key": "address.city",
                "type": "text",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "London",
                "minLength": null,
                "maxLength": null,
                "validationRegexp": null,
                "validationAsync": null,
                "valuesAllowed": null
              }
            ]
          },
          {
            "name": "Postal code",
            "group": [
              {
                "key": "address.postCode",
                "type": "text",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "10025",
                "minLength": null,
                "maxLength": null,
                "validationRegexp": null,
                "validationAsync": null,
                "valuesAllowed": null
              }
            ]
          },
          {
            "name": "Address",
            "group": [
              {
                "key": "address.firstLine",
                "type": "text",
                "refreshRequirementsOnChange": false,
                "required": true,
                "displayFormat": null,
                "example": "50 Branson Ave",
                "minLength": null,
                "maxLength": null,
                "validationRegexp": null,
                "validationAsync": null,
                "valuesAllowed": null
              }
            ]
          }
        ]
    }
]
```
### Request
**` GET https://api.sandbox.transferwise.tech/v1/quotes/{quoteId}/account-requirements`**<br/>
**` POST https://api.sandbox.transferwise.tech/v1/quotes/{quoteId}/account-requirements`**<br/>

GET and POST account-requirements endpoints help you to figure out which fields are required to create a valid recipient for different currencies.
You can use this to build a dynamic user interface on top of these endpoints. 
This is a step-by-step guide on how these endpoints work.

1.First create a quote to specify currencies and transfer amounts. See [Create.Quote](#quotes-create).

2.Call GET /v1/quotes/{quoteId}/account-requirements to get list of fields you need to fill with values in "details" section for creating a valid recipient account. 

In order to create "aba" recipient type you need these top level fields:<br/>
<ul>
 <li>legalType (PRIVATE / BUSINESS)</li>
 <li>abartn (ABA routing number)</li>
 <li>accountType  (CHECKING / SAVINGS)</li>
 <li>address.country</li>
 <li>address.city</li>
 <li>address.postalCode</li>
 <li>address.firstLine</li>
</ul>

Some fields require multiple levels of fields in the details request, for example Country followed by State. This should be handled by the client base don the `refreshRequirementsOnChange` field. In the example above 'address.country' has this field set to true, indicating that there are additional fields required depending on the selected value. To manage this you should create a request with all of the initially requested data and call the `POST account-requirements` endpoint. You will be returned a response similar the previosuly returned data from `GET account-requirements` but with additional fields.

3.For example, construct a recipient object with top level fields and call POST /v1/quotes/{quoteId}/account-requirements with these value to expose sub fields.  <br/>
For example posting US as country will also add "state" to list of fields.<br/>

```
{
    "type": "aba",
    "details": {
      "legalType": "PRIVATE",
      "abartn": "111000025",
      "accountNumber": "12345678",
      "accountType": "CHECKING",
      "address": {
        "country": "US"
      }
    }
}
```
However, posting GB as country will not add any new fields as GB addresses do not have this extra requirement.

```
{
    "type": "aba",
    "details": {
      "legalType": "PRIVATE",
      "abartn": "111000025",
      "accountNumber": "12345678",
      "accountType": "CHECKING",
      "address": {
        "country": "US"
      }
    }
}
```

It is possible that any new fields retuened may _also_ have `refreshRequirementsOnChange` field set to true. Thereofe you must keep iterating on the partially created details object until `POST account-requirements` returns you no new fields that it previously didn't include in the response, you can do this by checking the size of the array returned.

4.Once you have built your full reciepient details object you can use it to create a reciepient.

For example this is a valid request to create a recipient with address in US Arizona:
<br/> `POST /v1/accounts`:<br/>
```
{
    "profile": your-profile-id,
    "accountHolderName": "John Smith",
    "currency": "USD",
    "type": "aba",
    "details": {
    	"legalType": "PRIVATE",
    	"abartn": "111000025",
    	"accountNumber": "12345678",
    	"accountType": "CHECKING",
    	"address": {
    		"country": "US",
    		"state": "AZ"
       	"city": "New York",
    		"postCode": "10025",
    		"firstLine": "45 Sunflower Ave"
    	}
    }
}
```


### Response
Field                                       | Description                                        | Format
---------                                   | -------                                            | -----------
type                                        | "address"                                          | Text
fields[n].name                              | Field description                                  | Text
fields[n].group[n].key                      | Key is name of the field you should include in the JSON                                     | Text
fields[n].group[n].type                     | Display type of field (e.g. text, select, etc)                                  | Text
fields[n].group[n].refreshRequirementsOnChange |  Tells you whether you should call POST account-requirements once the field value is set to discover required lower level fields.  | Boolean
fields[n].group[n].required                 | Indicates if the field is mandatory or not                                 | Boolean
fields[n].group[n].displayFormat            | Display format pattern.                                | Text
fields[n].group[n].example                  | Example value.                                | Text
fields[n].group[n].minLength                | Min valid length of field value.                                   | Integer
fields[n].group[n].maxLength                | Max valid length of field value.                             | Integer
fields[n].group[n].validationRegexp         | Regexp validation pattern.                                     | Text
fields[n].group[n].validationAsync          | Validator URL and parameter name you should use when submitting the value for validation | Text
fields[n].group[n].valuesAllowed[n].key     | List of allowed values. Value key                           | Text
fields[n].group[n].valuesAllowed[n].name    | List of allowed values. Value name.                          | Text



## Validate Recipient Fields

> Example Request (Validate sort code (GBP):

```shell
curl -X GET https://api.sandbox.transferwise.tech/v1/validators/sort-code?sortCode=231470
```

> Example Response (Validate sort code (GBP):

```json
{
    "validation": "success"
}

or  

{
    "errors": [
        {
            "code": "VALIDATION_NOT_SUCCESSFUL",
            "message": "sortCode has not passed validation.",
            "path": "sortCode",
            "arguments": [
                "2314701"
            ]
        }
    ]
}

```



There are several validation URLs that make creating correct recipient accounts easier. 
These URLs are also included in fields provided by [Recipient Accounts.Requirements](#recipient-accounts-requirements) endpoint.

**GBP**

Validate UK bank sort code

[https://api.transferwise.com/v1/validators/sort-code?sortCode=231470](https://api.transferwise.com/v1/validators/sort-code?sortCode=231470)

Validate UK bank account number

[https://api.transferwise.com/v1/validators/sort-code-account-number?accountNumber=10000246](https://api.transferwise.com/v1/validators/sort-code-account-number?accountNumber=10000246)

**BGN CHF, DKK, EUR, GEL, GBP, NOK, PKR, PLN, RON, SEK** 

Validate IBAN

[https://api.transferwise.com/v1/validators/iban?iban=EE867700771000187087](https://api.transferwise.com/v1/validators/iban?iban=EE867700771000187087)

Validate BIC and IBAN

[https://api.transferwise.com/v1/validators/bic?bic=LHVBEE22&iban=EE867700771000187087](https://api.transferwise.com/v1/validators/bic?bic=LHVBEE22&iban=EE867700771000187087)

**USD** 

Validate ABA routing number

[https://api.transferwise.com/v1/validators/abartn?abartn=011103093](https://api.transferwise.com/v1/validators/abartn?abartn=011103093)

Validate ABA bank account number

[https://api.transferwise.com/v1/validators/aba-account-number?accountNumber=111000025](https://api.transferwise.com/v1/validators/aba-account-number?accountNumber=111000025)

**INR**

Validate IFSC code

[https://api.transferwise.com/v1/validators/ifsc-code?ifscCode=YESB0236041](https://api.transferwise.com/v1/validators/ifsc-code?ifscCode=YESB0236041)

Validate Indian bank account number 

[https://api.transferwise.com/v1/validators/indian-account-number?accountNumber=678911234567891](https://api.transferwise.com/v1/validators/indian-account-number?accountNumber=678911234567891)


**AUD**

Validate BSB code

[https://api.transferwise.com/v1/validators/bsb-code?bsbCode=112879](https://api.transferwise.com/v1/validators/bsb-code?bsbCode=112879)

Validate Australian bank account number

[https://api.transferwise.com/v1/validators/australian-account-number?accountNumber=123456789](https://api.transferwise.com/v1/validators/australian-account-number?accountNumber=123456789)

**CAD**

Validate Canadian institution number

[https://api.transferwise.com/v1/validators/canadian-institution-number?institutionNumber=006](https://api.transferwise.com/v1/validators/canadian-institution-number?institutionNumber=006)

Validate Canadian bank transit number

[https://api.transferwise.com/v1/validators/canadian-transit-number?institutionNumber=006&transitNumber=04841](https://api.transferwise.com/v1/validators/canadian-transit-number?institutionNumber=006&transitNumber=04841)

Validate Canadian bank account number

[https://api.transferwise.com/v1/validators/canadian-account-number?institutionNumber=006&transitNumber=04841&accountNumber=3456712](https://api.transferwise.com/v1/validators/canadian-account-number?institutionNumber=006&transitNumber=04841&accountNumber=3456712)

**SEK** Validate Bank Giro number

[https://api.transferwise.com/v1/validators/bankgiro-number?bankgiroNumber=12345674](https://api.transferwise.com/v1/validators/bankgiro-number?bankgiroNumber=12345674)

**HUF**

Validate Hungarian bank account number

[https://api.transferwise.com/v1/validators/hungarian-account-number?accountNumber=12000000-12345678-00000000](https://api.transferwise.com/v1/validators/hungarian-account-number?accountNumber=12000000-12345678-00000000)

**PLN**

Validate Polish bank account number

[https://api.transferwise.com/v1/validators/polish-account-number?accountNumber=12345678901234567890123456](https://api.transferwise.com/v1/validators/polish-account-number?accountNumber=12345678901234567890123456)

**UAH**

Validate Ukrainian bank account number

[https://api.transferwise.com/v1/validators/privatbank-account-number?accountNumber=1234](https://api.transferwise.com/v1/validators/privatbank-account-number?accountNumber=1234)

Validate Ukrainian phone number

[https://api.transferwise.com/v1/validators/privatbank-phone-number?phoneNumber=123456789](https://api.transferwise.com/v1/validators/privatbank-phone-number?phoneNumber=123456789)


**NZD**

Validate New Zealand bank account number

[https://api.transferwise.com/v1/validators/new-zealand-account-number?accountNumber=03-1587-0050000-00](https://api.transferwise.com/v1/validators/new-zealand-account-number?accountNumber=03-1587-0050000-00)


**AED**

Validate United Arab Emirates BIC code

[https://api.transferwise.com/v1/validators/emirates-bic?bic=AZIZAEAD&iban=AE070331234567890123456](https://api.transferwise.com/v1/validators/emirates-bic?bic=AZIZAEAD&iban=AE070331234567890123456)

**CNY**

Validate Chinese Union Pay card number

[https://api.transferwise.com/v1/validators/chinese-card-number?cardNumber=6240008631401148](https://api.transferwise.com/v1/validators/chinese-card-number?cardNumber=6240008631401148)

**THB**

Validate Thailand bank account number

[https://api.transferwise.com/v1/validators/thailand-account-number?accountNumber=9517384260](https://api.transferwise.com/v1/validators/thailand-account-number?accountNumber=9517384260)






## Create AED Recipient

> Example Request (AED):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "AED",
          "type": "emirates",
          "legalType": "PRIVATE",
          "details": {
      	   "IBAN": "AE070331234567890123456"
         }
      }'
```

Send payments to United Arab Emirates. 

Private and business recipients are supported. 

Recipient type = *'emirates'*

Required details: IBAN

## Create ARS Recipient

> Example Request (ARS):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "ARS",
          "type": "argentina",
          "details": {
           "legalType": "PRIVATE",
           "taxId": "20-34149938-1",
           "accountNumber": "0110482420048200036238"
         }
      }'
```

Send payments to Argentina. 

Private and business recipients are supported. 

Recipient type = *'argentina'*

Required details: 

taxId - Recipient’s CUIT / CUIL (Single Tax Identification/ Single Labor Identification), 11 characters 
                                                                                                  
accountNumber - Recipient’s account CBU,	22 characters (Alias not supported)

## Create AUD Recipient

> Example Request (AUD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "AUD",
          "type": "australian",
          "details": {
           "legalType": "PRIVATE",
           "bsbCode": "023604",
           "accountNumber": "123456789"
          }
        }'
```

Send payments to Australia. 

Private and business recipients are supported. 

Recipient type = *'australia'*

Required details: 

bsbCode - 6 digits

accountNumber - 5..9 digits

## Create BDT Recipient

> Example Request (BDT):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "BDT",
          "type": "bangladesh",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "015",
           "branchCode": "015270362",
           "accountNumber": "5060011118"
           }
        }'
```

<aside class="warning">
<b>Only private customers sending payments to private recipients. Businesses customers are not supported yet.</b>
</aside>

Send payments to Bangladesh. 

Recipient type = *'iban'*

Required details: bankCode, branchCode, accountNumber

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.

## Create BGN Recipient

> Example Request (BGN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "BGN",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "BG89370400440532013000"
           }
        }'
```

Send payments to Bulgaria. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN

## Create BRL Recipient

> Example Request (BRL):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "BRL",
          "type": "brazil",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "218",
           "branchCode": "1234",
           "accountNumber": "12345678-9",
           "accountType": "CHECKING",
           "cpf": "123.456.789-12",
           "phoneNumber": "+55 21 5555 5555"
           }
        }'
```

<aside class="warning">
<b>Only private customers sending payments to private recipients. Businesses customers are not supported yet.</b>
</aside>

Send payments to Brazil. 

Recipient type = *'brazil'*

Required details: bankCode, branchCode, accountNumber, accountType (CHECKING or SAVINGS), cpf (tax reg no), recipient phone number

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create CAD Recipient

> Example Request (CAD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "CAD",
          "type": "canadian",
          "details": {
           "legalType": "PRIVATE",
           "institutionNumber": "006",
           "transitNumber": "04841",
           "accountNumber": "1234567",
           "accountType": "Checking",
     }
  }'
```

Send payments to Canada. 

Private and business recipients are supported. 

Recipient type = *'canadian'*

Required details: institutionNumber, transitNumber, accountNumber, accountType (Checking or Saving)

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.

## Create CHF Recipient

> Example Request (CHF):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "CHF",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "CH89370400440532013000"
           }
        }'
```

Send payments to Switzerland. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create CLP Recipient

> Example Request (CLP):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "CLP",
          "type": "chile",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "504",
           "accountNumber": "12345678901234567890",
           "rut": "760864285",
           "accountType": "CHECKING",
           "phoneNumber": "+56 33 555 5555"
           }
        }'
```

Send payments to Chile. 

Private and business recipients are supported. 

Recipient type = *'chile'*

Required details: bankCode, accountNumber, rut (Rol Único Tributario), accountType (CHECKING, SAVINGS, CUENTA_VISTA), recipient phone number


## Create CNY Recipient

> Example Request (CNY):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "CNY",
          "type": "chinese_card",
          "details": {
           "legalType": "PRIVATE",
           "cardNumber": "6240008631401148"
           }
        }'
```

<aside class="warning">
<b>Only sending payments to private recipients. It is not allowed to send funds to business recipients.</b>
</aside>

Send payments to China Unionpay cardholder. 

Recipient type = *'chinese_card'*

Required details: cardNumber

## Create CZK Recipient

> Example Request (CZK Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "CZK",
          "type": "czech",
          "details": {
           "legalType": "PRIVATE",
           "prefix": "000000",
           "accountNumber": "5060011118",
           "bankCode": "5500"
           }
        }'
```

> Example Request (CZK IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "CZK",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "CZ89370400440532013000"
           }
        }'
```




Send payments to Czech Republic. 

Private and business recipients are supported. 

<br/>

Recipient type = *'czech'*

Required details: prefix, accountNumber, bankCode

<br/>


OR 

<br/>


Recipient type = *'iban'*

Required details: IBAN


## Create DKK Recipient

> Example Request (DKK):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "DKK",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "DK89370400440532013000"
           }
        }'
```

Send payments to Denmark. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN




## Create EGP Recipient

> Example Request (EGP):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "EGP",
          "type": "egypt_local",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "ECBAEGCA",
           "accountNumber": "123456789"
           }
        }'
```

Send payments to Egypt. 

Private and business recipients are supported. 

Recipient type = *'egypt_local'*

Required details: bankCode, accountNumber (Swift code)

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create EUR Recipient

> Example Request (EUR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "EUR",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "DE89370400440532013000"
           }
        }'
```

Send payments to Eurozone countries: Austria, Belgium, Cyprus, Estonia, Finland, France, Germany, Greece, Ireland, Italy, Latvia, Lithuania, Luxembourg, Malta, Netherlands, Portugal, Slovakia, Slovenia, Spain.

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create GBP Recipient

> Example Request (GBP Sort Code):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "GBP",
          "type": "sort_code",
          "details": {
           "legalType": "PRIVATE",
           "sortCode": "40-30-20",
           "accountNumber": "12345678"
           }
        }'
```

> Example Request (GBP IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "GBP",
          "type": "iban",
          "details": {
            "legalType": "PRIVATE",
            "IBAN": "GB89370400440532013000"
           }
        }'
```


Send payments to United Kingdom. 

Private and business recipients are supported. 

<br/>

Recipient type = *'sort_code'*

Required details: sortCode, accountNumber

<br/>


OR 

<br/>


Recipient type = *'iban'*

Required details: IBAN


## Create GEL Recipient

> Example Request (GEL):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "GEL",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "GE89370400440532013000"
           }
        }'
```

Send payments to Georgia.

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create GHS Recipient

> Example Request (GHS):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "GHS",
          "type": "ghana_local",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "030100",
           "accountNumber": "0011XXXXXXXXXX"
           }
        }'
```

Send payments to Ghana.

Private and business recipients are supported. 

Recipient type = *'ghana_local'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create HKD Recipient

> Example Request (HKD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "accountHolderName": "<recipient name>",
          "currency": "HKD",
          "type": "hongkong",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "307",
           "accountNumber": "005-231289-112"
           }
        }'
```

Send payments to Hong Kong.

Private and business recipients are supported. 

Recipient type = *'hongkong'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create HRK Recipient

> Example Request:

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "HRK",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "HR89370400440532013000"
           }
        }'
```

Send payments to Croatia.

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create HUF Recipient

> Example Request (HUF Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "HUF",
          "type": "hungarian",
          "details": {
           "legalType": "PRIVATE",
           "accountNumber": "12000000-12345678-00000000"
           }
        }'
```

> Example Request (HUF IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "HUF",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "HU89370400440532013000"
           }
        }'
```




Send payments to Hungary. 

Private and business recipients are supported. 

<br/>

Recipient type = *'hungarian'*

Required details: accountNumber

<br/>


OR 

<br/>


Recipient type = *'iban'*

Required details: IBAN


## Create IDR Recipient

> Example Request (IDR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "IDR",
          "type": "indonesian",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "610306",
           "accountNumber": "6789112345678"
           }
        }'
```


Send payments to Indonesia.

Private and business recipients are supported. 

Recipient type = *'indonesian'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create ILS Recipient

> Example Request (ILS IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
        "profile": <your profile id>,
        "accountHolderName": "<recipient name>",
        "currency": "ILS",
        "type": "israeli_local",
        "details": {
         "legalType": "PRIVATE",
         "IBAN": "IL620108000000099999999"
         }
      }'
```

> Example Request (ILS Local Bank Code):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "ILS",
          "type": "israeli_bank_code",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "054",
           "branchCode": "001",
           "accountNumber": "123456789"
           }
        }'
```




Send payments to Israel. 

Private and business recipients are supported. 

<br/>

Recipient type = *'israeli_local'*

Required details: IBAN

<br/>


OR 

<br/>


Recipient type = *'israeli_bank_code'*

Required details: bankCode, branchCode, accountNumber

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create INR Recipient

> Example Request (INR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "INR",
          "type": "indian",
          "details": {
           "legalType": "PRIVATE",
           "ifscCode": "YESB0236041",
           "accountNumber": "678911234567891",
           }
        }'
```


<aside class="warning">
<b>Private recipient: 1 mln GBP per payment (~ 88 mln INR)<br/>
Business recipient: 1,5 mln INR per day (~ 17 800 GBP)</b>
</aside>

Send payments to India.

Private and business recipients are supported. 


Recipient type = *'indian'*

Required details: ifscCode, accountNumber


## Create JPY Recipient

> Example Request (JPY):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "JPY",
          "type": "japanese",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "6470",
           "branchCode": "100",
           "accountType": "CURRENT",
           "accountNumber": "1234567"
           }
        }'
```

Send payments to Japan.

Private and business recipients are supported. 

Recipient type = *'japanese'*

Required details: bankCode, branchCode accountNumber, accountType (CURRENT, SAVINGS, CHECKING), 

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create KES Recipient

> Example Request (KES Bank Account):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "KES",
          "type": "kenya_local",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "35",
           "accountNumber": "0023183991919"
           }
        }'
```

> Example Request (KES Mobile MPESA):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "KES",
          "type": "kenya_mobile",
          "details": {
           "legalType": "PRIVATE",
           "accountNumber": "2547XXXXXXXX"
           }
        }'
```



Send payments to Kenya. 

Private and business recipients are supported. However please note that only individuals can hold MPESA accounts.

<br/>

Recipient type = *'kenya_local'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.

<br/>


OR 

<br/>


Recipient type = *'kenya_mobile'*

Required details: accountNumber - mobile number



## Create LKR Recipient

> Example Request (LKR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "LKR",
          "type": "srilanka",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "7214",
           "branchCode": "100",
           "accountNumber": "5060011118"
           }
        }'
```

<aside class="warning">
<b>Personal to personal: 4,999,999 LKR (~33,000 USD) per transfer <br/>
Business to personal, personal to business & business to business: 3,000,000 LKR (~20,000 USD) per transfer</b>
</aside>

Send payments to Sri Lanka. 

Private and business recipients are supported. 

Recipient type = *'srilanka'*

Required details: bankCode, branchCode, accountNumber

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.

## Create MAD Recipient

> Example Request (MAD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "MAD",
          "type": "morocco",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "BCMAMAMC",
           "accountNumber": "123456789012345678901234"
           }
        }'
```

Send payments to Morocco. 

Private and business recipients are supported. 260,000 MAD per transaction

Recipient type = *'morocco'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create MXN Recipient

> Example Request (MXN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "MXN",
          "type": "mexican",
          "details": {
           "legalType": "PRIVATE",
           "clabe": "032180000118359719"
           }
        }'
```

Send payments to Mexico. 

Private and business recipients are supported. 

Recipient type = *'mexican'*

Required details: clabe




## Create MYR Recipient

> Example Request (MYR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "MYR",
          "type": "malaysian",
          "details": {
           "legalType": "PRIVATE",
           "swiftCode": "ABNAMYKL",
           "accountNumber": "159012938613"
           }
        }'
```

Send payments to Malaysia. 

Private and business recipients are supported. Maximum amount is 10,000,000 MYR	per payment.

Recipient type = *'malaysian'*

Required details: swiftCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.




## Create NGN Recipient

> Example Request (NGN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "NGN",
          "type": "nigeria",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "044",
           "accountNumber": "0584412903"
           }
        }'
```

Send payments to Nigeria. 

Private and business recipients are supported. Maximum amount is 2,000,000 NGN per payment.


Recipient type = *'nigeria'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create NOK Recipient

> Example Request (NOK):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "NOK",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "DE89370400440532013000"
           }
        }'
```

Send payments to Norway. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN




## Create NPR Recipient

> Example Request (NPR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "NPR",
          "type": "nepal",
          "legalType": "PRIVATE",
          "details": {
           "bankCode": "977056",
           "accountNumber": "1234567890"
           }
        }'
```

<aside class="warning">
<b>Only sending payments to private recipients. Businesses recipients are not supported yet.</b>
</aside>

Send payments to Nepal. 

Private recipients are supported.
1mln NPR per transaction / per month for individual account. 

Recipient type = *'nepal'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create NZD Recipient

> Example Request (NZD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "NZD",
          "type": "newzealand",
          "details": {
           "legalType": "PRIVATE",
           "accountNumber": "03-1587-0050000-00"
           }
        }'
```

Send payments to New Zealand. 

Recipient type = *'newzealand'*

Required details: accountNumber




## Create PEN Recipient

> Example Request (PEN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "PEN",
          "type": "peru",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "BCON",
           "accountNumber": "12345678901234567890",
           "accountType": "CHECKING",
           "idDocumentType": "DNI",
           "idDocumentNumber": "09740475",
           "phoneNumber": "+51 987654321"
           }
        }'
```

Send payments to Peru. 

Private and business recipients are supported. 1,900 USD per transfer / 9,900 USD per 30 days.

Recipient type = *'peru'*

Required details: bankCode, accountNumber, accountType (CHECKING, SAVINGS), ID document type (DNI, RUC, C_EXT, PASSP), ID document number, recipient phone number

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.






## Create PHP Recipient

> Example Request (PHP):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "PHP",
          "type": "philippines",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "AMA",
           "accountNumber": "0044XXXXXXXX",
           "address" : {
              "country": "GB",
              "city": "London",
              "postCode": "10025",
              "firstLine": "50 Branson Ave"
             }
          }
        }'
```


Send payments to Philippines. 

Private and business recipients are supported. 480,000 PHP per payment.

Recipient type = *'philippines'*

Required details: bankCode, accountNumber, recipient address

You can get list of bank and country codes by using /v1/quotes/{quoteId}/account-requirements endpoint.





## Create PKR Recipient

> Example Request (PKR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "PKR",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "PK89370400440532013000"
           }
        }'
```

<aside class="warning">
<b>Only private customers sending payments to private recipients. Business customers and business recipients are not supported yet.</b>
</aside>

Send payments to Pakistan. Max 1 million PKR per payment.

Recipient type = *'iban'*

Required details: IBAN




## Create PLN Recipient

> Example Request (PLN IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "PLN",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "PL89370400440532013000"
           }
        }'
```

> Example Request (PLN Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "PLN",
          "type": "polish",
          "details": {
           "legalType": "PRIVATE",
           "accountNumber": "109010140000071219812874"
           }
        }'
```

Send payments to Poland. 

Private and business recipients are supported. 

<br/>

Recipient type = *'iban'*

Required details: IBAN

<br/>

OR 

<br/>


Recipient type = *'polish'*

Required details: accountNumber

 
 

## Create RON Recipient

> Example Request (RON):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "RON",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "RO89370400440532013000"
           }
        }'
```

Send payments to Romania. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN






## Create RUB Recipient

> Example Request (RUB):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "RUB",
          "type": "russiarapida",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "041234567",
           "accountNumber": "40820810999999999999",
           "russiaRegion": "ALTAIKRAI",
           "address" : {
              "country": "GB",
              "city": "London",
              "postCode": "10025",
              "firstLine": "50 Branson Ave"
             }
           }
        }'
```


<aside class="warning">
<b>Only payments to private recipients. Businesses recipients are not supported yet.</b>
</aside>

Send payments to Russia. 

Recipient type = *'russiarapida'*

Required details: bankCode, accountNumber, region, recipient address

You can get list of bank, region and country codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create SEK Recipient

> Example Request (SEK IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "SEK",
          "type": "iban",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "SE89370400440532013000"
           }
        }'
```

> Example Request (SEK Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "SEK",
          "type": "sweden_local",
          "details": {
           "legalType": "PRIVATE",
           "clearingNumber": "1234",
           "accountNumber": "1234567"
           }
        }'
```

> Example Request (SEK BankGiro):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "SEK",
          "type": "bankgiro",
          "details": {
           "legalType": "PRIVATE",
           "bankgiroNumber": "1234-5678"
           }
        }'
```




Send payments to Sweden. 

Private and business recipients are supported. 

<br/>

Recipient type = *'iban'*

Required details: IBAN

<br/>

OR 

<br/>


Recipient type = *'sweden_local'*

Required details: clearingNumber, accountNumber

<br/>

OR 

<br/>


Recipient type = *'bankgiro'*

Required details: bankgiroNumber




## Create SGD Recipient

> Example Request (SGD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "SGD",
          "type": "singapore",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "7418",
           "accountNumber": "1238827822"
           }
        }'
```


Send payments to Singapore. 

Private and business recipients are supported. 

Recipient type = *'singapore'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.




## Create THB Recipient

> Example Request (THB):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "THB",
          "type": "thailand",
          "details": {
           "legalType": "PRIVATE",
           "bankCode": "002",
           "accountNumber": "9517384260"
           "address" : {
              "country": "GB",
              "city": "London",
              "postCode": "10025",
              "firstLine": "50 Branson Ave"
             }
           }
        }'
```

Send payments to Thailand. Max 2 mln THB per payment.

Private and business recipients are supported. 

Recipient type = *'thailand'*

Required details: bankCode, accountNumber

You can get list of bank and country codes by using /v1/quotes/{quoteId}/account-requirements endpoint.




## Create TRY Recipient

> Example Request (TRY):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "TRY",
          "type": "turkish_earthport",
          "details": {
           "legalType": "PRIVATE",
           "IBAN": "TR330006100519786457841326"
           }
        }'
```

Send payments to Turkey. 

Private and business recipients are supported. 1 000 000 TRY per payment.	

Recipient type = *'turkish_earthport'*

Required details: IBAN


## Create UAH Recipient

> Example Request (UAH):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "UAH",
          "type": "privatbank",
          "details": {
           "legalType": "PRIVATE",
           "phoneNumber": "777210012",
           "accountNumber": "2662"
           }
        }'
```


<aside class="warning">
<b>Only sending payments to private recipients. Businesses recipients are not supported yet.</b>
</aside>

Send payments to Ukraine. Maximum 1,2m UAH per payment.

Recipient type = *'privatbank'*

Required details: 

* phoneNumber   = Use phone number registered in Privat Bank
* accountNumber = Last 4 digits of UAH PrivatBank card






## Create USD Recipient

> Example Request (USD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "USD",
          "type": "aba",
          "details": {
           "legalType": "PRIVATE",
           "abartn": "111000025",
           "accountNumber": "12345678",
           "accountType": "CHECKING",
           "address" : {
              "country": "GB",
              "city": "London",
              "postCode": "10025",
              "firstLine": "50 Branson Ave"
             }
           }
        }'
```


Send payments to USA. 

Private and business recipients are supported. Max 1 Million USD per payment.


Recipient type = *'aba'*

Required details: 

* abartn        = ACH Routing number
* accountNumber = Recipient bank account number
* accountType   = CHECKING or SAVINGS
* address       = Recipient address





## Create VND Recipient

> Example Request (VND):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "VND",
          "type": "vietname_earthport",
          "details": {
           "legalType": "PRIVATE",
           "swiftCode": "ABBKVNVX",
           "branchCode": "001",
           "accountNumber": "1234567890"
           }
        }'
```

Send payments to Vietnam. 

Private and business recipients are supported. 

Recipient type = *'vietname_earthport'*

Required details: swiftCode, branchCode, accountNumber

You can get list of bank  and branc codes by using /v1/quotes/{quoteId}/account-requirements endpoint.






## Create ZAR Recipient

> Example Request (ZAR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts" \
     -H "Authorization: Bearer <your api token>" \
     -H "Content-Type: application/json" \
     -d '{ 
          "profile": <your profile id>,
          "accountHolderName": "<recipient name>",
          "currency": "ZAR",
          "type": "southafrica",
          "details": {
           "legalType": "PRIVATE",
           "swiftCode": "ALBRZAJJ",
           "accountNumber": "0000000052312891"
           }
        }'
```


Send payments to South African Republic. 

Private and business recipients are supported. 

Recipient type = *'southafrica'*

Required details: swiftCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.





