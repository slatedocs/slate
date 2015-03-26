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
[
  {
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
    "google_plus_id": NULL,
    "instagram_id": "cricketnation",
    "status": "AVAILABLE",
    "mapped": false,
    "claimed": false,
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
    "updated_at": "2014-11-27T11:35:27.364Z"
  }
]

```

Business listings are made up of different pieces of data. These are the excepted base record data for a business. These should be sent in the JSON payload. These are all optional except where requests require a particular parameter. You may also add in any data that is not included specifically here, label the data type appropriatly, we will accept any data you would like to send.

### Data Types

Data Type | Description
--------- | -----------
listing_id |  Your unique identifier for the listing, used for adding or deleting a record
mojo_id | false | Associated MojoPages ID for listing will map automatically if you include it
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
status | Statuses of SUPPRESSED, CLAIMED or AVAILABLE can be given for listing
mapped | True or False on whether or not the partner listing is mapped
claimed | True or False on whether or not the partner has claimed a listing
omit_address | Boolean for omitting the address from the listing (default: false)
hours | The Hours a business is open or closed represented by a hash of multi dimensional arrays
updated_at | When the listing was last updated

# Getting Started Workflow

There are many ways and uses for the API. Here are the major typical workflows:

## Add, Search and Map Listings
1. [Post partner listings](#post-a-new-partner-listing) - First push all your listings into our database.
2. [Search for listings](#get-a-search-for-listings-in-json) - We recommend when searching using:  Name, Address, Latitude, Longitude and Phone number.
3. [Post a claim for the listing](/#post-claim-a-listing) - Post your listing ID and the Mojo_ID of the listing you want to claim ownership for.
3.A. [Post a suppress listing](#post-suppress-a-listing) - If there are **duplicates** or other issues with listings in our database then supress them.
3.B. [Update partner listing](#update-a-partner-listing) - If a listings status is already claimed then updating it with the you listing ID and Mojo_ID will map the listings and if the listing becomes unclaimed by default it will become your listing.
4. [Get partner listings](#get-partner-listings-in-json) - Lastly this will give you all your listings and the status of those listins in our database.

## Add and Automap Listings
If you do not manually want to map your listings to the listings in or database you can leave that to us and we will automap them. This is not on by default. To do this you will want to do the following:
1. [Post partner listings](#post-a-new-partner-listing) - First push all your listings into our database. Pass the parameter "map=true". We will do our best to map your listing to our listing.
2. [Search for listings](#get-a-search-for-listings-in-json) - We recommend when searching using:  Name, Address, Latitude, Longitude and Phone number.
2.A. [Post a suppress listing](#post-suppress-a-listing) - If there are **duplicates** or other issues with listings in our database then supress them.
2.B. [Update partner listing](#update-a-partner-listing) - If a listings status is already claimed then updating it with the you listing ID and the parameter "map=true" will automap the listings and if the listing becomes unclaimed by default it will become your listing.
3. [Get partner listings](#get-partner-listings-in-json) - Lastly this will give you all your listings and the status of those listins in our database.

## Unclaim Listings
If you no longer manage the clients listing you can [Unclaim](#post-unclaim-a-listing) a listing this will keep all updates done to the unclaim point and then remove your claim status from your account and open it back up to be claimed by other partners.
