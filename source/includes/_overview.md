# Overview

**Shiftdata**, the Shiftboard Application Programming Interface
(API), is designed to allow simple transactions with the Shiftboard
platform.  The Shiftboard platform is evolving quickly and this
documentation is updated frequently.

All requests and responses are encoded using JavaScript Object
Notation ([JSON](http://www.json.org/)) and encrypted using 256-bit
Secure Sockets Layer
([SSL](http://www.mozilla.org/projects/security/pki/nss/ssl/draft302.txt)).
Unencrypted requests are not accepted.  Using JSON, HMAC, and
[Base64](http://tools.ietf.org/rfc/rfc4648.txt) libraries, it should
be easy to create, update, list and delete objects within the
Shiftboard application.  These libraries should be available for
all programming languages (Java, PHP, .NET, Perl, and Ruby/Rails)

Most Shiftboard application, account, authorization, systems
management, and site provisioning data is already accessible or can
be made accessible according to demand.

All requests include your organization's unique Access Key ID and
are digitally signed by computing an HMAC SHA1 signature of the
request with your private (secret) Signature Key.  Your private
Signature Key should NEVER be transmitted or shared with anyone.

Please see the [Requests](#requests) section for details on making
digitally signed requests.

## Scope

For the most part, the Shiftboard API represents features already
available throughout the Web UI.  However, the Shiftboard API may
expose features that are new, beta, or do not have a UI counterpart.

This documentation, the API and the Web UI are revised regularly
as we respond to new customer requirements.  If you have any questions
or new requirements, please contact our Partner program for the
latest information.

The Shiftboard API is currently evolving.  Please ask about any
objects or extended functionality that can help meet the requirements
of your project.
