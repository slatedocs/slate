---
title: Plenario API Documentation

language_tabs:
  - html: Examples

toc_footers:
  - <a href='https://github.com/tripit/slate'>Slate</a>
  - <a href='http://www.urbanccd.org/#urbanccd'>UrbanCCD</a>
  - <a href='http://www.uchicago.edu/'>University of Chicago</a>
  - <a href='http://plenar.io/'>Plenario</a>

includes:
  - response_format
  - metadata_endpoints
  - aggregate_endpoints
  - raw_data_endpoints
  - shape_data_endpoints
  - advanced_filtering

search: true
---

# Welcome!

> ### In this rightmost column, you'll see example API calls and responses.

Plenario is a centralized hub for open datasets from around the world, ready to search and download.

<aside class=info>
    The easiest way to access Plenario’s data and to build your
    own queries is via the <a href="http://plenar.io/explore/discover">Data 
    Explorer</a>. Also, you can take a look at some <a
    href="http://plenar.io/examples">example</a> queries.
</aside>

**For developers:**

The Plenario RESTful API can be used to perform custom geospatial and temporal queries. We currently have 13 endpoints.

A few things to know:

* All API calls should be made with `HTTP GET`
* All methods are accessed via: `http://plenar.io/v1/api/SOME-ENDPOINT`
* All API responses default to [JSON format](http://www.json.org/), but you can
specify alternate datatypes specific to some endpoints.

