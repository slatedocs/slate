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
   - flow
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

Sila allows you to transfer money among KYC-verified users with an underlying stablecoin. Our aim is to make this process simple and accessible, especially for innovators and disruptors.

## Getting Started

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
