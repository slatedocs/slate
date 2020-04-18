---
title: Seam API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby

includes:
  - authentication
  - workspaces_and_groups
  - gateways
  - gateway_actions
  - devices
  - device_actions
  - door_locks
  - action_requests

search: true
---

![Seam Documentation Header](https://ik.imagekit.io/vgfzjbrn7/doc_background_black.jpg)


# INTRODUCTION

Welcome to the Seam API! We buildt Seam to make building applications that interact with IoT devices as easy as possible. We spent years wrestling with many of these problems and wished that there could be a simple API that would abstract it all away.

The following guide is intended to walk you through the core ideas behind Seam, such as making authenticated API requests, device commands, and listening for events.

<!-- You can use our API to retrieve information on your workspace, its gateways, and their connected devices, and ultimately issue commands to them. -->

<!-- ### First, Why Use Seam?

In the gilded age of IoT, one could reasonably ask why do we need yet another API? Well, it turns that despite all the progress in the past few years, doing things with IoT devices is still really hard.

#### Mesh Networking is Hard

First, most IoT devices don't connect to standard wifi. Instead, they use a variety of mesh networking protocols that, while being power efficient, all have the bad habit of being poorly documented and (consequentially) poorly followed by IoT device manufacturers.

As a result, communicating with IoT devices requires diving into 1000+ pages PDFs and parsing byte payloads for cryptic messages. YUCK!


#### Leaping Over the Firewall

Second, odds are you want to control your IoT devices remotely. Aside from converting HTTP requests to IoT protocol messages, you also need to bypass your wifi router's firewall which blocks random internet requests from ever reaching your devices.

Obviously, firewalls are good (and please don't poke holes in them), but it also means that any legitimate remote requests you make to unlock a door or turn on the heater will end in `/dev/null`.

#### Making IoT Great Again! -->





# KEY TERMINOLOGY


![Seam Architecture Overview](https://ik.imagekit.io/vgfzjbrn7/horizontal-architecture-diagram.svg)

Below is an end to end overview diagram of the Seam architecture. On the left is your APP; on the right are the devices you wish to control. Let's define each term.

##### YOUR APP
This is You! You can send requests to the Seam REST API and receive responses from that API, as well as status updates from either Webhooks or Websockets.

##### SEAM API
This is the REST API that your application can query. This API is accessible from anywhere and takes simple commands and forwards them to the gateway via a secure tunnel.

##### Seam GATEWAY
This is the hardware hub that's provided by Seam. It resides on your local area network (LAN) and creates a link to the outside world via a secure tunnel to the Seam API. Its job is to take simple commands and translate them to lower-level mesh protocol commands that end devices can understand.

##### END DEVICES
This is a generic term we'll be using and which refers to any connected device or sensor, such as door locks, lights, noise sensors thermostats...etc.


# API REFERENCE

The SEAM API is organized around REST. Our API has predictable resource-oriented URLs, accepts JSON-request bodies, returns JSON-encoded responses, and uses standard HTTP response codes, authentication, and verbs.


## Request/Response Format

```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  -H "Content-Type: application/json" \
  "https://api.getseam.com/v1/gateways"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}",
  "Content-Type": "application/json"
}

url = 'https://api.getseam.com/v1/gateways'

RestClient.get(url, headers: headers)
```

All request submitting parameters must set their [Content-Type](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type) to `application/json`. Nonconforming requests will not be accepted. You can do so by simply adding the `Content-Type: application/json` to your request.

The default response format is JSON. Successful requests will return a `200 OK` HTTP status.

Some general information about responses:

- Dates are returned in ISO8601 format: `YYYY-MM-DDTHH:MM:SS`
- Resource IDs are returned as integers or uuids


## Errors


Seam uses conventional HTTP response codes to indicate the success or failure of an API request. In general: Codes in the `2xx` range indicate success. Codes in the `4xx` range indicate an error that failed given the information provided (e.g., a required parameter was omitted, a resource is not authorized for writes, etc.). Codes in the `5xx` range indicate an error with Seam's servers (these are rare).

Below are a few example of such errors:

Status Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Couldn't authenticate your request
403 | Invalid scope -- User hasn’t authorized necessary scope
500 | Internal Server Error -- Server error


## Idempotent Requests (coming soon)

We plan on adding idempotency support to our API for safely retrying requests without accidentally performing the same operation twice. This is useful when an API call is disrupted in transit and you do not receive a response. For example, if a request to perform on a device does not respond due to a network connection error, you can retry the request with the same idempotency key to guarantee that no more than one action request is created.
