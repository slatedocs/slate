# Message Types

Request bodies, also called "messages," are required to have particularly-structured JSON. These message types have names, making it easier to identify exactly what structure you need in the endpoint you need to use.

We have a public JSON schema [here](https://api.silamoney.com/PROD/getschema?schema=SilaSchema).

## header_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints**:

- [/check_handle](#check_handle)
- [/check_kyc](#check_kyc)

**JSON structure**:

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | This object is required in every call. The information it includes is used to verify the signature. Object reference [here](#header) | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `header_msg`. | true |

## entity_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/register](#register)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header` | object | Object reference [here](#header). This object is required in every call. The information it includes is used to verify the signature. | true |
| `message` | string | This tag specifies the JSON schema object to validate against. For this call, use `entity_msg`. | true |
| `address` | object | Object reference [here](#address). This object specifies the street address of the person being verified. | true |
| `identity` | object | Object reference [here](#identity). This is used to specify an ID and what kind of ID is being specified. (As of writing, Sila only accepts social security numbers, but this will expand in the future.) | true |
| `contact` | object | Object reference [here](#contact). This is where the verified person's phone number and email address are sent. | true |
| `crypto_entry` | object | Object reference [here](#crypto_entry). Used to specify the blockchain address and network code it runs on. | true |
| `entity` | object | Object definition [here](#entity). Includes names, birthdates, and user type. | true |

## get_users_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/get_users](#)

**JSON Structure:**

TODO

## link_account_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/link_account](#)

**JSON Structure:**

TODO

## get_accounts_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/get_accounts](#)

**JSON Structure:**

TODO

## issue_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/issue_sila](#issue_sila)

**JSON Structure:**

TODO

## transfer_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/transfer_sila](#transfer_sila)

**JSON Structure:**

TODO

## redeem_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/redeem_sila](#redeem_sila)

**JSON Structure:**

TODO

## get_transactions_msg

```json
{
  "header": {
    "created": 1234567890, 
    "auth_handle": "handle.silamoney.eth", 
    "user_handle":"user.silamoney.eth", 
    "version": "v1_1", 
    "crypto": "ETH", 
    "reference": "ref"
  }, 
  "message": "header_msg"
}
```

**Used By Endpoints:**

- [/get_transactions](#get_transactions)

**JSON Structure:**

TODO
