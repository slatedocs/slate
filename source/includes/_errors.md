# Errors

The EventHero Registrations API may return the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Improperly formatted request, such as missing required fields
401 | Unauthorized -- Your API access key is invalid. See []
415 | Not supported media type. See [Media Types](#media-types)
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
