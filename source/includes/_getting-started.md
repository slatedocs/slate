# Getting Started

## Authentication

> Authentication using HTTP basic auth.

```shell
curl "https://api.affinity.co/api_endpoint" -u :$APIKEY
```

To use the API, you will need to generate an API secret key. This can be done easily through
the Settings Panel that is accessible through the left sidebar on the Affinity web app.

Requests are authenticated using [HTTP Basic Auth](http://en.wikipedia.org/wiki/Basic_access_authentication).
Provide your API key as the basic auth password. You do not need to provide a username.

Currently, we support one key per user on your team. Once you have generated a key, you
will need to pass in the key with every API request for us to process it successfully.
Otherwise, an error with a code of `401` will be returned.

<aside class="notice">
  <h6>Note</h6>
  <p>Changes made through the API will be attributed to the person the API key is assigned to.</p>
</aside>

## Requests & Responses

This is a full-featured RESTful API. We provide reading & writing functionality for each
object type in Affinity. All requests use the base URL of `https://api.affinity.co/`.

Responses to each request are provided as a JSON object. The response is either the data
requested, or a valid error message and error code as outlined below.

Here is a list of all the error codes the Affinity API returns in case something does not go as expected:

| Error Code | Meaning                                                                                                                                                                                                      |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| 401        | Unauthorized -- Your API key is invalid.                                                                                                                                                                     |
| 404        | Not Found -- Requested resource does not exist.                                                                                                                                                              |
| 422        | Unprocessable Entity -- Malformed parameters supplied. This can also happen in cases the parameters supplied logically cannot complete the request. In this case, an appropriate error message is delivered. |
| 429        | Too Many Requests -- You have exceed the rate limit.                                                                                                                                                         |
| 500        | Internal Server Error -- We had a problem with our server. Try again later.                                                                                                                                  |
| 503        | Service Unavailable -- This shouldn't generally happen. Either a deploy is in process, or Affinity services are down.                                                                                        |

<aside class="notice">
  <h6>Note</h6>
  <p>Requests must be sent over HTTPS. Requests sent over HTTP will not return any data in order to ensure your sensitive information remains secure.</p>
</aside>