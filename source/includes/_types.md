# Types
## Timestamps

Unless otherwise specified, all timestamps from API are returned in  [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601)  with microseconds. Make sure you can parse the following ISO 8601 format. Most modern languages and libraries will handle this without issues.

```
2019-09-18T10:41:20Z

```

## Numbers

Big Decimal numbers are returned as strings to save full precision. When making a API request, it is suggested to convert numbers to strings to avoid truncation and precision errors.

e.g. Limit price, stop loss price, trail_amount

Integer numbers (like contract size, product_id and impact size) are unquoted.

## IDs

Most identifiers are UUID unless otherwise specified. When making a request which requires a UUID, both forms (with and without dashes) are accepted.

`167ja7cg-678e-6876-d6g3-f803ce49qsc9`  or  `167ja7cg678e6876d6g3f803ce49qsc9`

