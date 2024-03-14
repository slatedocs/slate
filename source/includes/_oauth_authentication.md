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