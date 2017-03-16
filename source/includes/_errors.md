# Response Codes

The Intelex REST API uses the response codes:

Response Code | Meaning
---------- | -------
200 | Success -- Enjoy your data!
201 | Created -- We created the record!
204 | No Content -- Your request was successful, but we don't have anything more to tell you.
400 | Bad Request -- Something is wrong with your request
401 | Unauthorized -- Your credentials are wrong
403 | Forbidden -- You do not have permission to access the resource
404 | Not Found -- The object or navigation property you are trying to access doesn't exist
405 | Method Not Allowed -- We won't let you do that
500 | Internal Server Error -- We had a problem with our server. Try again later
501 | Not Implemented -- What you are trying to do doesn't work...yet.

