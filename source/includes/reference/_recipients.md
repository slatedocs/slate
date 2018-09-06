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
    "id": 31273058,
    "profile": <your profile id>, 
    "accountHolderName": "Ann Johnson",
    "type": "sort_code", 
    "country": "GB", 
    "currency": "GBP",
    "details": {
        "legalType": "PRIVATE",
        "accountNumber": "28821822",
        "sortCode": "231470"
    }
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

GBP example is provided here. You can find other currency examples below.<br/>
Please also look at [Recipients.Requirements](#recipient-accounts-requirements) to figure out which fields are required to create recipients in specific countries.


### Request

**`POST https://api.sandbox.transferwise.tech/v1/accounts`**

Field                 | Description                                   | Format
---------             | -------                                       | -----------
currency              | 3 character currency code                     | Text
type                  | Recipient type                                | Text
profile               | Personal or business profile id               | Integer
accountHolderName     | Recipient full name                           | Text
details               | Currency specific group, see Recipients API   | 
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
details               | Currency specific group, see Recipients API   | 
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

> Example Response (Create email recipient):

```json
{
    "id": 31273058,
    "profile": <your profile id>, 
    "accountHolderName": "Ann Johnson",
    "type": "email", 
    "currency": "EUR",
    "details": {
          "email": "ann.johnson@gmail.com"
    }
}

```
If you don't know recipient bank account details you can set up **email recipient** so that TransferWise will collect bank details directly from the recipient. 

TransferWise will then email your recipient with a link to collect their bank account details. 
Once recipient provides bank account details securely to Transferwise we are able to complete your transfer.



## Get By Id
> Example Request:

```shell

curl -X GET https://api.sandbox.transferwise.tech/v1/accounts/{accountId} \
     -H "Authorization: Bearer <your api token>" 
```

> Example Response:

```json
{
    "id": 31273058,
    "profile": <your profile id>, 
    "accountHolderName": "Ann Johnson",
    "type": "sort_code", 
    "country": "GB", 
    "currency": "GBP",
    "details": {
        "legalType": "PRIVATE",
        "accountNumber": "28821822",
        "sortCode": "231470"
    }
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
      "id": 31273058,
      "profile": <profileId>, 
      "accountHolderName": "Ann Johnson",
      "type": "sort_code", 
      "country": "GB", 
      "currency": "GBP",
      "details": {
          "legalType": "PRIVATE",
          "accountNumber": "28821822",
          "sortCode": "231470"
      }
  },
  {
      "id": 31273090,
      "profile": <profileId>, 
      "accountHolderName": "George Johnson",
      "type": "sort_code", 
      "country": "GB", 
      "currency": "GBP",
      "details": {
          "legalType": "PRIVATE",
          "accountNumber": "29912211",
          "sortCode": "231470"
      }
  }
]

```
Fetch list of your recipient accounts. Filter by currency and/or by user profile Id.
This list does not currently support pagination.
Therefore if you have very many recipient accounts defined in your business profile then please filter by currency to ensure a reasonable response time.


### Request
**`GET https://api.sandbox.transferwise.tech/v1/accounts?s?profile=<profileId>&currency=<currencyCode>`**

Both query parameters are optional.

Field                             | Description                                   | Format
---------                         | -------                                       | -----------
profileId                         | Personal or business profile id               | Integer
currency                          | Currency code                                 | Text


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
You could even build a dynamic user interface on top of these endpoints. 
This is a step-by-step guide on how these endpoints work.

1.Create quote first to specify currencies and transfer amounts. See [Create.Quote](#quotes-create).

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

Analyze the list of fields. Because refreshRequirementsOnChange=true for field 'address.country' then this indicates that there are additional fields required depending on the selected value.

3.Construct a recipient object with top level fields and call POST /v1/quotes/{quoteId}/account-requirements with these value to expose sub fields.  <br/>
For example posting US as country will also add "state" to list of fields.<br/>
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

But posting GB as country will not add new fields anything.

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


4.So once you get to the point where you have provided values for all fields which have refreshRequirementsOnChange=true then you have complete set of fields to compose a valid request to create an recipient object. 
For example this is a valid request to create a recipient with address in US Arizona:
<br/> POST /v1/accounts:<br/>
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
These URLs are also included in fields provided by [Recipients.Requirements](#recipients-requirements) endpoint.

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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "ARS",
    "type": "argentina",
    "legalType": "PRIVATE",
    "details": {
	   "taxId": "20-34149938-1",
	   "accountNumber": "0110482420048200036238"
     }
  }
```

Send payments to Argentina. 

Private and business recipients are supported. 

Recipient type = *'argentina'*

Required details: taxId, accountNumber

## Create AUD Recipient

> Example Request (AUD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "AUD",
    "type": "australian",
    "legalType": "PRIVATE",
    "details": {
	   "bsbCode": "023604",
	   "accountNumber": "123456789"
     }
  }
```

Send payments to Australia. 

Private and business recipients are supported. 

Recipient type = *'australia'*

Required details: bsbCode, accountNumber

## Create BDT Recipient

> Example Request (BDT):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "BDT",
    "type": "bangladesh",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "015",
	   "branchCode": "015270362",
	   "accountNumber": "5060011118"
     }
  }
```

<aside class="warning">
We only support private customers sending payments to private recipients. Businesses customers are not supported yet.
</aside>


Send payments to Bangladesh. 

Recipient type = *'iban'*

Required details: bankCode, branchCode, accountNumber

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create BGN Recipient

> Example Request (BGN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "BGN",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "BG89370400440532013000"
     }
  }
```

Send payments to Bulgaria. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN

## Create BRL Recipient

> Example Request (BRL):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "BRL",
    "type": "brazil",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "218",
	   "branchCode": "1234",
	   "accountNumber": "12345678-9",
	   "accountType": "CHECKING",
	   "cpf": "123.456.789-12",
	   "phoneNumber": "+55 21 5555 5555"
     }
  }
```

Send payments to Brazil. 

Private and business recipients are supported. 

Recipient type = *'brazil'*

Required details: bankCode, branchCode, accountNumber, accountType (CHECKING or SAVINGS), cpf (tax reg no), recipient phone number

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create CAD Recipient

> Example Request (CAD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "CAD",
    "type": "canadian",
    "legalType": "PRIVATE",
    "details": {
	   "institutionNumber": "006",
	   "transitNumber": "04841",
	   "accountNumber": "1234567",
	   "accountType": "Checking",
	   
     }
  }
```

Send payments to Canada. 

Private and business recipients are supported. 

Recipient type = *'canadian'*

Required details: institutionNumber, transitNumber, accountNumber, accountType (Checking or Saving)

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.

## Create CHF Recipient

> Example Request (CHF):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "CHF",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "CH89370400440532013000"
     }
  }
```

Send payments to Switzerland. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create CLP Recipient

> Example Request (CLP):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "CLP",
    "type": "chile",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "504",
	   "accountNumber": "12345678901234567890",
	   "rut": "760864285",
	   "accountType": "CHECKING",
	   "phoneNumber": "+56 33 555 5555"
     }
  }
```

Send payments to Chile. 

Private and business recipients are supported. 

Recipient type = *'chile'*

Required details: bankCode, accountNumber, rut (Rol Único Tributario), accountType (CHECKING, SAVINGS, CUENTA_VISTA), recipient phone number


## Create CNY Recipient

> Example Request (CNY):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "CNY",
    "type": "chinese_card",
    "legalType": "PRIVATE",
    "details": {
	   "cardNumber": "6240008631401148"
     }
  }
```

Send payments to China Unionpay cardholder. 

Private and business recipients are supported. 

Recipient type = *'chinese_card'*

Required details: cardNumber

## Create CZK Recipient

> Example Request (CZK Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "CZK",
    "type": "czech",
    "legalType": "PRIVATE",
    "details": {
	   "prefix": "000000",
	   "accountNumber": "5060011118",
	   "bankCode": "5500"
     }
  }
```

> Example Request (CZK IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "CZK",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "CZ89370400440532013000"
     }
  }
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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "DKK",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "DK89370400440532013000"
     }
  }
```

Send payments to Denmark. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN




## Create EGP Recipient

> Example Request (EGP):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "EGP",
    "type": "egypt_local",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "ECBAEGCA",
	   "accountNumber": "123456789"
     }
  }
```

Send payments to Egypt. 

Private and business recipients are supported. 

Recipient type = *'egypt_local'*

Required details: bankCode, accountNumber (Swift code)

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create EUR Recipient

> Example Request (EUR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "EUR",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "DE89370400440532013000"
     }
  }
```

Send payments to Eurozone countries: Austria, Belgium, Cyprus, Estonia, Finland, France, Germany, Greece, Ireland, Italy, Latvia, Lithuania, Luxembourg, Malta, Netherlands, Portugal, Slovakia, Slovenia, Spain.

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create GBP Recipient

> Example Request (GBP Sort Code):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "GBP",
    "type": "sort_code",
    "legalType": "PRIVATE",
    "details": {
	   "sortCode": "40-30-20",
	   "accountNumber": "12345678"
     }
  }
```

> Example Request (GBP IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "GBP",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "GB89370400440532013000"
     }
  }
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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "GEL",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "GE89370400440532013000"
     }
  }
```

Send payments to Georgia.

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create GHS Recipient

> Example Request (GHS):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "GHS",
    "type": "ghana",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "030100",
	   "accountNumber": "0011XXXXXXXXXX"
     }
  }
```

Send payments to Ghana.

Private and business recipients are supported. 

Recipient type = *'ghana'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create HKD Recipient

> Example Request (HKD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "HKD",
    "type": "hongkong",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "307",
	   "accountNumber": "005-231289-112"
     }
  }
```

Send payments to Hong Kong.

Private and business recipients are supported. 

Recipient type = *'hongkong'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create HRK Recipient

> Example Request:

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "HRK",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "HR89370400440532013000"
     }
  }
```

Send payments to Croatia.

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN


## Create HUF Recipient

> Example Request (HUF Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "HUF",
    "type": "hungarian",
    "legalType": "PRIVATE",
    "details": {
	   "accountNumber": "12000000-12345678-00000000"
     }
  }
```

> Example Request (HUF IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "HUF",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "HU89370400440532013000"
     }
  }
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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "IDR",
    "type": "indonesian",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "610306",
	   "accountNumber": "6789112345678"
     }
  }
```


Send payments to Indonesia.

Private and business recipients are supported. 

Recipient type = *'indonesian'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create ILS Recipient

> Example Request (ILS IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "ILS",
    "type": "israeli_local",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "IL620108000000099999999"
     }
  }
```

> Example Request (ILS Local Bank Code):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "ILS",
    "type": "israeli_bank_code",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "054",
	   "branchCode": "001",
	   "accountNumber": "123456789"
     }
  }
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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "INR",
    "type": "indian",
    "legalType": "PRIVATE",
    "details": {
	   "ifscCode": "YESB0236041",
	   "accountNumber": "678911234567891",
	   
     }
  }
```


Send payments to India.

Private and business recipients are supported. 

Recipient type = *'indian'*

Required details: ifscCode, accountNumber


## Create JPY Recipient

> Example Request (JPY):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "JPY",
    "type": "japanese",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "6470",
	   "branchCode": "100",
	   "accountType": "CURRENT",
	   "accountNumber": "1234567"
     }
  }
```

Send payments to Japan.

Private and business recipients are supported. 

Recipient type = *'japanese'*

Required details: bankCode, branchCode accountNumber, accountType (CURRENT, SAVINGS, CHECKING), 

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create KES Recipient

> Example Request (KES Bank Account):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "KES",
    "type": "kenya_local",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "35",
	   "accountNumber": "0023183991919"
     }
  }
```

> Example Request (KES Mobile MPESA):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "KES",
    "type": "kenya_mobile",
    "legalType": "PRIVATE",
    "details": {
	   "accountNumber": "2547XXXXXXXX"
     }
  }
```



Send payments to Kenya. 

Private and business recipients are supported. 

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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "LKR",
    "type": "srilanka",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "7214",
	   "branchCode": "100",
	   "accountNumber": "5060011118"
     }
  }
```

Send payments to Sri Lanka. 

Private and business recipients are supported. 

Recipient type = *'srilanka'*

Required details: bankCode, branchCode, accountNumber

You can get list of bank and branch codes by using /v1/quotes/{quoteId}/account-requirements endpoint.

## Create MAD Recipient

> Example Request (MAD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "MAD",
    "type": "morocco",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "BCMAMAMC",
	   "accountNumber": "123456789012345678901234"
     }
  }
```

Send payments to Morocco. 

Private and business recipients are supported. 

Recipient type = *'morocco'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create MXN Recipient

> Example Request (MXN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "MXN",
    "type": "mexican",
    "legalType": "PRIVATE",
    "details": {
	   "clabe": "032180000118359719"
     }
  }
```

Send payments to Mexico. 

Private and business recipients are supported. 

Recipient type = *'mexican'*

Required details: clabe




## Create MYR Recipient

> Example Request (MYR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "MYR",
    "type": "malaysian",
    "legalType": "PRIVATE",
    "details": {
	   "swiftCode": "ABNAMYKL",
	   "accountNumber": "159012938613"
     }
  }
```

Send payments to Malaysia. 

Private and business recipients are supported. 

Recipient type = *'malaysian'*

Required details: swiftCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.




## Create NGN Recipient

> Example Request (NGN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "NGN",
    "type": "nigeria",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "044",
	   "accountNumber": "0584412903"
     }
  }
```

Send payments to Nigeria. 

Private and business recipients are supported. 

Recipient type = *'nigeria'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create NOK Recipient

> Example Request (NOK):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "NOK",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "DE89370400440532013000"
     }
  }
```

Send payments to Norway. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN




## Create NPR Recipient

> Example Request (NPR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "NPR",
    "type": "nepal",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "977056",
	   "accountNumber": "1234567890"
     }
  }
```

Send payments to Nepal. 

Private and business recipients are supported. 

Recipient type = *'nepal'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.


## Create NZD Recipient

> Example Request (NZD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "NZD",
    "type": "newzealand",
    "legalType": "PRIVATE",
    "details": {
	   "accountNumber": "03-1587-0050000-00"
     }
  }
```

Send payments to New Zealand. 

Private and business recipients are supported. 

Recipient type = *'newzealand'*

Required details: accountNumber




## Create PEN Recipient

> Example Request (PEN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "PEN",
    "type": "peru",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "BCON",
	   "accountNumber": "12345678901234567890",
	   "accountType": "CHECKING",
	   "idDocumentType": "DNI",
	   "idDocumentNumber": "09740475",
	   "phoneNumber": "+51 987654321"
     }
  }
```

Send payments to Peru. 

Private and business recipients are supported. 

Recipient type = *'peru'*

Required details: bankCode, accountNumber, accountType (CHECKING, SAVINGS), ID document type (DNI, RUC, C_EXT, PASSP), ID document number, recipient phone number

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.






## Create PHP Recipient

> Example Request (PHP):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "PHP",
    "type": "philippines",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "AMA",
	   "accountNumber": "0044XXXXXXXX",
	   "address" : {
	      "country": "GB",
	      "city": "London",
	      "postCode": "10025",
	      "firstLine": "50 Branson Ave"
       }
    }
  }
```


Send payments to Philippines. 

Private and business recipients are supported. 

Recipient type = *'philippines'*

Required details: bankCode, accountNumber, recipient address

You can get list of bank and country codes by using /v1/quotes/{quoteId}/account-requirements endpoint.





## Create PKR Recipient

> Example Request (PKR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "PKR",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "PK89370400440532013000"
     }
  }
```


Send payments to Pakistan. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN




## Create PLN Recipient

> Example Request (PLN IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "PLN",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "PL89370400440532013000"
     }
  }
```

> Example Request (PLN Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "PLN",
    "type": "polish",
    "legalType": "PRIVATE",
    "details": {
	   "accountNumber": "109010140000071219812874"
     }
  }
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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "RON",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "RO89370400440532013000"
     }
  }
```

Send payments to Romania. 

Private and business recipients are supported. 

Recipient type = *'iban'*

Required details: IBAN






## Create RUB Recipient

> Example Request (RUB):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "RUB",
    "type": "russiarapida",
    "legalType": "PRIVATE",
    "details": {
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
  }
```


Send payments to Russia. 

Private and business recipients are supported. 

Recipient type = *'russiarapida'*

Required details: bankCode, accountNumber, region, recipient address

You can get list of bank, region and country codes by using /v1/quotes/{quoteId}/account-requirements endpoint.



## Create SEK Recipient

> Example Request (SEK IBAN):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "SEK",
    "type": "iban",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "SE89370400440532013000"
     }
  }
```

> Example Request (SEK Local):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "SEK",
    "type": "sweden_local",
    "legalType": "PRIVATE",
    "details": {
	   "clearingNumber": "1234",
	   "accountNumber": "1234567"
     }
  }
```

> Example Request (SEK BankGiro):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "SEK",
    "type": "bankgiro",
    "legalType": "PRIVATE",
    "details": {
	   "bankgiroNumber": "1234-5678"
     }
  }
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
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "SGD",
    "type": "singapore",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "7418",
	   "accountNumber": "1238827822"
     }
  }
```


Send payments to Singapore. 

Private and business recipients are supported. 

Recipient type = *'singapore'*

Required details: bankCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.




## Create THB Recipient

> Example Request (THB):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "THB",
    "type": "thailand",
    "legalType": "PRIVATE",
    "details": {
	   "bankCode": "002",
	   "accountNumber": "9517384260"
	   "address" : {
	      "country": "GB",
	      "city": "London",
	      "postCode": "10025",
	      "firstLine": "50 Branson Ave"
       }
     }
  }
```

Send payments to Thailand. 

Private and business recipients are supported. 

Recipient type = *'thailand'*

Required details: bankCode, accountNumber

You can get list of bank and country codes by using /v1/quotes/{quoteId}/account-requirements endpoint.




## Create TRY Recipient

> Example Request (TRY):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "TRY",
    "type": "turkish_earthport",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "TR330006100519786457841326"
     }
  }
```

Send payments to Turkey. 

Private and business recipients are supported. 

Recipient type = *'turkish_earthport'*

Required details: IBAN


## Create UAH Recipient

> Example Request (UAH):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "UAH",
    "type": "privatbank",
    "legalType": "PRIVATE",
    "details": {
	   "phoneNumber": "777210012",
	   "accountNumber": "2662"
     }
  }
```


Send payments to Ukraine. 

Private and business recipients are supported. 

Recipient type = *'privatbank'*

Required details: 

* phoneNumber   = Use phone number registered in Privat Bank
* accountNumber = Last 4 digits of UAH PrivatBank card






## Create USD Recipient

> Example Request (USD):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "USD",
    "type": "aba",
    "legalType": "PRIVATE",
    "details": {
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
  }
```


Send payments to USA. 

Private and business recipients are supported. 

Recipient type = *'aba'*

Required details: 

* abartn        = ACH Routing number
* accountNumber = Recipient bank account number
* accountType   = CHECKING or SAVINGS
* address       = Recipient address





## Create VND Recipient

> Example Request (VND):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "VND",
    "type": "vietname_earthport",
    "legalType": "PRIVATE",
    "details": {
	   "swiftCode": "ABBKVNVX",
	   "branchCode": "001",
	   "accountNumber": "1234567890"
     }
  }
```

Send payments to Vietnam. 

Private and business recipients are supported. 

Recipient type = *'vietname_earthport'*

Required details: swiftCode, branchCode, accountNumber

You can get list of bank  and branc codes by using /v1/quotes/{quoteId}/account-requirements endpoint.






## Create ZAR Recipient

> Example Request (ZAR):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "ZAR",
    "type": "southafrica",
    "legalType": "PRIVATE",
    "details": {
	   "swiftCode": "ALBRZAJJ",
	   "accountNumber": "0000000052312891"
     }
  }
```


Send payments to South African Republic. 

Private and business recipients are supported. 

Recipient type = *'southafrica'*

Required details: swiftCode, accountNumber

You can get list of bank codes by using /v1/quotes/{quoteId}/account-requirements endpoint.





