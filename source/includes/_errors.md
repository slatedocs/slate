# Errors

Space Invoices API uses the following error codes:

Code | Meaning
----------: | -------
400 | Bad Request _Your request is invalid._
401 | Unauthorized _Either you are not allowed to access the route or are not authorised for the resource with the given ID._
404 | Not Found _The specified route could not be found._
422 | Unprecessable entity _The provided data is invalid, usualy that means a validation error. Details about the error are visible in the server response body._
500 | Internal Server Error _We had a problem with our server. Try again later._
503 | Service Unavailable _We're temporarily offline for maintenance. Please try again later._
