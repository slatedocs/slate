# Authentication 

> To authorize, use this code:

```shell
# API Key Header
$ curl -i -X POST -H 'Content-Type: application/json' -H 'apikey: your_key_here' https://api-client.kudosnow.com/v1/kudos --data '{}'

# API Key Query Param
$ curl -i -X POST -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/kudos?apikey=your_key_here' --data '{}'
```
```javascript
var request = require('request');

var options = {
  uri: 'https://api-client.kudosnow.com/v1/kudos',
  method: 'POST',
  headers: {
    "apikey": "your_key_here"
  },
  json: {}
};

request(options, function (error, response, body) {
  ...
});

```

> Make sure to replace *your_key_here* with your private API key.

Authenticate your account when using the API by including your private API key in the request. You can
manage your API keys from your [Admin Account](/admin/api). Your API keys carry many privileges, so be
sure to keep them secret! Do not share your private API keys in publicly accessible areas such GitHub,
client-side code, etc.

|*Definition*|*type*|*name*|*in*|
|:---|:---|:---|:---| 
|APIKeyHeader|*api_key*|apikey|header|
|APIKeyQueryParam|*api_key*|apikey|query|

<aside class="notice">
  You must replace <code>your_key_here</code> with your private API key.
</aside>

