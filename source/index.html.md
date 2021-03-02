---
title: Beyonic API Reference

language_tabs:
  - shell: CURL
  - php: PHP
  - ruby: RUBY
  - python: PYTHON
  - java: JAVA

toc_footers:
  - <a href='http://support.beyonic.com'>Beyonic Support & User Guides</a>
  - <a href='http://beyonic.com'>Beyonic.com</a>
  - <a href='mailto:support@beyonic.com?subject="Error in your docs!"'>Found an error?</a>

includes:
  - libraries
  - versioning
  - authentication
  - duplicate_requests
  - errors
  - throttling
  - pagination
  - ordering
  - filtering
  - metadata
  - testing
  - changelog
  - collecting_funds
  - collecting_funds/collection_requests
  - collecting_funds/collections
  - sending_funds
  - sending_funds/payments
  - methods
  - methods/currencies
  - methods/networks
  - methods/banks
  - methods/accounts
  - methods/transactions
  - methods/contacts
  - methods/events
  - methods/webhooks

search: true
---
# Introduction

> Scroll down for examples.

Welcome to Beyonic's API documentation.

The Beyonic API is [REST](http://en.wikipedia.org/wiki/Representational_state_transfer) based. We provide libraries for several languages, including PHP, Java, Ruby and Python. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

All responses shall be returned using [JSON](http://www.json.org/), however, if you are using the language libraries, the JSON responses will be converted into native, language specific objects.

# Quick Start

Can't wait to dive in? Follow the 5 steps below to get started.

1. [Sign Up](https://app.beyonic.com/signup/) for a Beyonic account.
2. [Login](https://app.beyonic.com/) and get your API Token by clicking your user name on the bottom left of the left sidebar menu and selecting ‘Manage my account’ from the dropdown menu. The API Token is shown at the very bottom of the page.
3. Download the appropriate [client library](https://apidocs.beyonic.com/#client-libraries).
4. Using your API token and the library, connect to the API endpoint: https://api.beyonic.com/api
5. Identify the methods you need to use.
   - [Receiving Money](https://apidocs.beyonic.com/#receiving-money)
   - [Sending Money](https://apidocs.beyonic.com/#sending-money)
   - [Other Actions](https://apidocs.beyonic.com/#other-actions)

In client libraries, 

- Zapier - Beyonic provides zapier triggers and actions in “Invite Only” mode. Please [contact us](mailto:enterprise-support@mfsafrica.com) if you would like to use Zapier with Beyonic’s API.
