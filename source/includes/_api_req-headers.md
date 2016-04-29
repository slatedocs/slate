# Request Headers

| Header | Allowed Values | Description | Example |
| --- | --- | --- | --- |
| `**Accept**` | `**application/json**` (for .json requests) `**application/xml**` (for .xml requests) | The MIME type for the format you want to receive a response in.|`**application/xml**` |
| `**Authorization**`| `**Basic**`| The user credentials for accessing the API | `**Basic YWRtaW46cGFzc3dvcmQ=**` |
| `**Content-Type**` | `**application/json**` (for JSON requests) `**application/xml**` (for XML requests) | The MIME type of the request body. Use to validate and parse the request to the API. | `**application/json**` |
| `**User-Agent**` | String | While it is not required, we ask that you specify a user agent which identifies your integration/client with your requests. |
| `**X-Auth-Client**` | String | Client ID of the requesting app |
| `**X-Auth-Token**` | String | Access token authorizing the app to access resources on behalf of a user |

## Deprecated Headers

The following headers are deprecated and will eventually be removed from the API.

| Header | Description | Use Instead |
| --- | --- | --- |
| `**If-Modified-Since**` | Uses an [RFC 2822](http://tools.ietf.org/html/rfc2822#section-3.3) date. If supplied, then only resources modified since the specified date will be returned. If there are no modified objects, then a `**304 Not Modified**` response will be sent. Please refer to the individual resource pages for support for this header. | Use **min_date_modified** and **max_date_modified** query parameters on resources that support them. |
