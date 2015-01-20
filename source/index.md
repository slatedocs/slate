---
title: eDNA API Reference

language_tabs:
  - java
  - php

toc_footers:
  - eDNA API Reference Beta v1.0.7

includes:	
  - TransactionMonitoring
  - KYCconsumer
  - QuizResponseIDAnalytics
  - QuizResponsePhoneValidation
  - FeedbackFinalApplicationResult
  - appendixA
  - appendixB
  - appendixC
  - appendixD
  - appendixE

search: true

---

# eDNA API Reference

## Transaction Evaluation

The IdentityMind Engine exports a REST based Web Service interface over HTTPS, using JSON to encode service request and response data.

A typical merchant / IdentityMind interaction to validate a transaction is shown below:

![](http://i.imgur.com/4o540Tw.png)

## Authentication

IdentityMind uses an SSL Server certificate for the client to authenticate the service.  The merchant is authenticated using HTTP basic authentication (over HTTPS) via a merchant name and password/license key that is supplied when the merchant registers for the service. 

<link rel="icon" href="http://www.identitymindglobal.com/wp-content/uploads/2013/05/Favicon.png" type="image/png">