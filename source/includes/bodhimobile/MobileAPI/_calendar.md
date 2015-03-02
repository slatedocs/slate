## Calendar Module

This module provides the access to events in caledar. Developer can receive calendars and events list, create and delete event items.

### Tasks

  * `calendarItem` object
  * `recurrenceRuleItem` object
  * `eventAlarmItem` object
  * `eventItem` object
  * `getCalendars` function
  * `getCalendarById` function
  * `getEvents` function
  * `getEventById` function
  * `create` function
  * `delete` function

### Objects

#### calendarItem

##### Discussion

This object contains information about the calendar.

##### Keys

  * `id` required

A String value. A unique identifier for the calendar.

  * `title` required

A String value. The title of the calendar.

  * `type` optional

A String value. The type of the calendar. The value can be one of:

    * `local`

This calendar is sync'd from either Mobile Me or tethered.

    * `calDAV`

This calendar is from a CalDAV server.

    * `exchange`

This calendar comes from an Exchange server.

    * `subscription`

This is a locally subscribed calendar.

    * `birthday`

This is the built-in birthday calendar.

  * `allowsModifications` optional

A Boolean value. Represents whether developer can modify items in this calendar.

#### recurrenceRuleItem

##### Discussion

This object describes the recurrence pattern for a repeating event.

##### Keys

  * `frequency` required

A String value. The frequency of a recurrence. The value can be one of:

    * `daily`

Indicates a daily recurrence rule.

    * `weekly`

Indicates a weekly recurrence rule.

    * `monthly`

Indicates a monthly recurrence rule.

    * `yearly`

Indicates a yearly recurrence rule.

  * `interval` optional

An Integer value. Specifies how often the recurrence rule repeats over the unit of time described by the `frequency`. Not available on android.

  * `daysOfTheWeek` optional

An Array of Strings. Valid for all `frequency` types except `daily`.

Not available on android.

The array item can be one of:

    * `mo` \- Monday

    * `tu` \- Tuesday
    
    * `we` \- Wednesday
    
    * `th` \- Thursday
    
    * `fr` \- Friday
    
    * `sa` \- Saturday
    
    * `su` \- Sunday

  * `daysOfTheMonth` optional

An Array of Integers ([+/-] 1 to 31). Valid only for `monthly` `frequency`.

Not available on android.

  * `monthsOfTheYear` optional

An Array of Integers (1 to 12). Valid only for `yearly` `frequency`.

Not available on android.

  * `weeksOfTheYear` optional

An Array of Integers ([+/1] 1 to 53). Valid only for `yearly` `frequency`.

Not available on android.

  * `daysOfTheYear` optional

An Array of Integers ([+/1] 1 to 366). Valid only for `yearly` `frequency`.

Not available on android.

  * `endDate` optional

A Date value. Recurrence end with a specific end date.

  * `occurrenceCount` optional

An Interger value. Recurrence end with a maximum occurrence count.

Not available on android.

#### eventAlarmItem

##### Discussion

This object represents alarms on an eventItem. An alarm can be relative (e.g.
15 mins before) or absolute (specific time).

#### Keys

  * `date`optional

A Date value. The date the alarm should fire. Not available on android.

  * `offset`optional

An Integer value. The offset from the event start that the alarm should fire.
In milliseconds.

### eventItem

##### Discussion

This object contains information about the calendar's event item.

##### Keys

  * `id` required

A String value. A unique identifier for the event.

  * `title` optional

A String value. The title for the event.

  * `location` optional

A String value. The location associated with the event.

  * `notes` optional

A String value. The notes associated with the event.

  * `url` optional

A String value. The URL for the event.

  * `alarm` optional

An eventAlarmItem object. The alarm associated with the event.

  * `calendarId` optional

A String value. The unique identifier for the calendar for the event.

Developer can receive calendar info with `getCalendarById` method.

  * `startDate` required

A Date value. The start date for the event.

  * `endDate` required

A Date value. The end date for the event.

  * `availability` optional

A String value. The event’s availability setting for scheduling purposes.
The value can be one of:

    * `notSupported`

Availability settings are not supported by the event’s calendar.

    * `busy`

The event has a busy availability setting.

    * `free`

The event has a free availability setting.

    * `tentative`

The event has a tentative availability setting.

    * `unavailable`

The event has an unavailable availability setting.

  * `status` optional

A String value. The event’s status. The value can be one of:

    * `none`

The event has no status.

    * `confirmed`

The event is confirmed.

    * `tentative`

The event is tentative.

    * `canceled`

The event is canceled.

  * `recurrenceRules` optional

Array of `recurrenceRuleItem` objects. The recurrence rules for the event.

### Functions

#### getCalendars

```javascript
calendar.getCalendars( function(info) {  
    alert("Calendars count: "+info.calendars.length);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`calendar.getCalendars( successCallback, errorCallback )`

##### Discussion

Returns a list of the calendars.

##### Arguments

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `calendars` \- The list of `calendarItem` objects. (Array of Object)

  * `errorCallback`optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getCalendarById

```javascript
calendar.getCalendarById( "2e2b9f86-4a27-43d4-8f1e-c1566244bf3b",
function(info) {  
    alert("Found calendars count: "+info.calendars.length);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`calendar.getCalendarById( calendarId, successCallback, errorCallback )`

##### Discussion

Returns the calendar with specified id.

##### Arguments

  * `calendarId` required

A String value. The identifier of the calendar.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `calendars` \- The list of `calendarItem` objects with one element. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getEvents

```javascript
calendar.getEvents( {"startDate":aStartDate, "endDate":anEndDate },
function(info) {  
    alert("Found "+info.events.length+" events.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`calendar.getEvents( options, successCallback, errorCallback )`

##### Discussion

Returns a list of events for specified range of dates.

##### Arguments

  * `options` required

Object with key-value. Supported keys:

    * `startDate` required

A Date value. The start date for the search range.

    * `endDate` required

A Date value. The end date for the search range.

    * `calendars` optional

An Array of Strings. The list with calendar's identifiers.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `events` \- The list of `eventItem` objects. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### getEventById

```javascript
calendar.getEventById( "18ab2e21-333b-48d1-b010-6ade00639451",
function(info) {  
    alert("Found "+info.events.length+" events.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`calendar.getEventById( eventId, successCallback, errorCallback )`

##### Discussion

Returns the event with specified id.

##### Arguments

  * `eventId`required

A String value. The identifier of the event.

  * `succesCallback`optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `events` \- The list of `eventItem` objects with one element. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### create

```javascript
var event = {  
  title: "Test event",  
  location: "Test location",  
  notes: "Some notes",  
  url: "http://www.test.com",  
  alarm: {  
    offset: -600000 // 10 minutes  
  },
  startDate: aStartDate,  
  endDate: anEndDate,  
  recurrenceRules: [{  
    frequency: "weekly",  
    interval: 1,  
    daysOfTheWeek: ["mo","we","fr"]
  }]
};  

calendar.create( event, function(info) {  
    alert("Event added with id: "+info.events[0].id);  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`calendar.create( event, successCallback, errorCallback )`

##### Discussion

Adds new event to calendar.

##### Arguments

  * `event` required

eventItem object. Contains information about new event item.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is object which contains:

    * `events` \- The list of `eventItem` objects with one element. (Array of Object)

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object

#### delete

```javascript
var event = { id: "18ab2e21-333b-48d1-b010-6ade00639451" }; 

calendar.delete( event, function(info) {  
    alert("Event removed.");  
}, function (error) {  
    alert("code: " + error.code + "\nmessage: " + error.message);  
});
```

`calendar.delete( event, successCallback, errorCallback )`

##### Discussion

Deletes exist event item from calendar.

##### Arguments

  * `event` required

An `eventItem` object. Contains information for the event. Must contain `id`. Other fields ignored.

  * `succesCallback` optional

Success callback. Called when function finished without errors

Callback parameter is always **null**

  * `errorCallback` optional

Error Callback. Called when function return error.

##### Return Value

  * [RBCPromise](#kernel-promise) object