# Custom Domain

You can easily use your own domain for a Netlify site.

## Assigning the domain

First you need to assign the domain to the site you want us to show.

You can do this through the web UI by clicking "Edit domain" when viewing your site.

![set-custom-domain.jpg](_source/images/set-custom-domain.jpg)

You can also assign domains through the [CLI tool](/docs/cli) with the `netlify update` command.

**We highly recommend using a www domain instead of an apex domain (ie. www.example.com instead of example.com**. Unless your DNS provider supports ANAME or ALIAS records for the apex domain you won't be able to take full advantage of our CDN unless you use the **www** prefix or a similar subdomain.

## DNS configuration

You'll need to point the DNS records for the domain at our servers.

* Create a CNAME that will "alias" your site to `<site-name>.netlify.com`. If your domain is `example.com` and your site is at `example.netlify.com`, you would create a CNAME record for **www** pointing at `www.example.com` to `example.netlify.com`.
* Create an A record for the raw domain (example.com) pointing to `198.61.251.14`

![Example DNS Records](/img/docs/dns-records.png)

If your DNS provider supports ANAME or ALIAS records for apex domains you can instead alias the raw domain to `www.netlify.com`

Depending on your DNS provider changes to DNS records can take several hours to propagate, so be patient.

## Godaddy <a id="godaddy"></a>

If you've purchased your domain on GoDaddy, follow these simple instructions to point it at your netlify site:

Step 1: Log in to your GoDaddy account
![godaddy1.png](_source/images/godaddy1.png)

Step 2: Click the plus sign next to  `Domains`
![godaddy2.png](_source/images/godaddy2.png)

Step 3: For your chosen domain, click  `Manage DNS`
![godaddy3.png](_source/images/godaddy3.png)

Step 4: Click  `DNS ZONE FILE`
![godaddy4.png](_source/images/godaddy4.png)

Step 5: Click  `Add Record`
![godaddy5.png](_source/images/godaddy5.png)

Step 6: Add a CNAME Record as shown below, then click  `Add Another`
![godaddy6.png](_source/images/godaddy6.png)

Step 7: Add an A Record as shown below, then click  `Finish`
![godaddy7.png](_source/images/godaddy7.png)

Step 8: Don't forget to save!
![godaddy8.png](_source/images/godaddy8.png)

It could take up to 48 hours (but most likely won't) for the changes to go into effect.

## NameCheap<a id="namecheap"></a>

If you've purchased your domain on NameCheap, follow these simple instructions to point it at your netlify site:

Step 1: In your dashboard, click  `Manage`
![namecheap1.png](_source/images/namecheap1.png)

Step 2: Click  `Advanced DNS`
![namecheap2.png](_source/images/namecheap2.png)

Step 3: Under  `Type` select  `CNAME Record`. Make sure the  `Host` is set to  `www` and  `Value` is the name of your site as shown on [app.netlify.com/sites](https://app.netlify.com/sites), then click the green check mark
![namecheap3.png](_source/images/namecheap3.png)

Step 4: Under  `Type` select  `A Record`. Set the value to  `198.61.251.14` and click the green check mark
![namecheap4.png](_source/images/namecheap4.png)

Your custom domain is now pointing at your netlify site. Remember, it may take up to a few hours for everything to work correctly.

## Google Domains <a id="googledomains"></a>

If you've purchased your domain on Google Domains, follow these simple instructions to point it at your netlify site:

Step 1: Click the server icon under  `DNS`
![goog1.png](_source/images/goog1.png)

Step 2: Scroll down to `Custom Resource Records`
![goog2.png](_source/images/goog2.png)

Step 3: Choose  `A` from the dropdown menu, and set the IPv4 address to  `198.61.251.14`, then click  `Add`
![goog3.png](_source/images/goog3.png)

Step 4: Choose  `CNAME` from the dropdown, then set the first box to  `www` and enter the name of your site as shown on [app.netlify.com/sites](https://app.netlify.com/sites) in the  `Domain` box, then click  `Add`
![goog4.png](_source/images/goog4.png)

Your custom domain is now pointing at your netlify site. Remember, it may take up to a few hours for everything to work correctly.

## DNSimple <a id="dnsimple"></a>

If you've purchased your domain on DNSimple, follow these simple instructions to point it at your netlify site:

Step 1: From your dashboard, click the name of your domain
![dnsimple1.png](_source/images/dnsimple1.png)

Step 2: Click  `Services`
![dnsimple2.png](_source/images/dnsimple2.png)

Step 3: Click  `Add or edit services`
![dnsimple3.png](_source/images/dnsimple3.png)

Step 4: Scroll down to netlify, then click  `Add service`
![dnsimple4.png](_source/images/dnsimple4.png)

Step 5: Enter the name of your site as shown on [app.netlify.com/sites](https://app.netlify.com/sites) and then click  `Complete Netlify Setup`
![dnsimple5.png](_source/images/dnsimple5.png)

Your custom domain is now pointing at your netlify site. Remember, it may take up to a few hours for everything to work correctly.

## DNS Made Easy <a id="madeeasy"></a>

If you've purchased your domain on DNSimple, follow these simple instructions to point it at your netlify site:

Step 1: Click  `Domains`
![madeeasy1.png](_source/images/madeeasy1.png)

Step 2: Click the name of your domain
![madeeasy2.png](source/images/madeeasy2.png)

Step 3: Under  `A Records` click the  `+` sign
![madeeasy3.png](_source/images/madeeasy3.png)

Step 4: Leave the  `Name` field blank, enter  `198.61.251.14` in the  `IP` field, and click  `Submit`
![madeeasy4.png](_source/images/madeeasy4.png)

Step 5: Under  `CNAME Records` click the  `+` sign
![madeeasy5.png](_source/images/madeeasy5.png)

Step 6: In the  `Name` field enter  `www`, and in the  `Alias to` field enter the name of your site as shown on [app.netlify.com/sites](https://app.netlify.com/sites). Then click  `Submit`
![madeeasy6.png](_source/images/madeeasy6.png)

Your custom domain is now pointing at your netlify site. Remember, it may take up to a few hours for everything to work correctly.

## Naked domains?

You can use Naked domains with Netlify, but we recommend you always use the **www** version of the domain (eg. www.example.com) for your site. This makes it easier to take advantage of Netlify's powerful CDN.

If you prefer the naked domain, we recommend you use a DNS provider that supports ANAME or ALIAS records for apex domains such as [DNSimple](https://dnsimple.com/) or [DNS Made Easy](http://www.dnsmadeeasy.com/aname-records/). If you set an A record for the apex domain, you won't be able to take advantage of the full Netlify CDN. If your provider lets you set an ALIAS, the full CDN will work. If not, your assets (Javascript, CSS, images) will be served out of a global CDN, but your HTML will be served out of our primary datacenter in the US.

## Domain redirects

We'll automatically set up redirects for the alternative domain to the primary domain. So if you use `www.example.com`, we'll configure `example.com` to do a 301 redirect to the `www` domain. If you assign the naked domain to your site, we'll redirect in the opposite direction.

We only redirect automatically between the root domain and www. Not any other subdomains.

## Domain aliases

Depending on your plan, you can setup domain aliases for your domain, so the same site will be rendered on several different domains.

You can use domain aliases together with [rewrite and redirect](/docs/redirects) to redirect or rewrite based on the current domain of the site.
