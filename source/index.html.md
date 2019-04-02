--- 

title: Sila API Documentation

language_tabs:
   - plaintext: specs
   - javascript
   - python
   - java
   - go

toc_footers:
   - Version 0.2 (Beta)
  
includes:
   - security
   - endpoints
   - message-types
   - message-obj-ref
   - tran-errors

search: true 

--- 

# Introduction 

```
Code will be shown in this panel.
```

Welcome to the Sila API!

Sila allows you to build financial applications quickly and easily. Our APIs enable 

* **ID Verification** compliant with **US KYC** regulations, 
* **Secure Account Linking** through our partner **Plaid**, 
* **ACH transfers** in the US, and 
* **Smart Contract** programming on Ethereum with our ERC-20 stablecoin. 

We will soon be adding support for **Card payments**, **Business Verification**, and **International payments** systems. 

By using us for peer-to-peer money transfers, you can:

- decrease your go-to-market time (no regulatory headache or flaky bank partnerships)
- dramatically decrease your upfront costs
- easily access KYC ("know your customer") verification tools
- securely link bank account information using Plaid
- keep sensitive data off of your servers
- let us handle ACH transactions (send us JSON, not flat files)

## Getting Started
>>>>>>> 5749b6d6e76ccfbd74bfa9cf80505611ba60fb4b

To use our API endpoints, you will need to get registered on our [Developer Console](https://console.silamoney.com/), which should be available after our open-beta launch. Registration includes a KYC verification process, which should take less than 24 hours.

Once you have been verified, you can register apps with us. Each app will have an associated private key and handle. Keep these application keys *secure*; leave them out of your source code and never store them in an unsafe place. If they are ever compromised, please immediately replace your app keys from the Developer Console.

## Initializing SDKs

```plaintext
Currently-available SDKs:

- Python
- Node/JavaScript
```

```java
// No SDK available in Java yet. Check back later!
```

```go
// No SDK available in Go yet. Check back later!
```

While the API is accessible via HTTP requests through any language, we have provided some official SDKs to simplify implementation.

If there is an SDK available for our example languages, the code snippets in these docs will use it.

### Node/JavaScript SDK

```javascript
// Installation:
npm i sila-sdk

// Usage:
sila = require('sila-sdk/lib/index.js');

sila.configure({
    appKey: APPLICATION_PRIVATE_KEY,
    appHandle: APPLICATION_HANDLE,
})

// Switch to production when app is enabled for access;
// SDK uses the sandbox environment by default.
//sila.disableSandbox();
```

The current version is designed as a singleton, so you will need to use `require` to use the library.

Then, set up the private key and handle for the SDK to use for signing subsequent requests with `configure`. The other SDK functionality will not be available until this configuration is completed. The SDK does not store this information outside of the instance that is configured. It is never transmitted over the network or stored outside the scope of that instance.

For simplicity and consistency, all API calls return a Promise. All success and failure responses are passed into the `.then()` callback method. Only unhandled errors such as network issues, etc., are handled in the `.catch()` callback.

### Python SDK

```python
# Installation:
pip3 install silasdk

# Usage:
from silasdk import App
from silasdk import User
from silasdk import Transaction

silaApp = App("SANDBOX", app_private_key, app_handle)
```

Version 0.2 requires Python version >= 3.6. This SDK abstracts the signature piece for signing the messages locally using users' private keys.

Initialization sets up the app private key and handle for the SDK to use for signing subsequent requests. *The other SDK functionality will not be available until this configuration is completed.* The SDK does not store this information outside of the instance that is configured. Private keys are never transmitted over the network or stored outside the scope of that instance.

## Production Access

When you sign up through the developer console and obtain an app key, you will immediately be granted sandbox access. This means that you will be able to authenticate requests made to the `sandbox.silamoney.com` domain. However, requests made to our sandbox will not move any real money, and the resulting SILA tokens will be on a testnet contract, not a mainnet contract.

When you've tested your implementation, you can request production access for an app key through the Developer Console. If production access is granted, you will be able to make successful requests to the `api.silamoney.com` domain.

### Sila HTTPS Domains

| Environment | Domain | Description |
| :---------: | ------ | ----------- |
| Sandbox | `sandbox.silamoney.com` | Requests to this domain will not result in actual KYC verification or real-money transfers. Tokens will be on a Rinkeby testnet contract. |
| Production | `api.silamoney.com` | Requests to this domain must use real KYC verification data; transaction requests will result in real-money transfers. Tokens will be on a mainnet contract. |

## Endpoint Flow

This section describes a high-level overview of how our API might be used and the order in which our endpoints might be called.

### User Registration

Users added to an application must have a private key and handle (along with KYC information so that we can send them through a KYC verification process).

1. Generate a private key for the user. You can have them generate/manage it themselves.
2. Either randomly generate a handle or allow the user to pick a handle for themselves. The handle should be checked against the [/check_handle](#check_handle) endpoint for availability.
3. The user must pass in their required *KYC information* (see [entity message type](#entity_msg)) and the *address derived from the user's private key*. This information should be used to populate a [/register](#register) request.
4. It may take some time for the KYC process to complete, and a success response from /register only means that the verification process has started, not that the user has been verified. Subsequent [/check_kyc](#check_kyc) requests are the only way to know whether the person's information has been verified. 

*Note that most of the endpoints require a signature from the user's private key in addition to the developer's private key.*

### Bank Account Linking

Bank account linking is provided through our partner, Plaid. 

On the client side of your application, integrate [Plaid Link](https://plaid.com/docs/#creating-items-with-plaid-link), obtain the public token from your user's interaction with the interface, then send it on to our [/link_account](#link_account) endpoint.

In order to make public tokens that we can use, you will need to use our public key in your Plaid calls. You should gain access to this key when you register. Check out our demo app to see what other parameters we use!

As of writing, responses at the /link_account endpoint are synchronous, meaning that a success response indicates a successfully-linked bank account.

### Token Transfers

The SILA token is used to exchange USD value among users. For example, this would be the process of transferring $51.73 from user A to user B:

1. Users A and B successfully pass KYC in our system.
2. Users A and B successfully link their bank accounts.
3. [/issue_sila](#issue_sila) is called for user A, requesting issuance of 5173 SILA to their Ethereum address.
4. $51.73 is debited from A's bank account and sent to our backend, where it will be traded for US Treasuries.
5. When the $51.73 transaction is marked as "finally settled," which takes 2-3 business days, 5173 SILA are minted at user A's Ethereum address.
6. During this process, you can poll [/get_transactions](#get_transactions) to check the status of this transaction.
7. When user A has 5173 SILA, those SILA can be transferred to user B's address either with the [/transfer_sila](#transfer_sila) endpoint or directly over the blockchain (which will incur variable "gas costs" in Ethereum for which the developer is responsible). The transaction can only be tracked with /get_transactions if the /transfer_sila endpoint was called; otherwise, you can use something like Etherscan to monitor the transaction yourself.
8. When user B has 5173 SILA at their address, they can then have [/redeem_sila](#redeem_sila) called for them, requesting 5173 SILA to be redeemed.
9. 5173 SILA are immediately burned from B's address and the process of crediting $51.73 to their linked bank account from our backend is started. (If crediting fails, perhaps due to the bank account being closed, the transaction will be rolled back, thus re-minting the SILA at B's address.)
10. Thus, A has been debited $51.73 and B has been credited $51.73.

*Note: this does not take any per-transaction fees into account.* ***No fees are currently applied on transactions in this beta version of the API.***
