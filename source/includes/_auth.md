# Authentication

<!-- TODO: Merge these to be nicer & remove redundancy -->
<aside class="notice">
All endpoints use HTTPS
</aside>
``` shell
curl {:endpoint} -H "Authorization: Bearer {:access_token}"
```
Netlify uses OAuth2 for authentication. You'll need an application client key and a client secret before you can access the Netlify API. You can register a new application at [https://api.netlify.com/applications](https://app.netlify.com/applications).

If you're making a public integration with Netlify for others to enjoy, you must use OAuth 2. This allows users to authorize your application to use Netlify on their behalf without having to copy/paste API tokens or touch sensitive login info.

The Oauth2 end user authorization endpoint is

## Password Protecting Sites

If you're using netlify for staging sites or deploying mockups that you want to share with customers, netlify's built-in password protection can come in handy.

Go to the settings screen for your site and click "Edit" next to the "Privacy" setting. Then enter your password of choice.

If you need multiple passwords for a site, or need to protect just part of your site, you can setup Basic-Auth via netlify's [custom HTTP header](/docs/headers_and_basic_auth) support.

## Authenticating with 3rd party providers

If you're using netlify to host materials for your intranet, like sales manuals for your global sales team, private developer documentation, HR guides and similar sensitive material, you might want fine-grained access control based on 3rd party authentication providers like [Stormpath](https://stormpath.com) or your own authentication API.

We can work with you to make this possible and integrated directly with our CDN servers, to let you control fine grained access controls for individual users with all the performance of a CDN hosted static website.

Please [get in touch](/contact) for more information about authentication on enterprise plans.

<!-- AUTH PROVIDERS -->

## Authentication Providers

One thing that can hold back single page apps with no backend is authentication.

Let's say you want to build a small single page app that acts as a simpler UI for your Github issues.

Github's API is pretty awesome and it supports CORS so you can access the API directly from your browser once you have an OAuth2 access token.

The problem for a pure single page app is getting an OAuth token. The OAuth authentication process requires a server to send a signed request to the OAuth server, signed with a secret that you can never expose to the client-side of your app.

Netlify solves this problem by giving you a service that will sign the OAuth requests for you and give back an access token ready to use.

## Using an Authentication Provider

Before you can use an authentication provider, you'll need to register an API application with the provider and configure the credentials through the Netlify UI.

For Github, go to the [Applications](https://github.com/settings/applications) tab in the settings and create a new Developer Application.

Github will ask for an **Authorization callback URL**. Make sure to enter `https://api.netlify.com/auth/done`

![Github OAuth Configuration](/img/docs/github-oauth-config.png)

Then go to the **Access** tab for your Netlify site and configure the Github provider with your new **Client ID** and **Client Secret**.

Once you've configured an authentication provider you can use it to obtain an access token in your single page app.

Here's a complete example of how to ask the user to authenticate with Github and then display the resulting access token:

``` html
<!doctype html>
<html>
<head>
  <title>Github Authentication Example</title>
  <!--- This example uses jQuery: -->
  <script src="https://code.jquery.com/jquery-1.11.2.js"></script>

  <!-- Make sure to include Nelify's authentiation library -->
  <script src="https://app.netlify.com/authentication.js"></script>

  <script>
    $(function() {
      $("#login").on("click", function(e) {
        e.preventDefault();
        netlify.authenticate({provider:"github", scope: "user"}, function(err, data) {
          if (err) {
            return $("#output").text("Error Authenticating with Github: " + err);
          }
          $("#output").text("Authenticated with Github. Access Token: " + data.token);
        });
      });
    });
  </script>
</head>
<body>
  <h1>Github Auth Demo:</h1>
  <p><a href="#" id="login">Authenticate</a></p>
  <p id="output"></p>
</body>
</html>
```

## OAuth1 vs OAuth2 and API proxying

Services that use OAuth2 are easy to consume directly from Javascript as long as they support CORS requests, since you just need to set an authorization header in your Ajax calls.

OAuth1 is not as friendly to single page apps since it requires a server to sign each request to the API with a secret key, and some OAuth2 services don't support CORS request.

In these cases you can use Netlify's [proxy feature](/docs/redirects#proxying). For example, to proxy requests to BitBucket's API, add this line to your **_redirects** file:

    /bitbucket/* https://bitbucket.org/:splat 200

Now you can send Ajax requests to BitBucket's API even though it doesn't support CORS requests by replacing **https://bitbucket.org** with **/bitbucket**.

BitBucket's API uses OAuth1, so normally just proxying requests wouldn't help much, since you still need a server to sign requests with your secret. Netlify also has a solution to this.

When using netlify.authenticate with an OAuth1 API you get back an object with a **token** and a **secret** (this is not your API secret) and if you set these in an Authorization header, Netlify will automatically sign your API requests with your API secret.

A jQuery Ajax request to the BitBucket API to get a user's repositories would look like:

``` js
$.ajax({
  url: "/bitbucket/1.0/user/repositories",
  headers: {
       Authorization: "oauth_token: " + token + ", oauth_token_secret: " + secret
  }
}).then(function(data) { console.log("Got repositories: %o", data); });
```

The token variables here are the token and secret you get back from the call to netlify.authenticate().

## Supported Providers

Right now Netlify only supports Github and BitBucket as authentication providers, but we're working on adding more.

If you're building a single page app and need to speak with a specific API, let us know and we'll help you out.

<!-- HEADERS AND BASIC AUTH -->
## Headers & Basic Auth

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
