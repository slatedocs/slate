---
title: Crunch.io API Reference

language_tabs:
  - http
  - shell
  - python
  - r

toc_footers:
  - <a href='http://crunch.io/'>Sign Up</a>

includes:
  - feature-authentication
  - feature-importing
  - feature-appending
  - feature-deriving
  - endpoint-intro
  - object-reference

search: true
---

# Introduction

Crunch exposes a REST API for third parties, and indeed its own UI, to manage datasets. This API is also used by the [Python](https://github.com/Crunch-io/pycrunch) and [R](https://github.com/Crunch-io/rcrunch) libraries. This User Guide is for developers who are writing applications on top of the Crunch REST API, with or without those language bindings. It describes the existing interfaces for the current version and attempts to provide context and examples to guide development. 

The documents are organized in three overlapping scopes: a <a href="#feature-guide">feature guide</a>, which provide higher-level vignettes that illustrate key features; an <a href="#endpoint-reference">endpoint reference</a>, which describes individual URIs in detail; and an <a href="#object-reference">object reference</a>, which defines the building blocks of the Crunch platform, such as values, columns, types, variables, and datasets.

# Feature Guide
