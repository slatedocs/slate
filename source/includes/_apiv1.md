# API V1

## Get Status

> Request example

```shell
curl "https://api.mojopages.com/api/v1/status"
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""
```

> The above command returns JSON structured like this:

```json
[
  {
    "api_status": "published",
    "partner": "Company Name",
    "total_listings": 12000,
    "matched_listings": 600
  }
]
```

Check the status of the inserted businesses and the current total businesses matched.

### HTTP Request

`GET https://api.mojopages.com/api/v1/status`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate



## Get Listings

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listings"
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""
```

> The above command returns JSON structured like this:

```json
[
  {
    "listing_id": "f76ae9ceb01cf2904fe2",
    "mojo_id": 123456,
    "name": "Instant Plumbing",
    "address": "1944 W Coolbrook Ave",
    "address_extended": null,
    "locality": null,
    "region": "AZ",
    "postcode": "85023",
    "tel": "(602) 993-3532",
    "website": null,
    "longitude": "-112.10158",
    "latitude": "33.643668",
    "facebook_id": "568020079969282",
    "updated_at": "2014-11-27T11:35:27.364Z"
  }
]
```

This endpoint retrieves all your existing business listings.

### HTTP Request

`GET https://api.mojopages.com/api/v1/listings`

### Query Parameters

Parameter | Required | Description
--------- | ------- | -----------
access_token | true | Access token used to authenticate



## Get a Listing

> Request example

```shell
curl "https://api.mojopages.com/api/v1/listing/7d373c1da40cbfc3f165"
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""
```

> The above command returns JSON structured like this:

```json
[
  {
    "listing_id": "7d373c1da40cbfc3f165",
    "mojo_id": 1234567,
    "name": "Carol's Proper Protocol",
    "address": "1129 E Cambria Ln N",
    "address_extended": null,
    "locality": null,
    "region": "IL",
    "postcode": "60148",
    "tel": "(630) 740-2439",
    "website": "http://carolsproperprotocol.com/",
    "longitude": "-87.989643",
    "latitude": "41.870809",
    "facebook_id": null,
    "updated_at": "2014-11-27T11:07:24.075Z"
  }
]
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
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""
```

> The above command returns JSON structured like this:

```json
[
  {
    "mojo_id": 201702,
    "name": "Piety Hill Cottages",
    "address": "523 Sacramento St",
    "locality": "Nevada City",
    "region": "CA"
  }
]
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
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""
  -H "Content-Type: application/json"
  -X POST -d '{"mojo_id": 201702, "name": "Piety Hill Cottages", "address": "523 Sacramento St", "tel": "(555) 555-5555", "locality": "Nevada City", "region": "CA"}'

```

> The above command returns JSON structured like this:

```json
[
  {
    "status": 200,
    "message": "success"
  }
]
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
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""
  -H "Content-Type: application/json"
  -X PUT -d '{"address": "523 Sacramento Streeet", "tel": "(800) 555-5555"}'

```

> The above command returns JSON structured like this:

```json
[
  {
    "status": 200,
    "message": "success"
  }
]
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
  -H "Authorization: Token token="YOUR-ACCESS-TOKEN""

```

> The above command returns JSON structured like this:

```json
[
  {
    "status": 200,
    "message": "success"
  }
]
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
