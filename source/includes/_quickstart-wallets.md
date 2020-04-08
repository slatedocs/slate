## <em>Quickstart Wallets 🚧</em>

<aside class="notice">
Please note: wallets are not available by default. Please speak to the Goji integrations team if you wish to use this functionality.
</aside>

This guide gives a brief overview of how to do the following, using the wallet API:

- Register parties
- Create wallets
- Registering a payment destination outside the system to send money to
- Make an outbound payment

Please ensure you also read the complete documentation for each API.

All money held in wallets is eMoney and therefore might not be suitable for all use cases. Let us know if you have questions.

- [Payments API](/#payments-managers)

## Registering parties

In our payments system we refer to all different types of entity as a Party. In the case of [registering a company](/#payments-manager-post-companies) you will receive a `partyId` in the response. This will look something like `COM~d28360c5-07a3-4d78-ade4-bddcdd8b5502` and is our reference to that entity which will be used to create wallets under that party.

It's worth noting that money in wallets underneath this party will be held in their name. For example, if we registered Goji under the wallet API, money held in any wallet under that party would be owned by Goji. Likewise if we registered a Borrower in the P2P space, any money in wallets under that borrower is owned by the Borrower.

Registering new parties is an asynchronous process therefore the party will not be ready for use straight away. You will receive a [webhook](/#webhooks-company_registration_update) when the party is ready for use.

## Creating wallets

Once you've received the webhook from the previous stage letting you know the party is registered, you will be ready to create wallets for that party.

Wallets are created under the [Managing Wallets API](/#payments-manager-post-wallets).

Creating a wallet is an asynchronous action due to slow responses from downstream providers. Once you create a wallet for a given party you'll receive a unique `id` for the wallet in the HTTP response. This is then used in any subsequent wallet related calls. You'll receive a [webhook](/#webhooks-wallet_created) when the wallet is enabled and ready for use.

## Registering a payment destination outside the system to send money to

In order to send money outside of the system we need to register the recipient bank details and run AML checks on them. You can use the [bank destination API](/#payments-manager-post-platformapi-bankaccountdetails) to add new accounts and these can be registered once for use across multiple party wallets.

This is also an asynchronous action so you'll receive a [webhook](/#webhooks-bank_account_details_status_changed) once they've passed AML and are ready to use.

## Make an outbound payment

Once you have the wallet created and the destination account enabled, you're ready to send money. To do this you can use the [wallet payment API](/#payments-manager-post-wallets-id-payment). Please note that we currently do not support sending in multiple currencies via this API. If this is a problem please get in touch.

Once a payment has cleared we will update you via [webhook](/#webhooks-wallet_transfer_cleared).
