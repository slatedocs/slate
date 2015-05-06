---
title: MojoPages API Documentation


toc_footers:
  - <a href='#'>Get an Access</a>
  - <a href='http://help.mojopages.com'>Get some help</a>
  - <a href='http://github.com/tripit/slate'>Documentation Powered by Slate</a>
  - <p>&#169; 2014 MojoPages, Inc. San Diego, CA</p>

includes:
  - apiv1
  - changelog
  - errors
  - terms

search: true
---

# Introduction

Welcome to the MojoPages API documentation! MojoPages is a local business search application which uses social media to provide relavant and interesting results. The API is RESTful and enables adding, updating or delete business listing data on [MojoPages.com](http://mojopages.com) and it's properties. The API also allows you to check the status and map your business data to our database as well as retrieve all your business listings within our system.

Sample code is currently available as cURL in the dark area to the right. Requests and responses are all in JSON.

The API base url is: **https://api.mojopages.com/api/v1/**

The API is versioned, the current version is 1. This is designated in the url path with /v1

If you have any question please visit [our support pages](http://help.mojopages.com).


# Authentication

> To set authorization, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl https://api.mojopages.com/api/v1/status
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
```

> Make sure to replace `YOUR-ACCESS-TOKEN` with your API access key.

MojoPages uses API keys to allow access to the API. You can get an account by contacting us.

The MojoPages API expects for the API key to be included in all API requests to the server. The API key can be passed either as a parameter like the following:

`access_token=YOUR-ACCESS-TOKEN`

Or in a header that looks like the following:

`Authorization: Token token=YOUR-ACCESS-TOKEN`

<aside class="notice">
You must replace `YOUR-ACCESS-TOKEN` with your API key.
</aside>

# Listing Data Types

> Sample JSON Payload:

```json
{
  "status": "AVAILABLE",
  "listing_id": "f76ae9ceb01cf2904fe2",
  "mojo_id": "11079728",
  "mojo_url": "https://www.mojopages.com/biz/instant-phones-phoenix-az/11079728",
  "name": "Instant Phones",
  "address": "2415 E Thomas Rd",
  "locality": "Pheonix",
  "region": "AZ",
  "postcode": "85016",
  "tel": "(602) 224-9582",
  "website": "http://www.mycricket.com/",
  "longitude": "-112.10158",
  "latitude": "33.643668",
  "facebook_id": "111664078919577",
  "twitter_id": "cricketnation",
  "google_plus_id": null,
  "instagram_id": "cricketnation",
  "omit_address": false,
  "hours": {
      "sunday": [
        [
          "closed"
        ]
      ],
      "monday": [
        [
          "8:00",
          "16:00"
        ]
      ]
    },
  "category_ids": [
      "467"
    ],
  "logo_url": null,
  "photo_urls": [],
  "video_urls": [],
  "offer_message": null,
  "offer_url": null,
  "attribution_logo": {
      "description": "Company",
      "url": "http://www.company.com/attribution/logo.png",
      "width": 100,
      "height": 20
    },
  "attribution_url": "http://www.company.com",
  "updated_at": "2014-11-27T11:35:27.364Z"
}

```

Business listings are made up of different pieces of data. These are the excepted base record data for a business. These should be sent in the JSON payload. These are all optional except where requests require a particular parameter. You may also add in any data that is not included specifically here, label the data type appropriatly, we will accept any data you would like to send.

### Status Types

Status Type | Description
--------- | -----------
AVAILABLE | This listing is not currently a claimed listing, it may be successfully claimed by you.
ACTIVE | This listing is fully activated and live on MojoPages.com.
SUPPRESSED | The listing is suppressed, which means it should not appear in our search results or have a detail page.
BLOCKED | The listing has an existing relationship with another partner and may not be controlled by you.

### Data Types

Data Type | Description
--------- | -----------
status | Contains either AVAILABLE, ACTIVE, SUPPRESSED or BLOCKED status
listing_id | Your unique identifier for the listing, used for adding or deleting a record
mojo_id | Claims a Business based on mojo_id, will automap or create new listing when not included
mojo_url | URL for MojoPages listing
name | Name of the business
address | Address of the business
address_extended | Second address of the business if there is one
locality | City where the business is located
region | State in which the business is located, should be 2 character abreviation
postcode | Postal code where the business is located, should be a minimum 5 digits
tel | Telephone number of the business, should be 10 digits
fax | Fax number of the business, should be 10 digits
website |  URL for the business, include http://
email | Email address for the business
longitude | Longitude of the business location
latitude | Latitude of the business location
facebook_id | The Facebook ID or the name of the page for the business
twitter_id | Twitter username for the business, without the @ symbol
google_plus_id | The Google Plus ID or the name used for the page of the business
instagram_id | The Instgram ID or the username for the business listing
omit_address | Boolean for omitting the address from the listing (default: false)
hours | The Hours a business is open or closed represented by a hash of multi dimensional arrays
category_ids | MojoPages Category ID's that you want business to be listed under array (max: 3)
logo_url | URL for the listing logo, must be a minimum of 150x150 pixels
photo_urls | Array of URLs for the listing photos, must all be a minimum of 150x150 pixels
video_urls | Array of URLs for the listing videos, must be either YouTube or Vimeo links
offer_message | Special Offer or Coupon Message used as a link on the listing page
offer_url | Special Offer or Coupon URL used as a link on the listing page
attribution_logo | Partner attribution logo hash with description, width, height and a url that also supports https
attribution_url | Partner attribution url
updated_at | When the listing was last updated

# Getting Started Workflow

There are many ways and uses for the API. Here are the major typical workflows:

1) [Find Right Category ID](#get-categories-in-json) - You'll first want to grab a list of our category ID's before getting started.

2) [Search for listings](#get-a-search-for-listings-in-json) - We recommend when searching using: Name, Address, Latitude, Longitude and Phone number.

3) [Get a listing detail](#get-a-listing) - Verify the listings status and make sure that it is Available to be claimed.

4) [Post partner listings](#post-a-new-partner-listing) - Push all your listings into our database with your listing ID and the Mojo_ID of the listing you want to claim ownership for.

4.A) [Post a suppress listing](#post-suppress-a-listing) - If there are duplicates or other issues with listings in our database then supress them.

4.B) [Add a partner listing](#post-a-new-partner-listing) - If you have verified there is no match to a search result, Post a partner listing without a Mojo_ID and it will be added.

4.C) [Update partner listing](#update-a-partner-listing) - If you have claimed a listing and the status is active then you can update it at anytime and any parameters passed will be updated.

5) [Get partner listings](#get-partner-listings-in-json) - Lastly this will give you all your listings and the status of those listins in our database.
