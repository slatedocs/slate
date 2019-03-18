--- 

title: Sila API Documentation

language_tabs:
   - http: specs
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

Welcome to the Sila API! 

Sila allows you to transfer money among KYC-verified users with an underlying stablecoin. Our aim is to make this process simple and accessible, especially for innovators and disruptors.

### Getting Started

To get set up with using Sila, you'll need to obtain your own "**auth handle**" with a **set of keys**. In order to obtain these, a prospective developer must first go through an automated KYC vetting process. Visit the [quickstart guides](https://guide.silamoney.com/api/) to learn more.

The set of "auth keys" you receive can double as Ethereum private/public keys. These keys will be used in the API's [authentication mechanism](#authentication); you should *not* plan to hold large amounts of assets at the associated Ethereum address.

Once you've gotten set up, you'll be ready to follow the recommended flow for using our API endpoints.
