---
title: AccessType API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true

includes:
  - access-type/subscription-groups
  - access-type/subscriptions
  - access-type/subscriber-identities
---

# Introduction To AccessType

AccessType is a product for managing subscriptions. It can be used in conjunction with the Quintype Platform

## Terminology
* Account - An account is a customer of the subtype platform.
* Asset - An asset is a locked resource (typically owned by the account above), which can be unlocked with a purchase. An asset may have an access level. (Example: Stories, Collections..)
* Subscription Group - A subscription group gives a user access to some number of assets. A subscription group's asset may have an access level, which unlocks relevant assets at a lower access level.
* Subscription Plan - A subscription plan is a purchasable item, for some duration. A subscription plan is attached to a group. Each plan has it's own price, and may give a few additional assets free.
* Subscriber - A person that hopes to access a customer's locked assets. Subscribers will typically not have direct access to subtype. A subscriber will have purchased some subscription plans, for some duration. A subscriber is for an account only.
* SubscriberIdentity - A subscriber is identified by a pair of a provider and an identity (such as [email,dev@quintype.com], or [facebook, fb-id]). A subscriber can have many identities
* Provider - This is an external system
* Subscription - A subscription is a particular subscriber's access to a subscription plan. It will typically have a start date, and an end date. A subscription may have an external id if it came from an earlier CMS, which must be unique within a plan.
* Payment - A payment records a transaction (either real or virtual), to give users access to a subscription plan. This payment is reconciled against the subscription
* Payment Token - This is a unique string that represents the payment, unique within the payment gateway (even unique across accounts). In the case of a recurring subscription, the token represents a subscription in the external system, not the payment itself.
* Payment Gateway - This is an external service for our customers to accept payments.
* Metadata Fields - This is for recording the details of a subscriber, (such as [full-name, email, mobile-or-contact-number, etc]).

## Identities
A subscriber is identified by a pair of a provider and an identity (such as [email,dev@quintype.com], or [facebook, fb-id]). A subscriber can have many identities.
A provider is an external system. It can be one of [email, quintype, facebook, twitter].
