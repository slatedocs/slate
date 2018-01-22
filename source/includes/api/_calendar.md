## calendar object

calendar objects have the following attributes:

####start_date

The starting date for querying the calendar object.

####end_date

The ending date for querying the calendar object.

### calendar.summary

<script>tryit('calendar.summary')</script>

> Request example:

```JSON

{
    "include_timeOff": true, 
    end_date: "2017-02-28", 
    include_shifts: true, 
    tradeboard: {
        trade_complete: true
    }, 
    workgroups: [], 
    shifts: {
        coverage_type: [
            mine, 
            available, 
            confirmed
        ]
    }, 
    include_tradeboard: true, 
    start_date: "2017-02-01", 
    "timeOffRequests": {
        status: 0, 
        member: 1
    }
}
```

> Response example:

```JSON
{
    seconds: "0.391969", 
    jsonrpc: "2.0", 
    id: "3", 
    result: {
        summaries: [
            {
                available: true, 
                confirmed: true, 
                trades: false, 
                mine: true, 
                date: "2017-04-01", 
                "timeOffRequest": false
            }, 
            {
                available: true, 
                confirmed: true, 
                trades: true, 
                mine: true, 
                date: "2017-04-02", 
                "timeOffRequest": true
            }, 
            {
                available: true, 
                confirmed: true, 
                trades: true, 
                mine: true, 
                date: "2017-04-03", 
                "timeOffRequest": true
            }
        ]
    }
}
```

Get a summarized list of data for a given date range.

Required parameters:

####start_date

####end_date

Optional parameters:

####workgroups

Selects only the included workgroups, if and only if array contains elements

####include_shifts

Include shift information. If not defined, this property is set to true

####shifts

Additional configuration for what shift information to display. Options are as follows:

* coverage_type

* Coverage type array with possible values of mine, `available`, and `confirmed`

include_timeOff

Include time off information. If not defined, this property is set to true

timeOffRequests

Additional configuration for what time off information to display. Options are as follows:

* status

* Accepts any valid timeOffRequest status

* member

* Accepts a member ID
			####external_member

            Accepts an external member ID for this account, if this organization uses external IDs.
####include_tradeboard

Include tradeboard information. If not defined, this property is set to true

####tradeboard

Additional configuration for what tradeboard information to display. Options are as follows:

* trade_complete

* Accepts Tradeboard's trade_complete

Response: On success, an array of summaries will be returned.

On error, one of the following error codes may be returned:

####invalid_params

Start or end date are invalid or missing

