# Payment

Payment is required to create a subscription for any subscription plan.

## Payment Types

A payment always has a payment_type associated. It can be one of the below:

* razorpay - Can be used only with one-time subscription plans
* razorpay_recurring - Can be used only with recurring subscription plans
* android_pay - (Deprecated) Can be used only with one-time subscription plans
* androidpay_recurring - (Deprecated) Can be used only with recurring subscription plans
* juspay- Can be used only with one-time subscription plans
* simpl - Can be used only with one-time subscription plans
* paytm_auto_debit - Can be used only with one-time subscription plans
* stripe - Can be used only with one-time subscription plans
* sponsored - Can be used only when subscription plan worth is zero
* reward - Can be used only when subscription plan worth is zero
* skip_payment_gateway - Can be used only when payment amount is zero

## Payment Amount

It must be same as subscription plan price. If a valid coupon code is applied, the difference of subscription plan price and payment amount must be equal to the discount amount.

This price validation will be skipped when payment type is `android_pay` or `androidpay_recurring`