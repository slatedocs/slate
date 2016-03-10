---
title: Documentation

language_tabs:
  - html
  - http
  - shell

toc_footers:
  - <a href='https://api.netlify.com/applications'>Start a new application!</a>

includes:
  - auth
  - cli
  - continuous-deployment
  - custom-domains
  - ssl
  - redirects
  - form-handling
  - webhooks
  - inject-analytics-snippets
  - versioning-and-rollbacks
  - prerendering
  - github-permissions
  - api
  - rest
  - rest_sites
  - rest_deploys
  - rest_submissions
  - rest_forms
  - rest_hooks
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
