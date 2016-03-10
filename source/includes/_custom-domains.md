# Custom Domain

You can easily use your own domain for a Netlify site.

## Assigning the domain

First you need to assign the domain to the site you want us to show.

You can do this through the web UI by clicking "Edit domain" when viewing your site.

![set-custom-domain.jpg](/uploads/set-custom-domain.jpg)

You can also assign domains through the [CLI tool](/docs/cli) with the `netlify update` command.

**We highly recommend using a www domain instead of an apex domain (ie. www.example.com instead of example.com**. Unless your DNS provider supports ANAME or ALIAS records for the apex domain you won't be able to take full advantage of our CDN unless you use the **www** prefix or a similar subdomain.

## DNS configuration

You'll need to point the DNS records for the domain at our servers.

* Create a CNAME that will "alias" your site to `<site-name>.netlify.com`. If your domain is `example.com` and your site is at `example.netlify.com`, you would create a CNAME record for **www** pointing at `www.example.com` to `example.netlify.com`.
* Create an A record for the raw domain (example.com) pointing to `198.61.251.14`

![Example DNS Records](/img/docs/dns-records.png)

If your DNS provider supports ANAME or ALIAS records for apex domains you can instead alias the raw domain to `www.netlify.com`

Depending on your DNS provider changes to DNS records can take several hours to propagate, so be patient.

## Naked domains?

You can use Naked domains with Netlify, but we recommend you always use the **www** version of the domain (eg. www.example.com) for your site. This makes it easier to take advantage of Netlify's powerful CDN.

If you prefer the naked domain, we recommend you use a DNS provider that supports ANAME or ALIAS records for apex domains such as [DNSimple](https://dnsimple.com/) or [DNS Made Easy](http://www.dnsmadeeasy.com/aname-records/). If you set an A record for the apex domain, you won't be able to take advantage of the full Netlify CDN. If your provider lets you set an ALIAS, the full CDN will work. If not, your assets (Javascript, CSS, images) will be served out of a global CDN, but your HTML will be served out of our primary datacenter in the US.

## Domain redirects

We'll automatically set up redirects for the alternative domain to the primary domain. So if you use `www.example.com`, we'll configure `example.com` to do a 301 redirect to the `www` domain. If you assign the naked domain to your site, we'll redirect in the opposite direction.

We only redirect automatically between the root domain and www. Not any other subdomains.

## Domain aliases

Depending on your plan, you can setup domain aliases for your domain, so the same site will be rendered on several different domains.

You can use domain aliases together with [rewrite and redirect](/docs/redirects) to redirect or rewrite based on the current domain of the site.
