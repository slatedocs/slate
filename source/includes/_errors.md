# Errors

<aside class="notice">This error section is stored in a separate file in `includes/_errors.md`. Slate allows you to optionally separate out your docs into many files...just save them to the `includes` folder and add them to the top of your `index.md`'s frontmatter. Files are included in the order listed.</aside>

The Kittn API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your http request was bad
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The http request is hidden for administrators only
404 | Not Found -- The specified http request could not be found
405 | Method Not Allowed -- You tried to access a http request with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
410 | Gone -- The http request has been removed from our servers
429 | Too Many Requests -- You're requesting too many kittens! Slown down!
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.