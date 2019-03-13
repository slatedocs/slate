--- 

title: Sila API Documentation

language_tabs:
   - http: specs
   - javascript
   - python
   - java
   - go

toc_footers: 
   - <a href='#'>Sign Up for a Developer Key</a>
  
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

Sila allows you to usher users through a KYC process, link bank accounts through Plaid, and then transfer money among these users with an underlying stablecoin. Our aim is to make this process simple and accessible, especially for innovators and disruptors.

To get set up with using Sila, you'll need to obtain your own "**auth handle**" with a **set of keys**. In order to obtain these, a prospective developer must first go through an automated KYC vetting process. Visit the [quickstart guides](https://guide.silamoney.com/api/) to learn more.

Your keys will double as Ethereum private/public keys. You should *not* plan to hold large amounts of assets at the associated Ethereum address; these will be used in the API's [authentication mechanism](#authentication). While you will never pass your private key in an API call to Sila, you will be signing each request body and sending the resultant signature in a header.

Once you've gotten set up, you'll be ready to follow the recommended flow for using our API endpoints.
