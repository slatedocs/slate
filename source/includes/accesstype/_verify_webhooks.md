# Verify Webhooks

## Signature Verification

If you set the secret for the webhooks, the headers of the webhook will contain `X-AT-Signature`. You can
verify the signature by using the following snippet in rails


```ruby
signature = request.headers['X-AT-Signature']
digest = OpenSSL::Digest.new('sha256')
secret = "foobar" # the secret that you have set in dashboard of Accesstype
message = request.body.read
digest = OpenSSL::HMAC.hexdigest(digest, secret, message)
ActiveSupport::SecurityUtils.secure_compare(digest, signature)
```
