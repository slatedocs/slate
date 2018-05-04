# Overview

Shiftboard offers a rich set of Application Programming Interfaces
(APIs) to allow external systems to interact with the Shiftboard
platform.  These APIs take the form of
[JSON-RPC](http://jsonrpc.org/spec.html) web service calls or
[Webhooks](https://en.wikipedia.org/wiki/Webhook).  Most
Shiftboard application, account, authorization, systems management,
and site provisioning data is accessible and the API is continually
extended to encompass more of the Shiftboard data and functionality.

All requests and responses are encoded using JavaScript Object
Notation ([JSON](http://www.json.org/)) and encrypted using 256-bit
Secure Sockets Layer
([SSL](http://www.mozilla.org/projects/security/pki/nss/ssl/draft302.txt)).
Unencrypted requests are not accepted.  Using JSON, HMAC, and
[Base64](http://tools.ietf.org/rfc/rfc4648.txt) libraries, it should
be easy to create, update, list and delete objects within the
Shiftboard application.  These libraries should be available for
all programming languages.

All requests include your organization's unique Access Key ID and
are digitally signed by computing an HMAC SHA1 signature of the
request with your private (secret) Signature Key.  Your private
Signature Key should NEVER be transmitted or shared with anyone.

Please see the [Requests](#requests) section for details on making
digitally signed requests.

## Scope

Virtually every end-user interaction can be implemented using the
web service.  In fact, all of Shiftboard's end-user applications use the
web service. In addition, various types of management functionality not 
available to end-users are exposed via the web service.

The Shiftboard APIs are constantly evolving.  Please ask about any
objects or extended functionality that can help meet the requirements
of your project.
