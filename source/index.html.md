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
  - gateway_events

search: true
---

# INTRODUCTION

```shell
___  ___  _______   ___       ___       ________                       
|\  \|\  \|\  ___ \ |\  \     |\  \     |\   __  \                      
\ \  \\\  \ \   __/|\ \  \    \ \  \    \ \  \|\  \                     
\ \   __  \ \  \_|/_\ \  \    \ \  \    \ \  \\\  \                    
 \ \  \ \  \ \  \_|\ \ \  \____\ \  \____\ \  \\\  \                   
  \ \__\ \__\ \_______\ \_______\ \_______\ \_______\                  
   \|__|\|__|\|_______|\|_______|\|_______|\|_______|                  



___       __   _______   ________  ___      ___ _______   ________     
|\  \     |\  \|\  ___ \ |\   __  \|\  \    /  /|\  ___ \ |\   __  \    
\ \  \    \ \  \ \   __/|\ \  \|\  \ \  \  /  / | \   __/|\ \  \|\  \   
\ \  \  __\ \  \ \  \_|/_\ \   __  \ \  \/  / / \ \  \_|/_\ \   _  _\  
 \ \  \|\__\_\  \ \  \_|\ \ \  \ \  \ \    / /   \ \  \_|\ \ \  \\  \|
  \ \____________\ \_______\ \__\ \__\ \__/ /     \ \_______\ \__\\ _\
   \|____________|\|_______|\|__|\|__|\|__|/       \|_______|\|__|\|__|



```

```ruby
___  ___  _______   ___       ___       ________                       
|\  \|\  \|\  ___ \ |\  \     |\  \     |\   __  \                      
\ \  \\\  \ \   __/|\ \  \    \ \  \    \ \  \|\  \                     
\ \   __  \ \  \_|/_\ \  \    \ \  \    \ \  \\\  \                    
 \ \  \ \  \ \  \_|\ \ \  \____\ \  \____\ \  \\\  \                   
  \ \__\ \__\ \_______\ \_______\ \_______\ \_______\                  
   \|__|\|__|\|_______|\|_______|\|_______|\|_______|                  



___       __   _______   ________  ___      ___ _______   ________     
|\  \     |\  \|\  ___ \ |\   __  \|\  \    /  /|\  ___ \ |\   __  \    
\ \  \    \ \  \ \   __/|\ \  \|\  \ \  \  /  / | \   __/|\ \  \|\  \   
\ \  \  __\ \  \ \  \_|/_\ \   __  \ \  \/  / / \ \  \_|/_\ \   _  _\  
 \ \  \|\__\_\  \ \  \_|\ \ \  \ \  \ \    / /   \ \  \_|\ \ \  \\  \|
  \ \____________\ \_______\ \__\ \__\ \__/ /     \ \_______\ \__\\ _\
   \|____________|\|_______|\|__|\|__|\|__|/       \|_______|\|__|\|__|



```

Welcome to the Weaver API! You can use our API to access the Gateway API endpoints, which can get information on various gateways and connected devices in our database.

![Weaver overview](https://i.imgur.com/jrJsrqN.jpg)

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
