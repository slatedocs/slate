# AUTHENTICATION

> To authorize a request, you can use this code:

```shell
# With curl, you can use -u followed by your API key. Adding `:` after the key will simply tell curl not to ask you for a password.
curl "https://api.getseam.com/v1/groups" \
  -u "${YOUR_API_KEY}:"
```

```ruby
# In ruby, we first need to encode the key using Base64 before adding it to the request header
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = 'https://api.getseam.com/v1/groups'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
[
    {
        "id": "512beb75-2538-47bf-b646-f39239d2e127",
        "name": "12119 robinridge ln"
    }
]
```


The Seam API uses API keys to authenticate requests. You can view and manage your API keys in the Seam Dashboard or by calling your user profile endpoint using your user auth token.

![Seam Architecture Overview](https://ik.imagekit.io/vgfzjbrn7/api-key-dashboard-view.svg)

Authentication to the API is performed via [HTTP Basic Auth](https://en.wikipedia.org/wiki/Basic_access_authentication). Provide your API key as the basic auth username value. You do not need to provide a password.

If you do not include your key when making an API request, or use an incorrect or outdated key, Seam will return an error.

Your secret API key can be used to make any API call on behalf of your account, such as performing actions or retrieving data. ***Treat your secret API key as you would any other password.***

Grant access only to those who need it. Ensure it is kept out of any version control system you may be using. Control access to your key using a password manager or secrets management service. We plan to eventually introduce restricted API keys for granular permissions.

<aside class="notice">
Make sure to replace <code>YOUR_API_KEY</code> with your actual API key.
</aside>

If you are running the shell examples, you can simply export your API key in your current terminal session as such: `export YOUR_API_KEY="<your actual API key>"`
