---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:

  - user/overview
  - user/get
  - user/put

  - power zone/overview
  - power zone/get
  - power zone/put

  - heart rate zone/overview
  - heart rate zone/get
  - heart rate zone/put

  - workouts/overview
  - workouts/create
  - workouts/get
  - workouts/update
  - workouts/index
  - workouts/delete

  - workout summary/overview
  - workout summary/get
  - workout summary/put

  - errors

search: true
---

# Introduction

Welcome to the Wahoo Fitness API! You can use our API to access Wahoo Fitness API endpoints, which can get information on your  user profile and workout history stored in our database.

We have language bindings in Shell! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

# Authentication

> To authorize, use this code:


```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer <Token>"
```

> Make sure to replace `<Token>` with your API key.

Wahoo Fitness uses API keys to allow access to the API. You can register a new Wahoo Fitness API key at our [developer portal](http://developers.wahooligan.com).

Wahoo Fitness endpoints expect the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer <Token>`

<aside class="notice">
You must replace <code><Token></code> with your personal API key.
</aside>


