---
title: API Reference

language_tabs:
  - Javascript

toc_footers:
  - <a href='#'>Made by hand in HELSINKI</a>
 
includes:
  - api
  - callbacks
  - enums
  - init
  - auth
  - integrate
  - config
  - require

search: true
---

# Introduction

Welcome to the callstats.io API! 

The callstats.io's Javascript client library enables performance monitoring features in browser-based WebRTC endpoints. The communication with [callstats.io]({{site.callstats.backend-url}}) occurs over _Secure HTTP_ (`https://`) and _Secure WebSocket_ (`wss://`). The endpoint (the browser in this case) MUST support [WebSockets](http://socket.io/). Additionally, the origin server MUST allow _Cross-Origin Resource Sharing_ ([CORS](http://enable-cors.org/server.html)) and MAY need to serve its own pages over HTTPS to avoid mixed content warnings.


## Versioning

`callstats.js` uses [semantic versioning](http://semver.org). The latest version is in the changelog.

---

