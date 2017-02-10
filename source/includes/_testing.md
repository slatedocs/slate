# Testing

Beyonic provides a few features to ease API testing. These features are described below.

## Test API token
All the examples include a test API token that actually works. They can be run directly, so feel free to try them out as you read the documentation.

## Test Currency

Beyonic provides a test currency, with the following parameters:

* **Phone Format**: +800XXXXXXXX
* **Currency Code**: BXC

The BXC currency is used throughout the examples and you can also use it in your own testing. Payments made in the BXC currency will not affect your live currency accounts. Additionally, depending on the number you are paying, you can test various success and failure scenarios. See "Test Numbers" below

**Note**: Currently, this test currency works only for outgoing payments.

**Enabling or disabling the test currency**

To enable or disable the test currency, once you're logged into Beyonic, go to this URL:

<aside class="notice">https://app.beyonic.com/testing/</aside>

Or go to "Home" > "Company Settings" > (Cogwheel) > Test Tools.

From that URL, you can enable the test currency, and also update the available test credit.

## Test Numbers

Beyonic provides test numbers that should be used in conjunction with the test currency. The following numbers are treated in special ways when used with the BXC currency:

### Sending Payments

* **+80000000001** - When you add a contact with this number, the contact will always fail the mobile money registration checks, and therefore payments sent to this number will always fail.
* **+800XXXXXXXX** - All other numbers in the format +800XXXXXXXX will pass the name checks only if the contact name is "John Doe". So, set the name to "John Doe" to test the effect of a successful name check, or set it to something else to test the effect of a failed name check.
* Subsequently, all BXC payments to numbers with format +800XXXXXXXX and name "John Doe", (except +80000000000) will succeed, if the amount is greater than or equal to 10 and less than or equal to 5,000,000 BXC.

**Note**: Make sure you have enough BXC credit on your account. Use [https://app.beyonic.com/testing/](https://app.beyonic.com/testing/) to update your BXC credit.

### Receiving Payments

* **+80000000001** - If you request a payment from this number, it will always fail with the "Cancelled By User" error. Use this to simulate a user cancelling or rejecting your payment request.
* **+80000000009** - If you request a payment from this number, it will always expire. Use this to simulate a user ignoring your payment request by doing nothing and letting it expire.
* **+800XXXXXXXX** - All other numbers in this format will complete successfully. Use this to test successful payment request scenarios.

**Note**: Make sure you have enough BXC credit on your account. Use [https://app.beyonic.com/testing/](https://app.beyonic.com/testing/) to update your BXC credit.

## Testing Webhooks

**1. Triggering test events**

To trigger a test notification, simply perform the corresponding action in your account. You can do this via the API or the web portal.

For example, to trigger a 'contact.created' event, simply create a contact. Or, to trigger a 'payment.status.changed' event, use the Payments API to create a payment with the test currency and test numbers described above.

**2. Https with invalid certificates**

Beyonic only supports notification urls (also called webhooks or callback urls) that start with "https://", even when testing. See the "Webhooks" section for more infromation. So, you should set up URL to a dedicated page on your server with a server-side https certificate.

Beyonic will usually validate the https certificate, and if validation fails, the notification will not be sent to your URL. To skip validation while testing, add ?skip-cert-verify to your URL, for example:
    <aside class="notice">https://my.callback.url.com?skip-cert-verify</aside>

Note that skip-cert-verify only prevents certificate verification. It doesn't eliminate the "https://" requirement

While you can use skip-cert-verify on your production URLs, we advise you to use valid server side certificates to maximize security on your production systems.

**3. Setting up a temporary callback URL and verifying the format of the notifications**

If you are not able to set up a dedicated "https://" url while testing, we recommend using a service like [RequestBin](https://requestb.in/).

RequestBin gives you a URL that will collect requests made to it and let you inspect them in a human-friendly way. Use RequestBin to inspect and debug the webhook notifications.

Once you get a RequestBin URL, it uses http by default. Since Beyonic only supports https, remember to use "https://" and "skip-cert-verify"

For example, if your RequestBin URL is

    <aside class="notice">http://requestb.in/xzdqe313</aside>

Then use this for your callback URLs:

    <aside class="notice">https://requestb.in/xzdqe313?skip-cert-verify</aside>

**4. Viewing logged notification requests and responses**

Beyonic logs notificaiton requests and responses for at least 30 days. These can be viewed by logging into the web portal, and going to "Home" > Company Settings" > "Advanced Settings" > "Notification Endpoints"

By clicking on "Recent Events", you will be able to see events and notification attempts, including the responses that Beyonic is getting from your notification server.
