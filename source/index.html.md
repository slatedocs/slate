---
title: LossExpress Carrier API

includes:
  - activity_feed
  - claims
  - direct_messages
  - documents
  - letter_of_guarantee
  - payments
  - settlement_counters
  - errors

search: true

code_clipboard: true
---

# Introduction

Welcome to the LossExpress Carrier API! This API is designed for use by insurance carriers interested in triggering processing events within LossExpress and viewing the results of those events.

When going through the integration process with your organization’s systems and LossExpress, it’s important to keep in mind the idea at the core of the LossExpress product and underlying APIs: we act simply as a conduit of information, from carriers to lenders.

As a result, we have done our best when building out this API to give the power to make decisions to the carrier (where that power belongs), not ourselves.

# Authentication

Our Carrier API utilizes a standard OAuth 2.0 Client Credentials flow, where the external server authenticates itself using a provided client ID and client secret and is provided an access token that will be used on every request.

Once a token has been received, every request is expected to have a header that looks like the following:

`Authorization: Bearer exampletokenbutreplacewithyourown`

### HTTP Request
`POST https://exapi.lossexpress.com/oauth/token`

<aside class="notice">
You must replace <code>exampletokenbutreplacewithyourown</code> with the access token provided.
</aside>
