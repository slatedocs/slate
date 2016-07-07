# In-Feed API

The PowerLinks In-Feed API describes how your application can interact directly with the PowerLinks system to
conduct a real-time query of In-Feed content.

The PowerLinks In-Feed API can be accessed either from a server, or from a browser. The response can be formatted
as either XML or JSON, with XML being the default. In the case of accessing from a browser, both CORS and JSONP
are supported. If a callback parameter is present, JSONP is assumed and the response will be wrapped in the callback
parameter, formatted as JSON.

For more information, please consider the following resources:

XML: http://www.w3.org/XML/

JSON: http://wwww.json.org/

JSONP: http://json-p.org/

CORS: https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS

All currencies are in USD and all dates and times are relative to UTC.

## Request

### Overview

All requests made to the PowerLinks System should be done through a single entry point which supports a number
of options to allow for the response to be made more contextual. The table below describes these.

Parameter|Type|Required|Description
---------|----|--------|-----------
i | integer | Yes | Your PowerLinks account ID
c | string | Yes | The Category IDs of the site on which the ad will display, separated by comma. Please find a list of Top Level Categories below. For a more granular list, please ask your Powerlinks account manager.
ip | string | Yes | IP (v.4) address of the end user, or the string ‘false’. NOTE: If this is a server-side implementation, please include the IPv4 address. If this is a client-side implementation, please provide a string value of ‘false’ for this parameter. This will tell us that we should be detecting the IP from the request headers.
ua | string | Yes | User agent of the end user
rf | string | Yes | URL-encoded HTTP referring URL
q | string | No | A query string to improve relevance
pc | string | No | The Category IDs of the page on which the ad will display, separated by
tmax | integer | No | The maximum allowed title length
dmax | integer | No | The maximum allowed description length
iw | integer | No | Exact image width for returned image, in pixels. Default is 200
ih | integer | No | Exact image height for returned image, in pixels. Default is 200
subid | string | No | An ID specified by you for extended identification in reporting
cid | string | No | Cookie ID for user
floor | float | No | Floor price, in the format ’0.01’. No currency symbol is required.
o | string | No | The response format, XML or JSON. Default to XML
callback | string | No | This is strictly for JSONP support. If this parameter is included, the response will be wrapped in the callback, and the format will be JSON, overriding the ‘o’ parameter if present.
test | integer | No | This can be set to a value of 1 in order to test. When testing, we will provide 100% fill rate with dummy, in-house content.

### Making the request

All requests should be made using the following method

***Range Options***

`GET http://adserver.powerlinks.com/infeed`

***Parameters***

See above table

***Example Request***

GET

`http://adserver.powerlinks.com/infeed?i=1&c=1&ip=1.1.1.1&ua=Mozilla%2F5.0%20(Windows%20NT%206.3%3B%20WOW64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F39.0.2171.95%20Safari%2F537.36&rf=http%3A%2F%2Fwww.examplepage.com%2Fsomepage&q=keyword1+keyword2&iw=300&ih=250&cid=uuid1234567890&subid=1234567890`

## Response

### Structure

Responses are returned in the format specified in the request (or XML if not specified). The data returned in the
response are described in the following tables:

Parameter | Type | Description
----------|------|------------
status | string | The response status, success or error
ad | object | The object containing the advert data in successful responses

### Ad Object

Parameter | Type | Description
----------|------|------------
image | string | The main advert image URL
title | string | The advert title
description | string | The advert description. Optional.
sponsor | string | The advertiser or client
bid | float | The advert bid value
click_url | string | The advert click through URL
impression | object | The object containing impression information

### Impression Object

This will contain **either** an \<image> element, or a \<js> element.

Parameter | Type | Description
----------|------|------------
image | string | A URL that should be used to create a 1x1 \<img>\ element
js | string | A URL that should be used to create a \<script>\ element

> ***Example Responses: XML - w/ impression image or impression JS***

```xml
    <?xml version="1.0" encoding="utf-8"?>
    <response>
        <status>success</status>
        <ad>
            <bid>0.21</bid>
            <title>Ad Title</title>
            <description>Ad Description</description>
            <sponsor>Ad Sponsor</sponsor>
            <image>
                <![CDATA[http://images.powerlinks.com/ad1-image.jpg]]>
            </image>
            <click_url><![CDATA[http://click.powerlinks.com]]></click_url>
            <impression>
                <image>
                    <![CDATA[http://imp.powerlinks.com]]>
                </image>
            </impression>
        </ad>
    </response>
    
    <?xml version="1.0" encoding="utf-8"?>
    <response>
        <status>success</status>
        <ad>
            <bid>0.21</bid>
            <title>Ad Title</title>
            <description>Ad Description</description>
            <sponsor>Ad Sponsor</sponsor>
            <image>
                <![CDATA[http://images.powerlinks.com/ad1-image.jpg]]>
            </image>
            <click_url><![CDATA[http://click.powerlinks.com]]></click_url>
            <impression>
                <js>
                    <![CDATA[http://imp.powerlinks.com]]>
                </js>
            </impression>
        </ad>
    </response>
```

> ***Example Responses: JSON - w/ impression image or impression JS***

```json
{
    "status": "success",
    "ad": {
        "bid": "0.21",
        "title": "Ad Title",
        "description": "Ad Description",
        "sponsor": "Ad Sponsor",
        "image": "http://images.powerlinks.com/ad1-image.jpg",
        "click_url": "http://click.powerlinks.com",
        "impression": {
            "image": "http://imp.powerlinks.com"
        }
    }
}

{
    "status": "success",
    "ad": {
        "bid": "0.21",
        "title": "Ad Title",
        "description": "Ad Description",
        "sponsor": "Ad Sponsor",
        "image": "http://images.powerlinks.com/ad1-image.jpg",
        "click_url": "http://click.powerlinks.com",
        "impression": {
            "js": "http://imp.powerlinks.com"
        }
    }
}
```

> ***Example Responses: JSONP - w/ impression image or impression JS***

```jsonp
jQuery123({
    "status": "success",
    "ad": {
        "bid": "0.21",
        "title": "Ad Title",
        "description": "Ad Description",
        "sponsor": "Ad Sponsor",
        "image": "http://images.powerlinks.com/ad1-image.jpg",
        "click_url": "http://click.powerlinks.com",
        "impression": {
            "image": "http://imp.powerlinks.com"
        }
    }
})

jQuery123({
    "status": "success",
    "ad": {
        "bid": "0.21",
        "title": "Ad Title",
        "description": "Ad Description",
        "sponsor": "Ad Sponsor",
        "image": "http://images.powerlinks.com/ad1-image.jpg",
        "click_url": "http://click.powerlinks.com",
        "impression": {
            "js": "http://imp.powerlinks.com"
        }
    }
})
```

### Other Responses

Along with the advert data contained within the ‘ad’ block you’ll also receive a status message that can be used to quickly determine whether an advert was returned. Adverts will always accompany a success status. If no relevant advert was found the status will be error, and in most cases will be supplemented with a message describing the cause.
