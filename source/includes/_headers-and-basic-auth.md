# Headers & Basic Auth

You can configure custom headers and basic auth for your Netlify site by adding a `_headers` file to the root of your site folder.

## Custom headers

The format is very simple:

```
## A path:
/templates/*
  # Headers for that path:
  Cache-Control: max-age=3000
```

Paths can contain `*` or `:placeholders`. A `:placeholder` matches anything except `/` while a `*` matches anything.

Here's an example of settings the `X-Frame-Options` and `X-XSS-Protection` headers for all pages on your site:

```
/*
  X-Frame-Options: DENY
  X-XSS-Protection: 1; mode=block
```

## Basic auth

The headers file can also be used to set basic auth headers. It's a simple way to limit access to particular parts of your site.

```
/something/*
  Basic-Auth: someuser:somepassword anotheruser:anotherpassword
```

This will trigger the built-in basic browser authentication for any URL under `/something`. There's two users defined here, one with the username "someuser" and password "somepassword", the other with "anotheruser" and "anotherpassword".

Unlike other headers in the `_headers` file, the `Basic-Auth` header will obviously not be sent as a standard HTTP header but used to control the appropriate HTTP headers for basic authentication.
