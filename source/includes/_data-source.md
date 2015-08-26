# Data Source Setup

The Geezeo platform provides a number of transaction enrichment and aggregation services. A key component of any partnership with Geezeo is setting up the data source where Geezeo will get partner accounts and transactions.

The transaction enrichment and aggregation services work on both partner and aggregated accounts. Partners do not need to do additional setup for aggregated accounts.

We have both an http api, as well as a file interface. The httpinterface is required, while the file interface can be used supplement http traffic for bulk processing.

## Customer User data format

> Users XML sample for either Flat File or SAX endpoint

```xml

<Users>
  <User>
    <Action>New</Action>
    <PartnerCustomerId>123</PartnerCustomerId>
    <FirstName>FirstName</FirstName>
    <LastName>LastName</LastName>
    <Email>flastname@geezeo.com</Email>
    <ZipCode>06000</ZipCode>
  </User>
</Users>

```


The Users call is used to create, update, or delete a user.

Tag | Type | Usage | Description |
----|------|-------|-------------|
\<Users> | Container | Required |Contains all \<User> records in the set |
\<User> | Container | Required | Contains data defining a single customer |
\<Action> | [ActionType](#ActionType)| Required | If this element is left out, Geezeo will attempt to update the record, or add it if it does not exist; specify “Delete” if the account is to be deleted |
\<PartnerCustomerId> | String (255) | Required; Unique | Unique alphanumeric ID; used to identify the customer and match accounts to it |
\<FirstName> | String (255) | Required | Customer’s first name|
\<LastName> |String (255) | Required | Customer’s last name |
\<Email> | String (255) | Required | Customer’s email address; should be a properly formatted email address |
\<ZipCode> | String (255) | Required\ |Customer’s zip code; should be a valid US postal code |


## Customer Account data format

> Accounts XML sample for either Flat File or SAX endpoint

```xml

<Accounts>
  <Account>
    <Action>NEW</Action>
    <PartnerCustomerId>12345</PartnerCustomerId>
    <AccountId>999</AccountId>
    <AccountFiName>JOHN Q PUBLIC</AccountFiName>
    <AccountNickname>John’s Savings</AccountNickname>
    <AccountType>Savings</AccountType>
    <AccountBalances>
      <AccountBalance>
        <BalanceType>Current</BalanceType>
        <BalanceAmount>1999.99</BalanceAmount>
        <CurrencyCode>USD</CurrencyCode>
      </AccountBalance>
    </AccountBalances>
  </Account>
</Accounts>

```


The Users call is used to create, update, or delete a user.

Tag | Type | Usage | Description |
----|------|-------|-------------|
\<Accounts> | Container | Required | Contains all \<Account> records in the set |
\<Account> | Container | Required | Contains data defining a single account |
\<Action> | [ActionType](#ActionType) | Optional | If this element is left out, Geezeo will attempt to update the record, or add it if it does not exist; specify “Delete” if the account is to be deleted |
\<PartnerCustomerId> | String (255) | Required | Matches the account with the proper customer |
\<AccountId> | String (255) |Required; Unique| |Unique ID, may contain letters and numbers; used to identify the account and match transactions to it. Full credit card numbers must not be sent as the account ID. |
\<AccountNumber> | String (255) | Optional | Further identifying information show to the user in certain circumstances to help identify the account to them. Full credit card numbers must not be supplied. |
\<AccountFiName> | String (255) | Required | Account name as provided by partner |
\<AccountNickname> | String (255) | Optional |Account nickname if set by partner |
\<AccountType> | [AccountType](#AccountType) | Required | Account type from closed list
\<AccountBalances> | Container | Required |Contains [\<AccountBalance>\(#AccountBalance) elements|
\<Properties> | Container | Optional | Contains [\<Property>](#Properties) elements |

<a name="AccountBalance"></a>

| AccountBalance | Type | Usage | Description |
| -------------- | ---- | ----- | ----------- | 
\<BalanceType> | [\<BalanceType>](#BalanceType) | Required | The type of balance |
\<BalanceAmount> | Decimal | Required |The relative value of the balance type to two decimal places, e.g. 505.12 or -1110.56; a negative number should be preceded by a minus sign. Two decimal places are always required, even for .00 amounts. |
\<CurrencyCode> | [\<CurrencyType>](#CurrencyType) | Required | The currency code (currently only USD or CAD) |

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
\<PropertyType> | [\<PropertyType>](#PropertyType)| Required | The type of property in the record|
\<PropertyValue> | String (255) | Required | The property’s value |

### <a name="PropertyType"></a> Property Types

| Tag | Type | Usage | Description |
| --- | ---- | ----- | ----------- |
PurchasesApr | Decimal | Optional | APR for Purchase with one decimal of precision; e.g. 24.5% would be 25.5, not .255|
PaymentDueDate | DateTime | Optional | Due date for current pay period |
InternalTransaction | String (255) | Optional | Add type to internal transaction with these possible options: “bill pay”, “transfer”; added for clarity to user |

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

