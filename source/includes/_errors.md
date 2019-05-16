# Errors

>Errors are structured in the following format:

```json
{
  "errors": [
    {
      "error_code": "installments_required",
      "error_message": "Installments value must be at least 1."
    },
    {
      "error_code": "process_date_timing",
      "error_message": "Process date must be at least 2 business days in the future."
    }
  ]
}
```

### ERROR FORMAT

Errors are returned from Rotessa in the form of a list of values in the `errors` key of response. Each error has an `error_code` and `error_message`, corresponding to the type of error that has occurred.

### HTTP RESPONSE CODES

The Rotessa API uses the following http error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request – Your request includes invalid parameters
401 | Unauthorized – Your API key is not valid or is missing
404 | Not Found – The specified resource could not be found
406 | Not Acceptable – You requested a format that isn’t json
422 | Unprocessable Entity – Your request results in invalid data
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarily offline for maintenance. Please try again later.
