# Offsite SEO &amp; Social Profiles

## Offsite SEO

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
    "INVALID_BATCH_ID": "Batch ID not found",
    "INVALID_WEBSITE_URL": "Website URL missing"
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

This API method returns offsite SEO information domain age, hosting location, number of pages indexed and authority. Authentication for this method is via API key only.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/seo/offsite`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | Required
batch-id | Required. Required batch v4 see /v4/batch.
website-url | Required. URL of the business web site. Can be specified with or without http(s).

## Social Profiles

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
    "INVALID_WEBSITE_URL": "Website URL missing",
    "INVALID_CITY": "City missing",
    "INVALID_COUNTRY": "Country missing",
    "INVALID_BUSINESS_NAMES": "Business name(s) missing"
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

This API method returns details of the social profiles a business has on Twitter, Facebook and Foursquare. Authentication for this method is via API key only.

Please Note: Address and telephone fields are mostly optional but the more information you provide the more likely that we'll return correct matches for your business.

### HTTP Request

`POST https://tools.brightlocal.com/seo-tools/api/v4/social/profiles`

### Query Parameters

Parameter | Notes
--------- | -----
api-key | Required
batch-id | Required. Required batch v4 see /v4/batch.
website-url | Required. URL of the business website. Can be specified with or without http(s).
fetch-twitter | yes or no. Defaults to no. Fetch Twitter profile for the business if available.
fetch-facebook | yes or no. Defaults to no. Fetch Facebook profile for the business if available.
fetch-foursquare | yes or no. Defaults to no. Fetch Foursquare profile for the business if available.
business-names | Required. A JSON encoded string of business names, e.g. ["Delmonico's","Delmonico's Restaurant"]
street-address |
city | Required
state-code | Required (USA only). A valid two letter state code, e.g. CA.
telephone |
postcode | A valid ZIP or postal code.
country | Required. Valid 3 letter ISO code. e.g, USA, GBR, CAN.
follow-mode | This determines how our crawler extracts information from your website. We crawl your website to help us identify Twitter, Facebook and Foursquare profile information.<ol><li>Only follow links that lead to the same root domain (e.g. foo.brightlocal.com and bar.brightlocal.com).</li><li>Only follow links that lead to the same domain (e.g. www.brightlocal.com). This is the default.</li><li>Only follow links that lead to pages under the same path as that specified in website-url.</li></ul>
