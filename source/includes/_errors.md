# Errors

Rubberstamp uses conventional HTTP response codes to indicate the success or
failure of an API request.

| Error Code         | Meaning       | Description                                                  |
| ----------         | -------       | ---------------                                              |
| 400                | Bad Request   | The request was unacceptable                                 |
| 401                | Unauthorized  | No valid authentication token provided                       |
| 403                | Forbidden     | The requested resource is hidden for admin only              |
| 404                | Not Found     | The specified resource could not be found                    |
| 500, 502, 503, 504 | Server Errors | Something went wrong on Rubberstamp's end.  (these are rare) |
