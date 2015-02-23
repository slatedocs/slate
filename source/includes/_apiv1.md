# API V1

## Get Status

> Request example

```shell
curl "https://api.mojopages.com/api/v1/status"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "api_status": "published",
  "partner": "Company Name",
  "total_listings": 12000,
  "matched_listings": 600
}
```

Check the status of the inserted businesses and the current total businesses matched.

### HTTP Request

`GET https://api.mojopages.com/api/v1/status`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate




## Get a Search for Listings in JSON

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listings/search?name=Instant+Phones&locality=Pheonix&region=AZ"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "listings": [
    {
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
      "updated_at": "2014-11-27T11:35:27.364Z"
    }
  ]
}
```

This endpoint retrieves all your existing business listings.

### HTTP Request

`GET https://api.mojopages.com/api/v1/listings/search`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
results | false | Number of results to return (default returns one listing)
name | false | Name of the business
address | false | Address of the business
address_extended | false | Second address of the business if there is one
locality | false | City where the business is located
region | false | State in which the business is located, should be 2 character abreviation
postcode | false | Postal code where the business is located, should be a minimum 5 digits
tel | false | Telephone number of the business, should be 10 digits
website | false | URL for the business, include http://
longitude | false | Longitude of the business location
latitude | false | Latitude of the business location




## Get Listings in JSON

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listings"
  -H 'Authorization: Token token=YOUR-ACCESS-TOKEN'
```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "listings": [
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
      "google_plus_id": null,
      "instagram_id": "cricketnation",
      "updated_at": "2014-11-27T11:35:27.364Z"
    }
  ]
}

```

This endpoint retrieves all your existing business listings.

### HTTP Request

`GET https://api.mojopages.com/api/v1/listings`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate




## Get Listings in CSV

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listings/csv"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN" >> Listings.csv
```

> The above command returns CSV structured like this:

```csv
listing_id, mojo_id, mojo_url, name, address, locality, region, postcode, tel, website, longitude, latitude, facebook_id, twitter_id, google_plus_id, instagram_id, updated_at
f76ae9ceb01cf2904fe2,11079728,https://www.mojopages.com/biz/instant-phones-phoenix-az/11079728,Instant Phones,2415 E Thomas Rd,Pheonix,AZ,85016,(602) 224-9582,http://www.mycricket.com/,-112.10158,33.643668,111664078919577,cricketnation,,cricketnation,2014-11-27T11:35:27.364Z
```

This endpoint retrieves all your existing business listings.

### HTTP Request

`GET https://api.mojopages.com/api/v1/listings/csv`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate






## Get a Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/7d373c1da40cbfc3f165"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "listing": {
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
    "updated_at": "2014-11-27T11:35:27.364Z"
  }
}
```

This endpoint retrieves a specific business listings.

### HTTP Request

`GET https://api.mojopages.com/api/v1/listing/:LISTING_ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:LISTING_ID| true | Your ID for the specific business listing

<aside class="notice">
You must replace `:LISTING_ID` with your business listing id.
</aside>


## Get Listing by Factual ID

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/693acfb0-a323-44c5-8aa1-75baf9f99f3a/factual"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "listing": {
    "mojo_id": "11079728",
    "mojo_url": "https://www.mojopages.com/biz/instant-phones-phoenix-az/11079728",
    "name": "Instant Phones",
    "address": "2415 E Thomas Rd",
    "locality": "Pheonix",
    "region": "AZ"
  }
}
```

This endpoint retrieves a specific business listings by the Factual ID.

### HTTP Request

`GET https://api.mojopages.com/api/v1/listing/:FACTUAL_LISTING_ID/factual`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:FACTUAL_LISTING_ID| true | Factual ID for the specific business listing

<aside class="notice">
You must replace `:FACTUAL_LISTING_ID` with the business listings Factual id.
</aside>


## Post a New Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/7d373c1da40cbfc3f165"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
  -H "Content-Type: application/json"
  -X POST -d '{"mojo_id": 201702, "name": "Piety Hill Cottages", "address": "523 Sacramento St", "tel": "(555) 555-5555", "locality": "Nevada City", "region": "CA"}'

```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "success": true
}
```

This endpoint is used to post a new business listings to MojoPages.

### HTTP Request

`POST https://api.mojopages.com/api/v1/listing/:LISTING_ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:LISTING_ID| true | Your ID for the specific business listing


<aside class="notice">
You must replace `:LISTING_ID` with your business listings id.
</aside>


## Update a Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/7d373c1da40cbfc3f165"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
  -H "Content-Type: application/json"
  -X PUT -d '{"address": "523 Sacramento Streeet", "tel": "(800) 555-5555"}'

```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "success": true
}
```

This endpoint is used to put updated data for an existing business listing into MojoPages.

### HTTP Request

`PUT https://api.mojopages.com/api/v1/listing/:LISTING_ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:LISTING_ID| true | Your ID for the specific business listing being updated

<aside class="notice">
You must replace `:LISTING_ID` with your business listings id.
</aside>


## Delete a Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/7d373c1da40cbfc3f165"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"

```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "success": true
}
```

This endpoint is used to delete an existing business listing from MojoPages.

### HTTP Request

`DELETE https://api.mojopages.com/api/v1/listing/:LISTING_ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:LISTING_ID| true | Your ID for the specific business listing being deleted

<aside class="notice">
You must replace `:LISTING_ID` with your business listings id.
</aside>




## Get Categories in JSON

> Request example

```shell
curl "https://api.mojopages.com/api/v1/categories"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "categories": [
    {
      "category_id": 2,
      "parent_category_id": 1,
      "category_level": 1,
      "title": "Automotive",
      "naic_code": null,
      "sic_code": null
    }
  ]
}
```

Check the status of the inserted businesses and the current total businesses matched.

### HTTP Request

`GET https://api.mojopages.com/api/v1/categories`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate




## Get Categories in CSV

> Request example

```shell
curl "https://api.mojopages.com/api/v1/categories/csv"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN" >> Categories.csv
```

> The above command returns CSV structured like this:

```csv
category_id, parent_category_id, category_level, title, naic_code, sic_code
2,1,1,Automotive,,
```

Check the status of the inserted businesses and the current total businesses matched.

### HTTP Request

`GET https://api.mojopages.com/api/v1/categories/csv`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate




## Post Suppress a Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/11079728/suppress/4279039"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
  -X POST

```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "success": true
}
```

This endpoint is used to redirect or suppress business listings to MojoPages.

### HTTP Request

`POST https://api.mojopages.com/api/v1/listing/:MOJO_ID/suppress/:DESTINATION_MOJO_ID`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:MOJO_ID| true | Our Mojo ID for the specific business listing being redirected from
:DESTINATION_MOJO_ID| true | Our Mojo ID for the new business listing being redirected to


<aside class="notice">
You must replace `:MOJO_ID` with your duplicate business Mojo id and `:DESTINATION_MOJO_ID` for the business you wish to redirect to.
</aside>





## Post Unsuppress a Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/11079728/unsuppress"
  -H "Authorization: Token token=YOUR-ACCESS-TOKEN"
  -X POST

```

> The above command returns JSON structured like this:

```json
{
  "response": {
    "status": 200
  },
  "success": true
}
```

This endpoint is used to remove a redirect or suppression for a business listings to MojoPages. You need to be the one who originally suppressed the listing in order to unsupress it.

### HTTP Request

`POST https://api.mojopages.com/api/v1/listing/:MOJO_ID/unsuppress`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate
:MOJO_ID| true | Our Mojo ID for the specific business listing that needs to no longer be redirected


<aside class="notice">
You must replace `:MOJO_ID` with your non duplicate business Mojo id.
</aside>
