# Authentication

## Authentication Headers Format

Authentication information is required for every request.  This information should be placed
in the headers of each request by the client.  The headers follow the RFC 6750 Bearer Token format:

```
  Access-Token: Jap0KPYbYrdbs7fuPfcN2g
  Token-Type: Bearer
  Client: 3LNndC01Qcle0NTzSZMMDg
  Expiry: 1462471387
  Uid: partner_abc@optisom.com
```


## Creating an Authentication Token

Using your email and password, you can create an authentication token by posting to the
API sign_in endpoint.

`https://partner_abc.optisom.com/api/v2/auth/sign_in`

<aside class="notice">
The email, password and domain name should be replaced with the information provided
to you by our partner support team.
</aside>

> Request for authentication token:

```
curl -i -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -d '{ "email": "partner_abc@optisom.com", "password": "supersecret" }' \
  "https://partner_abc.optisom.com/api/v2/auth/sign_in"
```

> Abbreviated response:

```
> HTTP/1.1 200 OK
> Access-Token: Jap0KPYbYrdbs7fuPfcN2g
> Token-Type: Bearer
> Client: 3LNndC01Qcle0NTzSZMMDg
> Expiry: 1462471387
> Uid: partner_abc@optisom.com
> Content-Type: application/json; charset=utf-8
> Date: Thu, 21 Apr 2016 18:03:07 GMT
```

## Validating an Existing Authentication Token
Previously issued tokens can be validated through the following request:

```
curl -X GET \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Access-Token: gqhY7hJ2Nwkld0dSSkta0A" \
  -H "Token-Type: Bearer" \
  -H "Client: RKhX7t2HkzLeenVevc4mww" \
  -H "Expiry: 1462471387" \
  -H "Uid: partner_abc@optisom.com" \
  "https://partner_abc.optisom.com/api/v2/auth/validate_token"
```

## Making an Authenticated Request
To make an authenticated request, use the following format:

<aside class="notice">
The Access-Token, Client and Expiry should be replaced with the values from the response
for an authenticated token request.

</aside>


```
curl -X GET \
  -H "Accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Access-Token: gqhY7hJ2Nwkld0dSSkta0A" \
  -H "Token-Type: Bearer" \
  -H "Client: RKhX7t2HkzLeenVevc4mww" \
  -H "Expiry: 1462471387" \
  -H "Uid: partner_abc@optisom.com" \
  "https://partner_abc.optisom.com/api/v2/users/1/screenings"
```
