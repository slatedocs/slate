---
title: Front API Reference

toc_footers:
  - <a href='https://frontapp.com/signup'>Create a Front account</a>
  - <a href='plugin.html'>Plugin API documentation</a>

language_tabs:
  - shell

includes:
  - endpoints
  - custom_channels
  - webhooks

search: true
---

# Introduction

## Authentication

```http
GET /teammates HTTP/1.1
Host: api2.frontapp.com
Authorization : Bearer <token>
```

> You should replace "`<token>`" in the example above by your JSON Web Token.

The API uses [JSON Web Token](https://tools.ietf.org/html/rfc7519) to authenticate its user.

You **MUST** send the token for each request needing authentication in the **Authorization** header. The token **MUST** be preceeded by `Bearer `

You can get your JSON web token directly from Front (go to Settings > API access).

## Limitations

### Rate limiting

By default, the API is limited to 120 requests in 60 seconds. If you need more, just ask us and we will consider raising your quota.
Every response will contains three headers related to the rate-limiting:

> Example of a response to a request exceeding the rate limit. The client should wait 20s before resending the request.

```http
HTTP/1.1 429 Too Many Requests
X-RateLimit-Limit: 120
X-RateLimit-Remaining: 0
X-RateLimit-Reset: 1454450858
Retry-After: 20
```

| Name                      | Description                                                           |
|---------------------------|-----------------------------------------------------------------------|
| `X-RateLimit-Limit`       | Maximum number of request allowed in the time window                  |
| `X-RateLimit-Remaining`   | Current remaining number of requests in the current time window       |
| `X-RateLimit-Reset`       | Next timestamp when the number of remaining requests will be reset    |


When the rate limit is exceeded, the server will respond with a [**429 Too Many Requests**](https://tools.ietf.org/html/rfc6585#section-4) HTTP code with the header `Retry-After` to tell you how many seconds you need to wait before you can retry the request.

### Individual inboxes and channels

Since individual inboxes and channels are private, the API does not let you interact with them nor with their content.

<aside class="info">The API can only access conversations that appear in at least one team inbox.</aside>

## Resource aliases

You can refer to all the resources with their IDs. Alternatively, some resources can be accessed via a more human readable alias:

* [Teammates](#teammates) can be identified with their `email`.
* [Channels](#channels) can be identified with their `address`.
* [Contacts](#contacts) can be identified with one of their `source` and `handle`.

If you want to use an alternative alias, you **MUST** prefix it with `alt:` and the name of the value used to identify the resource.
Examples:

* `alt:email:leela@planet-express.com` for the teammate with the email address *leela@planet-express.com*.
* `alt:address:@FrontApp` for the channel with the address *@FrontApp*.
* `alt:twitter:@leela` for the contact having the twitter handle *@leela*.
* `alt:phone:+12345678900` for the contact having the phone number *+12345678900*.

## Dates

All dates in the Front API are encoded as a number representing Unix time: It is the number of seconds that have elapsed since 00:00:00 UTC, January 1st 1970.

Since Front is based on events that can occur during the same second, all the timestamps include leap seconds with a precision of 3 digits: `1454453901.012`.

## Search parameters

For some requests to get a large collection of resources, you can send search criteria in the query string via a parameter named `q`.

> Fetch all conversations deleted and assigned:

```http
GET /conversations?q[statuses][]=deleted&q[statuses][]=assigned HTTP/1.1
Host: api2.frontapp.com
```

### Search criteria for conversations

| Name       | Type             | Description                                                 |
|------------|------------------|-------------------------------------------------------------|
| `statuses` | array (optional) | List of the statuses of the conversations you want to list  |

> Fetch all comment and assign events between Jan 25th, 2016 at 2:00 pm and January 25th, 2016 at 5:00 pm:

```http
GET /events?q[types][]=comment&q[types][]=assign&q[after]=1453730400&q[before]=1453741200 HTTP/1.1
Host: api2.frontapp.com
```

### Search criteria for events

| Name     | Type              | Description                                              |
|----------|-------------------|----------------------------------------------------------|
| `types`  | array (optional)  | List of the types of events you want to list             |
| `before` | number (optional) | Timestamp of the max date of the events you want to list |
| `after`  | number (optional) | Timestamp of the min date of the events you want to list |

## Response body structure

A JSON object will be at the root of every responses body. When requesting a resource collections, the collection will be encapsulated in a `_results` field.

A response will contain at least one of the following top-level members:

* `_pagination`: An object containing pagination information.
* `_links`: An object containing the resource links for self-discoverability.
* `_errors`: An array of [error objects](#errors).

### Pagination

When listing a large number of resources, the API server will return a limited number of results.
When this is the case, the JSON response will contain a field named `_pagination`.

| Name      | Type              | Description               |
|-----------|-------------------|---------------------------|
| `prev`    | string (optional) | URL of the previous page  |
| `next`    | string (optional) | URL of the next page      |


### Links

To improve the self-discoverability of our API, every resources contains a `_links` object:

| Name      | Type              | Description                                   |
|-----------|-------------------|-----------------------------------------------|
| `self`    | string            | URL of the resource                           |
| `related` | object (optional) | Object listing the URL of related resources   |

### Errors

When the request encounters at least one problem, the response body will contain an `_errors` array containing objects describing the errors.

An error object looks like this:

| Name      | Type      | Description                               |
|-----------|-----------|-------------------------------------------|
| `status`  | string    | HTTP status code applicable to the error  |
| `title`   | string    | Human-readable summary of the problem     |
| `detail`  | string    | Human-readable explanation of the error   |
