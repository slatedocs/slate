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

<aside>This is a test!</aside>

### BidRequest

Field Name | Type | Default | Description
---------- | ---- | ------- | -----------  
test | test | test | test 


### Imp
### Banner
### Video
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
