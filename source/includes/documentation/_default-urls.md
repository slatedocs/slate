## Default URLs

The Quintype application is made up of at least 3 host names.

* The editor
* The API server
* The front end application

### Staging

Staging urls are typically hosted by Quintype, and will have the following URLs.

* editor - `thefoobar.staging.quintype.com`
* api server - `thefoobar.staging.quintype.io`
* front end - `thefoobar-web.staging.quintype.io`

### Production

Production urls typically have the editor and API server on the quintype domains, and the front end on the final domain

* editor - `thefoobar.quintype.com`
* api server - `thefoobar.quintype.io` / `thefoobar.internal.quintype.io` (accessible within QCC)
* front end - `www.thefoobar.com` (this should be `next.thefoobar.com` before going live)
* beta front end - `beta.thefoobar.com`

### Black Knight

During the process of creating your account, the Quintype team will also create a publisher (The Foobar) on the [Black Knight](./black-knight) application. You will be able to deploy all your front end applications from the same place.

### Production DNS Entries

The following is an example for the DNS entries to be made

```dns
www.thefoobar.com   CNAME thefoobar.publisher.quintype.io
next.thefoobar.com  CNAME thefoobar.publisher.quintype.io
beta.thefoobar.com  CNAME thefoobar.publisher.quintype.io
thefoobar.com       A     174.129.25.170 # Redirect to www.thefoobar.com using http://wwwizer.com/naked-domain-redirect
```

We strongly recommend that you serve your content off a `www` domain, and use the apex to forward 301 to your www domain. However, do use a provider that sets a `Cache-Control` header with the redirect (like GoDaddy).

If your main site is on an APEX domain, then you may use the following entries:

```dns
thefoobar.com A 151.101.0.204
thefoobar.com A 151.101.64.204
thefoobar.com A 151.101.128.204
thefoobar.com A 151.101.192.204
```

### SSL / HTTPS

If your site requires SSL / HTTPS, contact us support@quintype.com
