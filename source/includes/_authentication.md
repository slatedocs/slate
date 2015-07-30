# Authentication

## API Token

> To authorize, use this code:

```javascript
var ConstructorIO = require('constructorio');
var constructorio = new ConstructorIO({
  apiToken: "[your token]",
  autocompleteKey: "[your autocomplete key]",
});

```

```shell
# with curl, there's no need to authorize separately -- just pass your API token in with every call
curl -X POST -H "Content-Type: application/json" -d '{"item_name":"xyz","keywords":["k1","k2"]}' \
  -u "[your token]:" https://ac.constructor.io/v1/item
```

> Make sure to replace `[your token]` with your API token from [your dashboard](/dashboard).

You authenticate to the REST API by providing your API token, which you can obtain from [your dashboard](/dashboard).

Authentication is done using [HTTP Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API token as the basic auth username in every request. You do not need to provide a password. All API requests must be made over HTTPS.

## Verification

```shell
curl -u "[your token]:" "https://ac.constructor.io/v1/verify?autocomplete_key=[your_autocomplete_key]"
```

```javascript
constructorio.verify(function(error, response) {
  if (error) {
    console.log("Error: " + error);
  } else {
    console.log("Response: " + response);
  }
}
```

You can verify that authentication works correctly by issuing a simple verification request.

