# Redirects and Rewrite Rules

## Country and Language based rewrite rules

Netlify's GeoIP add-on lets you add conditions to your rewrite rules based on countries and languages.

When you add these rules, netlify automatically creates flexible alternate headers that will make sure that the redirects happens straight on the CDN nodes without the need for a roundtrip to our origin servers, and that normal pages and country or language based redirects will both get cached on the CDN.

The easiest way to understand the redirect capabilities is to look at some examples:

```
# Redirect users in China, Hongkong or Taiwan to /china
/  /china   302  Country=cn,hk,tw
# Redirect users in israel to /israel
/  /israel  302  Country=il

# Redirect users with chinese language preference from /china to /china/zn-ch
/china/*  /china/zn-ch/:splat  302  Language=zh
```

The system is smart enough to flatten chains of redirect. So in the above case, if a user from China with Chinese language preference visits /china, she'll get redirected directly to /china/zn-ch in one step. Our cache server will cache this redirect for any other users that would match the same country and language rules.

You can find a list of country codes here:
[http://dev.maxmind.com/geoip/legacy/codes/iso3166/](http://dev.maxmind.com/geoip/legacy/codes/iso3166/)

And language codes here:
[http://www.metamodpro.com/browser-language-codes](http://www.metamodpro.com/browser-language-codes)

For languages, note that en will match en-US and en-GB, zh will match zh-tw and zh-hk, etc.
