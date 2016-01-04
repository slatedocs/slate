# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

Bingo API uses [OAuth 2](https://tools.ietf.org/html/rfc6749) to authenticate and authorize access to the API. In order to access the API, hence, you will need `Client Id` and  `Client Secret` which you can get at out [developer portal](http://example.com/developers).
Kittn uses API keys to allow access to the API. You can register a new Bingo API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>