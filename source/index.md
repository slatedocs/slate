---
title: Crunch.io API Reference

language_tabs:
  - http: HTTP
  - shell: cURL
  - python: Python
  - r: R

toc_footers:
  - <a href='http://crunch.io/'>Sign Up</a>

includes:
  - feature-authentication
  - feature-importing
  - feature-appending
  - feature-deriving
  - feature-arrays
  - feature-analyzing
  - endpoint-intro
  - endpoint-public
  - endpoint-dataset
  - endpoint-table
  - endpoint-variable
  - endpoint-filter
  - endpoint-analysis
  - endpoint-comparison
  - endpoint-version
  - endpoint-batch
  - endpoint-source
  - endpoint-join
  - endpoint-permission
  - endpoint-user
  - endpoint-team
  - object-reference

search: true
---

# Introduction

Crunch exposes a REST API for third parties, and indeed its own UI, to manage datasets. This API is also used by the [Python](https://github.com/Crunch-io/pycrunch) and [R](https://github.com/Crunch-io/rcrunch) libraries. This User Guide is for developers who are writing applications on top of the Crunch REST API, with or without those language bindings. It describes the existing interfaces for the current version and attempts to provide context and examples to guide development. 

The documents are organized in three overlapping scopes: a [feature guide](#feature-guide), which provide higher-level vignettes that illustrate key features; an [endpoint reference](#endpoint-reference), which describes individual URIs in detail; and an [object reference](#object-reference), which defines the building blocks of the Crunch platform, such as values, columns, types, variables, and datasets.

# Feature Guide
