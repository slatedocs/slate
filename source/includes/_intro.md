# Third-Party Documentation Center

Welcome to the Chartboost third-party documentation center! 

This site features API instructions third-party attribution platforms can use to send two types of data to Chartboost: install attribution postbacks to power Smartbid campaigns, and post-install revenue data for Chartboost Post-Install Analytics (PIA). Each product's API has a unique external endpoint.

## Smartbid Overview

Chartboost is introducing a new campaign type, Smartbid, that lets advertisers leverage third-party attribution data to optimize CPC (cost-per-click) campaigns toward a CPI (cost-per-install) target. 

After Chartboost receives install attribution postbacks from a third party (via <a href="#install-attribution">this endpoint</a>), the game's CPI campaign targets in the Chartboost dashbaord will be replaced with Smartbid targets. (Third-party attribution data will then replace attribution data collected by the Chartboost SDK or received via server-to-server integration.)

### Smartbid Requirements

- Third-party attribution platform SDK integration. Chartboost SDK integration is recommended (if you plan to publish, for example), but optional.
- Tracking URLs/macros to send Chartboost click data to your third-party via <a href="https://answers.chartboost.com/hc/en-us/articles/201220115">callbacks</a>
- Smartbid customers will also need to use their third-party attribution service's website to create install attribution postbacks. These postbacks need to include all bootups and attributed installs (using the <code>claim=</code> parameter).

## Post-Install Analytics Overview

The Post-Install Analytics (PIA) integration lets Chartboost customers view IAP data &ndash; like payer %, ARPU, purchase counts, ARPPU and more &ndash; in the Chartboost dashboard. They can then use this data to build custom player segments to power retargeting campaigns and optimize user acquisition efforts.

(For additional developer-facing information about PIA, visit <a href="https://answers.chartboost.com/hc/en-us/articles/201220265-Post-Install-Analytics-Beta-">our Help Site</a>.)

### PIA Requirements

- Chartboost <a href="https://answers.chartboost.com/hc/en-us/articles/201220265-Post-Install-Analytics-Beta">SDK PIA integration</a>, <a href="https://answers.chartboost.com/hc/en-us/articles/201220265-Post-Install-Analytics-Beta-#s2s">S2S PIA integration</a>, or <a href="https://answers.chartboost.com/hc/en-us/articles/202199899">third-party S2S PIA integration</a>

## How to Read These Docs

These docs demonstrate how to make the requests to send to our API endpoints, with each endpoint's available and required parameters described in detail. 

You'll also find information about which HTTP method to use, which headers to include, etc. 

We provide code examples where appropriate in Shell (cURL), Python, and PHP. You can view these code examples in the dark area to the right and use the tabs at the top of that section to switch programming languages. 

While this documentation and the code examples were designed to eliminate ambiguity about our endpoints, we're more than happy to answer any remaining questions you might have &ndash; just <a href="mailto:support.integrations@chartboost.com">contact our Support Team</a> for assistance!

(Note: At some points in these docs, we will use double curly braces to signify a variable that should be placed at a certain point. For example, we might notate `{{api token}}` in one parameter. When sending requests of your own, you should replace it with a value. So in practice, `{{api token}}` may become `"my_network_api_token"`.)

## Authentication

Each service API currently has different methods of authentication. The documentation for the service will include specific instructions about how to authenticate. For all endpoints that require authentication, requests must be signed and the computed signature must be placed in the `X-Chartboost-Signature` header.

All API requests should be made via HTTPS.


```php
<?php
// The php examples will use the requests library, found at:
// https://github.com/rmccue/Requests

$endpoint = "https://live.chartboost.com/api/endpoint"
$headers = array(
  "X-Chartboost-Signature" => "d41d8cd98f00b204e9800998ecf8427e"
);

Requests::get($response, $headers);
?>
```

```python
# The python examples will use the requests library, found at:
# http://docs.python-requests.org/en/latest/
import requests

endpoint = 'https://live.chartboost.com/api/endpoint'
headers = {
  'X-Chartboost-Signature': 'd41d8cd98f00b204e9800998ecf8427e'
}

requests.get(endpoint, headers=headers)
```

```shell
curl 'https://live.chartboost.com/api/endpoint' \
  -H 'X-Chartboost-Signature: d41d8cd98f00b204e9800998ecf8427e'
```

<aside class="success">
Remember &ndash; signature generation methods vary by endpoint!
</aside>
