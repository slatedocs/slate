---
title: Wahoo Fitness API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='https://developers.wahooligan.com'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:

  - users/overview
  - users/show
  - users/update

  - power_zones/overview
  - power_zones/show
  - power_zones/update

  - heart_rate_zones/overview
  - heart_rate_zones/show
  - heart_rate_zones/update

  - workouts/overview
  - workouts/create
  - workouts/show
  - workouts/update
  - workouts/index
  - workouts/delete

  - workout_summaries/overview
  - workout_summaries/show
  - workout_summaries/create

  - workout_types
  - errors

search: true
---

# Introduction

Welcome to the Wahoo Fitness OAuth2 API! You can use our API to access Wahoo Fitness OAuth2 API endpoints, which can get information on your  user profile and workout history stored in our cloud.

We have language bindings in Shell! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## Data Model

This diagram shows how the data records are related within the API

[//]: # (Edit file here: https://drive.google.com/file/d/1cOpAiu_1DGkx8oLKtqP_uLMgk9d1x-vE/view?usp=sharing)
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="551px" viewBox="-0.5 -0.5 551 474" style="max-width:100%;max-height:474px;"><defs/><g><rect x="328" y="410" width="220" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)translate(438,0)scale(-1,1)translate(-438,0)" opacity="0.25"/><rect x="328" y="410" width="220" height="60" rx="9" ry="9" fill="#10739e" stroke="none" transform="translate(438,0)scale(-1,1)translate(-438,0)" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="437.5" y="444.5">Workout Summary</text></g><rect x="167" y="308" width="220" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)" opacity="0.25"/><rect x="167" y="308" width="220" height="60" rx="9" ry="9" fill="#10739e" stroke="none" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="276.5" y="342.5">Workout</text></g><rect x="0" y="0" width="200" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)translate(100,0)scale(-1,1)translate(-100,0)" opacity="0.25"/><rect x="0" y="0" width="200" height="60" rx="9" ry="9" fill="#10739e" stroke="none" transform="translate(100,0)scale(-1,1)translate(-100,0)" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="99.5" y="34.5">User</text></g><rect x="158" y="100" width="220" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)translate(268,0)scale(-1,1)translate(-268,0)" opacity="0.25"/><rect x="158" y="100" width="220" height="60" rx="9" ry="9" fill="#10739e" stroke="none" transform="translate(268,0)scale(-1,1)translate(-268,0)" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="267.5" y="134.5">Power Zone</text></g><rect x="318" y="400" width="220" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)translate(428,0)scale(-1,1)translate(-428,0)" opacity="0.25"/><rect x="318" y="400" width="220" height="60" rx="9" ry="9" fill="#10739e" stroke="none" transform="translate(428,0)scale(-1,1)translate(-428,0)" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="427.5" y="434.5">Workout Summary</text></g><rect x="158" y="300" width="220" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)" opacity="0.25"/><rect x="158" y="300" width="220" height="60" rx="9" ry="9" fill="#10739e" stroke="none" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="267.5" y="334.5">Workout</text></g><path d="M 100 60 L 100 120 Q 100 130 110 130 L 143.53 130" fill="none" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><path d="M 153.53 130 L 143.53 135 L 143.53 125 Z" fill="#23445d" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><rect x="158" y="200" width="220" height="60" rx="9" ry="9" fill="#000000" stroke="none" transform="translate(2,3)" opacity="0.25"/><rect x="158" y="200" width="220" height="60" rx="9" ry="9" fill="#10739e" stroke="none" pointer-events="none"/><g fill="#FFFFFF" font-family="Helvetica" font-weight="bold" text-anchor="middle" font-size="14px"><text x="267.5" y="234.5">Heart Rate Zone</text></g><path d="M 100 60 L 100 220 Q 100 230 110 230 L 143.53 230" fill="none" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><path d="M 153.53 230 L 143.53 235 L 143.53 225 Z" fill="#23445d" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><path d="M 100 60 L 100 320 Q 100 330 110 330 L 143.53 330" fill="none" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><path d="M 153.53 330 L 143.53 335 L 143.53 325 Z" fill="#23445d" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><path d="M 268 360 L 268 420 Q 268 430 278 430 L 303.53 430" fill="none" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/><path d="M 313.53 430 L 303.53 435 L 303.53 425 Z" fill="#23445d" stroke="#23445d" stroke-width="4" stroke-miterlimit="10" pointer-events="none"/></g></svg>

# Authentication

> To authorize, use this code:


```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: Bearer <Token>"
```

> Make sure to replace `<Token>` with your API key.

Wahoo Fitness uses OAuth2 API keys to allow access to the API. You can register your App at our [developer portal](http://developers.wahooligan.com).

Wahoo Fitness endpoints expect the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer <Token>`

<aside class="notice">
You must replace <code>Token</code> with your personal API key.
</aside>


