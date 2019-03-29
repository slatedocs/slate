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
Code snippets will be shown in this panel.
```

Welcome to the Sila API! 

Sila allows you to build financial applications quickly and easily. Our APIs enable 

* **ID Verification** compliant with **US KYC** regulations, 
* **Secure Account Linking** through our partner **Plaid**, 
* **ACH transfers** in the US, and 
* **Smart Contract** programming on Ethereum with our ERC-20 stablecoin. 

We will soon be adding support for **Card payments**, **Business Verification**, and **International payments** systems. 

### Getting Started

To get set up with using Sila, you'll need to obtain your own **developer handle** and register **set of keys**. Before doing this, a developer will have to go through an ID Verification process. Visit the [quickstart guides](https://guide.silamoney.com/api/) to learn more.

The set of "auth keys" you generate and use to access the API double as Ethereum private/public keys. These keys will be used in the API's [authentication mechanism](#authentication); you should **not** plan to hold large amounts of assets at the associated Ethereum address.

Once you've gotten set up, you'll be ready to follow the recommended flow for using our API endpoints.
