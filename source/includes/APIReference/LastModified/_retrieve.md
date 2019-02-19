## Retrieve Last Modified Timestamps

Retrieves a list of `last_modified` timestamps associated with each requested API endpoint. This is especially useful because you can see, with just one request, what endpoints may need to be queried to get changes since the last time you connected to the API.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/last_modified_timestamps</api>

### Parameters
|                |             |             |
| -------------: | :---------: | ----------- |
| **endpoints**<br/>optional | _String_ | Comma separated list of one or more endpoints. You can specify any endpoint - see each respective endpoint for the endpoint 'name' that you can use in this list. E.g. if you wanted to only check for changed timesheets and jobcodes, you'd specify _'timesheets,timesheets_deleted,jobcodes'_ as the value of this filter.<br/><br/>If a list of endpoints is not specified, then the following list is returned by default.:<br/><ul><li>`current_user`</li><li>`customfields`</li><li>`customfielditems`</li><li>`effective_settings`</li><li>`geolocations`</li><li>`jobcodes`</li><li>`jobcode_assignments`</li><li>`timesheets`</li><li>`timesheets_deleted`</li><li>`users`</li><li>`reminders`</li><li>`locations`</li><li>`geofence_configs`</li></ul> |