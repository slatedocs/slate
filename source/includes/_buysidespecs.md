# Buy-Side Specifications

Powerlinks Media is fully compliant with the Open RTB 2.3 specifications and its Native subprotocol. Below you'll find information regarding Powerlinks's bid request/response specifications and expectations for buy-side partners.

## Example Bid Request

Include an example bid request from a seller. Then include a table that shows what's required in the bid request, and then also what they should expect (and what's seller-specific). Always, expected + enhancements, SSP Specific (columns for table)

enhancements - device data from browsecap, ias data from manuel
extensions 
mappings

## Supported Objects

Object Name | Supported | Required | Expected
----------- | --------- | -------- | ------------------ 
Bid Response | Yes | id | seatbid, bidid, cur, customdata, nbr, ext
SeatBid | Yes | bid | seat, group, ext
Bid  | Yes | id, impid, price | adid, nurl, adm, adomain, bundle, iurl, cid, crid, cat, attr, dealid, h, w, ext


### BidResponse

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | string | - | ID of the bid request to which this is a response.
seatbid | object array | - | Array of seatbid objects; 1+ required if a bid is to be made.
bidid | string | - | Bidder generated response ID to assist with logging/tracking.
cur | string| USD | Bid currency using ISO-4217 alpha codes.
customdata | string | - | Optional feature to allow a bidder to set data in the exchange’s cookie. The string must be in base85 cookie safe characters and be in any format. Proper JSON encoding must be used to include “escaped” quotation marks.
nbr | integer | - | Reason for not bidding. Refer to List 5.19.
ext | object | - | Placeholder for bidder-specific extensions to OpenRTB.

### SeatBid

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
bid | object array | - | Array of 1+ Bid objects (Section 4.2.3) each related to an impression. Multiple bids can relate to the same impression.
seat | string | - | ID of the bidder seat on whose behalf this bid is made.
group | integer | 0 | 0 = impressions can be won individually; 1 = impressions must be won or lost as a group.
ext | object | - | Placeholder for bidder-specific extensions to OpenRTB.

### Bid

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
id | string | - | Bidder generated bid ID to assist with logging/tracking.
impid | string | - | ID of the Imp object in the related bid request.
price | float | - | Bid price expressed as CPM although the actual transaction is for a unit impression only. Note that while the type indicates float, integer math is highly recommended when handling currencies (e.g., BigDecimal in Java).
adid | string | - | ID of a preloaded ad to be served if the bid wins.
nurl | string | - | Win notice URL called by the exchange if the bid wins; optional means of serving ad markup.
adm | string | - | Optional means of conveying ad markup in case the bid wins; supersedes the win notice if markup is included in both.
adomain | string array | - | Advertiser domain for block list checking (e.g., “ford.com”). This can be an array of for the case of rotating creatives. Exchanges can mandate that only one domain is allowed.
bundle | string | - | Bundle or package name (e.g., com.foo.mygame) of the app being advertised, if applicable; intended to be a unique ID across exchanges.
iurl | string | - | URL without cache-busting to an image that is representative of the content of the campaign for ad quality/safety checking.
cid | string | - | Campaign ID to assist with ad quality checking; the collection of creatives for which iurl should be representative.
crid | string | - | Creative ID to assist with ad quality checking.
cat | string array | - | IAB content categories of the creative. Refer to List 5.1.
attr | integer array | - | Set of attributes describing the creative. Refer to List 5.3.
dealid | string | - | Reference to the deal.id from the bid request if this bid pertains to a private marketplace direct deal.
h | integer | - | Height of the creative in pixels.
w | integer | - | Width of the creative in pixels.
ext | object | - | Placeholder for bidder-specific extensions to OpenRTB.

## Native Ad Bid Response Markup

### Native Ad Creative JSON

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
native | required | object | - | Top level Native object

### Native

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
ver | optional | integer | 1 | Version of the Native Markup version in use.
assets | required | array of objects | - | List of native ad’s assets.
link | required | object | - | Destination Link. This is default link object for the ad. Individual assets can also have a link object which applies if the asset is activated (clicked). If the asset doesn’t have a link object, the parent link object applies.
imptrackers[] | optional|  array of strings | - | Array of impression tracking URLs, expected to return a 1x1 image or 204 response - typically only passed when using 3rd party trackers.
jstracker | optional | string | - | Optional JavaScript impression tracker. This is a valid HTML, Javascript is already wrapped in \<script> tags. It should be executed at impression time where it can be supported.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification

### Asset

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
id | required | integer | -  | Unique asset ID, assigned by exchange, must match one of the asset IDs in request
required | optional | integer | 0 | Set to 1 if asset is required. (bidder requires it to be displayed).
title | optional | object | - | Title object for title assets. 
img | optional | object | - | Image object for image assets.
video | optional | object | - | Video object for video assets. Note that in-stream video ads are not part of Native. Native ads may contain a video as the ad creative itself.
data | optional | object | - | Data object for ratings, prices etc.
link | optional | object | - | Link object for call to actions. The link object applies if the asset item is activated (clicked). If there is no link object on the asset, the parent link object on the bid response applies.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Title

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
text | required | string | - | The text associated with the text element.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Image

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
url | required | string | - | URL of the image asset.
w | recommended | integer | - | Width of the image in pixels.
h | recommended | integer | - | Height of the image in pixels.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Data

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
label | optional | string | - | The optional formatted string name of the data type to be displayed.
value | required | string | - | The formatted string of data to be displayed. Can contain a formatted value such as “5 stars” or “$10” or “3.4 stars out of 5”
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.

### Video

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
vasttag | required | string | - | VAST xml.

### Link

Field Name | Scope | Type | Default | Description
-----------| ----- | ---- | ------- | -----------
url | required | string | - | Landing URL of the clickable link.
clicktrackers[] | optional | array of strings | - | List of third-party tracker URLs to be fired on click of the URL.
fallback | optional | string (URL) | - | Fallback URL for deeplink. To be used if the URL given in url is not supported by the device.
ext | optional | object | - | This object is a placeholder that may contain custom JSON agreed to by the parties to support flexibility beyond the standard defined in this specification.