---
title: Metype API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true
---

# Introduction To Metype

Metype is a platform for increasing user engagement. It can be embedded with any web page or mobile app.

## Terminology
* Realm
* Comment

# User Generated Content

## POST Create a User Generated Content

```shell
curl -H "Content-Type: application/json" https://www.metype.com/
```

The above API can be used to submit user generated content from a site. The MeType platform can be configured to automatically move this user generated content into any supported CMS.
