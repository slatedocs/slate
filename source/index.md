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

The API base url is: **http://api.mojopages.com/api/v1/**

The API is versioned, the current version is 1. This is designated in the url path with /v1

If you have any question please visit [our support pages](http://help.mojopages.com).


# Authentication

> To set authorization, use this code:

```shell
# With shell, you can just pass the correct header with each request
curl http://api.mojopages.com/api/v1/status 
  -H "Authorization: Token token='YOUR-ACCESS-TOKEN'"
```

> Make sure to replace `YOUR-ACCESS-TOKEN` with your API access key.

MojoPages uses API keys to allow access to the API. You can get an account by contacting us.

The MojoPages API expects for the API key to be included in all API requests to the server. The API key can be passed either as a parameter like the following:

`access_token=YOUR-ACCESS-TOKEN`

Or in a header that looks like the following:

`Authorization: Token token="YOUR-ACCESS-TOKEN"`

<aside class="notice">
You must replace `YOUR-ACCESS-TOKEN` with your API key.
</aside>

# Listing Data Types

> Sample JSON Payload:

```json
[
  {
    "listing_id": "f76ae9ceb01cf2904fe2",
    "name": "Instant Plumbing",
    "address": "1944 W Coolbrook Ave",
    "locality": "Pheonix",
    "region": "AZ",
    "postcode": "85023",
    "tel": "(602) 993-3532",
    "website": "http://mywebsite.com",
    "longitude": "-112.10158",
    "latitude": "33.643668",
    "facebook_id": "568020079969282"
  }
]

```

Business listings are made up of different pieces of data. These are the excepted base record data for a business. These should be sent in the JSON payload. These are all optional except where requests require a particular parameter. You may also add in any data that is not included specifically here, label the data type appropriatly, we will accept any data you would like to send.

### Data Types

Data Type | Description
--------- | -----------
listing_id |  Your unique identifier for the listing, used for adding or deleting a record
name | Name of the business
address | Address of the business
address_extended | Second address of the business if there is one
locality | City where the business is located
region | State in which the business is located, should be 2 character abreviation
postalcode | Postal code where the business is located, should be a minimum 5 digits
tel | Telephone number of the business, should be 10 digits
website |  URL for the business, include http:// 
email | Email address for the business
logitude | Longitude of the business location
latitude | Latitude of the business location
facebook_id | The Facebook ID or the name of the page for the business
twitter_id | Twitter username for the business, without the @ symbol
google_plus_id | The Google Plus ID or the name used for the page of the business
instagram_id | The Instgram ID or the username for the business
