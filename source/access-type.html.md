---
title: AccessType API Documentation

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

search: true

includes:
  - access-type/subscriber-identities
  - access-type/subscription-groups
  - access-type/subscriptions
---

# Introduction To AccessType

AccessType is a product for managing subscriptions. It can be used in conjunction with the Quintype Platform

## Terminology
* Asset - An asset is a locked resource, which can be unlocked with a purchase. An asset may have an access level. (Example: Stories, Collections..)
* Subscription Group - A subscription group gives a user access to some number of assets.
* Subscription Plan - A subscription plan is a purchasable item, for some duration. A subscription plan is attached to a group. Each plan has it's own price, and may give a few additional assets free.
* Subscriber - A person that purchases's to locked assets. Subscribers will typically not have direct access to AccessType. A subcriber may have multiple identities.
* Subscription - A subscription is a particular subscriber's access to a subscription plan. It will typically have a start date, and an end date, and may recur at some period. A subscription may have an external id if it came from an earlier CMS, which must be unique .
