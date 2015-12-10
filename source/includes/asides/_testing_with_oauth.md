## Testing with Oauth
### Setting up the client

To test TradeGecko API, first make sure you have installed the oauth2
gem.

To setup the client, go to your terminal and fire up irb and type:

```ruby
irb(main):001:0> require 'oauth2'
irb(main):002:0> client_id     = '...'
irb(main):003:0> client_secret = '...'
irb(main):004:0> redirect_uri  = '...'
irb(main):005:0> site          = "https://api.tradegecko.com"
irb(main):006:0> client = OAuth2::Client.new(client_id, client_secret, site: site)
```

Now that your client is ready, you can request an authorization code.

### Getting an authorization code

Generate an authorization url with:

```ruby
irb(main):006:0> client.auth_code.authorize_url(redirect_uri: redirect_uri)
=> https://api.tradegecko.com/oauth/authorize?response_type=code&client_id=...&redirect_uri=...
```

Go to this url in your browser. You'll see the authorization endpoint.
If you click on Authorize, you'll see a page with the authorization code
in it:

![auth_image](/images/auth.png)

Then you'll get redirected to the redirect uri that you specified along with the code parameter in the query.

      http://my.redirect.uri/callback?code=123456789

With this unique code, you will now be able to request the access token.

### Getting an access token

TradeGecko API currently allows [Authorization Code](http://tools.ietf.org/html/rfc6749#section-1.3.1) and
[Resource Owner Password Credentials](http://tools.ietf.org/html/rfc6749#section-1.3.3) authentication grant types.
> For security reasons, the use of Resource Owner Password Credentials is limited only to the account who created the application.

**Authorization Code flow**

```ruby
irb(main):008:0> code = "..." # code you got in the redirect uri
irb(main):009:0> token = client.auth_code.get_token(code, redirect_uri: redirect_uri)
=> <#OAuth2::AccessToken ...>
```  

**Resource Owner Password Credentials flow**

```ruby
irb(main):010:0> token = client.password.get_token('username', 'password')
=> <#OAuth2::AccessToken ...>
```

You now have access to the TradegGecko API.

### Making your first TradeGecko API request

```ruby
irb(main):011:0> response = token.get('accounts')
irb(main):012:0> JSON.parse(response.body)
=> { "accounts": [{ "name": "tradegecko", ... }] }
```

Congratulations! You just made your first request to the TradeGecko API.

### Request with additional parameters

```ruby
irb(main):013:0> response = token.post('products') do |request|
irb(main):014:0>   request.params[:product] = {
irb(main):015:0>     name: "Product1",
irb(main):016:0>     description: "My first product"
irb(main):017:0>   }
irb(main):018:0> end

irb(main):019:0> JSON.parse(response.body)
=> {"product"=>{"id"=>22, "name"=>"Product1", "description"=>"My first product", ...} }
```
