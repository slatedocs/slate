# Transaction Error Codes

| Error Code | Meaning |
| ---------- | ------- |
| `ACH_ACCT_DNE` | A bank account with the given name does not exist under the user handle's linked accounts. |
| `ACH_ACCT_INVALID` | The specified bank account is invalid. It may be closed or have invalid values. |
| `ACH_INSUFF_FUNDS` | A bank account debit could not be completed due to insuffient funds. |
| `ACH_REJECTED` | For whatever reason, an ACH transaction was rejected. This could be due to suspected fraud. |
| `ACH_RETURN` | There was an ACH return on a transaction. |
| `ADDR_BLACKLISTED` | An address in this transaction is blacklisted. |
| `ADDR_INSUFF_FUNDS` | There are insufficient funds at the user handle's associated blockchain address. |
| `ADDR_INVALID` | Provided blockchain address for user handle is invalid. It could be that it is a smart contract address, is not a real address, or is not on our betalist (temporary whitelist). |
| `ADDR_NOT_BETALISTED` | An address in this transaction is not on the contract's betalist (temporary whitelist). |
| `APPL_LIMIT` | The request count limit has been reached for the current application. |
| `BLOCK_TIMEOUT` | The transaction timed out on the blockchain and can be retried. |
| `EMERGENCY_FLAG` | All further transactions are temporarily disabled on the Sila platform. |
| `FEE_INSUFF_FUNDS` | The address specified to pay the transaction fee had insufficient funds. |
| `NON-ACH_TRANS_UNSUPPORTED` | A non-ACH transaction was requested while non-ACH transactions are temporarily unsupported. |
| `RATE_LIMIT` | Too many transactions have been requested in a short span of time. Try waiting and retrying later. |
| `TRANS_AMNT_TOO_LOW` | The amount specified in the transaction was too low for it to complete. |
| `TRANS_AMNT_TOO_HIGH` | The amount specified in the transaction was higher than allowed transaction limit. |
| `TRANS_AMNT_INVALID` | The amount may have been for an issue or redeem transaction and been a decimal value; this would convert to a fraction of a cent, which is not permitted on bank account transactions. |
| `UNKNOWN` | This is an unknown error. Contact us ASAP if a transaction has this error code! |
| `USER_HANDLE_FROZEN` | This user is not permitted to transact at this time. |
| `USER_KYC_INCOMPLETE` | The user has not been KYC-verified. |
| Any code in <> | This is a specific issue on our end that we should fix. Contact us ASAP if you catch one of these! |