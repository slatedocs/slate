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
  - pagination
  - ordering
  - filtering
  - metadata
  - changelog
  - methods
  - methods/accounts
  - methods/collections
  - methods/collection_requests
  - methods/contacts
  - methods/payments
  - methods/webhooks

search: true
---
# Introduction

> Scroll down for examples.

Welcome to Beyonic's API documentation.

The Beyonic API is [REST](http://en.wikipedia.org/wiki/Representational_state_transfer) based. We provide libraries for several languages, including PHP, Java, Ruby and Python. You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

All responses shall be returned using [JSON](http://www.json.org/), however, if you are using the language libraries, the JSON responses will be converted into native, language specific objects.

# Quick Start

Can't wait to dive in? Follow the 6 steps below to get started.

1. [Sign Up](https://app.beyonic.com/signup/) for a Beyonic account.
2. [Login](https://app.beyonic.com/) and get your API Token by clicking the user icon on the top left corner, and selecting 'Profile' from the dropdown menu. The API Token is shown at the bottom of the page.
3. Download the appropriate client library from links in the "Libraries" section of this reference.
4. Using your API token and the library, connect to the API endpoint: https://app.beyonic.com/api
5. Identify the methods you need to use. See the "Methods" section of this reference.
6. Profit!
