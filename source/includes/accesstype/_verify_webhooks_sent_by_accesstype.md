# Verify Webhooks sent by Accesstype

```ruby
signature = request.headers['X-AT-Signature']
digest = OpenSSL::Digest.new('sha256')
secret = "foobar" # the secret that you have set in dashboard of Accesstype
message = request.body.read
digest = OpenSSL::HMAC.hexdigest(digest, secret, message)
ActiveSupport::SecurityUtils.secure_compare(digest, signature)
```

This section is useful when the Outgoing Webhooks feature is enabled in Accesstype dashboard under Accesstype > Settings > Outgoing Webhooks and if the field `Secret` has a value setup in the webhook.

Each webhook request will include a base64-encoded `X-AT-Signature` in the header, which is generated using the `Secret` that is setup in the Accesstype dashboard.

To verify that the request came from Accesstype, the HMAC `digest` must be computed according to an algorithm and compared with the value in the `X-AT-Signature` header. If they match, then you can be sure that the webhook was sent from Accesstype.

An example of the algorithm for signature verification is seen here in Rails.