# Flow

## User Registration

Users added to an application must have an Ethereum private key and handle, then they need to be sent through a KYC verification process.

1. Generate a private key for the user (or have them generate/manage it themselves).
2. Either randomly generate a handle or allow the user to pick a handle for themselves. The handle should be checked against the [/check_handle](#check_handle) endpoint for availability.
3. The user must pass in their required KYC information (see [entity message type](#entity_msg)). This information should be used to populate a [/create_entity](#create_entity) request.
4. It may take some time for the KYC process to complete, and a success response from /create_entity only means that the verification process has started, not that the user has been verified. Subsequent [/check_kyc](#check_kyc) requests are the only way to know whether the person's information has been verified. 

*Note that the rest of the endpoints, including /check_kyc, require a signature, not only from the developer's private key, but also from the user's private key.*

## Bank Account Linking

Bank account linking is provided through our partner, Plaid. 

On the client side of your application, integrate [Plaid Link](https://plaid.com/docs/#creating-items-with-plaid-link), obtain the public token from your user's interaction with the interface, then send it on to our [/link_account](#link_account) endpoint.

In order to make public tokens that we can use, you will need to use our public key in your Plaid calls. You should gain access to this key when you register, or you can check out our demo app to see what parameters we use.

As of writing, responses at the /link_account endpoint are synchronous, meaning that a success response indicates a successfully-linked bank account.

## Token Transfers

The SILA token is used to exchange USD value among users. For example, this would be the process of transferring $5.17 from user A to user B:

1. Users A and B successfully pass KYC in our system.
2. Users A and B successfully link their bank accounts.
3. [/issue_sila](#issue_sila) is called for user A, requesting issuance of 517 SILA to their Ethereum address.
4. $5.17 is debited from A's bank account and sent to our backend, where it will be traded for US Treasuries.
5. When the $5.17 transaction is marked as "finally settled," which takes 2-3 business days, 517 SILA are minted at user A's Ethereum address.
6. During this process, you can poll [/get_transactions](#get_transactions) to check the status of this transaction.
7. When user A has 517 SILA, those SILA can be transferred to user B's address either with the [/transfer_sila](#transfer_sila) endpoint or directly over the blockchain (which will incur variable "gas costs" in Ethereum for which the developer is responsible). The transaction can only be tracked with /get_transactions if the /transfer_sila endpoint was called; otherwise, you can use something like Etherscan to monitor the transaction yourself.
8. When user B has 517 SILA at their address, they can then have [/redeem_sila] called for them, requesting 517 SILA to be redeemed.
9. 517 SILA are immediately burned from B's address and the process of crediting $5.17 to their linked bank account from our backend is started. (If crediting fails, perhaps due to the bank account being closed, the transaction will be rolled back, thus re-minting the SILA at B's address.)
10. Thus, A has been debited $5.17 and B has been credited $5.17.

*Note: this does not take any per-transaction fees into account.*