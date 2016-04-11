# Third-Party Documentation Center

Welcome to the Chartboost third-party documentation center! 

This site features API instructions that measurement platforms can use to send two types of data to Chartboost: install attribution postbacks, and post-install event data. Each product's API has a unique external endpoint.

## S2S Tracking Overview

Chartboost's S2S Install Tracking feature lets advertisers leverage attribution data from approved third parties to run CPI campaigns on the Chartboost network. 

After an app has Requested S2S Install Tracking and Chartboost approves it, when Chartboost receives install attribution postbacks from a third party (via <a href="#install-attribution">this endpoint</a>), the game's CPI campaign targets in the Chartboost dashbaord will be replaced with S2S Tracking targets. (Third-party attribution data will then be used in place of attribution data collected by the Chartboost SDK.)

### S2S Tracking Requirements

- Tracking URLs/macros to send Chartboost click data via <a href="https://answers.chartboost.com/hc/en-us/articles/205607385">Chartboost Callbacks</a> to your third-party endpoint.
- S2S Install Tracking customers will also need to use their measurement platform's website to create install attribution postbacks. These postbacks should include *all* attributed and non-attributed installs (making use of the <code>claim={0 or 1}</code> parameter).

## Post-Install Analytics Overview

The Post-Install Analytics (PIA) integration lets Chartboost customers view IAP data -- payer %, ARPU, purchase counts, ARPPU and more -- in the Chartboost dashboard. They can then use this data to build custom player segments to power retargeting campaigns and optimize user acquisition efforts.  Developers can also send custom in-app events for <a href="https://answers.chartboost.com/hc/en-us/articles/209738503-Post-Install-Analytics-Event-Level-Tracking-via-S2S">tracking level progression</a> or events like Tutorial Completion, Player Registration, etc..  These events can then be used to set up <a href="https://answers.chartboost.com/hc/en-us/articles/204451579-User-Segment-Builder">User Segments</a> and applied to campaign targeting efforts.

For additional developer-facing information about PIA, visit <a href="https://answers.chartboost.com/hc/en-us/sections/201140105">our Help Site</a>.

### PIA Requirements

- Chartboost <a href="https://answers.chartboost.com/hc/en-us/articles/205607035-Post-Install-Analytics-In-App-Purchase-Tracking-via-S2S">S2S PIA integration for in-app purchases</a>, or <a href="https://answers.chartboost.com/hc/en-us/articles/209738503-Post-Install-Analytics-Event-Level-Tracking-via-S2S">S2S PIA integration for Events & Level Tracking</a>.

## How to Read These Docs

These docs demonstrate how to make the requests to send to our API endpoints, with each endpoint's required and optional parameters described in detail. 

You'll also find information about which HTTP method to use, which headers to include, etc. 

We provide code examples where appropriate in Node.js, Python, and PHP. You can view these code examples in the dark area to the right and use the tabs at the top of that section to switch programming languages. 

While this documentation and the code examples were designed to eliminate ambiguity about our endpoints, we're more than happy to answer any remaining questions you might have -- just <a href="mailto:support.integrations@chartboost.com">contact our Integrations Support Team</a> for assistance.

(Note: At some points in these docs, we will use double curly braces to signify a variable that should be replaced at a certain point. For example, we might notate `{{api token}}` in one parameter. When sending requests of your own, you should replace it with a value. So in practice, `{{api token}}` may become `"my_network_api_token"`.)

## Authentication

All API endpoints require authentication and use the same signature generation method. Requests must be signed and the computed signature must be placed in the `X-Chartboost-Signature` header.

All API requests must be made via HTTPS.

