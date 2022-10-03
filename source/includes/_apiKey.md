# API Key

In order to use the SportX API, you do NOT need an API Key. The standard API user can perform all the requests provided in this document. There is a baseline rate limiter applied to these requests.

Some users may require higher rate limits for their application. SportX provides elevated rate limits through an authenticated API Key. If a valid API Key is passed in the request, the elevated rate limits will be applied.

## Generating API Key

1. Visit <a href='https://sx.bet'>sx.bet</a> and register/login to your account. You can connect your MetaMask wallet, or login using your Fortmatic email address.
2. If using MetaMask, `sign` the Signature Request.
3. Click the `Account` tab on the top navigation bar.
4. Click the `Overview` tab on the account navigation bar.
5. You will see an `API Credentials` card. Complete the `Basic Verification` if you have not yet done so by clicking the link in the card.
6. If you've signed in and completed the basic verification, you can now click the button: `GENERATE API KEY NOW`. An API Key will be displayed.
7. The API Key generated will not be displayed again, so please <b>copy and save this key for future use</b>.

<aside class="notice">
If you lose your key, you can generate a new one by following the same steps. Any previous keys used will be unauthorized if you generate a new key.
</aside>

## Usage

```shell
curl --location --request GET 'https://api.sx.bet/markets/active?onlyMainLine=true' \
--header 'X-Api-Key: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX'
```

> You must fill your API Key in the header `X-Api-Key`. The above sample command returns JSON as expected but will allow elevated rate limits.

Once your API Key is generated (see above), you can use it in your HTTP Requests as a header to automatically allow elevated rate limits. You must add it as a HTTP Header with the name: `X-Api-Key`.
