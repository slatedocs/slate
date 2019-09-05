---
title: AccessType API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell--request: Request
  - shell--response: Response

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true

includes:
  - accesstype/accesstype_js
  - accesstype/subscriber-identities
  - accesstype/subscription-groups
  - accesstype/subscriptions
  - accesstype/subscription_gifts
  - accesstype/campaigns
  - accesstype/pay_per_asset
  - accesstype/assets
  - accesstype/wallets
  - accesstype/coupon_codes
  - accesstype/invoices
  - accesstype/referral_voucher
  - accesstype/webhooks
  - accesstype/for-quintype-platform-customers
  - accesstype/for-accepting-donations
  - accesstype/deprecated-for-platform-customers
  - accesstype/amp
  - accesstype/faq
  - accesstype/release_notes



---

# Introduction To AccessType

AccessType is a product for managing subscriptions. It can be used in conjunction with the Quintype Platform

## Terminology
* Asset - An asset is a locked resource, which can be unlocked with a purchase. An asset may have an access level. (Example: Stories, Collections..)
* Subscription Group - A subscription group gives a user access to some number of assets.
* Subscription Plan - A subscription plan is a purchasable item, for some duration. A subscription plan is attached to a group. Each plan has it's own price, and may give a few additional assets free.
* Subscriber - A person that purchases's to locked assets. Subscribers will typically not have direct access to AccessType. A subcriber may have multiple identities.
* Subscription - A subscription is a particular subscriber's access to a subscription plan. It will typically have a start date, and an end date, and may recur at some period. A subscription may have an external id if it came from an earlier CMS, which must be unique. [Payment](#payment) is required to create a subscription.
* Patrons Group - It is the default name of the subscription group for campaigns. It can have many abstract plans (patron plans) attached to it.
* Patron Plan - A patron plan is a purchasable item, for some duration. A subscription plan is attached to a patron group. Each plan has it's own duration, price and assets. A parton plan is purchasable only through a campaign.
* Campaign - A campaign is typically used to fund a project and therefore has a goal. A subscriber can contribute to a campaign by choosing any patron plan.
* Patrons - Users who have subscribed to a Patron plan of a campaign.
* Wallets - A wallet is used by a subscriber to purchase assets or plans. Purchases by subscribers must be validated by Wallet tokens which can be saved in and retrieved from Accesstype.

## Payment

Payment is required to create a subscription for any subscription plan.

### Payment Types

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

### Payment Amount

It must be same as subscription plan price. If a valid coupon code is applied, the difference of subscription plan price and payment amount must be equal to the discount amount.

This price validation will be skipped when payment type is `android_pay` or `androidpay_recurring`
