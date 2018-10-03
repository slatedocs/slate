## ScheduleTradeActivityReport

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Schedules a series of trade activity reports to run for a list of accounts on a single Order Management System, starting at a specific date/time, and covering a specific time duration. The reports will run periodically until canceled.

Users with Trading permission can schedule reports for accounts with which they are associated; users with Operator permissions can schedule reports for any accounts.

Trade Activity Reports are delivered in comma-separated-value (CSV) format. For specific CSV formatting information, see the APEX Extract CSV Data Dictionary, available from Cubobit.

### Request

```json
{
  "frequency": {
		 "Options": [
            "OnDemand", // 0 
			"Hourly", // 1
			"Daily", // 2
			"Weekly", // 3
			"Monthly", // 4
			"Annual" // 5
		] 
	},
  "accountIdList":[1],
  "omsId":1,
  "beginTime":"2018-08-10T04:00:00.000Z",
  "intervalDuration":10
}
```

| Key              | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| frequency        | **integer.** How often the report will run. One of:<br />0 OnDemand<br />1 Hourly<br />2 Daily<br />3 Weekly<br />4 Monthly<br />5 Annually |
| accountIdList    | **integer array.** Comma-separated integers; each element an account ID on the Order Management System whose trade activity will be reported on. All accounts must be from the same OMS. |
| omsId            | **integer.** The ID of the Order Management System on which the accounts named in the list reside. |
| beginTime        | **string.** The time at which the periodic reports begin; the day and time when you want reporting to start, in Microsoft Ticks format. |
| intervalDuration | **integer.** The length of time prior to the run time that the report covers, in days. For example, 90 for 90 days. Whatever the report's frequency, it looks back 90 days. A monthly report, for example, would look back 90 days; an annual report would look back 90 days. |

### Response

```json
{
	"RequestingUser":1,
	"OMSId":1,
	"reportFlavor": { // enumerated string
		 "Options": [
			"TradeActivity",
			"Transaction",
			"Treasury"
		] 
	},
	"createTime":"2018-08-17T17:57:51Z",
	"initialRunTime":"2018-08-10T04:00:00Z",
	"intervalStartTime":"2018-08-10T04:00:00Z",
	"intervalEndTime":"2018-08-10T05:00:00Z",
	"RequestStatus": { // enumerated string
		 "Options": [
			"Submitted",
			"Validating",
			"Scheduled",
			"InProgress",
			"Completed",
			"Aborting",
			"Aborted",
			"UserCancelled",
			"SysRetired",
			"UserCancelledPending"
		] 
	},
	"ReportFrequency": { // enumerated string
		 "Options": [
			"onDemand",
			"Hourly",
			"Daily",
			"Weekly",
			"Monthly",
			"Annually"
		] 
	},
	"intervalDuration":36000000000,
	"RequestId":"mGzjUfylGEmqgJIxu651aQ==",
	"lastInstanceId":"AAAAAAAAAAAAAAAAAAAAAA==",
	"accountIds":[1]
}

```
The response returns an object confirming the settings in the call.


| Key               | Value                                                        |
| ----------------- | ------------------------------------------------------------ |
| RequestingUser    | **integer.** The User ID of the person requesting the trade activity report. This confirms the ID of the authenticated user who made the request by returning it as part of the response. |
| OMSId             | **integer.** The ID of the Order Management System on which the trade activity report will be run. |
| reportFlavor      | **enumerated string.** The type of report to be generated. One of:<br />TradeActivity<br />Transaction<br />Treasury<br /><br />The *reportFlavor* string confirms the nature of the call. |
| createTime        | **string.** The time and date on which the request for the trade activity report was made, in Microsoft Ticks format. |
| initialRunTime    | **string.**  The time and date at which the trade activity report was first run, in Microsoft Ticks format. |
| intervalStartTime | **string.** The start of the period that the report will cover, in Microsoft Ticks format. |
| intervalEndTime   | **string.** The end of the period that the report will cover, in Microsoft Ticks format. |
| RequestStatus     | **enumerated string.** The status of the request for the trade activity report. Each request returns one of:<br />Submitted<br />Validating<br />Scheduled<br />InProgress<br />Completed<br />Aborting<br />Aborted<br />UserCancelled<br />SysRetired<br />UserCancelledPending |
| ReportFrequency   | **enumerated string.** When the report runs:<br />OnDemand<br />Hourly<br />Daily<br />Weekly<br />Monthly<br />Annually |
| intervalDuration  | **long integer.** The period that the report covers relative to the run date, in POSIX format. The call specifies a start time and an *intervalDuration*.<br /><br />For example, say that you schedule a weekly report with a 90-day *intervalDuration* value. *intervalDuration* represents the backward-looking period of the report. When the report runs again in a week’s time, it again looks back 90 days — but now those 90 days are offset by a week from the first report. |
| RequestId         | **string.** The ID of the original request. Request IDs are long strings unique within the Order Management System. |
| lastInstanceId    | **string.** For scheduled reports, the report ID of the most recent previously run report. |
| accountIds        | **integer array.** A comma-delimited array of account IDs whose trades are reported in the trade activity report. |




