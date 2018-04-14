# Compliance

## HIPAA

While Scout itself is not HIPAA compliant, our agent can be installed safely in HIPAA compliant environments. To ensure user data is properly de-identified:

1. Disable sending HTTP query params if these contain sensitive data via the `uri_reporting` config option.
2. Do not add custom context (like reporting the current user in the session).

Email support@scoutapp.com with any questions regarding HIPAA.

## GDPR

Scout will be ready for the EU General Data Protection Regulation (GDPR) before May 25, 2018, when the law goes into effect. Scout receives performance data from our customers, which we use to generate charts and reports. While our monitoring agents are primarily metric-focused, they can be configured to send personal data if the customer wishes.

Under the GDPR, Scout is defined as a [Data Processor](https://gdpr-info.eu/art-28-gdpr/). Here is how we’ll support customers with GDPR readiness given our role:

* An updated Data Processing Agreement (DPA) that reflects the requirements of the GDPR and ensures compliant data transfer with storage outside the EU.
* Reviewing our technical and organizational security measures to ensure they are in compliance with the GDPR.
* Prompt breach notifications: In line with our current policies, we will promptly inform you of any incidents involving your users’ personal data. 
* Clarifying our data deletion process: Customers can request that their data be deleted at anytime. Upon account closure, all performance data will be deleted within 90 days. Requests for return or deletion of data are handled on a case by case basis.

## PCI DSS

Scout’s payment and card information is handled by Stripe, which has been audited by an independent PCI Qualified Security Assessor and is certified as a PCI Level 1 Service Provider, the most stringent level of certification available in the payments industry.

Scout does not typically receive credit card data, making it compliant with Payment Card Industry Data Security Standards (PCI DSS) in most situations.