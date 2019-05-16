# Authentication
Rotessa uses API keys to allow access to the API. API keys are unique tokens used by the API, placed in the request header that grant access to your Rotessa resources.

The Rotessa API is located at [https://api.rotessa.com/v1](https://api.rotessa.com/v1). The URL for our test environment is [https://sandbox-api.rotessa.com/v1](https://sandbox-api.rotessa.com/v1).

Access to the test environment can be granted by signing up at [sandbox.rotessa.com](https://support@rotessa.com). Once signed up, email [support@rotessa.com](mailto:support@rotessa.com?Subject=Requiring an API Key For Sandbox) with your username to get your sandbox account approved and to gain access to the API.

## Generate an API Key

> To authorize, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl "<rotessa_endpoint>/customers.json" -H "Authorization: Token token=\"<your_api_key>\""
```

> Make sure to replace `your_api_key` with your API key.

Access the API Keys from your Rotessa admin portal.

Existing API keys can be revoked and generated. Click `Create API Key`.

Rotessa expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Token token="your_api_key"`

<aside class="notice">
You must replace <code>your_api_key</code> with your personal API key.
</aside>