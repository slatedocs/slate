# Authentication

> Example Request

```shell
curl https://api.recruiterbox.com/v1/openings -u {api_key}:

curl uses the -u flag to pass basic auth credentials (adding a colon after your API key will prevent it from asking you for a password).

```

Authentication is done via the API key which you can find in <a href="https://app.recruiterbox.com/app/#settings/api-key/" target="_blank">Settings -> Advanced Settings -> API Key</a>

Requests are authenticated using <a href="http://en.wikipedia.org/wiki/Basic_access_authentication" target="_blank">HTTP Basic Auth</a>. Provide your API key as the basic auth username. You do not need to provide a password.

You can see your API key, and revoke it if necessary. Be sure to keep your API key a secret. The API is designed to be used from server side.


<aside class="notice">
You must replace `{api_key}` with your API key.
</aside>
