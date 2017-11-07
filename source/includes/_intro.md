# Introduction 

This is the Kudos Client API specification.  The Client API is organized around REST. Our API has predictable,
resource-oriented URLs, and uses HTTP response codes to indicate API errors. We use built-in HTTP features, like
HTTP authentication and HTTP verbs, which are understood by off-the-shelf HTTP clients. JSON is returned by all API
responses, including errors.
 
### Timestamps
All timestamps are returned in ISO 8601 format:
```
YYYY-MM-DDTHH:MM:SSZ
```
### Rate limiting
If you're sending too many requests too quickly, we'll send back a 429 error code (Too Many Requests). You are
limited to 1000 requests per hour per token overall.
 

**Version:** 1.0.0 

Version information is part of the URL

**HTTP Request**
 
`GET /v1/request` 

