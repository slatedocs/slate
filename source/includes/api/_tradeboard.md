## tradeboard object

### tradeboard: basic attributes

####id

A unique identifier for this tradeboard.

####shift

shift identifier for this trade.

####traded_by

account identifier originally assigned this shift.

####traded_to

account identifier that accepted this trade, or null if the trade is not completed.

####trade_complete

Boolean.

####status

####pending

Pending - Trade is awaiting permission to be offered

####offered

Offered - Trade is offered

####unapproved

Unapproved - Trade is awaiting approval of completion

####complete

Complete - Trade is completed

### tradeboard: extended attributes

####notes

####trade_completed

time at which this trade was completed.

### tradeboard.accept

> Request example:

```JSON
{
   "id" : 2753501
}
```

> Response example:

```JSON
{
   "seconds" : "0.188065",
   "jsonrpc" : "2.0",
   "id" : "45",
   "result" : {}
}
```

<span class="tryit" id="tradeboard-accept-tryit"></span>
Takes a shift offered on the tradeboard.

Required parameter: `id`.

Response: On success, empty results will be returned.

### tradeboard.create

> Request example:

```JSON
{
   "shift" : 12345678
}
```

> Response example:

```JSON
{
   "seconds" : "0.207354",
   "jsonrpc" : "2.0",
   "id" : "59",
   "result" : {
      "id" : 92873
   }
}
```

<span class="tryit" id="tradeboard-create-tryit"></span>
Creates a new tradeboard posting.

Required Parameter:

####shift

shift identifier for this trade.

Optional Parameters:

####notes

Response: On success, an `id` attribute will provide the identifier for the new tradeboard posting.

### tradeboard.delete

> Request example:

```JSON
{
   "id" : "2753"
}
```

> Response example:

```JSON
{
   "seconds" : "0.058344",
   "jsonrpc" : "2.0",
   "id" : "67",
   "result" : {}
}
```

<span class="tryit" id="tradeboard-delete-tryit"></span>
Deletes a tradeboard posting.

Required parameter: `id`.

Response: On success, empty results will be returned.

### tradeboard.get

> Request example:

```JSON
{
   "id" : "123456",
   "extended" : true
}
```

> Response example:

```JSON
{
   "seconds" : "0.128193",
   "jsonrpc" : "2.0",
   "id" : "15",
   "result" : {
      "referenced_objects" : {
         "workgroup" : [
            {
               "name" : "Help Desk",
               "id" : "412345"
            }
         ],
         "department" : [
            {
               "name" : "Distribution",
               "label" : "Distribution",
               "id" : "9942"
            }
         ],
         "timezone" : [
            {
               "name" : "Pacific Time (US/Can) (GMT-08:00)",
               "olson_timezone" : "America/Los_Angeles"
            }
         ],
         "location" : [
            {
               "name" : "Training / Meetings",
               "id" : "92580"
            }
         ],
         "shift" : [
            {
               "display_time" : "1pm to 2pm",
               "department" : "9942",
               "reference_id" : "",
               "linkurl" : "",
               "work_status_type" : "5",
               "start_date" : "2014-01-29T13:00:00",
               "signup_list" : false,
               "id" : "56789012",
               "count" : "1",
               "timezone" : "Pacific Time (US/Can) (GMT-08:00)",
               "display_date" : "January 29, 2014",
               "location" : "92580",
               "subject" : "",
               "covering_member" : "47",
               "urgent" : false,
               "zipcode" : "94132",
               "qty" : "1",
               "details" : "details!",
               "workgroup" : "412345",
               "published" : true,
               "no_credit" : false,
               "end_date" : "2014-01-29T14:00:00",
               "covered" : true,
               "no_pick_up" : false,
               "no_trade" : false,
               "room_floor" : "room/floor",
               "linktitle" : ""
            }
         ],
         "account" : [
            {
               "id" : "39",
               "screen_name" : null,
               "last_name" : "Foster",
               "first_name" : "Joanie"
            },
            {
               "seniority_order" : "19999-12-31 23:59:59",
               "id" : "47",
               "profile_type" : "3",
               "screen_name" : "Stan Wilson",
               "last_name" : "Wilson",
               "first_name" : "Stan"
            }
         ],
         "workStatusType" : [
            {
               "name" : "Salary/Exempt",
               "id" : "5"
            }
         ]
      },
      "tradeboard" : {
         "trade_completed" : "2014-01-21T20:40:38Z",
         "shift" : "56789012",
         "notes" : "Need to see the dentist; please take this trade",
         "id" : "123456",
         "traded_to" : "47",
         "traded_by" : "39",
         "trade_complete" : true
      }
   }
}
```

<span class="tryit" id="tradeboard-get-tryit"></span>
Returns information about a tradeboard posting.

Parameters:

####id

Required. id of the tradeboard posting for which to return information.

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard posting.

The response results `tradeboard` attribute will be the selected tradeboard object.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or in its associated shift, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

**NOTE:** external_id will also be returned in the results if external ids are enabled for the site.

####client

id and name attributes are provided.

####department

id and name attributes are provided.

####location

id and name attributes are provided.

####role

id and name attributes are provided.

####shift

All basic shift attributes will be provided. If the `extended` parameter is true, extended shift attributes will also be provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####timezone

name and olson_timezone attributes are provided.

workStatusType

id and name attributes are provided.

####workgroup

id and name attributes are provided.

### tradeboard.list

> Request example:

```JSON
{
   "select" : {
      "end_date" : "2014-07-18",
      "start_date" : "2014-07-12"
   }
}
```

> Response example:

```JSON
{
   "seconds" : "0.087686",
   "jsonrpc" : "2.0",
   "id" : "3",
   "result" : {
      "referenced_objects" : {
         "workgroup" : [
            {
               "name" : "Floor Staff",
               "id" : "226093"
            }
         ],
         "account" : [
            {
               "id" : "20",
               "screen_name" : "Johnny Smith",
               "last_name" : "John",
               "first_name" : "Smith"
            }
         ],
         "shift" : [
            {
               "workgroup" : "226093",
               "display_time" : "10am to 11am",
               "display_date" : "July 13, 2014",
               "id" : "25687871"
            }
         ]
      },
      "tradeboard" : [
         {
            "shift" : "25687871",
            "id" : "1123",
            "trade_complete" : false,
            "traded_by" : "20",
            "traded_to" : null
         }
      ],
      "count" : "1",
      "page" : {
         "this" : {
            "batch" : 10,
            "start" : 1
         }
      }
   }
}
```

<span class="tryit" id="tradeboard-list-tryit"></span>
Returns information about tradeboard postings. Uses [pagination](#pagination). Uses select criteria.

Optional parameters:

####extended

Boolean; if specified and true, the results returned will include an extended set of attributes; otherwise a basic set of attributes will be returned for each tradeboard posting.

####referenced_objects

Boolean, defaults to true. Indicates that, in addition to the tradeboard attribute, the results should include a referenced_objects attribute giving information about objects referred to by the returned tradeboard postings.

####select

An object specifying selection criteria for this request. Note that start_date and end_date will have default values if not specified. The available criteria include:

####start_date

The earliest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format (e.g. "2009-04-01"). Defaults to today.

####end_date

The latest date of coverage to select, in [RFC 3339](http://www.ietf.org/rfc/rfc3339.txt) full date format. Defaults to 14 days after the start_date.

####trade_complete

If specified, true requests only completed trades, false requests only uncompleted trades.

The response results `tradeboard` attribute will be an array of the current page of selected tradeboard postings. Each element of the array will be a tradeboard object containing basic or basic and extended tradeboard fields.

If requested, the response results `referenced_objects` attribute will be an object containing one or more object type names as attributes; for each object type the value will be an array of those instances of that type of object which are referred to in the `tradeboard` results or their associated shifts, with only selected minimal attributes provided:

####account

id, first_name, last_name, and screen_name attributes are provided.

**NOTE:** external_id will also be returned in the results if external ids are enabled for the site.

####shift

id and workgroup attributes are provided. Additionally, display_date and display_time attributes contain formatted strings describing the shift's start and end time.

####workgroup

id and name attributes are provided.

### tradeboard.update

> Request example:

```JSON
{
   "notes" : "I'd like to trade for a shift the following Wednesday",
   "id" : 2345
}
```

> Response example:

```JSON
{
   "seconds" : "0.178901",
   "jsonrpc" : "2.0",
   "id" : "43",
   "result" : {}
}
```

<span class="tryit" id="tradeboard-update-tryit"></span>
Updates a tradeboard posting's notes.

Required parameter: `id`.

Optional parameter: `notes`.

Response: On success, empty results will be returned.

