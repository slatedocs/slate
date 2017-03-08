# Errors

<aside class="notice">This error section is stored in a separate file in `includes/_errors.md`. Slate allows you to optionally separate out your docs into many files...just save them to the `includes` folder and add them to the top of your `index.md`'s frontmatter. Files are included in the order listed.</aside>

The API uses the following error codes:


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The resource requested is hidden for administrators only
404 | Not Found -- The specified resource could not be found - please check your project_id
405 | Method Not Allowed -- You tried to access a resource with an invalid method
406 | Not Acceptable -- You requested a format that isn't json
422 | Unprocessable Entity - Your parameter values are wrong or missing.
429 | Too Many Requests -- You're requesting too many resources! Slow down!
500 | Internal Server Error -- General server error - there was a problem with the request.
503 | Service Unavailable -- We're temporarially offline for maintenance. Please try again later.
