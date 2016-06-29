# Open RTB 2.3

Powerlinks Media is fully compliant with the Open RTB 2.3 specifications. Below you'll find information regarding the RTB specifications and how it pertains to Powerlinks Media.

## Supported Objects

Object Name | Supported | Required | Highly Recommended | Optional
----------- | --------- | -------- | ------------------ | --------
Bid Request | Yes | id, imp | site, app, device, user | test, at, tmax, wseat, allimps, cur, bcat, badv, regs, ext
Imp | Yes | id | none | banner, video, native, displaymanager, displaymanagerver, instl, tagid, bidfloor, bidfloorcur, secure, iframebuster, pmp
Banner  | Yes | none | w, h | wmax, hmax, wmin, hmin, id, btype, battr, pos, mimes, topframe, expdir, api
Video | Yes | mimes | minduration, maxduration, protocols, w, h, startdelay | linearity, sequence, battr, maxextended, minbitrate, maxbitrate, boxingallowed, playbackmethod, delivery, pos, companionad, api, companiontype
Native | Yes | request | ver | api, battr
Site | Yes | none | id | name, domain, cat, sectioncat, pagecat, page, ref, search, mobile, privacypolicy, publisher, content, keywords
App | Yes | none | id | name, bundle, domain, storeurl, cat, sectioncat, pagecat, ver, privacypolicy, paid, publisher, content, keywords
Publisher | Yes | none | none | id, name, cat, domain
Content | Yes | none | none | id, episode, title, series, season, producer, url, cat, videoquality, context, contentrating, userrating, qagmediarating, keywords, livestream, sourcerelationship, len, language, embeddable
Producer | Yes | none | none | id, name, cat, domain
Device | Yes | none | ua, geo, dnt, lmt, ip | ipv6, devicetype, make, model, os, osv, hwv, h, w, ppi, pxratio,js, flashver, language, carrier, connectiontype, ifa, didsha1, didmd5, dpidsha1, dpidmd5, macsha1, macmd5
Geo | Yes | none | none | lat, lon, type, country, region, regionfips104, metro, city, zip, utcoffset
User | Yes | none | id, buyerid | yob, gender, keywords, customdata, geo, data
Data | Yes | none | none | id, name, segment
Segment | Yes | none | none | id, name, value
Regs | Yes | none | none | coppa
Pmp | Yes | none | none | private_auction, deals
Deal | Yes | id | none | bidfloor, bidfloorcur, at, wseat, wadomain

### BidRequest

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | String | none | Unique ID of the bid request, provided by the exchange.
imp | Object array | none | Array of Imp objects representing the impressions offered. At least 1 Imp object is required
site | Object | none | Details via a Site object about the publisher’s website. Only applicable and recommended for websites
app | Object | none | Details via an App object about the publisher’s app (i.e., non-browser applications). Only applicable and recommended for apps.
device | Object | none | Details via a Device object about the user’s device to which the impression will be delivered.
user | Object | none | Details via a User object about the human user of the device; the advertising audience.
test | Integer | 0 | Indicator of test mode in which auctions are not billable, where 0 = live mode, 1 = test mode
at | Integer | 2 | Auction type, where 1 = First Price, 2 = Second Price Plus. Exchange-specific auction types can be defined using values greater than 500. 
tmax | Integer | none | Maximum time in milliseconds to submit a bid to avoid timeout. This value is commonly communicated offline.
wseat | String array | none | Whitelist of buyer seats allowed to bid on this impression. Seat IDs must be communicated between bidders and the exchange a priori. Omission implies no seat restrictions.
allimps | Integer | 0 | Flag to indicate if Exchange can verify that the impressions offered represent all of the impressions available in context (e.g., all on the web page, all video spots such as pre/mid/post roll) to support road blocking. 0 = no or unknown, 1 = yes, the impressions offered represent all that are available.
cur | String array | none | Array of allowed currencies for bids on this bid request using ISO-4217 alpha codes. Recommended only if the exchange accepts multiple currencies.
bcat | String array | none | Blocked advertiser categories using the IAB content categories.
badv | String array | none | Block list of advertisers by their domains (e.g., “ford.com”)
reqs | Object | none | A Regs object (Section 3.2.16) that specifies any industry, legal, or governmental regulations in force for this request.
ext | Object | none | Placeholder for exchange-specific extensions to OpenRTB.


### Imp

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | String | none | A unique identifier for this impression within the context of  the bid request (typically, starts with 1 and increments.
banner | Object | none | A Banner object; required if this impression is offered as a banner ad opportunity.
video | Object | none | A Video object (Section 3.2.4); required if this impression is offered as a video ad opportunity
native | Object | none | A Native object (Section 3.2.5); required if this impression is offered as a native ad opportunity.
displaymanager | String | none | Name of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video or mobile). Used by some ad servers to customize ad code by partner. Recommended for video and/or apps.
displaymanagerver  | String | none | Version of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video or mobile). Used by some ad servers to customize ad code by partner. Recommended for video and/or apps.
instl | Integer | 0 | 1 = the ad is interstitial or full screen, 0 = not interstitial.
tagid | String | none | Identifier for specific ad placement or ad tag that was used to initiate the auction. This can be useful for debugging of any issues, or for optimization by the buyer.
bidfloor | Float | 0 | Minimum bid for this impression expressed in CPM.
bidfloorcur | String | USD | Currency specified using ISO-4217 alpha codes. This may be different from bid currency returned by bidder if this is allowed by the exchange.
secure | Integer | none | Flag to indicate if the impression requires secure HTTPS URL creative assets and markup, where 0 = non-secure, 1 = secure. If omitted, the secure state is unknown, but non-secure HTTP support can be assumed.
iframebuster | String array | none | Array of exchange-specific names of supported iframe busters.
pmp | String array | none | A Pmp object containing any private marketplace deals in effect for this impression.
ext | String array | none | Placeholder for exchange-specific extensions to OpenRTB.

### Banner

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
w | Integer | none | Width of the impression in pixels. If neither wmin nor wmax are specified, this value is an exact width requirement. Otherwise it is a preferred width.
h | Integer| none | Height of the impression in pixels. If neither hmin nor hmax are specified, this value is an exact height requirement. Otherwise it is a preferred height.
wmax | Integer | none | Maximum width of the impression in pixels. If included along with a w value then w should be interpreted as a recommended or preferred width.
hmax | Integer | none | Maximum height of the impression in pixels. If included along with an h value then h should be interpreted as a recommended or preferred height.
wmin | Integer | none | Minimum width of the impression in pixels. If included along with a w value then w should be interpreted as a recommended or preferred width.
hmin | Integer | none | Minimum height of the impression in pixels. If included along with an h value then h should be interpreted as a recommended or preferred height.
id | String | none | Unique identifier for this banner object. Recommended when Banner objects are used with a Video object to represent an array of companion ads. Values usually start at 1 and increase with each object; should be unique within an impression.
btype | Integer array | none | Blocked banner ad types.
battr | Integer array | none | Blocked creative attributes.
pos | Integer | none | Ad position on screen.
mimes | String array | none | Content MIME types supported. Popular MIME types may include “application/x-shockwave-flash”, “image/jpg”, and “image/gif”.
topframe | Integer | none | Indicates if the banner is in the top frame as opposed to an iframe, where 0 = no, 1 = yes.
expdir | Integer array | none | Directions in which the banner may expand. 
api | Integer array | none | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported
ext | Object | none | Placeholder for exchange-specific extensions to OpenRTB.

### Video

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
mimes | String array | none | Content MIME types supported. Popular MIME types may include “video/x-ms-wmv” for Windows Media and “video/x-flv” for Flash Video.
minduration | Integer| none | Minimum video ad duration in seconds.
maxduration | Integer | none | Maximum video ad duration in seconds.
protocols | Integer array | none | Array of supported video bid response protocols. At least one supported protocol must be specified in either the protocol or protocols attribute.
w | Integer | none | Width of video player in pixels.
h | Integer | none | Height of video player in pixels.
startdelay | Integer | none | Indicates the start delay in seconds for pre-roll, mid-roll, or post-roll ad placements. Refer to List 5.10 for additional generic values.
linearity | Integer | none |Indicates if the impression must be linear, nonlinear, etc. If none specified, assume all are allowed. 
sequence | Integer | none | If multiple ad impressions are offered in the same bid request, the sequence number will allow for the coordinated delivery of multiple creatives.
battr | Integer array | none | Blocked creative attributes.
maxextended | Integer | none | Maximum extended video ad duration if extension is allowed. If blank or 0, extension is not allowed. If -1, extension is allowed, and there is no time limit imposed. If greater than 0, then the value represents the number of seconds of extended play supported beyond the maxduration value.
minbitrate | Integer | none | Minimum bit rate in Kbps. Exchange may set this dynamically or universally across their set of publishers.
maxbitrate | Integer | none | Maximum bit rate in Kbps. Exchange may set this dynamically or universally across their set of publishers.
boxingallowed | Integer | 1 | Indicates if letter-boxing of 4:3 content into a 16:9 window is allowed, where 0 = no, 1 = yes.
playbackmethod | Integer array | none | Allowed playback methods. If none specified, assume all are allowed.
delivery | Integer array | none | Supported delivery methods (e.g., streaming, progressive). If none specified, assume all are supported.
pos | Integer | none | Ad position on screen.
companionad | Object array | none | Array of Banner objects if companion ads are available.
api | Integer array | none | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
companiontype | Integer array | none | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
ext | Object | none | Placeholder for exchange-specific extensions to OpenRTB.

### Native
### Site
### App
### Publisher
### Content
### Producer
### Device
### Geo
### User
### Data
### Segment
### Regs
### Pmp
### Deal
