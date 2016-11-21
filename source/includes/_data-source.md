# Data Source Setup

Geezeo provides robust transaction enrichment for partner and aggregated accounts. The first step in any implementation is connecting the platform to a data source for all partner accounts.

Geezeo provides a standard XML specification for harvesting transactions and accounts. Partners must provide an endpoint that meets the XML specifications below to provide data.

The Geezeo platform will harvest users data based on a predefined schedule. 

Geezeo also provides a file transfer using the same XML spec. File transfers are often used in larger implementations for bulk data.  

## Customer User data format

> Users Request XML

```xml
<PartnerRequest
    signature="PartnerSignature" 
    id="2" 
    sso_partner_id="abc122">
  <UserList>
    <Users>
      <User>
        <PartnerCustomerId>1234</PartnerCustomerId>
      </User>
    </Users>
  </UserList>
</PartnerRequest>
```


> Users Response XML


```xml
<PartnerResponse
    signature="PartnerSignature" 
    request_id="2">
  <Users>
    <User>
      <Action>New</Action>
      <PartnerCustomerId>123</PartnerCustomerId>
      <FirstName>FirstName</FirstName>
      <LastName>LastName</LastName>
      <Email>flastname@geezeo.com</Email>
      <ZipCode>06000</ZipCode>
      <UserExperience>pfm</UserExperience>
    </User>
  </Users>
</PartnerResponse>
```


Geezeo will request a list of users by sending User elements containing only their PartnerCustomerIds.

Validating a [Partner Signature Request](#PartnerSignatureRequest) and generating a [Partner Signature Response](#PartnerSignatureResponse).

Tag | Type | Usage | Description |
----|------|-------|-------------|
\<Users> | Container | Required |Contains all \<User> records in the set |
\<User> | Container | Required | Contains data defining a single customer |
\<Action> | [Enum](#ActionType)| Required | If this element is left out, Geezeo will attempt to update the record, or add it if it does not exist; specify “Delete" if the account is to be deleted |
\<PartnerCustomerId> | String (255) | Required; Unique | Unique alphanumeric ID; used to identify the customer and match accounts to it |
\<FirstName> | String (255) | Required | Customer's first name|
\<LastName> |String (255) | Required | Customer's last name |
\<Email> | String (255) | Required | Customer's email address; should be a properly formatted email address |
\<ZipCode> | String (255) | Required |Customer's zip code; should be a valid US postal code |
\<UserExperience> | String (255) | Optional |Customer user experience (PFM or TruBiz) |


## Customer Account data format

> Accounts Request XML

```xml
<PartnerRequest
    signature="PartnerSignature" 
    id="2" 
    sso_partner_id="abc122">
  <AccountList>
      <Accounts>
        <Account>
          <PartnerCustomerId>4453</PartnerCustomerId>
        </Account>
      </Accounts>
    </AccountList>
</PartnerRequest>
```


> Accounts Response XML


```xml
<PartnerResponse
    signature="PartnerSignature" 
    request_id="2">
  <Accounts>
    <Account>
      <Action>NEW</Action>
      <PartnerCustomerId>12345</PartnerCustomerId>
      <AccountId>999</AccountId>
      <AccountFiName>JOHN Q PUBLIC</AccountFiName>
      <AccountNickname>John's Savings</AccountNickname>
      <AccountType>Savings</AccountType>
      <AccountBalances>
        <AccountBalance>
          <BalanceType>Current</BalanceType>
          <BalanceAmount>1999.99</BalanceAmount>
          <CurrencyCode>USD</CurrencyCode>
        </AccountBalance>
      </AccountBalances>
      <AccountExperience>pfm</AccountExperience>
    </Account>
  </Accounts>
</PartnerResponse>
```
Geezeo will request a list of accounts belonging to a user by sending an Account element containing only the user's PartnerCustomerId. You may optionally respond with updated account information instead of all account information. We will create any accounts that do not exist in the Geezeo database, update any accounts that do exist, and mark as closed any accounts that are in the Geezeo database but not in the response.

Validating a [Partner Signature Request](#PartnerSignatureRequest) and generating a [Partner Signature Response](#PartnerSignatureResponse).

Tag | Type | Usage | Description |
----|------|-------|-------------|
\<Accounts> | Container | Required | Contains all \<Account> records in the set |
\<Account> | Container | Required | Contains data defining a single account |
\<Action> | [Enum](#ActionType) | Optional | If this element is left out, Geezeo will attempt to update the record, or add it if it does not exist; specify “Delete" if the account is to be deleted |
\<PartnerCustomerId> | String (255) | Required | Matches the account with the proper customer |
\<AccountId> | String (255) |Required; Unique| |Unique ID, may contain letters and numbers; used to identify the account and match transactions to it. Full credit card numbers must not be sent as the account ID. |
\<AccountNumber> | String (255) | Optional | Further identifying information show to the user in certain circumstances to help identify the account to them. Full credit card numbers must not be supplied. |
\<AccountFiName> | String (255) | Required | Account name as provided by partner |
\<AccountNickname> | String (255) | Optional |Account nickname if set by partner |
\<AccountType> | [Enum](#AccountType) | Required | Account type from closed list
\<AccountBalances> | Container | Required |Contains [\<AccountBalance>\(#AccountBalance) elements|
\<Properties> | Container | Optional | Contains [\<Property>](#Properties) elements |
\<AccountExperience> | String (255) | Optional | Account experience (PFM or Trubiz)

<a name="AccountBalance"></a>

| AccountBalance | Type | Usage | Description |
| -------------- | ---- | ----- | ----------- | 
\<BalanceType> | [Enum](#BalanceType) | Required | The type of balance |
\<BalanceAmount> | Decimal | Required |The relative value of the balance type to two decimal places, e.g. 505.12 or -1110.56; a negative number should be preceded by a minus sign. Two decimal places are always required, even for .00 amounts. |
\<CurrencyCode> | [Enum](#CurrencyType) | Required | The currency code (currently only USD or CAD) |

<a name="BalanceType"></a>

### BalanceType (Deposit Accounts)

| Value Name | Usage | Description |
| ---------- | ----- | ----------- |
Current | Required | The amount currently in the account without any holds |
Available | Optional | The amount after any holds; the effective balance |

### BalanceType (Credit Accounts)

| Value Name | Usage | Description |
| ---------- | ----- | ----------- |
CurrentLimit | Optional | Current charge limit |
AvailableCredit | Optional | Amount left to spend after any charges |
Outstanding | Required | Amount currently charged to card |
CashAdvanceLimit | Optional | Limit on cash advances |
MinimumPaymentDue | Optional | Current minimum payment due |
PreviousAmountDue | Optional | Previous minimum payment due |
PastDueAmount | Optional | Past due amount |
FinanceCharges | Optional | Finance charges for current bill |

### <a name="Properties"></a> Properties Container

The properties container is used to define non-balance based information and statistics. For example, in the future, items such as reward points, airline miles, and special promotion information would be provided through the properties container.

| Tag | Type | Usage | Description |
| --- | ---- | ----- | ----------- |
\<Property> | Container | Required | Contains property information|
\<PropertyType> | [Element](#PropertyType)| Required | The type of property in the record|
\<PropertyValue> | String (255) | Required | The property's value |

### <a name="PropertyType"></a> Property Types

| Tag | Type | Usage | Description |
| --- | ---- | ----- | ----------- |
PurchasesApr | Decimal | Optional | APR for Purchase with one decimal of precision; e.g. 24.5% would be 25.5, not .255|
PaymentDueDate | DateTime | Optional | Due date for current pay period |
InternalTransaction | String (255) | Optional | Add type to internal transaction with these possible options: “bill pay", “transfer"; added for clarity to user |

## Customer Transaction data format

> Transactions Request XML

```xml
<PartnerRequest
    signature="PartnerSignature" 
    id="2" 
    sso_partner_id="abc122">
 <TransactionList>
    <AccountId>12345</AccountId>
    <LastTransactionId>9876</LastTransactionId>
  </TransactionList>
</PartnerRequest>
```


> Trasactions Response XML


```xml
<PartnerResponse
    signature="PartnerSignature" 
    request_id="2">
  <Transactions>
    <Transaction>
      <TransactionId>12345</TransactionId>
      <AccountId>9999901</AccountId>
      <TransactionType>Debit</TransactionType>
      <PostedDate>2009-03-19T11:40:50-04:00</PostedDate>
      <OriginationDate>2009-03-19T15:31:36-04:00</OriginationDate>
      <Amount>112.03</Amount>
      <Pending>true</Pending>
      <Memo>DUNKINDONUTS*100094</Memo>
    </Transaction>
  </Transactions>

</PartnerResponse>
```

Geezeo will request a list of transactions belonging to a particular account by sending a TransactionList element containing an AccountId. We may provide you with the last TransactionId that we received. In that case, please respond with only transactions newer than that transaction. If we do not provide a TransactionId (for example when adding a new user), simply respond with all transactions.


Tag | Type | Usage | Description |
--- | ---- | ----- | ----------- |
\<Transactions> | Container | Required | Contains all \<Transaction> records in the file |
\<Transaction> | Container | Required | Contains data defining a single transaction |
\<Action> | [Enum](#ActionType) | Required | If this element is left out, Geezeo will attempt to update the record, or add it if it does not exist; specify “Delete" if the transaction is to be deleted |
\<TransactionId> | String (255) | Required; Unique | Unique alphanumeric ID; used to identify the transaction. This must be unique within each account, and never change. |
\<AccountId> | String(255) | Required | Used to match the transaction with its account |
\<TransactionType> | Closed List | Required | “Debit" for a negative transaction, “Credit" for a positive transaction |
\<PostedDate> | DateTime | Required | The time that the transaction posted to the user's account |
\<OriginationDate> | DateTime | Optional | The time the transaction actually occurred |
\<Amount> | Decimal | Required | The absolute value of the transaction; do not use a dash to indicate a negative number. Two decimal places are required, even if they amount is even (5.00). |
\<Pending> | Closed List | Optional | If this is a pending transaction, pass “true"; otherwise do not include this field |
\<Memo> | String (255) | Required | The transaction description. What is provided in this field should match what's shown on the users statement, and/or in the FIs OLB |
\<CheckNumber> | String (255) | Optional | If the transaction is a check, a check number may be included in this field. |


## Partner Request

> Request Format

```xml
<PartnerRequest
    signature="PartnerSignature" 
    id="2" 
    sso_partner_id="abc122">
    <!-- Payload -->
</PartnerRequest>
```

All requests will come within a Partner Request. 

Attribute | Type | Element | Description
--------- | ---- | ------- | -----------
signature | String(128) | PartnerRequest, PartnerResponse | Contains authentication data
id | Integer | PartnerRequest | An integer to identify the request. These request IDs will be unique per day, but no tracking or verification is necessary.
sso_partner_id | String(128) | PartnerRequest | This value is identical to the partner_id value submitted in the SSO assertion. It can be used by Resellers that use a single end point for all related FIs as a differentiator, if the PartnerCustomerId values are not globally unique.
request_id | Integer | PartnerResponse | The value of this attribute must be the value of the “id" attribute from the corresponding PartnerRequest.

## Validating a Request Signature

###Signature Verification

1. Retrieve the signature from the complete XML request
2. Extract the inner portion of the XML request body
3. Generate a signature for this portion of the body, using the steps outlined above 4. Ensure the signature generated matches the signature provided by the request

In order for the partner to authenticate Geezeo's requests, and for Geezeo to authenticate the partner's responses, the partner will be issued an API key. This key will never be included in any request or response, rather it will be used as a “shared secret" to generate a signature for each request and response.

The API key may also be used to identify the partner that the request is targeted at if necessary; for instance, if multiple partners are served through the same partner API.

Each request from Geezeo, as well as each response from the partner, will include a signature that is calculated the exact same way. The steps for signature generation and verification are outlined below.


## Partner Response

> Request Format

```xml
<PartnerResponse
    signature="PartnerSignature" 
    request_id="2">
    <!-- Payload -->
</PartnerResponse>

```

All responses should be come in the form of a PartnerResponse. 

Attribute | Type | Element | Description
--------- | ---- | ------- | -----------
signature | String(128) | PartnerRequest, PartnerResponse | Contains authentication data
id | Integer | PartnerRequest | An integer to identify the request. These request IDs will be unique per day, but no tracking or verification is necessary.
sso_partner_id | String(128) | PartnerRequest | This value is identical to the partner_id value submitted in the SSO assertion. It can be used by Resellers that use a single end point for all related FIs as a differentiator, if the PartnerCustomerId values are not globally unique.
request_id | Integer | PartnerResponse | The value of this attribute must be the value of the “id" attribute from the corresponding PartnerRequest.

## Generating a Response Signature

In order for the partner to authenticate Geezeo's requests, and for Geezeo to authenticate the partner's responses, the partner will be issued an API key. This key will never be included in any request or response, rather it will be used as a “shared secret" to generate a signature for each request and response.

The API key may also be used to identify the partner that the request is targeted at if necessary; for instance, if multiple partners are served through the same partner API.

Each request from Geezeo, as well as each response from the partner, will include a signature that is calculated the exact same way. The steps for signature generation and verification are outlined below.


### Signature Generation

1. Generate the inner portion of the XML request body
2. Remove any leading and trailing whitespace from each line, and then remove any newline
characters.
3. Generate a SHA512 hash of this body
4. XOR this hash with the hexadecimal decoded version of the partner's API key
5. Convert the result to hexadecimal (low nibble first)
Once a signature has been generated, place it in the “signature" attribute of the top level XML element, which will be PartnerRequest or PartnerResponse.

## Signature Example

> Example Partner Request

```xml
<PartnerRequest
signature="2385432dff1286f507acaec2485b14cdef92e669da759b2f30824eb
844a6d6ad11d36968ce62d99556dda62449495189b5d688cc8d2c820288b34d8a7
01af783" id="1" sso_partner_id="abc123">
  <AccountList>
    <Accounts>
      <Account>
        <PartnerCustomerId>2358475</PartnerCustomerId>
      </Account>
    </Accounts>
  </AccountList>
</PartnerRequest>
```

> Example payload - note : no spaces or line feeds

```xml
<AccountList><Accounts><Account><PartnerCustomerId>2358475</PartnerCustomerId></Account></Accounts></AccountList>
```

> Example api key
```
2385432dff1286f507acaec2485b14cdef92e669da759b2f30824eb844a6d6ad11d36968ce62d99556dda62449495189b5d688cc8d2c820288b34d8a701af783
```

Using the example to the right. The payload should be used for the signature. 

The payload is the actual request body inside the PartnerRequest.

Using an example key.
 
 2385432dff1286f507acaec2485b14cdef92e669da759b2f30824eb844a6d6ad11d36968ce62d99556dda62449495189b5d688cc8d2c820288b34d8a701af783
 
The SHA512 of that




## Reporting Errors

> Error Response

```xml
<Errors>
  <Error>
    <Code>500</Code>
    <Description>
      Unable to find account 12345 for member 99999.
    </Description>
</Error>
  ...
</Errors>
```


If an API request cannot be processed, please include any applicable errors by code and/or description in the body of the response.


## General reused types

### <a name="AccountType"></a> Account Types

|AccountType | Description |
|-----------| ------------ |
| checking | Checking Account |
| savings | Savings Account |
| cards | Credit Card Account |
| autos | Auto Loan | 
| home | Mortgage |
| loan | Other Loan type account not listed specifically |
| asset | Other Asset type account not listed specifically |
| investment | Investment Accounts (positions/transactions will not be created) |

### <a name="ActionType"></a> Action Types

|ActionType|
|-----------|
|New|
|Update|
|Delete|

