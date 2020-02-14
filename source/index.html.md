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

![Weaver Documentation Header](https://i.imgur.com/yw6JEsa.png)


# INTRODUCTION

Welcome to the Weaver API! You can use our API to retrieve information on your gateways, their connected devices, and issue commands to them.

### First, Why Use Weaver?

In the gilded age of IoT, one could reasonably ask why do we need yet another API? Well, it turns that despite all the progress in the past few years, doing things with IoT devices is still really hard.

#### Mesh Networking is Hard

First, most IoT devices don't connect to standard wifi. Instead, they use a variety of mesh networking protocols that, while being power efficient, all have the bad habit of being poorly documented and (consequentially) poorly followed by IoT device manufacturers.

As a result, communicating with IoT devices requires diving into 1000+ pages PDFs and parsing byte payloads for cryptic messages. YUCK!


#### Leaping Over the Firewall

Second, odds are you want to control your IoT devices remotely. Aside from converting HTTP requests to IoT protocol messages, you also need to bypass your wifi router's firewall which blocks random internet requests from ever reaching your devices.

Obviously, firewalls are good (and please don't poke holes in them), but it also means that any legitimate remote requests you make to unlock a door or turn on the heater will end in `/dev/null`.

#### Making IoT Great Again!
We started Weaver to make building applications that interact with IoT devices as easy as possible. We spent years wrestling with many of these problems and wished that there could be a simple API that would abstract it all away.

The following guide is intended to walk you through the core ideas behind weaver, such as making authenticated API requests, device commands, and listening for events.


## Let's Start by Defining Some Key Terminology...

![Weaver overview](https://i.imgur.com/jrJsrqN.jpg)

Above is an end to end overview diagram of Weaver. Let's define each term.

##### YOUR APP
This is You! You can send requests to the Weaver REST API and receive responses from that API, as well as status updates from either Webhooks or Websockets.

##### WEAVER API
This is the REST API that your application can query. This API is accessible from anywhere and takes simple commands and forwards them to the gateway.

##### WEAVER GATEWAY
This is the hardware hub that's provided by Weaver. It resides on your local area network (LAN) and creates a link to the outside world via a secure connection to the Weaver API. Its job is to take simple commands and translate them to lower-level mesh protocol commands that end devices can understand.

##### END DEVICES
This is a generic term we'll be using and which refers to any connected device or sensor, such as door locks, lights, noise sensors thermostats...etc.

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
