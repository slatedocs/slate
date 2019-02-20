## Retrieve Locations Maps

Retrieves a list of all locations maps associated with your company, with optional filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/locations_maps</api>
 
### Filter Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **ids**<br/>optional | _Int_ | Comma separated list of one or more locations map ids you'd like to filter on. Only locations maps with an id set to one of these values will be returned. If omitted, all locations maps matching other specified filters are returned. |
| **active**<br/>optional | _String_ | 'yes', 'no', or 'both'. Default is 'yes'. |
| **modified_before**<br/>optional | _String_ | Only locations maps modified before this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **modified_since**<br/>optional | _String_ | Only locations maps modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **per_page**<br/>optional | _Int_ | Represents how many results you'd like to retrieve per request (page). Default is 50. Max is 50. |
| **page**<br/>optional | _Int_ | Represents the page of results you'd like to retrieve. |
| **by_jobcode_assignment**<br/>optional | _Boolean_ | true or false. If specified only locations maps mapped to a jobcode the user is assigned to will be returned. |

