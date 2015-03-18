# Reviews

## Fetch Reviews (by profile URL)

> Success (201 Created)

```json
{
    "success": true,
    "job-id": 318
}
```
 
> Failure (400 Bad Request)

```json
{
  "success": false,
  "errors": {
    "INVALID_COUNTRY": "Invalid  country  specified",
    "INVALID_PROFILE_URL": "Profile Url is not valid",
    "INVALID_DATE_FROM": "Invalid Date From. Date Format: Y-m-d or Y-m-d H:i:s",
    "INVALID_REVIEWS_LIMIT": "Reviews Limit should be positive number or 'all'"
  }
}
```
 
> Failure (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": {
    "INVALID_METHOD": "Invalid method specified. Only POST method is available"
  }
}
```

Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-reviews`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | Required
batch-id | Required
profile-url | Required
country | Required
sort | 'rating' or 'date'. By default 'date'.
reviews-limit | Positive number or 'all'. By default 250.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.

## Fetch Reviews (by business data)

> Success (201 Created)

```json
{
    "success": true,
    "job-id": 318
}
```
 
> Failure (400 Bad Request)

```json
{
  "success": false,
  "errors": {
    "INVALID_BUSINESS_NAMES": "Invalid Business names specified",
    "INVALID_COUNTRY": "Invalid country specified",
    "INVALID_CITY": "Invalid city specified",
    "INVALID_POSTCODE": "Invalid postcode specified",
    "INVALID_LOCAL_DIRECTORY": "Invalid local directory specified",
    "INVALID_DATE_FROM": "Invalid Date From. Date Format: Y-m-d or Y-m-d H:i:s",
    "INVALID_REVIEWS_LIMIT": "Reviews Limit should be positive number or 'all'"
  }
}
```
 
> Failure (405 Method Not Allowed)

```json
{
  "success": false,
  "errors": {
    "INVALID_METHOD": "Invalid method specified. Only POST method is available"
  }
}
```

This method finds profile url then fetches reviews using this URL.

Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/ld/fetch-reviews-by-business-data`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | Required
batch-id | Required. Required batch v4 see /v4/batch.
business-names | Required. A newline (\n) separated list of possible business names to search for. For example: The Rose Pub Rose Pub The Rose.
city | Required
postcode | Required
local-directory | Required. See appendix below for possible options.
street-address |
country | Required. Only USA.
telephone | A valid telephone number. Providing this will improve the quality of results returned.
sort | 'rating' or 'date'. By default 'date'.
reviews-limit | Positive number or 'all'. By default 250.
date-from | Date Format: Y-m-d or Y-m-d H:i:s. By default not specified.
