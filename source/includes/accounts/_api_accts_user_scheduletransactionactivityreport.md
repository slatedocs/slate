## ScheduleTransactionActivityReport

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Schedules a series of transaction activity reports for a list of accounts on a single Order Management System, starting at a specific date/time, and covering a specific time interval (90 days, for example). The reports run periodically until canceled.

Users with Trading permission can schedule transaction activity reports only for accounts with which they are associated; users with Operator permission can schedule transaction activity reports for any account.

Transaction Activity Reports are delivered in comma-separated-value (CSV) format. For specific CSV formatting information, see the APEX Extract CSV Data Dictionary, available from Cubobit.

### Request

```json
{
  "frequency":0,
  "accountIdList":[1],
  "omsId":1,
  "beginTime":"2018-08-10T04:00:00.000Z",
  "intervalDuration":10
}
```

| Key              | Value                                                        |
| ---------------- | ------------------------------------------------------------ |
| frequency        | **integer:** How often the report will run. Expressed as an integer that maps to this list:<br />0 OnDemand<br />1 Hourly<br />2 Daily<br />3 Weekly<br />4 Monthly<br />5 Annually |
| accountIdList    | **integer array.** Comma-separated integers; each element is an account ID whose transaction activity will be reported on. All accounts must be from the same OMS. |
| omsId            | **integer.** The Order Management System on which the accounts named in the list reside. |
| beginTime        | **string.** The time from which the transaction activities will be reported, in Microsoft Ticks format. |
| intervalDuration | **integer.** The length of time prior to the run time that the report covers, in days. For example, 90 means 90 days. Whenever the report runs, it looks back 90 days. |

### Response

```json
{
    "RequestingUser":1,
    "OMSId":1,
    "reportFlavor":"Transaction",
    "createTime":"2018-08-17T18:02:23Z",
    "initialRunTime":"2018-08-10T04:00:00Z",
    "intervalStartTime":"2018-08-10T04:00:00Z",
    "intervalEndTime":"2018-08-10T05:00:00Z",
    "RequestStatus":"Submitted",
    "ReportFrequency":"Hourly",
    "intervalDuration":36000000000,
    "RequestId":"I2nCtvyY8UuHsoSyrLe2QA==",
    "lastInstanceId":"AAAAAAAAAAAAAAAAAAAAAA==",
    "accountIds":[1]
}
```

Similar objects are returned for **Generate~Report** and **Schedule~Report** calls.

| Key               | Value                                                        |
| ----------------- | ------------------------------------------------------------ |
| RequestingUser    | **integer.** The User ID of the person requesting the transaction activity report. This confirms the ID of the authenticated user who made the request by returning it as part of the response. |
| OMSId             | **integer.** The ID of the Order Management System on which the transaction activity report will be run. |
| reportFlavor      | **string.** The type of report to be generated. One of:<br />TradeActivity<br />Transaction<br />Treasury<br /><br />The *reportFlavor* string confirms the nature of the call. |
| createTime        | **string.** The time and date on which the request for the transaction activity report was made, in Microsoft Ticks format. |
| initialRunTime    | **string.** The time and date at which the transaction activity report was first run, in Microsoft Ticks format. |
| intervalStartTime | **string.** The start of the period that the report will cover, in Microsoft Ticks format. |
| intervalEndTime   | **string.** The end of the period that the report will cover, in Microsoft Ticks format.|
| requestStatus     | **string.** The status of the request for the transaction activity report. Each request returns one of:<br />Submitted<br />Validating<br />Scheduled<br />InProgress<br />Completed<br />Aborting<br />Aborted<br />UserCancelled<br />SysRetired<br />UserCancelledPending |
| ReportFrequency   | **string.** When the report runs:<br />OnDemand<br />Hourly<br />Daily<br />Weekly<br />Monthly<br />Annually |
| intervalDuration  | **long integer.** The period that the report covers relative to the run date, in POSIX format. For example, say that you schedule a weekly report with a 90-day *intervalDuration* value. *intervalDuration* represents the backward-looking period of the report. When the report runs again in a week’s time, it again looks back 90 days — but now those 90 days are offset by a week from the first report. |
| RequestId         | **string.** The ID of the original request. Request IDs are long strings unique within the Order Management System. |
| lastInstanceId    | **string.** For scheduled reports, the report ID of the most recent previously run report. |
| accountIds        | **integer array.** A comma-delimited array of account IDs whose trades are reported in the trade activity report. |

