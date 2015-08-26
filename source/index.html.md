---
title: API Reference

language_tabs:
  - shell
  - ruby
  - csharp

toc_footers:
  - <a href='//geezeo.com'>Powered by:<img class="logo" src="images/logo.png"></a>

includes:
  - accounts
  - ads
  - alerts
  - aggregation
  - budgets
  - cashflow-bills
  - cashflow-events
  - cashflow-incomes
  - cashflows
  - current-partner
  - current-user
  - expenses
  - harvests
  - networth
  - payoff-goals
  - ping
  - savings-goals
  - tags
  - tickets
  - transactions
  - users
  - data-source

search: true
---

# Overview

The Geezeo REST API provides a method of read and partial write access to a users PFM data. This API is for Partner use only, and is not designed or intended for use by the end user. In addition, security is limited to a Partner-wide access token at this time, so care should be taken that the token is not exposed to an end user.

# Platform SDKs

Geezeo is creating platform specific SDK's to accelerate integrating our platform features into OLBs, mobile, support, or any other use case that you can envision. 

These SDKs will follow best practices for the specific platform, and should significantly lower the barrier of entry for any integration project. 

# .net SDK

We have recently released our .net SDK. [Download it here](https://github.com/Geezeo/net-sdk-public)

The .net SDK provides :

* Concrete types for all API endpoints
* Simple scoped access to user resources
* Caching
* Aggregation of endpoints for easier UI work

For more information, please contact your account representative and ask for an introduction to the .net SDK!