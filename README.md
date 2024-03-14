<p align="center">
  <img
  src="https://raw.githubusercontent.com/rubberstamp/slate/master/source/images/logo.png"
  alt="Rubberstamp API Documentation" width="226">
</p>

<p align="center"><em>Rubberstamp is a simple Purchase Order Solution.</em></p>

If you are here to view Rubberstamp API documentation then this is not the proper place to view them,
Please visit [rubberstamp.github.io/slate](https://rubberstamp.github.io/slate) for documentation


This project is maintained using [slate](https://github.com/lord/slate).

Getting Started
---------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Clone this repository
2. `cd` into it
3. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

Need Help? Found a bug?
--------------------

[Submit an issue](https://github.com/rubberstamp/slate/issues) to the docs Github if you need any help.
And, of course, feel free to submit pull requests with bug fixes or changes.

----------------------------------------------------------------------------------------------------

# Available Oauth2 routes/endpoints for V3 API

```
POST /oauth/token # Oauth2 login route
POST /oauth/revoke # oauth2 sign out route
```

## Getting a bearer token (Sign in)

**Endpoint**

```
POST /oauth/token
```

**Body**

```
email: <email>
password: <password>
grant_type: password
client_id: <client id>
client_secret: <client secret>
```

**Example response**

```json
{
    "access_token": "NoR6Oz8OG5Ci....WXmC_8WE",
    "token_type": "Bearer",
    "expires_in": 7200,
    "refresh_token": "NxmOamX....TqekmatIw",
    "scope": "public",
    "created_at": 1692767229
}
```

## Revoke a token (or Sign out)

**Endpoint**

```
POST /oauth/revoke
```

**Header**

```
Authorization: Bearer <token>
```

**Body**

```
client_id: <client_id>
client_secret: <client_secret>
```

**Example Response**

```json
{}
```

## Check if token is valid

**Endpoint**

```
GET /oauth/token/info
```

**Header**

```
Authorization: Bearer <token>
```

## Accessing other resources with token

In this example I am going to access budget listing api endpoint

**Endpoint**

```
GET /api/v3/budgets
```

**header**

```
Authorization: Bearer <token>
```

And it should give you list of budgets. You can pass `Authorization` header to any V3 API endpoints to access them.

### TODO

- [ ] How to refresh token
- [ ] Today oauth2 Applications are tied with company id, mobile app needs client id and client secret that should works globally for all companies. How do we solve this?
