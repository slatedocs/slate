---
title: Weaver API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby

includes:
  - authentication
  - gateways
  - devices
  - commands

search: true
---

# Introduction

Welcome to the Weaver API! You can use our API to access the Gateway API endpoints, which can get information on various gateways and connected devices in our database.

## Request/Response Format

The default response format is JSON. Requests with a message-body use plain JSON to set or update resource attributes. Successful requests will return a `200 OK` HTTP status.

Some general information about responses:

- Dates are returned in ISO8601 format: `YYYY-MM-DDTHH:MM:SS`
- Resource IDs are returned as integers or uuids

## Errors

Occasionally you might encounter errors when accessing the REST API. There are four possible types:

Status Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Couldn't authenticate your request
403 | Invalid scope -- User hasn’t authorized necessary scope
500 | Internal Server Error -- Server error
