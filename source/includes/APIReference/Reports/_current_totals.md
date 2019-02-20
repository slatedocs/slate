## Retrieve Current Totals Report

Retrieves a snapshot report for the current totals (shift and day) along with additional information provided for those who are currently on the clock.

### HTTP Request

<img src="../../images/post.png" alt="post"/><api>https://rest.tsheets.com/api/v1/reports/current_totals</api>

### Understanding the Output
The best way to understand how the output is laid out is to look at some sample output - with comments out to the side explaining things. 

_Note: When a user is off the clock, both the `timesheet_id` and `jobcode_id` attributes will return as null and shift seconds will be 0._