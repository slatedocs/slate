# AMP Subscriptions
The [amp-subscriptions](https://www.ampproject.org/docs/reference/components/amp-subscriptions) extensions implements the subscription-style access/paywall rules.

There could be a local service or vendor services.

A local service is configured fully within the page, including its authorization/pingback endpoints, as well as login and subscribe actions.
The properties in the "local" service are:

* "authorizationUrl" - the authorization endpoint URL.
* "pingbackUrl" - the pingback endpoint URL.
* "actions" - a named map of action URLs. At a minimum there must be two actions specified: "login" and "subscribe".


The customers of Quintype platform can use below APIs for amp-subscriptions in Accesstype.

## GET Authorization endpoint

```shell--request

$ curl -X GET 'https://sketches.quintype.com/api/access/v1/stories/<story-id>/amp-access?readerId=<reader-id>'

```
```shell--response

{
  "granted": true,
  "grantReason": "METERING",
  "data": {
    "numberRemaining": 6,
    "isLoggedIn": true
  }
}

```
It is a credentialed CORS GET endpoint.

The properties in the response are:

* "granted" - boolean stating if the access to the document is granted or not.
* "grantReason" - the string of the reason for giving the access to the document, recognized reasons are either SUBSCRIBER meaning the user is fully subscribed or METERING meaning user is on metering.
* "data" - any free form data which can be used for render templating.

*Note* An additional query param `disable-meter=true` needs to be sent for stories behind hard paywall. Such stories will not be metered and access will be granted only to subscribers.

## POST Pingback endpoint

```shell--request

$ curl -H "Content-Type: text/plain" -X POST 'https://sketches.quintype.com/api/access/v1/stories/<story-id>/amp-pingback?readerId=<reader-id> -d {
  "granted": true,
  "grantReason": "METERING",
  "data": {
    "numberRemaining": 6,
    "isLoggedIn": true
  }
}'

```
```shell--response

```
It is a credentialed CORS POST endpoint. AMP Runtime calls this endpoint automatically when the Reader has started viewing the document. One of the main goals of the Pingback is for the Publisher to update metering information.

Important: The pingback JSON object is sent with Content-type: text/plain. This is intentional as it removes the need for a CORS preflight check.
