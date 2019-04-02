# Message Object References

These are objects referenced in the [Message Types](#message-types) section.

## header

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `auth_handle` | string | This is the superuser handle used to identify the API consumer making the call. | true |
| `user_handle` | string | This is the user handle attached to the KYC'd entity. | true |
| `created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `crypto` | string | This tag specifies the blockchain network to use. (As of writing, the only valid crypto tag available is `ETH`.) | true |
| `reference` | string | This is an idempotency string used to identify the call you've made. | true |
| `version` | string | This tag specifies the version of the API you want to use. (As of writing, the only valid version string to use is `0.2`.) | true |

**Referenced in Message Types:**

- [header_msg](#header_msg)
- [entity_msg](#entity_msg)
- [link_account_msg](#link_account_msg)
- [issue_msg](#issue_msg)
- [transfer_msg](#transfer_msg)
- [redeem_msg](#redeem_msg)
- [get_users_msg](#get_users_msg)
- [get_accounts_msg](#get_accounts_msg)
- [get_transactions_msg](#get_transactions_msg)

## address

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `address_alias` | string | This is a nickname that can be attached to the address object. While a required field, it can be left blank if desired. | true |
| `street_address_1` | string | This is line 1 of a street address. Post office boxes are not accepted in this field. | true |
| `street_address_2` | string | This is line 2 of a street address (optional). This may include suite or apartment numbers (though, if desired, you can put these in line 1). | false |
| `city` | string | Name of the city where the person being verified is a current resident. | true |
| `state` | string | Name of state where verified person is a current resident. (As of writing, this is a required field as the only accepted country is the US, but this may be expected to change in future versions.) | true |
| `country` | string | Two-letter country code. (As of writing, the only acceptable value is `US`.) | true |
| `postal_code` | string | In the US, this can be the 5-digit ZIP code or ZIP+4 code. | true |

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

## crypto_entry

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `crypto_alias` | string | A name to identify the address/code pairing. Can be left blank. | true |
| `crypto_code` | string | Code to identify network address is on. (As of writing, the only acceptable value is `ETH`.) | true |
| `crypto_address` | string | Hex-encoded blockchain address (prefixed with "0x"). | true |

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

## identity

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `identity_alias` | string | This describes what kind of ID is being sent. (As of writing, the only accepted value is `SSN`.) | true |
| `identity_value` | string | This is where the ID value would go. | true |

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

## contact

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `contact_alias` | string | Any name attached to the email/phone pair. If desired, leave empty, but don't leave out. | true |
| `email` | string | This is the verified person's email  | true |
| `phone` | string | This is the verified person's phone number. Please specify area code at a minimum and country code if anywhere but US. | true |

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

## entity

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `birthdate` | string | Date of birth/inception. Must be formatted YYYY-MM-DD. | true |
| `entity_name` | string | Full name of entity. This field is used because some names are "Last First" rather than the "First Last" format usually expected in the US; also allows inclusion of any middle names, titles, etc. | true |
| `first_name` | string | First name of entity. | true |
| `last_name` | string | Last name of entity. | true |
| `relationship` | string | This is the entity type. Specify `user` in this field to manage the entity as a user. | true |

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

## search_filters

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `transaction_id` | string | The UUID that Sila assigns to a transaction. | false |
| `reference_id` | string | The reference sent in the message header object when the transaction was first created. | false |
| `statuses` | string array | Possible values in the array include "pending", "complete", "successful", and "failed". An empty/absent array results in no filter on transaction status. | false |
| `transaction_types` | string array | Possible values in the array include "issue", "redeem", and "transfer". An empty/absent array just results in returning all types. | false |
| `max_sila_amount` | float | If specified and > 0, returns transactions with amounts less than or equal to this amount. | false |
| `min_sila_amount` | float | If specified and > 0, returns transactions with amounts greater than or equal to this amount. | false |
| `start_epoch` | integer | Nanosecond epoch time. If specified and is a date after 1969, returns transactions started after this date. | false |
| `end_epoch` | integer | Nanosecond epoch time. Returns transactions started before this date. | false |
| `page` | integer | Specifies page of results to return (default 1). | false |
| `per_page` | integer | Number of results to return in a single call (1-100, default 20). | false |
| `sort_ascending` | boolean | If true, returns the oldest transactions first instead of the newest first. | false |
| `show_timelines` | boolean | If true, adds a timeline array to each transaction object in the JSON response. | false |

**Referenced in Message Types:**

- [get_transactions_msg](#get_transactions_msg)
