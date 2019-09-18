# Payments


<a name="overview"></a>
## Overview
Interact with an investor's cash balance.


### Version information
*Version* : 1.0.0


### URI scheme
*Host* : api-sandbox.goji.investments
*BasePath* : /platformApi
*Schemes* : HTTPS


### Tags

* payments


### Consumes

* `application/json`


### Produces

* `application/json`

<a name="securityscheme"></a>
## Security

<a name="basicauth"></a>
### basicAuth
HTTP Basic Authentication over HTTPS. Only valid in Sandbox, HMAC should be used in production.

*Type* : basic


<a name="paths"></a>
## Paths

<a name="addbankaccountdetails"></a>
### Create a set of bank details.
```
POST /bankAccountDetails
```


#### Description
Create a set of bank details.


#### Parameters

|Type|Name|Description|Schema|
|---|---|---|---|
|**Body**|**bankDetails**  <br>*required*|The new bank account details|[BankDetails](#bankdetails)|


#### Responses

|HTTP Code|Description|Schema|
|---|---|---|
|**200**|ID of the created bank account details.|[CreatedBankAccountDetails](#createdbankaccountdetails)|
|**400**|Bad request.|[ErrorResponse](#errorresponse)|
|**401**|Unauthorised.|[ErrorResponse](#errorresponse)|
|**500**|Unexpected server error.|[ErrorResponse](#errorresponse)|


#### Consumes

* `application/json`


#### Produces

* `application/json`


#### Tags

* payments


#### Security

|Type|Name|



<a name="definitions"></a>
## Definitions

<a name="accountbalance"></a>
### Account Balance

|Name|Description|Schema|
|---|---|---|
|**isaRemainingSubscriptionAmount**  <br>*optional*|The remaining amount of new funds that can be added to the ISA this tax year. null if not an ISA balance|[MonetaryAmount](#monetaryamount)|
|**totalBalance**  <br>*optional*|The total balance. The sum of the invested, queued and cash balances.|[MonetaryAmount](#monetaryamount)|
|**totalCashBalance**  <br>*optional*|The total cash balance.|[MonetaryAmount](#monetaryamount)|
|**totalInvestedBalance**  <br>*optional*|The total invested balance.|[MonetaryAmount](#monetaryamount)|
|**totalQueuedInvestedBalance**  <br>*optional*|The total queued for investment.|[MonetaryAmount](#monetaryamount)|


<a name="accountbalances"></a>
### Account Balances

|Name|Description|Schema|
|---|---|---|
|**accounts**  <br>*optional*|A breakdown of the balances by account.|[accounts](#accountbalances-accounts)|
|**totalBalance**  <br>*optional*|The total balance. The sum of the invested, queued and cash balances.|[MonetaryAmount](#monetaryamount)|
|**totalCashBalance**  <br>*optional*|The total cash balance.|[MonetaryAmount](#monetaryamount)|
|**totalInvestedBalance**  <br>*optional*|The total invested balance.|[MonetaryAmount](#monetaryamount)|
|**totalQueuedInvestedBalance**  <br>*optional*|The total queued for investment.|[MonetaryAmount](#monetaryamount)|

<a name="accountbalances-accounts"></a>
**accounts**