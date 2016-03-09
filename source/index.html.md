---
title: API Reference

language_tabs:
  - html
  - http
  - shell
  - go

toc_footers:
  - <a href='https://api.netlify.com/applications'>Start a new application!</a>

includes:
  - cli
  - continuous-deployment
  - custom-domains
  - ssl
  - redirects
  - headers-and-basic-auth
  - form-handling
  - password-protection
  - webhooks
  - inject-analytics-snippets
  - versioning-and-rollbacks
  - authentication-providers
  - prerendering
  - github-permissions
  - api
  - rest
  - rest_sites
  - rest_deploys
  - errors

search: true
---

# Introduction

[Netlify](http://www.netlify.com) builds, deploys and hosts your front end.

Deploying a new site with Netlify is so simple it fits in a tweet.

``` shell
npm install netlify-cli -g
cd my-site-folder
netlify deploy
```

This is all you need to deploy a static site folder, but Netlify can do much more for you.

For a good example you can look at the [Netlify](http://netlify.com) main page. Feel free to check it out on [Github](https://github.com/netlify/netlify-home) and correct any typos you see.

Anytime we do a push to Github or merge a pull request on that repo, Netlify will automatically do a clean build of the site with [Jekyll](http://jekyllrb.com/) and deploy to the global CDN.

# Authentication
<aside class="notice">
All endpoints use HTTPS
</aside>

Netlify uses OAuth2 for authentication. You'll need an application client key and a client secret before you can access the Netlify API. You can register a new application at [https://api.netlify.com/applications](https://app.netlify.com/applications).

If you're making a public integration with Netlify for others to enjoy, you must use OAuth 2. This allows users to authorize your application to use Netlify on their behalf without having to copy/paste API tokens or touch sensitive login info.

The Oauth2 end user authorization endpoint is
