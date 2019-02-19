## Retrieve Reminders

Retrieves a list of reminders associated with your employees or company, with filters to narrow down the results.

### HTTP Request

<img src="../../images/get.png" alt="get"/><api>https://rest.tsheets.com/api/v1/reminders</api>

### Parameters

|                |             |             |
| -------------: | :---------: | ----------- |
| **user_ids**<br/>required | _Int_ | Comma-separated list of one or more user ids to retrieve reminders for. Include a `user_id` of _0_ to retrieve company-wide reminders. |
| **reminder_types**<br/>optional | _String_ | Comma-separated list of one or more reminder types to retrieve reminders for. Current legal values are 'clock-in' and 'clock-out'. For example, specify 'clock-in,clock-out' to retrieve both clock-in and clock-out reminders. |
| **modified_since**<br/>optional | _String_ | Only reminders modified since this date/time will be returned, in ISO 8601 format (YYYY-MM-DDThh:mm:ss?hh:mm) |
| **supplemental_data**<br/>optional | _String_ | 'yes' or 'no'. Default is 'yes'. Indicates whether supplemental data should be returned. |
