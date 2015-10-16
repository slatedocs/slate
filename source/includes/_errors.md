# Errors

<aside class="success">This guide is in no way complete. If you happen upon errors that are not listed here, please let us know so we can help make the guide and the Sendle API better!</aside>

## Error Codes

The Sendle API uses the following error codes:

Error Code | Meaning
---------- | -------
200 | OK -- A successful response (for reference - not an error)
400 | Bad Request -- The data provided by the client (typically in the body) is invalid or incorrectly structured.
401 | Unauthorized -- The authorisation details are invalid. Either the Sendle ID, the API key (or both) are incorrect and should be fixed.
402 | Payment Required -- The client does not yet have a payment-method set up on their account, and cannot create orders.
404 | Not Found -- The requested resource/URI was not found.
422 | Unprocessable Entity -- The server was unable to complete the request due to the data itself. For example, validations within the data may fail, or an upstream request may not be able to be fulfilled with the data. This is different to `400 Bad Request` as `422 Unprocessable Entity` suggests that the request sent by the client was structurally valid, and the request was attempted.
500 | Internal Server Error -- An error occurred within the system itself. This may be a coding error that caused the system to fail. The development team will have been notified of this failure.
503 | Service Unavailable -- An error occurred within the system due to an upstream error or failure. For example, a courier API may be unavailable or failing to respond.  The development team will have been notified of this failure.
