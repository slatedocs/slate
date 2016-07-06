---
title: Plenario API Documentation

language_tabs:
  - html: Examples

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>
  - <a href='http://www.urbanccd.org/#urbanccd'>Made by UrbanCCD and</a>
  - <a href='http://www.uchicago.edu/'>University of Chicago</a>

includes:
  - metadata_endpoints
  - aggregate_endpoints
  - raw_data_enpoints
  - shape_data_endpoints
  - response_format
  - errors

search: true
---

# Introduction

> ### In this rightmost column, you'll see example API calls and responses.

Plenario is a centralized hub for open datasets from around the world, ready to search and download.

The Plenario RESTful API can be used to perform custom geospatial and temporal queries. We currently have 13 endpoints.

A few things to know:

* All API calls should be made with `HTTP GET`
* All API responses are in [JSON format](http://www.json.org/)
* All methods are accessed via: `http://plenar.io/v1/api/SOME-ENDPOINT`

<aside class=warning>Most responses are truncated with <b>ellipses</b> (...) due to extreme length.</aside>

