# Message Object References

These are objects referenced in the [Message Types](#message-types) section.

## header

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

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `header.created` | integer | Epoch time that the API call was started (in nanoseconds). | true |
| `header.auth_handle` | string | This is the superuser handle used to identify the API consumer making the call. | true |
| `header.user_handle` | string | This is the user handle attached to the KYC'd entity. | true |
| `header.reference` | string | This is an idempotency string used to identify the call you've made. | true |
| `header.version` | string | This tag specifies the version of the API you want to use. (As of writing, the only valid version string to use is `v1_1`.) | true |
| `header.crypto` | string | This tag specifies the blockchain network to use. (As of writing, the only valid crypto tag available is `ETH`.) | true |

## address

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `address.address_alias` | string | This is a nickname that can be attached to the address object. While a required field, it can be left blank if desired. | true |
| `address.street_address_1` | string | This is line 1 of a street address. Post office boxes are not accepted in this field. | true |
| `address.street_address_2` | string | This is line 2 of a street address. This may include suite or apartment numbers. | false |
| `address.city` | string | Name of the city where the person being verified is a current resident. | true |
| `address.state` | string | Name of state where verified person is a current resident. (As of writing, this is a required field as the only accepted country is the US, but this may be expected to change in future versions.) | true |
| `address.country` | string | Two-letter country code. (As of writing, the only acceptable value is `US`.) | true |
| `address.postal_code` | string | In the US, this can be the 5-digit ZIP code or ZIP+4 code. | true |

## crypto_entry

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `crypto_entry.crypto_alias` | string | A name to identify the address/code pairing. Can be left blank. | true |
| `crypto_entry.crypto_address` | string | Hex-encoded blockchain address. | true |
| `crypto_entry.crypto_code` | string | Code to identify network address is on. (As of writing, the only acceptable value is `ETH`.) | true |

## identity

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `identity.alias` | string | This describes what kind of ID is being sent. (As of writing, the only accepted value is `SSN`.) | true |
| `identity.identity_value` | string | This is where the ID value would go. | true |

## contact

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `contact.phone` | string | This is the verified person's phone number. Please specify area code at a minimum and country code if anywhere but US. | true |
| `contact.email` | string | This is the verified person's email address. | true |
| `contact.contact_alias` | string | Any name attached to the email/phone pair. If desired, leave empty, but don't leave out. | true |

## entity

**Referenced in Message Types:**

- [entity_msg](#entity_msg)

**JSON Structure:**

| Key | Type | Description | Required |
| --- | ---- | ----------- | -------- |
| `entity.birthdate` | string | Date of birth/inception. Must be formatted YYYY-MM-DD. | true |
| `entity.entity_name` | string | Full name of entity. This field is used because some names are "Last First" rather than the "First Last" format usually expected in the US. | true |
| `entity.first_name` | string | First name of entity. | true |
| `entity.last_name` | string | Last name of entity. | true |
| `entity.relationship` | string | This is the entity type. Specify `user` in this field to manage the entity as a user. | true |
