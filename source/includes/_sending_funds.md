# Sending Money

# Introduction
Beyonic uses the term "Payments" to refer to money that you send to a mobile subscriber. This differentiates money you send (Payments) to mobile subscribers from money you receive from mobile subscribers (Collections).

Beyonic provides the [Payments API](#payments) to enable you to send a payment to a mobile subscriber, or to view payments that you have previously sent to a mobile subscriber. See the [Payments](#payments) documentation below for more information.

**Related Events**

The "payment.status.changed" event is triggered whenever something happens to a payment that you have initiated. For example, if it is successfully delivered or if it fails. You can configure a web link to receive notifications whenever this occurs. This will allow you to respond automatically whenever a payment is completed or whenever it fails. See our [Webhooks API](#webhooks) documentation for more information.