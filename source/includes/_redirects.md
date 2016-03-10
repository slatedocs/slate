# Redirects and Rewrite Rules

You can configure redirects and rewrite rules for your Netlify site by adding a `_redirects` file to the root of your site folder (note, if you're running a build command, the `_redirects` file should end up in the folder you're deploying. It's not enough to have on in the root of your repository).


## Basic redirects

Setting up basic redirects is dead simple:

    # Simple redirects from one path to another
    /home              /
    /blog/my-post.php  /blog/my-post
    /news              /blog
    /google            https://www.google.com

Just list the original path followed by the new path or URL.

Any # indicates a comment and everything following the pound sign will be ignored.


## HTTP Status Codes

You can specify the HTTP status code for the rewrite. The default is 301 which will do a permanent redirect.

    # Redirect with a 301
    /home         /              301

    # Redirect with a 302
    /my-redirect  /              302

    # Rewrite a path
    /pass-through /index.html    200

    # Show a custom 404 for this path
    /ecommerce    /store-closed  404

When the status code is 301, 302 or 303 Netlify will redirect to the target url. With any other status code Netlify will render the target url with the specified status code.

This means that you can define **rewrite** rules as well as **redirects** by specifying 200 as the status code.

## Custom 404

You can easily setup a custom 404 page for all paths that doesn't resolve to a static file. This doesn't require any redirect rules. Just add a `404.html` page to your site and it'll be picked up automatically.

## Trailing Slash

Our CDN edge nodes do URL normalization before the redirect rules kick in. This happens to make sure we can guarantee the highest possible cache hit rate and the absolute best performance for your site.

When "Pretty URLs" is enabled under processing settings for your site, Netlify will enforce consistent URL patterns.

A link to /about.html will be rewritten to /about in your HTML files and Netlify will enforce a redirect from /about/ to /about

A link to /about/index.html will be rewritten to /about/ and Netlify will redirect from /about to /about/

We don't do automatic redirects from /about/index.html to /about/ since the former URL really does correspond to a file on our servers (and redirecting in this case would often cause trouble for single page apps loading partials over AJAX).


## Placeholders

You can use placeholders in the origin and target paths:

    /news/:year/:month:/:date/:slug  /blog/:year/:month/:date/:slug

This would redirect a URL like `/news/2004/02/12/my-story` to `/blog/2004/02/12/my-story`


## Splats

An asterisk indicates a **splat** that will match anything that follows:

You can use the splat in your rewrites or redirects like this:

    /news/*  /blog/:splat

This would redirects paths like `/news/2004/01/10/my-story` to `/blog/2004/01/10/my-story`

## Query Params

You can also use query parameters in your URL matches. The following match will redirect a URL like: `/store?id=my-blog-post` to `/blog/my-blog-post` with a `301` redirect.

```
/story id=:id  /blog/:id  301
```

Just add separate key/value pairs separated by space to match more than one query parameter.

## History Pushstate and Single Page Apps

If you're developing a single page app and want history pushstate to work so you get clean urls, you'll want to enable the following rewrite rule:

    /*    /index.html   200

This will effectively serve the index.html instead of giving a 404 no matter what URL the browser requests.

## Proxying

Just like you can rewrite paths like `/*` to `/index.html`, you can also set up rules to let parts of your site proxy to external services. Let's say you need to communicate from a Single Page App with an API on https://api.example.com that doesn't support CORS request. The following rule will let you use /api/ from your JavaScript client:

    /api/*  https://api.example.com/:splat  200

Now all requests to /api/... will be proxied through to https://api.example.com straight from our CDN servers. If the API supports standard HTTP caching mechanisms like Etags or Last-Modified headers, the responses will even get cached by CDN nodes.

## Note on shadowing

By default, you can't shadow a URL that actually exists within the site when using a splat or dynamic path segment. This means that even if you've setup the following rewrite rule:

    /*   /index.html   200

The path `/partials/chat.html` would still render the contents of that file, if that file actually exists. This tends to be the preferred behavior when setting up rewrite rules for single page apps, etc.

However, if you're 100% sure that you'll always want to redirect, even when the URL matches a static file, you can append an exclamation mark to the rule:

    /app/*  /app/index.html  200!

This will rewrite everything within /app/* to /app/index.html even if a file matches the URL.

## GeoIP and Language-based redirects

Netlify supports GeoIP and language-based redirects directly from our CDN nodes.

This is ideal for large multi-regional sites where you want to send people to the right location based on their location or browser language.

Both the language and the country can be specified in a cookie as well, so you can easily override the default behavior with JavaScript.

GeoIP and language-based redirects are available on our enterprise plan. [Please get in touch](/contact) for more details.
