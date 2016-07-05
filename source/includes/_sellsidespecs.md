# Sell-Side Specifications

Powerlinks Media is fully compliant with the OpenRTB 2.3 specifications and its Native subprotocol. Below you'll find information regarding Powerlinks's bid request specifications for sell-side partners.

## Supported Objects

Object Name | Supported | Required | Highly Recommended | Optional
----------- | --------- | -------- | ------------------ | --------
Bid Request | Yes | id, imp | site, app, device, user | test, at, tmax, wseat, allimps, cur, bcat, badv, regs, ext
Imp | Yes | id | - | banner, video, native, displaymanager, displaymanagerver, instl, tagid, bidfloor, bidfloorcur, secure, iframebuster, pmp
Banner  | Yes | - | w, h | wmax, hmax, wmin, hmin, id, btype, battr, pos, mimes, topframe, expdir, api
Video | Yes | mimes | minduration, maxduration, protocols, w, h, startdelay | linearity, sequence, battr, maxextended, minbitrate, maxbitrate, boxingallowed, playbackmethod, delivery, pos, companionad, api, companiontype
Native | Yes | request | ver | api, battr
Site | Yes | - | id | name, domain, cat, sectioncat, pagecat, page, ref, search, mobile, privacypolicy, publisher, content, keywords
App | Yes | - | id | name, bundle, domain, storeurl, cat, sectioncat, pagecat, ver, privacypolicy, paid, publisher, content, keywords
Publisher | Yes | - | - | id, name, cat, domain
Content | Yes | - | - | id, episode, title, series, season, producer, url, cat, videoquality, context, contentrating, userrating, qagmediarating, keywords, livestream, sourcerelationship, len, language, embeddable
Producer | Yes | - | - | id, name, cat, domain
Device | Yes | - | ua, geo, dnt, lmt, ip | ipv6, devicetype, make, model, os, osv, hwv, h, w, ppi, pxratio,js, flashver, language, carrier, connectiontype, ifa, didsha1, didmd5, dpidsha1, dpidmd5, macsha1, macmd5
Geo | Yes | - | - | lat, lon, type, country, region, regionfips104, metro, city, zip, utcoffset
User | Yes | - | id, buyerid | yob, gender, keywords, customdata, geo, data
Data | Yes | - | - | id, name, segment
Segment | Yes | - | - | id, name, value
Regs | Yes | - | - | coppa
Pmp | Yes | - | - | private_auction, deals
Deal | Yes | id | - | bidfloor, bidfloorcur, at, wseat, wadomain

### BidRequest

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | string | - | Unique ID of the bid request, provided by the exchange.
imp | object array | - | Array of Imp objects representing the impressions offered. At least 1 Imp object is required
site | object | - | Details via a Site object about the publisher’s website. Only applicable and recommended for websites
app | object | - | Details via an App object about the publisher’s app (i.e., non-browser applications). Only applicable and recommended for apps.
device | object | - | Details via a Device object about the user’s device to which the impression will be delivered.
user | object | - | Details via a User object about the human user of the device; the advertising audience.
test | integer | 0 | Indicator of test mode in which auctions are not billable, where 0 = live mode, 1 = test mode
at | integer | 2 | Auction type, where 1 = First Price, 2 = Second Price Plus. Exchange-specific auction types can be defined using values greater than 500. 
tmax | integer | - | Maximum time in milliseconds to submit a bid to avoid timeout. This value is commonly communicated offline.
wseat | string array | - | Whitelist of buyer seats allowed to bid on this impression. Seat IDs must be communicated between bidders and the exchange a priori. Omission implies no seat restrictions.
allimps | integer | 0 | Flag to indicate if Exchange can verify that the impressions offered represent all of the impressions available in context (e.g., all on the web page, all video spots such as pre/mid/post roll) to support road blocking. 0 = no or unknown, 1 = yes, the impressions offered represent all that are available.
cur | string array | - | Array of allowed currencies for bids on this bid request using ISO-4217 alpha codes. Recommended only if the exchange accepts multiple currencies.
bcat | string array | - | Blocked advertiser categories using the IAB content categories.
badv | string array | - | Block list of advertisers by their domains (e.g., “ford.com”)
reqs | object | - | A Regs object (Section 3.2.16) that specifies any industry, legal, or governmental regulations in force for this request.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.


### Imp

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | string | - | A unique identifier for this impression within the context of  the bid request (typically, starts with 1 and increments.
banner | object | - | A Banner object; required if this impression is offered as a banner ad opportunity.
video | object | - | A Video object (Section 3.2.4); required if this impression is offered as a video ad opportunity
native | object | - | A Native object (Section 3.2.5); required if this impression is offered as a native ad opportunity.
displaymanager | string | - | Name of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video or mobile). Used by some ad servers to customize ad code by partner. Recommended for video and/or apps.
displaymanagerver  | string | - | Version of ad mediation partner, SDK technology, or player responsible for rendering ad (typically video or mobile). Used by some ad servers to customize ad code by partner. Recommended for video and/or apps.
instl | integer | 0 | 1 = the ad is interstitial or full screen, 0 = not interstitial.
tagid | string | - | Identifier for specific ad placement or ad tag that was used to initiate the auction. This can be useful for debugging of any issues, or for optimization by the buyer.
bidfloor | float | 0 | Minimum bid for this impression expressed in CPM.
bidfloorcur | string | USD | Currency specified using ISO-4217 alpha codes. This may be different from bid currency returned by bidder if this is allowed by the exchange.
secure | integer | - | Flag to indicate if the impression requires secure HTTPS URL creative assets and markup, where 0 = non-secure, 1 = secure. If omitted, the secure state is unknown, but non-secure HTTP support can be assumed.
iframebuster | string array | - | Array of exchange-specific names of supported iframe busters.
pmp | string array | - | A Pmp object containing any private marketplace deals in effect for this impression.
ext | string array | - | Placeholder for exchange-specific extensions to OpenRTB.

### Banner

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
w | integer | - | Width of the impression in pixels. If neither wmin nor wmax are specified, this value is an exact width requirement. Otherwise it is a preferred width.
h | integer| - | Height of the impression in pixels. If neither hmin nor hmax are specified, this value is an exact height requirement. Otherwise it is a preferred height.
wmax | integer | - | Maximum width of the impression in pixels. If included along with a w value then w should be interpreted as a recommended or preferred width.
hmax | integer | - | Maximum height of the impression in pixels. If included along with an h value then h should be interpreted as a recommended or preferred height.
wmin | integer | - | Minimum width of the impression in pixels. If included along with a w value then w should be interpreted as a recommended or preferred width.
hmin | integer | - | Minimum height of the impression in pixels. If included along with an h value then h should be interpreted as a recommended or preferred height.
id | string | - | Unique identifier for this banner object. Recommended when Banner objects are used with a Video object to represent an array of companion ads. Values usually start at 1 and increase with each object; should be unique within an impression.
btype | integer array | - | Blocked banner ad types.
battr | integer array | - | Blocked creative attributes.
pos | integer | - | Ad position on screen.
mimes | string array | - | Content MIME types supported. Popular MIME types may include “application/x-shockwave-flash”, “image/jpg”, and “image/gif”.
topframe | integer | - | Indicates if the banner is in the top frame as opposed to an iframe, where 0 = no, 1 = yes.
expdir | integer array | - | Directions in which the banner may expand. 
api | integer array | - | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Video

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
mimes | string array | - | Content MIME types supported. Popular MIME types may include “video/x-ms-wmv” for Windows Media and “video/x-flv” for Flash Video.
minduration | integer| - | Minimum video ad duration in seconds.
maxduration | integer | - | Maximum video ad duration in seconds.
protocols | integer array | - | Array of supported video bid response protocols. At least one supported protocol must be specified in either the protocol or protocols attribute.
w | integer | - | Width of video player in pixels.
h | integer | - | Height of video player in pixels.
startdelay | integer | - | Indicates the start delay in seconds for pre-roll, mid-roll, or post-roll ad placements. Refer to List 5.10 for additional generic values.
linearity | integer | - |Indicates if the impression must be linear, nonlinear, etc. If none specified, assume all are allowed. 
sequence | integer | - | If multiple ad impressions are offered in the same bid request, the sequence number will allow for the coordinated delivery of multiple creatives.
battr | integer array | - | Blocked creative attributes.
maxextended | integer | - | Maximum extended video ad duration if extension is allowed. If blank or 0, extension is not allowed. If -1, extension is allowed, and there is no time limit imposed. If greater than 0, then the value represents the number of seconds of extended play supported beyond the maxduration value.
minbitrate | integer | - | Minimum bit rate in Kbps. Exchange may set this dynamically or universally across their set of publishers.
maxbitrate | integer | - | Maximum bit rate in Kbps. Exchange may set this dynamically or universally across their set of publishers.
boxingallowed | integer | 1 | Indicates if letter-boxing of 4:3 content into a 16:9 window is allowed, where 0 = no, 1 = yes.
playbackmethod | integer array | - | Allowed playback methods. If none specified, assume all are allowed.
delivery | integer array | - | Supported delivery methods (e.g., streaming, progressive). If none specified, assume all are supported.
pos | integer | - | Ad position on screen.
companionad | Object array | - | Array of Banner objects if companion ads are available.
api | integer array | - | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
companiontype | integer array | - | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Native

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
request | string | - | Request payload complying with the Native Ad Specification.
ver | string| - | Version of the Native Ad Specification to which request complies; highly recommended for efficient parsing.
api | integer array | - | List of supported API frameworks for this impression. If an API is not explicitly listed, it is assumed not to be supported.
battr | Integer array | - | Blocked creative attributes.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.


### Site
Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | string | - | Exchange-specific site ID.
name | string | - |  Site name (may be aliased at the publisher’s request).
domain | string | - | Domain of the site (e.g., “mysite.foo.com”).
cat | string array | - | Array of IAB content categories of the site. 
sectioncat |  string array | - | Array of IAB content categories that describe the current section of the site. 
pagecat | string array | - | Array of IAB content categories that describe the current page or view of the site.
page | string | - | URL of the page where the impression will be shown.
ref | string | - | Referrer URL that caused navigation to the current page.
search | string | - | Search string that caused navigation to the current page.
mobile | integer | - | Mobile-optimized signal, where 0 = no, 1 = yes.
privacypolicy | integer | - | Indicates if the site has a privacy policy, where 0 = no, 1 = yes.
publisher | object | - | Details about the Publisher (Section 3.2.8) of the site.
content | object | - | Details about the Content (Section 3.2.9) within the site.
keywords | string | - | Comma separated list of keywords about the site.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### App

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | Exchange-specific app ID.
name | string | - | App name (may be aliased at the publisher’s request).
bundle | string | - | Application bundle or package name (e.g., com.foo.mygame); intended to be a unique ID across exchanges.
domain | string | - | Domain of the app (e.g., “mygame.foo.com”). 
storeurl | string | - | App store URL for an installed app; for QAG 1.5 compliance.
cat | string array | - | Array of IAB content categories of the app.
sectioncat | string array | - | Array of IAB content categories that describe the current section of the app.
pagecat | string array | - | Array of IAB content categories that describe the current page or view of the app. 
ver | string | - | Application version.
privacypolicy | integer | - | Indicates if the app has a privacy policy, where 0 = no, 1 = yes.
paid | integer | - | 0 = app is free, 1 = the app is a paid version.
publisher | object | - | Details about the Publisher of the app.
content | object | - | Details about the Content within the app.
keywords | string | - | Comma separated list of keywords about the app.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Publisher

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | Exchange-specific publisher ID.
name | string | - | Publisher name (may be aliased at the publisher’s request).
cat | string array | - | Array of IAB content categories that describe the publisher.
domain | string | - | Highest level domain of the publisher (e.g., “publisher.com”).
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Content

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | ID uniquely identifying the content.
episode | integer | - | Episode number (typically applies to video content).
title | string | - | Content title. Video Examples: “Search Committee” (television), “A New Hope” (movie), or “Endgame” (made for web). Non-Video Example: “Why an Antarctic Glacier Is Melting So Quickly” (Time magazine article).
series | string | - | Content series. Video Examples: “The Office” (television), “Star Wars” (movie), or “Arby ‘N’ The Chief” (made for web). Non-Video Example: “Ecocentric” (Time Magazine blog).
season | string | - | Content season; typically for video content (e.g., “Season 3”).
producer | object | - | Details about the content Producer (Section 3.2.10).
url | string | - | URL of the content, for buy-side contextualization or review.
cat | string array | - | Array of IAB content categories that describe the content producer. 
videoquality | integer | - | Video quality per IAB’s classification.
context | integer | - | Type of content (game, video, text, etc.). 
contentrating | string | - | Content rating (e.g., MPAA).
userrating | string | - | User rating of the content (e.g., number of stars, likes, etc.).
qagmediarating | integer | - | Media rating per QAG guidelines. 
keywords | string | - | Comma separated list of keywords describing the content.
livestream | integer | - | 0 = not live, 1 = content is live (e.g., stream, live blog).
sourcerelationship | integer | - | 0 = indirect, 1 = direct.
len | integer | - | Length of content in seconds; appropriate for video or audio.
language | string | - | Content language using ISO-639-1-alpha-2.
embeddable | integer | - |  Indicator of whether or not the content is embeddable (e.g., an embeddable video player), where 0 = no, 1 = yes.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Producer

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | Content producer or originator ID. Useful if content is syndicated and may be posted on a site using embed tags.
name | string | - | Content producer or originator name (e.g., “Warner Bros”).
cat | string array | - | Array of IAB content categories that describe the content producer.
domain | string | - | Highest level domain of the content producer (e.g., “producer.com”).
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Device

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
ua | string | - | Browser user agent string.
geo | object | - | Location of the device assumed to be the user’s current location defined by a Geo object.
dnt | integer | - | Standard “Do Not Track” flag as set in the header by the browser, where 0 = tracking is unrestricted, 1 = do not track.
lmt | integer | - |  “Limit Ad Tracking” signal commercially endorsed (e.g., iOS, Android), where 0 = tracking is unrestricted, 1 = tracking must be limited per commercial guidelines.
ip | string | - | IPv4 address closest to device.
ipv6 | string | - | IP address closest to device as IPv6.
devicetype | integer | - | The general type of device. make string Device make (e.g., “Apple”).
model | string | - | Device model (e.g., “iPhone”).
os | string | - | Device operating system (e.g., “iOS”).
osv | string | - | Device operating system version (e.g., “3.1.2”).
hwv | string | - | Hardware version of the device (e.g., “5S” for iPhone 5S).
h | integer | - | Physical height of the screen in pixels.
w | integer | - | Physical width of the screen in pixels.
ppi | integer | - | Screen size as pixels per linear inch.
pxratio | float | - | The ratio of physical pixels to device independent pixels.
js | integer | - | Support for JavaScript, where 0 = no, 1 = yes.
flashver | string | - | Version of Flash supported by the browser.
language | string | - | Browser language using ISO-639-1-alpha-2.
carrier | string | noen | Carrier or ISP (e.g., “VERIZON”). “WIFI” is often used in mobile to indicate high bandwidth (e.g., video friendly vs. cellular).
connectiontype | integer | - | Network connection type.
ifa | string | - | ID sanctioned for advertiser use in the clear (i.e., not hashed).
didsha1 | string | - | Hardware device ID (e.g., IMEI); hashed via SHA1.
didmd5 | string | - | Hardware device ID (e.g., IMEI); hashed via MD5.
dpidsha1 | string | - | Platform device ID (e.g., Android ID); hashed via SHA1.
dpidmd5 | string | - | Platform device ID (e.g., Android ID); hashed via MD5.
macsha1 | string | - | MAC address of the device; hashed via SHA1.
macmd5 | string | - | MAC address of the device; hashed via MD5.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB

### Geo

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
lat | float | - | Latitude from -90.0 to +90.0, where negative is south.
lon | float | - | Longitude from -180.0 to +180.0, where negative is west.
type | integer | - | Source of location data; recommended when passing lat/lon.
country | string | - | Country code using ISO-3166-1-alpha-3.
region | string | - | Region code using ISO-3166-2; 2-letter state code if USA.
regionfips104 | string | - | Region of a country using FIPS 10-4 notation. While OpenRTB supports this attribute, it has been withdrawn by NIST in 2008.
metro | string | - | Google metro code; similar to but not exactly Nielsen DMAs.
city | string | - | City using United Nations Code for Trade & Transport Locations.
zip | string | - | Zip or postal code.
utcoffset | integer | - | Local time as the number +/- of minutes from UTC.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### User

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | Exchange-specific ID for the user. At least one of id or buyeruid is recommended.
buyeruid | string | - | Buyer-specific ID for the user as mapped by the exchange for the buyer. At least one of buyeruid or id is recommended.
yob | integer | - | Year of birth as a 4-digit integer.
gender | string | - | Gender, where “M” = male, “F” = female, “O” = known to be other (i.e., omitted is unknown).
keywords | string | - | Comma separated list of keywords, interests, or intent.
customdata | string | - | Optional feature to pass bidder data that was set in the exchange’s cookie. The string must be in base85 cookie safe characters and be in any format. Proper JSON encoding must be used to include “escaped” quotation marks.
geo | object | - | Location of the user’s home base defined by a Geo object. This is not necessarily their current location.
data | object array | - | Additional user data. Each Data object represents a different data source.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Data

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | Exchange-specific ID for the data provider.
name | string | - | Exchange-specific name for the data provider.
segment | object array | - | Array of Segment objects that contain the actual data values.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Segment

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | ID of the data segment specific to the data provider.
name | string | - | Name of the data segment specific to the data provider.
value | string | - | String representation of the data segment value.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Regs

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
coppa | integer | - | Flag indicating if this request is subject to the COPPA regulations established by the USA FTC, where 0 = no, 1 = yes.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Pmp

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
private_auction | integer | - | Indicator of auction eligibility to seats named in the Direct Deals object, where 0 = all bids are accepted, 1 = bids are restricted to the deals specified and the terms thereof.
deals | object array | - | Array of Deal objects that convey the specific deals applicable to this impression.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB.

### Deal

Field Name | Type | Default | Description
---------- | ---- | ------- | ----------- 
id | string | - | A unique identifier for the direct deal.
bidfloor | float | 0 | Minimum bid for this impression expressed in CPM.
bidfloorcur | string | USD| Currency specified using ISO-4217 alpha codes. This may be different from bid currency returned by bidder if this is allowed by the exchange.
at | integer | - | Optional override of the overall auction type of the bid request, where 1 = First Price, 2 = Second Price Plus, 3 = the value passed in bidfloor is the agreed upon deal price. Additional auction types can be defined by the exchange.
wseat | string array | - | Whitelist of buyer seats allowed to bid on this deal. Seat IDs must be communicated between bidders and the exchange a priori. Omission implies no seat restrictions.
wadomain | string array | - | Array of advertiser domains (e.g., advertiser.com) allowed to bid on this deal. Omission implies no advertiser restrictions.
ext | object | - | Placeholder for exchange-specific extensions to OpenRTB

## Native Ad Request Markup Details

### Native Markup Request Object

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
ver | optional | string | 1  | Version of the Native Markup version in use.
layout | recommended | integer | - | The Layout ID of the native ad unit. See the table of Native Layout IDs below.
adunit | recommended | integer | - | The Ad unit ID of the native ad unit. See the Table of Native Ad Unit IDs below for a list of supported core ad units.
plcmtcnt | optional | integer | 1 | The number of identical placements in this Layout.
seq | optional | integer | 0 | 0 for the first ad, 1 for the second ad, and so on. This is not the sequence number of the content in the stream. 
assets | required | array of objects | - | An array of Asset Objects. Any bid must comply with the array of elements expressed by the Exchange.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Asset Object

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
id | required | integer | - | Unique asset ID, assigned by exchange. Typically a counter for the array.
required | optional | integer | 0 | Set to 1 if asset is required (exchange will not accept a bid without it)
title | optional | object | - | Title object for title assets. 
img | optional | object | - | Image object for image assets.
video | optional | object | - | Video object for video assets. Note that in-stream video ads are not part of Native. Native ads may contain a video as the ad creative itself.
data | optional | object | - | Data object for ratings, prices etc.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Title Object

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
len | required | integer | - | Maximum length of the text in the title element.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification

### Image Object

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
type | optional | integer | - | Type ID of the image element supported by the publisher. The publisher can display this information in an appropriate format.
w | optional | integer | - | Width of the image in pixels.
wmin | recommended | integer | - | The minimum requested width of the image in pixels. This option should be used for any rescaling of images by the client. Either w or wmin should be transmitted. If only w is included, it should be considered an exact requirement.
h | optional | integer | - | Height of the image in pixels. 
hmin | recommended | integer | - | The minimum requested height of the image in pixels. This option should be used for any rescaling of images by the client. Either h or hmin should be transmitted. If only h is included, it should be considered an exact requirement.
mimes | optional | array of strings| All types allowed | Whitelist of content MIME types supported. Popular MIME types include, but are not limited to “image/jpg” “image/gif”. Each implementing Exchange should have their own list of supported types in the integration docs. See Wikipedia's MIME page for more information and links to all IETF RFCs. If blank, assume all types are allowed.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Video Object

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
mimes | required | array of strings | - | Content MIME types supported. Popular MIME types include,but are not limited to “video/x-mswmv” for Windows Media, and “video/x-flv” for Flash Video.
minduration | required | integer | - | Minimum video ad duration in seconds.
maxduration | required | integer | - | Maximum video ad duration in seconds.
protocols | required | array of integers | - | An array of video protocols the publisher can accept in the bid response.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification. 

### Data Object

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
type | required | integer | - | Type ID of the element supported by the publisher. The publisher can display this information in an appropriate format. 
len | optional | integer | - | Maximum length of the text in the element’s response.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.


## Tables 5.16 - 5.18

These tables contain additional information about location and device type

### Location Type

Value | Description
----- | ----------
1 | GPS/Location Services
2 | IP Address
3 | User provided (e.g. registration data)

### Device Type

Value | Description | Notes 
----- | ----------- | -----
1 | Mobile/Tablet | Version 2.0
2 | Personal Computer | Version 2.0
3 | Connected TV | Version 2.0
4 | Phone | New for Version 2.2
5 | Tablet | New for Version 2.2
6 | Connected Device | New for Version 2.2
7 | Set Top Box | New for Version 2.2


### Connection Type

Value | Description 
----- | ----------- 
0 | Unknown
1 | Ethernet
2 | WIFI
3 | Cellular Network – Unknown Generation
4 | Cellular Network – 2G
5 | Cellular Network – 3G
6 | Cellular Network – 4G
