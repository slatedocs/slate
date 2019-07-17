# Webhooks

Accesstype has the ability to inform third party system by webhook calls that it makes to any third party systems.

## How to Setup Accesstype webhooks

1. Login to Accesstype and go to Settings > Outgoing webhooks > Add Webhook
2. Enter the URL that you would like Accesstype to make a POST call to.
3. Optionally enter a `Secret` in case you wish to verify and segregate the calls made from Accesstype. [Click here](#verify-webhooks-sent-by-accesstype) for more info on how to verify Accesstype webhooks.
4. Check the `Active` checkbox. This is useful to activate the webhook when Accesstype automatically disables in case of failures. 
5. Select one or more events for which for which you would want the webhook call to be made, and press save.

## Here is how the Accesstype Outgoing Webhooks work
* Once the webhooks are set up, Accesstype makes a POST API call to the webhook URLs specified, as and when the event(s) occur. 
* The Webhook request body contains the Event Name and the Subscription Object.
* When the third party system receives the request, it is advised to return back a success response (200, 201, 2xx).
* In case the external system responds will a failure (non 2xx), then Accesstype will send an email to the Admins and Owners of the Accesstype account along with the payload and will also retry making the webhook call every hour. Accesstype will discontinue retrying the webhook call when it receives a success response or after 24 retries, whichever is earlier.
* If the failures continue to persist, Accesstype will disable the webhook.
* The disabled webhook can then be re-activated in the dashboard by going to Accesstype.com > Settings > Outgoing Webhooks > Activate.

## Description of events

|Event name|Applicability|Description|
|-|-|-|
|Subscription Expiry|One-time and Recurring Subscriptions|Triggered when a one-time-subscription has expired or a recurring subscription which was cancelled, has come to an end.|
|Subscription Cancellation|One-time and Recurring Subscriptions|Triggered when a one-time or a recurring subscription is cancelled.|
|Subscription Renewal|Recurring Subscriptions|Triggered when a recurring subscription is successfully renewed for the subsequent cycle.|
|Subscription Creation|One-time and Recurring Subscriptions|Triggered when a new subscription is created.|
|Subscription Awaiting Payment|Recurring Subscriptions|Triggered when the payment is pending for a recurring subscription, and is not yet renewed. Note: When a payment is due for a recurring subscription, Accesstype waits for the payment for a grace period of 5 days before it marks the subscription as expired. During this grace period, the subscriber continues to gain access to the content.|
|Subscription Activation|One-time and Recurring subscriptions|Triggered when a subscription which was created in the `Pending` state, becomes `Active`.|
|Subscriber Creation|-NA-|Triggered when a new Subscriber is created in Accesstype.|

## Verify Webhooks sent by Accesstype

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