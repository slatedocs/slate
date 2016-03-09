# Prerendering for Single Page Apps

If you're using a single page app for a site that's not behind a login, SEO is an important concern.

Google, Bing, Yandex and other all support Google's [standard for Ajax Crawling](https://developers.google.com/webmasters/ajax-crawling/docs/specification).

Normally Google will penalize sites heavily for using "Cloaking", ie. showing different content to Google than to normal web visitors, but for single page apps they have an exception. When detecting a single page app their crawler will send an `_escaped_fragment_` query parameter in the request, and the origin server can then choose to return a document that represents the content a user will actually see when the single page app is running.

Note: Google recently marked their Standard for Ajax Crawling as deprecated. They're still following the standard, but recommend that single page app authors just rely on Google's built-in capacity for interpreting JavaScript applications. In our experience that's often still not enough and prerendering is often still a necessity.

## Setting up Prerendering

Netlify comes with built-in prerendering on our larger plans. If you're on a plan that supports prerendering, enabling it is as simple as checking a box:

![Enabling netlify's built-in prerendering](/img/docs/netlify-prerendering.png)

Our built-in prerendering service will cache prerendered pages for 24 hours. Prerendered requests counts towards the proxy request count in your plans limits.

You can also use external prerender services that can automate this for you:

* [Prerender.io](https://prerender.io/)
* [Brombone](http://www.brombone.com/)
* [SEO.js](http://getseojs.com/)
* [SEO4Ajax](http://www.seo4ajax.com/)

Prerender.io also have an open-source version of their service that you can self-host.

To use an external service, send us a mail at [team@netlify.com](mailto:team@netlify.com) and let us know which service you're using, and we'll get you setup.

## How it works

We've taken great care to implement support for prerendering in the most efficient manner possible.

When a request hits one of our CDN servers, our CDN software determines if it's a prerendering request from a crawler. If prerendering is enabled for your site, our cache servers will contact the prerendering backend straight from our CDN nodes instead of serving the normal cached request.

If your prerendering backend makes good use of HTTP caching headers like max-age, ETags or Last-Modified dates, prerendered responses will be cached sensibly on our CDN edge nodes. In our initial tests we've seen average response times of ~100ms to crawlers, which is low enough that Google will still give your site a SEO boost for being fast.
