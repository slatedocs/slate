# Appendix

## Constructing Google+ URLs

```php
<?php
$url = 'https://www.google.com/search?' . http_build_query([
    'q'    => sprintf('"%s" "%s" %s', 'Hub Plumbing & Mechanical Inc', 'New York', '212-482-8500'),
]);
```

```php
<?php
$url = 'https://www.google.com/search?' . http_build_query([
    'q'   => sprintf('"%s" "%s"', 'Pizza Hut', '67337'),
]);    
```

Google recently simplified their Google+ profile pages and removed much of the useful profile information that we normally gather through APIs documented here, such as NAP and reviews. Consequently we have stopped using Google+ Local listings and have instead started tracking business profile information via Google SERP pages. This means that when requesting Google profile data or reviews via our API you need to supply us with a pre-formatted search URL rather than the plus URL that corresponds to that business. Your search URL should be constructed with one of the following formats:

### Business names (in quotes) + zip code (in quotes) and phone number (without quotes)

`https://www.google.com/search?q="Hub+Plumbing+%26+Mechanical+Inc"+"New+York"+212-482-8500`

### Business name (in quotes) + zipcode (in quotes)

`https://www.google.com/search?q="Pizza+Hut"+"67337"`

One format may work better than another for a specific business so we recommend testing both approaches to find the optimal profile URL. The code snippets on the right give examples of how to generate each type of URL.

## Supported Local Directories

The following tables provide details of the local directories we support for looking up profile URLs, profile details and/or reviews. For some directories we are able to grab all information and for others only partial information due to restrictions on certain sites or due to complications in the data gathering process (e.g. site uses JS to mask certain data points or doesn't present listing on separate, distinct URLs)

### Key for tables

* Identifier = name of directory to be used when querying data for a specific directory
* NAP = we are able to retrieve Business Name, Address, Phone Number from a directory (some sites provide address in component parts, some as single data string)
* Reviews = we grab review content, star rating + review count from a directory
* Find Profile URL = we are able to return a URL on directory for this business
* Website URL = we are able to retrieve website URL from a directory (if it is present) 

### United States (USA)

Identifier|NAP|Reviews|Find Profile URL|Website URL|Notes
----------|---|-------|---|-----|-----
2findlocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
411com|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
aboutus|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
<s>acxiom</s>|<span class="yes">Yes</span>||||No longer available
agreatertown|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
<s>allpages</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
angies|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
b2byellowpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bbb|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bizdays|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
bizexposed|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bizvotes|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
botw|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
brownbook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
businessnetpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
callupcontact|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cbsyellowpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
chamberofcommerce|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
checkmyreview|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cityfos|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
citysearch|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
citysquares|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cmac|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
corporationwiki|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
cortera|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cylex|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
demandforce|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
dexknows|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
doctoroogle|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ebusinesspages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
elocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
enrollbusiness|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
expressupdate|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ezlocal|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
facebook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
factual|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
favecentral|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
find-us-here|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
finduslocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
foursquare|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
freebusinessdirectory|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
garagecommerce|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
google|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
healthgrades|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
hotfrog|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ibegin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
insiderpages|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
judysbook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
justdeal|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|Incorrectly named - corresponds to JustDial
kudzu|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
linkbyme|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
linkedin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
linktownwhas11|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localcom|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localstack|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
magicyellow|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>manta</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
mapquest|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
merchantcircle|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
misterwhat|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>mojopages</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>||No longer available
mywebyellow|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
neustarlocaleze|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
nexport|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
opentable|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
powerprofiles|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
realself|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
realpatientratings|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
salesspider|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
showmelocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
smilereminder|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
superpages|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>switchboard</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
<s>theusaexplorer</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>||No longer available
tripadvisor|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
tupalo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tuugo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ucomparehealthcare|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
vitals|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
wellness|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
wfaa|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
whitepages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
worldweb|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yahoo|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yalwa|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yasabe|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yellowbook|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yellowbot|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yellowee|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yellowpagecity|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yellowpages|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yelp|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ziplocalonline|<span class="yes">Yes</span>||<span class="yes">Yes</span>||Was previously referred to as ziplocal
zocdoc|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
zomato|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||




### Great Britain (GBR)

Identifier|NAP|Reviews|Find Profile URL|Website URL|Notes
----------|---|-------|---|-----|-----
192|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
2findlocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
aboutus|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
accessplace|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bizexposed|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bizwiki|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
brownbook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>businessclassified</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
businessmagnet|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
<s>bview</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>||No longer available
callupcontact|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cityvisitor|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cylex|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
dentons|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|Currently causing issues in grabbing profile details
enrollbusiness|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
facebook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
factual|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
find-us-here|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
foursquare|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
freeindex|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
fyple|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
google|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
hotfrog|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ibegin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
independent|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
linkedin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localdatasearch|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>localmole</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
<s>manta</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
misterwhat|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
mylocalservices|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
near|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
oneoneeight|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
opendi|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
opentable|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
scoot|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
thediscdirectory|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
thelocalweb|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
thesun|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
thomsonlocal|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tipped|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
touchlocal|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
townpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tripadvisor|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tupalo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tuugo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
uk-local-search|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ukplaces|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
wampit|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
<s>welovelocal</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>||No longer available
wheresbest|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
worldweb|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yahoo|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yalwa|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yell|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yelp|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
zomato|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||



### Australia (AUS)

Identifier|NAP|Reviews|Find Profile URL|Website URL|Notes
----------|---|-------|---|-----|-----
2findlocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
aubiz|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
aussieweb|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
australiabusinesslisting|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
australianguide|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
australianplanet|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bizexposed|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bloo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
brownbookaus|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>businesscomau</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
callupcontact|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cylex|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as cylexaus
dlook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>eatability</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
enrollbusiness|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
facebook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
factual|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
find-us-here|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
foursquare|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
fyple|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
google|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
hotfrog|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as hotfrogaus
linkedin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localbd|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localbusinessguide|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localcomau|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localsearch|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
localstore|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>manta</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
misterwhat|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
nationaldirectory|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>nearyouau</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
opentable|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
pinkpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
reverseaustralia|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
startlocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
streetdirectory|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
superpagesaus|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tripadvisor|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
truelocal|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tupalo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tuugo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>vicdir</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>||No longer available
whereis|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
whitepagesaus|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
womo|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
worldweb|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
wowcity|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yalwa|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yellowbook|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yellowpagesaus|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yelp|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as yelp-aus
zomato|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||




### Canada (CAN)

Identifier|NAP|Reviews|Find Profile URL|Website URL|Notes
----------|---|-------|---|-----|-----
411|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as c411
2findlocal|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
411com|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>allpages</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
bbb|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
bizexposed|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
brownbook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
businessnetpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
callupcontact|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
canadabusinessdirectory|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
canadaone|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
canadaspace|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
canpages|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cdnpages|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
cylex|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as cylexcan
dakitaki|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
directorycentral|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
enrollbusiness|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
facebook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
factual|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>findusfast</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>||No longer available
find-us-here|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
foursquare|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
goldbook|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
google|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
hotfrog|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as hotfrogcan
ibegin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
linkedin|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>manta</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
misterwhat|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>n49<s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>||No longer available
<s>nearyouca</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
opentable|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
ourbis|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
pagesjaunes|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
phonepages|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
profilecanada|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
salespider|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>superpages</s>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
tripadvisor|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tupalo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
tuugo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
weblocal|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
worldweb|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yahoo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yalwa|<span class="yes">Yes</span>||<span class="yes">Yes</span>||
yellowee|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yellowpagesca|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|
yelp|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>|Was previously referred to as yelp-can
ylm|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|
<s>ziplocal</s>|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|No longer available
zomato|<span class="yes">Yes</span>|<span class="yes">Yes</span>|<span class="yes">Yes</span>||
zoominfo|<span class="yes">Yes</span>||<span class="yes">Yes</span>|<span class="yes">Yes</span>|


## Business Category IDs

We no longer list the supported business categories here. We now have an [endpoint](#business-categories) which enables you to retrieve a list of categories by country.

## Supported Countries

The following countries and codes are supported by our system:

Country|Code
---|---
Australia|AUS
Canada|CAN
Germany|DEU
Hong Kong|HKG
Ireland|IRL
Macau|MAC
Netherlands|NLD
New Zealand|NZL
Philippines|PHL
Taiwan|TWN
United Kingdom|GBR
United States|USA
Singapore|SGP
South Africa|ZAF
