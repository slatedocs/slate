# Errors

Error objects provide additional information about problems encountered while performing an operation. Error objects are returned as an array keyed by errors in the top level of a JSON document.

An error object MAY have the following members:


Name      | Type    | Description
--------- | ------- | -----------
id        | string  | A unique identifier for this particular occurrence of the problem
status    | string  | The HTTP status code applicable to this problem, expressed as a string value.
code      | string  | An application-specific error code, expressed as a string value.
title     | string  | A short, human-readable summary of the problem.
detail    | string  | A human-readable explanation specific to this occurrence of the problem.


Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request is invalid.
401 | Unauthorized -- Your API key is wrong.
404 | Not Found -- The specified resource could not be found.
405 | Method Not Allowed -- You tried to access a kitten with an invalid method.
406 | Not Acceptable -- You requested a format that isn't json.
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
