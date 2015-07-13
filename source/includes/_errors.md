# Errors

The SafetyCulture API uses the following error codes:

Error Code | Meaning               | Description
---------- | -------               | -----------
       400 | Bad Request           | The request is incorrect
       401 | Unauthorized          | The authorisation token is missing or incorrect
       403 | Forbidden             | The request is not available to the user 
       404 | Not Found             | The specific audit or other URI is not found
       405 | Method Not Allowed    | The HTTP method used is not valid for that URI
       406 | Not Acceptable        | You requested a format that isn't json
       500 | Internal Server Error | A problem occured in the SafetyCulture servers, please contact support.
