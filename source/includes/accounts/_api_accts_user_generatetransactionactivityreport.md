## GenerateTransactionActivityReport

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Generates an immediate report on account transaction activity for a list of accounts under a single Order Management System during a specified time. A user with Trading permission can only generate reports for accounts with which he is associated; a user with Operator permission can generate reports for accounts associated with others. There can be multiple users associated with an account. 

The Transaction Activity Report is delivered as a comma-separated (CSV) file. For specific CSV formatting information, see the APEX Extract CSV Data Dictionary, available from Cubobit.

### Request

```json
{
	"accountIdList": [
		0
	],
	"omsId": 0,
	"startTime": "0001-01-01T05:00:00Z",
	"endTime": "0001-01-01T05:00:00Z",
}
```

| Key           | Value                                                        |
| ------------- | ------------------------------------------------------------ |
| accountIdList | **integer array.** A comma-delimited array of one ore more account IDs, each valid on the same Order Management System on which the user is authenticated. |
| omsId         | **integer.** The ID of the Order Management System on which the array of account IDs exist. |
| startTime     | **string.** *startTime* identifies the time and date for the beginning of the transaction activity report, in ISO 8601 format. |
| endTime       | **string.**  *endTime* identifies the time and date for the end of the transaction activity report, in ISO 8601 format. |

### Response

```json
{ 
  "RequestingUser":1,
  "OMSId":1,
  "reportFlavor": {
		 "Options":  [
			"TradeActivity",
			"Transaction",
			"Treasury"
		] 
	},
  "createTime":"2018-08-17T15:46:07Z",
  "initialRunTime":"2018-08-17T15:46:07Z",
  "intervalStartTime":"2019-04-10T04:00:00Z",
  "intervalEndTime":"2020-04-10T04:00:00Z",
  "RequestStatus": {
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
  "ReportFrequency": {
		 "Options":  [
			"onDemand",
			"Hourly",
			"Daily",
			"Weekly",
			"Monthly",
			"Annually"
		] 
	},
  "intervalDuration":316224000000000,
  "RequestId":"+QgyhnEFqEazyZ46Q902MA==",
  "lastInstanceId":"AAAAAAAAAAAAAAAAAAAAAA==",
  "accountIds":[1]
}
```

Similar objects are returned for **Generate~Report** and **Schedule~Report** calls. As a result, for an on-demand **Generate~Repor**t call, some string-value pairs such as *initialRunTime* may return the current time and *ReportFrequency* will always return *OnDemand* because the report is only generated once and on demand.

| Key               | Value                                                        |
| ----------------- | ------------------------------------------------------------ |
| RequestingUser    | **integer.** The User ID of the person requesting the transaction activity report. This confirms the ID of the authenticated user who made the request by returning it as part of the response. |
| OMSId             | **integer.** The ID of the Order Management System on which the transaction activity report will be run. |
| reportFlavor      | **string.** The type of report to be generated. One of:<br />TradeActivity<br />Transaction<br />Treasury<br /><br />The *reportFlavor* string confirms the nature of the call. |
| createTime        | **string.** The time and date on which the request for the trade activity report was made. |
| initialRunTime    | **string.**  The time and date at which the trade activity report was first run. Returns the current time for a **Generate~Report** call. |
| intervalStartTime | **string.** The start of the period that the report will cover. |
| intervalEndTime   | **string.**  The end of the period that the report will cover. |
| RequestStatus     | **string.** The status of the request for the trade activity report. A **Generate~Report** request will always return *Submitted*. Each request returns one of:<br />Submitted<br />Validating<br />Scheduled<br />InProgress<br />Completed<br />Aborting<br />Aborted<br />UserCancelled<br />SysRetired<br />UserCancelled<br />Pending |
| ReportFrequency   | **string.** When the report runs. For a **Generate~Report** call, this is always *OnDemand*.<br />OnDemand<br />Hourly<br />Daily<br />Weekly<br />Monthly<br />Annually |
| intervalDuration  | **long integer.** The period that the report covers relative to the run date. The **Generate~Report** call requires a start time and an end time. The Cubobit software calculates the difference between them as *intervalDuration*. <br /><br />For example, say that you specify a 90-day start-date-to-end-date window for a report. The *intervalDuration* value returns a value equivalent to 90 days. If you have called **Generate~Report**, that value simply confirms the length of time that the on-demand report covers. |
| RequestId         | **string.** The ID of the original request. Request IDs are long strings unique within the Order Management System. |
| lastInstanceId    | **string.** For scheduled reports, the report ID of the most recent previously run report. Will be *null* for a **Generate~Report** call, because generated reports are on-demand. |
| accountIds        | **integer array.** A comma-delimited array of account IDs whose trades are reported in the trade activity report. |


