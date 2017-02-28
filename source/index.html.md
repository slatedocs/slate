---
title: PractiTest's REST API

language_tabs:
  - shell
  - ruby
  - python
  - csharp


toc_footers:
  - <a href='https://www.practitest.com/help/account/account-api-tokens/' target="_blank">How to get an API Token</a>

includes:
  - authentication
  - pagination
  - projects
  - users
  - custom_fields
  - instances
  - errors

search: true
---

<!--
- kittens_example

-->

# PractiTest API V2

## Welcome to the PractiTest's REST API V2!

The REST API is designed for developers who want to integrate PractiTest into their application, synchronize issue trackers or develop any other tool integration with PractiTest.
The API also enables organizations to update their automated test results into PractiTest.

We have language bindings in Shell, Ruby, Python, Java and C#! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

## JSON API
All along this api we've embraced <a href="http://jsonapi.org/" target="blank">JSON API</a> standards, for share conventions and to save you (and us) precious time.

## A small note about API V2 vs V1
We wrote this API V2 based on our experience from V1, trying to make it simpler and more robust.
Eventually, this V2 API will support all current V1 API methods, and later on V1 will be depreciated.

We changed many things from V1:

* Different authentication - [read the Authentication section](#authentication).

* All resources' ids of are what we used to call in V1 system_ids. The purpose is to eliminate the ambiguity in parameter names (author? author_id? author_system_id?), and to enable a more distinct definition

* Json API - API standards have been evolved since V1 - [read more here](#json-api).

* Better Documentation - a specific tool for API documentation (slate). We hope you can see the difference.

If you're new to PractiTest and you're just starting to write API code, you should use this V2, and not the V1. If you need anything that is still missing, please email us to support, as we'd like to reduce the number of V1 users.

### Current API V1 users
If you already have V1 code, then you must change /api/resource_name to /api/v1/resource_name. Also, when you write new code, try to use V2, since V1 will depreciate.
