# Authentication

To interact with the Careerbuilder API you will need API credentials which will include a developer key, client id and client secret.  We have recently made the decision to shift from a publicly available API to a private API so that we may be able to better service our customer, while still evolving our API Platform.
                                                                                                                                       
The API will still be available to our partner level clients. If you are interested in becoming a partner please [Contact Us](http://developer.careerbuilder.com/partner_messages/new).

Some API endpoints only require a developer key, but most require an OAuth access_token.  There are two types of OAuth access tokens.  Client credentials (using JSON Web Tokens) and user credentials (using the OAuth website flow).

For endpoints that require an OAuth access token, it should be included in the Authorization HTTP header like so:

```shell
curl "http://api.careerbuilder.com/consumer/some-api-name"
  -H "Authorization: Bearer <My_Happy_Token>"
```


<aside class="notice">
You must replace <code>My_Happy_Token</code> with an OAuth token.
</aside>