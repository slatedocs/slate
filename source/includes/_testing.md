# Testing

Beyonic provides a few features to ease API testing. These features are described below.

## Test API token
All the examples include a test API token that actually works. They can be run directly, which enables you to try them out as you read the documentation

## Test Currency

Beyonic provides a test currency, with the following parameters:
* Country Code: +401
* Currency Code: BXC

The BXC currency is used throughout the examples and you can also use it in your own testing. Payments made in the BXC currency will not affect your live currency accounts. Additionally, depending on the number you are paying, you can test various success and failure scenarios. See "Test Numbers" below

**Note**: Currently, this test currency works only for outgoing payments.

**Enabling or disabling the test currency**

To enable or disable the test currency, once you're logged into Beyonic, go to this URL: 

<aside class="notice">https://app.beyonic.com/testing/</aside>

Or go to "Home" > "Company Settings" > (Cogwheel) > Test Tools.

From that URL, you can enable the test currency, and also update the available test credit.

## Test Numbers

Beyonic provides test numbers that should be used in conjunction with the test currency. The following numbers are treated in special ways when used with the BXC currency:

* +401000000000 - this number will always fail the mobile money registration checks, and therefore will not allow payment.
* All numbers in the format +401XXXXXXXXX will pass the name checks only if the contact name is "John Doe".
* Subsequently, all BXC payments to numbers with format +401XXXXXXXXX and name "John Doe", (except 401000000000) will succeed, if the amount is greater than or equal to 10 and less than or equal to 5,000,000 BXC.

**Note**: Make sure you have enough BXC credit on your account. Use [https://app.beyonic.com/testing/](https://app.beyonic.com/testing/) to update your BXC credit.

## Testing Webhooks

**1. Https with invalid certificates**

Beyonic only supports notification urls (also called webhooks or callback urls) that start with "https://", even when testing. See the "Webhooks" section for more infromation. So, you should set up URL to a dedicated page on your server with a server-side https certificate.

Beyonic will usually validate the https certificate, and if validation fails, the notification will not be sent to your URL. To skip validation while testing, add ?skip-cert-verify to your URL, for example:
    <aside class="notice">https://my.callback.url.com?skip-cert-verify</aside>

Note that skip-cert-verify only prevents certificate verification. It doesn't eliminate the "https://" requirement

While you can use skip-cert-verify on your production URLs, we advise you to use valid server side certificates to maximize security on your production systems

**2. Setting up a temporary callback URL and verifying the format of the notifications**

If you are not able to set up a dedicated "https://" url while testing, we recommend using a service like [RequestBin](https://requestb.in/).

RequestBin gives you a URL that will collect requests made to it and let you inspect them in a human-friendly way. Use RequestBin to inspect and debug the webhook notifications.

Once you get a RequestBin URL, it uses http by default. Since Beyonic only supports https, remember to use "https://" and "skip-cert-verify"

For example, if your RequestBin URL is

    <aside class="notice">http://requestb.in/xzdqe313</aside>

Then use this for your callback URLs:

    <aside class="notice">https://requestb.in/xzdqe313?skip-cert-verify</aside>

**3. Logging all callback requests and responses**

RequestBin will only show you the request format, but will not send the request to your final callback URL, and will not show you the response that Beyonic is receiving from your callback URL.

A number of third party services can be used to provide request proxying and logging. For example, [Runscope](https://www.runscope.com/) provides full traffic inspection and debugging via its Gateway URLs service. This service will provide a custom URL for you, that will proxy the callbacks to your real callback URL, and log both the requests and responses. Runscope provides free plans as well as paid plans.

Once you have your gateway URL from Runscope, use that as your callback URL in Beyonic.

[See this article for more information.](https://www.runscope.com/docs/debugging)

