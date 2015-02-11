# Errors

The NewsWhip API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request could not be parsed
403 | Forbidden -- Your API key is not allowed to access this resource. Your API key is expired or invalid.
429 | Too Many Requests -- Enhance your calm! or contact us for higher limits!
500 | Internal Server Error -- We had a problem with our server. Please try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.

# More Information

## Server-side Caching

* `GET` queries are cached (per API Key) for a small amount of time. Usually about 3 minutes. Check the HTTP headers sent by our servers for an exact value.
* `POST` queries are never cached.

## Cross-Origin Resource Sharing

* `GET` endpoints support 1 `Cross-origin resource sharing` per API key. Contact api@newswhip.com to set this up.
* `POST` endpoints are server-side only.

## JSONP

We don't currently support JSONP.

# Changelog

### Version 1.0.1 (2015-02-11)

- Added a new `sort_by` method: `created_at` to sort by most recent
- The filtering field `country` is deprecated, use `country_code` instead
- In Entities, Article. The field `country_code` replaces `country`. The contents of `country` will be set to 'World'


### Version 1.0.0 (2014-11-21)

- First public version