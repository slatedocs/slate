# HTTPS on Custom Domains

Netlify offers free SSL on all plans with a simple one-click setup.

HTTPS brings a lot of advantages:

* **HTTP/2** Boost your sites performance &mdash; HTTP/2 only works when HTTPS is enabled
* **SEO** Google awards site that works with HTTPS enabled
* **Analytics** If your visitors comes from HTTPS enabled sites, you only get referrers if you support HTTPS as well.
* **Content Integrity** Without DNS free Wi-fi services can inject ads into your pages.
* **Security** If you have a login on a Single Page App or accept form submissions, HTTPS is essential for your users' security and privacy

## Basic vs Full SSL

Netlify offers two different SSL solutions: **Basic SSL** and **Full SSL**

**Basic SSL** is based on a browser standard called **SNI**. Without SNI, the browser will never send the domain name of the site in clear text, but requires an encrypted connection first. This means that when you're serving sites for lots of different domains (like our CDN edge nodes are), you need a dedicated IP address for each domain or a very large shared certificate that lists all possible domains on the service.

With SNI, the browser sends the domain in cleartext before opening an encrypted connection, and this gives our CDN edge nodes a chance to pick the right certificate for the domain and use that for the encryption handshake.

Today SNI works in all modern browsers, but users of IE on Windows XP or older Android phones will be unable to access your site over HTTPS without going through very scary looking error messages. You might also experience issues with certain automated tools, like PhantomJS before 2.0.

**Full SSL** is a solution that combines a specific SNI certificate unique to your domain, with a fallback shared certificate combining lots of domains.

This gives support for all browsers, even older browsers with no SNI support, with the same ease of setup as our SNI-based solution and a much lower cost than SSL solutions based on dedicated IPs.

**Dedicated IP SSL** is available on our enterprise plans. If you want your own unique certificate available to all browsers without requiring SNI and without a shared certificate as fallback, [get in touch](/contact).

## Netlify Certificates

Simply go to the SSL screen and click "Provision New Certificate." Netlify will then provision a new domain-validated certificate and automatically install it on all our CDN edge nodes. The process normally takes less than a minute from the time you click the button until your site supports HTTPS.

You'll need to configure the DNS for the custom domain before you can provision a netlify certificate. To provision the certificate, netlify needs to go through a domain validation process, and this step cannot be completed unless your domain is already pointing at our servers.

If you're migrating an existing site and need to complete this process before changing the DNS settings, please [get in touch](/contact).

## Domain Aliases

Your certificate will include all your domain aliases when it's issued, but note that DNS also needs to be configured for the aliases for us to include them on your certificate.

If you have more than 5 aliases that are subdomains of the same domain, you might run into rate-limits. In that case we recommend you provide your own wildcard certificate.

## Custom Certificates

If you already have a certificate for your domain and prefer that to netlify's domain-validated certificate, you can easily install your own.

Be aware that while netlify automatically handles renewals for certificates we provision, you'll have to manually renew your custom certificate yourself before it expires.

To install a certificate, you'll need the certificate itself in X.509 PEM format (normally this will be a .crt file), the private key you've used to request the certificate and a chain of intermediary certificates from your Certificate Authority (CA).

Click "Provide Your Own" certificate, and then paste in the certificate, each of the intermediary certificates and the private key.

Netlify validates that the certificate matches the custom domain for your site and that the DNS record for the domain is pointed at netlify, and then installs your certificate. If your certificate covers several of your sites (ie., if it's a wildcard certificate or uses subject alternative names), you only need to install it for one site.

## Forcing SSL

Once you have a certificate in place, you can check a box to force SSL. This will both set a redirect from http to https, and add `Strict Transport Security` headers to all requests.

Strict Transport Security makes sure that a "man in the middle" can't simply serve your users a fake site over HTTP, by telling the browser that once it has visited your site, it should only accept HTTPS connections to that site for the next year.

**Warning:** once you force HTTPS there's no going back for anybody who visits your site. So make sure to verify that SSL is working properly on your site before enabling this.

## HTTP 2.0

When SSL is enabled for your site, Netlify supports HTTP 2.0 - a new internet protocol engineered for faster web performance.

Note that currently our asset CDN (Akamai) doesn't support HTTP 2.0. If you have a site where you expect HTTP 2.0 would make a big difference because of request patterns, [get in touch](/contact) and we can test out whether you'll get better performance from the large network of Akamai or from running the whole site on netlify's CDN with HTTP 2.0 enabled.
