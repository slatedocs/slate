# Compliance and Privacy

## What Data is Collected by the Scout APM Agent?

When you install our APM agent into your application, we instrument your code in order to gather timing and other data. The data collected for all transactions includes:

  * Numeric metrics (timing, object allocations, memory)
  * Controller (in MVC terms) name and invoked controller function name
  * Background job name and invoked function name
  * SQL table and operation (e.g. Users#select)

In addition to collecting general data for every transaction, Scout uses an algorithm to pick out the most interesting transactions. These detailed transactions gather more information about the specifics of the transaction including:

  * URL path
  * URL parameters
  * SQL query strings (scrubbed and sanitized before being sent to Scout)
  * Outgoing HTTP request URLs (of instrumented HTTP libraries)
  * End user IP (the IP of a user making a request to your web server)
  * File name and line number of slow functions (used to display a backtrace)

Some of this information can be disabled for detailed transactions. Refer to our configuration section for your language at [https://docs.scoutapm.com](https://docs.scoutapm.com)

In Ruby, you can set `log_level = debug` to inspect the entire payload sent by our agent.

## HIPAA

Our agent can be installed safely in HIPAA compliant environments. To ensure user data is properly de-identified:

1. Disable sending HTTP query params if these contain sensitive data via the `uri_reporting` config option.
2. Do not add custom context (like reporting the current user in the session).

Email support@scoutapm.com with any questions regarding HIPAA.

## GDPR

While our monitoring agents are primarily metric-focused, they can be configured to send personal data if the customer wishes.

Under the GDPR, Scout is defined as a [Data Processor](https://gdpr-info.eu/art-28-gdpr/). You can [view and sign our Data Processing Agreement](https://app.hellosign.com/s/a349d944) on behalf of your organization.

## PCI DSS

Scout’s payment and card information is handled by Stripe, which has been audited by an independent PCI Qualified Security Assessor and is certified as a PCI Level 1 Service Provider, the most stringent level of certification available in the payments industry.

Scout does not typically receive credit card data, making it compliant with Payment Card Industry Data Security Standards (PCI DSS) in most situations.
