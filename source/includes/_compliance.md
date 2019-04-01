# Compliance

## HIPAA

While Scout itself is not HIPAA compliant, our agent can be installed safely in HIPAA compliant environments. To ensure user data is properly de-identified:

1. Disable sending HTTP query params if these contain sensitive data via the `uri_reporting` config option.
2. Do not add custom context (like reporting the current user in the session).

Email support@scoutapm.com with any questions regarding HIPAA.

## GDPR

While our monitoring agents are primarily metric-focused, they can be configured to send personal data if the customer wishes.

Under the GDPR, Scout is defined as a [Data Processor](https://gdpr-info.eu/art-28-gdpr/). You can [view and sign our Data Processing Agreement](https://app.hellosign.com/s/a349d944) on behalf of your organization.

## PCI DSS

Scout’s payment and card information is handled by Stripe, which has been audited by an independent PCI Qualified Security Assessor and is certified as a PCI Level 1 Service Provider, the most stringent level of certification available in the payments industry.

Scout does not typically receive credit card data, making it compliant with Payment Card Industry Data Security Standards (PCI DSS) in most situations.