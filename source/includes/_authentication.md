# Authentication

## Strategy

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.handshq.com/v1/authentication" \
  -H "Accept: application/json"  \
  -H "Authorization: bearer [api_token]"
```

> In all subsequent examples make sure to replace `[api_token]` with your API token

HandsHQ uses API tokens to allow access to the API. You can find your API token in the API tab of your settings page
[here.](https://app.handshq.com/settings/api_configuration)


HandsHQ expects for the API token to be included in all API requests to the server in a header that looks like the following:

`Authorization: bearer [api_token]`

<aside class="notice">
You must replace <code>[api_token]</code> with your HandsHQ API token and please be sure to keep it safe!
</aside>


## Testing your authentication details

```json
{
    "data": {
        "id": "abcdefg",
        "type": "actor",
        "attributes": {
            "company_name": "Example Company Ltd"
        }
    }
}
```

If you would like to test that your token is valid, the following request is available:

### Request

`GET https://api.handshq.com/v1/authentication`

### Response

- `200` Successful authentication.
- `401` The token provided was not recognised as being valid.

## Verifying requests made by HandsHQ
### Verification strategy - Signed Requests
<!-- Credit to @jasny for putting together a gist with different example implementations in different languages -->

> All examples assume a key of "my_key" and JSON data of {"bar":"foo"}

> Ruby Example:

```ruby
  require 'openssl'
  key = "my_key"
  # NB: "{\"bar\":\"foo\"}" and JSON[{bar: :foo}] and '{"bar":"foo"}' are equivalent arguments in ruby.
  data = "{\"bar\":\"foo\"}"

  OpenSSL::HMAC.hexdigest('sha256', "my_key", data)
  # "f0ccfece4923a8eb610fec19a031a769361d164860c4bb11dde380f6d8dc54bf"
```

> Node example:

```javascript
  var crypto = require('crypto');
  var key = 'my_key';
  var data = '{"bar":"foo"}';

  var signature = crypto.createHmac('sha256', key).update(data).digest('hex');
  // 'f0ccfece4923a8eb610fec19a031a769361d164860c4bb11dde380f6d8dc54bf'
```

> Note that different languages will have their own implementations of how to generate the HMAC hex digest.

While requests made to the HandsHQ API require the authentication measures set out out [here](#strategy), we also provide measures to verify that any requests made from HandsHQ can be authenticated.

Such requests are made as a result of subscribing for webhook notifications (e.g. `version_pdf_created`) where we will send a payload containing information about the event. e.g. attributes about a PDF that was just generated for one of your projects.

<aside class='notice'>
  Please note that while we provide such measures, it is still up to those who wish to receive webhook notifications to implement the checks of authenticity with the strategy described.
</aside>

Our strategy involves the generation of a signature which is constructed for each request sent by HandsHQ and can be verified by the consumer due to the fact that the only other holder of the shared secret is HandsHQ, the signature also protects against request tamperings, see below for details:

### Signature details

The signature can be found in a custom header called `X-Handshq-Webhook-Signature`.

This value is generated for every webhook event request.

HandsHQ uses a `HMAC hex digest` for the signature value, which has been generated using:

- Hashing Algorithm: `SHA-256`.
- Secret value: Your HandsHQ `api_token`.
- Data: The body of the request `application/json; charset=utf-8`.

If you wish to be able to generate a signature value to compare against then you will need to use the same hashing algorithm and encoding with the same secret value and data.

### Example authentication workflow

> Example Ruby-On-Rails controller contents

```ruby
  
  before_action :ensure_valid_signature

  def create
    # consume webhook
  end

  private

  def ensure_valid_signature
    # handle invalid signatures, e.g. return a 404 status
    raise 'oh no - an invalid signature!' unless valid_signature?
  end

  def valid_signature?
    # retrieve hex-encoded HMAC digest
    provided_signature = request.headers['X-Handshq-Webhook-Signature']
    # generate your own
    generated_signature = OpenSSL::HMAC.hexdigest('sha256', ENV['MY_HANDSHQ_API_TOKEN'], request.body.read)
    # compare values
    Rack::Utils.secure_compare(generated_signature, provided_signature)
  end
```
> Different frameworks will have their own ways of achieving the workflow as described, and will have their own considerations of best practices, for example in this case the use of `#secure_compare` for additional protection against timing attacks.

Once you have an endpoint which is able to receive notifications and have registered an `event subscription` with the URL pointing to this endpoint, you can do the following to verify the signature.

- Obtain the value of the signature from the `X-Handshq-Webhook-Signature` header.
- Generate a HMAC hex digest with the details as described [here](#signature-details)
- Compare the value of the digest with the value in `X-Handshq-Webhook-Signature`.
- Reject the request if the values do not match.

### Additional considerations

- The signature would only be deemed secure so long as your `api_token` is kept a secret. If you wish to regenerate your `api_token` you can do so [here.](https://app.handshq.com/settings/api_configuration)
- All URLs for webhook destinations must be using `https` to ensure that the contents of the request are secure.
- If you wish to automatically remove an event subscription after it contacts your endpoint, by returning a `410 gone` http status we will automatically remove your event subscription so that you do not need to manually remove it later [via the api](#removing-an-event-subscription).
- Because the signature is generated using both the `api_token` and the body of the request, if either are incorrect then the comparison between digests will fail ensuring both authenticity of sender and request forgery protection.
