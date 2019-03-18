# Message Types

Request bodies, also called "messages," are required to have particularly-structured JSON. These message types have names, making it easier to identify exactly what structure you need in the endpoint you need to use.

We have a public JSON schema here: [https://api.silamoney.com/0.2/getschema?schema=SilaSchema](https://api.silamoney.com/0.2/getschema?schema=SilaSchema).

## header_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

| Key | Type | Description | Required |
| :-: | :--: | ----------- | :------: |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `header_msg`. | true |

**Used By Endpoints:**

- [/check_handle](#check_handle)
- [/request_kyc](#request_kyc)
- [/check_kyc](#check_kyc)

## entity_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "entity_msg",
  "address": {
    "address_alias": "Home Sweet Home",
    "street_address_1": "123 SW Main St. Apt 143",
    "city": "Portland",
    "state": "Oregon",
    "country": "US",
    "postal_code": "97000"
  },
  "identity": {
    "identity_alias": "SSN",
    "identity_value": "123452222"
  },
  "contact": {
    "contact_alias": "main",
    "phone": "5035035035",
    "email": "contact@silamoney.com"
  },
  "crypto_entry": {
    "crypto_alias": "primary",
    "crypto_code": "ETH",
    "crypto_address": "0x65a796a4bD3AaF6370791BefFb1A86EAcfdBc3C1"
  },
  "entity": {
    "first_name": "Holly",
    "last_name": "Golightly",
    "entity_name": "Holly Golightly",
    "birthdate": "1959-01-31",
    "relationship": "user"
  }
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `entity_msg`. | true |
| `address` | [object](#address) | This object specifies the street address of the person being verified. | true |
| `identity` | [object](#identity) | This is used to specify an ID and what kind of ID is being specified. (As of writing, Sila only accepts social security numbers, but this will expand in the future.) | true |
| `contact` | [object](#contact) | This is where the verified person's phone number and email address are sent. | true |
| `crypto_entry` | [object](#crypto_entry) | Used to specify the blockchain address and network code it runs on. | true |
| `entity` | [object](#entity) | Includes names, birthdates, and user type. | true |

**Used By Endpoints:**

- [/register](#register)

## link_account_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "link_account_msg",
  "public_token": "public_token_wH473vr",
  "account_name": "Chase Checking Account"
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `link_account__msg`. | true |
| `public_token` | string | This is the public token returned in the onSuccess function of a Plaid Link session. | true |
| `account_name` | string | This is the name given to the linked account. If omitted, it is "default". | false |
| `selected_account_id` | string | If one account is selected through Plaid Link, the ID found in the selected accounts array can be passed in here. If this is omitted, the endpoint will choose the first checking account it finds at the end-user's bank. | false |

**Used By Endpoints:**

- [/link_account](#)

## get_accounts_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "get_accounts_msg"
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `get_accounts__msg`. | true |

**Used By Endpoints:**

- [/get_accounts](#)

## issue_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "issue_msg",
  "amount": 1000,
  "account_name": "default"
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `issue__msg`. | true |
| `amount` | float | Amount of Sila to issue the handle (debits amount/100 from specified account and issues Sila amount at registered blockchain address). | true |
| `account_name` | string | Name of user handle's linked bank account to debit/credit. | true |

**Used By Endpoints:**

- [/issue_sila](#issue_sila)

## transfer_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "transfer_msg",
  "amount": 13,
  "destination": "user2.silamoney.eth"
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `transfer__msg`. | true |
| `destination` | string | Handle of recipient of Sila amount. | true |
| `amount` | float | Amount of Sila to transfer. | true |

**Used By Endpoints:**

- [/transfer_sila](#transfer_sila)

## redeem_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "redeem_msg",
  "amount": 1000,
  "account_name": "default"
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `redeem_msg`. | true |
| `amount` | float | Amount of Sila to burn; amount/100 is credited to user handle's specified account. | true |
| `account_name` | string | Name of user's linked account to be credited. | true |

**Used By Endpoints:**

- [/redeem_sila](#redeem_sila)

## get_transactions_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "0.2", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "get_transactions_msg",
  "search_filters": {
    "transaction_id": "some UUID string assigned by Sila",
    "reference_id": "the reference string sent in the header object when transaction request was made",
    "show_timelines": false,
    "sort_ascending": false,
    "max_sila_amount": 1300,
    "min_sila_amount": 1000,
    "statuses": ["pending", "successful", "failed", "complete"],
    "start_epoch": 1234567860,
    "end_epoch": 1234567891,
    "page": 1,
    "per_page": 20,
    "transaction_types": ["issue", "redeem", "transfer"]
  }
}
```

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | [object](#header) | This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `get_transactions_msg`. | true |
| `search_filters` | [object](#search_filters) | This is an optional object with all-optional attributes. The values inside this object filter the results to be returned. | false |

**Used By Endpoints:**

- [/get_transactions](#get_transactions)
