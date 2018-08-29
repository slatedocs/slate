# Recipients API Guide

## Create AED recipient

> Example Request (AED):

```shell
curl -X POST "https://api.sandbox.transferwise.tech/v1/accounts"
     -H "Authorization: Bearer <your api token>"
{
    "profile": <your profile id>,
    "accountHolderName": "<recipient name>",
    "currency": "AED",
    "type": "emirates",
    "legalType": "PRIVATE",
    "details": {
	   "IBAN": "AE070331234567890123456"
     }
  }
```

Send payments to United Arab Emirates. 

Private and business recipients are supported. 

Recipient type = *'emirates'*

Required details: IBAN

## Create ARS recipient

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

## Create AUD recipient

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

## Create BDT recipient

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


## Create BGN recipient

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

## Create BRL recipient

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


## Create CAD recipient

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

## Create CHF recipient

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


## Create CLP recipient

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


## Create CNY recipient

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

## Create CZK recipient

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


## Create DKK recipient

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




## Create EGP recipient

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


## Create EUR recipient

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


## Create GBP recipient

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


## Create GEL recipient

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


## Create GHS recipient

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



## Create HKD recipient

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



## Create HRK recipient

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


## Create HUF recipient

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


## Create IDR recipient

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


## Create ILS recipient

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



## Create INR recipient

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


## Create JPY recipient

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


## Create KES recipient

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



## Create LKR recipient

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

## Create MAD recipient

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



## Create MXN recipient

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




## Create MYR recipient

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




## Create NGN recipient

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



## Create NOK recipient

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




## Create NPR recipient

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


## Create NZD recipient

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




## Create PEN recipient

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






## Create PHP recipient

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





## Create PKR recipient

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




## Create PLN recipient

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

 
 

## Create RON recipient

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






## Create RUB recipient

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



## Create SEK recipient

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




## Create SGD recipient

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




## Create THB recipient

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




## Create TRY recipient

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


## Create UAH recipient

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






## Create USD recipient

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





## Create VND recipient

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






## Create ZAR recipient

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





