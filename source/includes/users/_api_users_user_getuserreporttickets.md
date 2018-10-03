## GetUserReportTickets

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Returns an array of user report tickets for a specific user ID. A user report ticket identifies a report requested or subscribed to by a user. Reports can run once or periodically.

### Request

```json
{
  "UserId":  1 
}
```

| Key    | Value                                                        |
| ------ | ------------------------------------------------------------ |
| UserId | **integer**. The ID of the user whose user report tickets will be returned. |

### Response

The response returns an array of tickets, each ticket representing a report.

```json
[
  {
    {
      "RequestingUser": 0,
      "OMSId": 0,
      "reportFlavor": {
        "Options": [
              "TradeActivity",
              "Transaction",
              "Treasury"
         ]
       },
       "createTime": "0001-01-01T05:00:00Z",
       "initialRunTime": "0001-01-01T05:00:00Z",
       "intervalStartTime": "0001-01-01T05:00:00Z",
       "intervalEndTime": "0001-01-01T05:00:00Z",
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
         "Options": [
           "onDemand",
           "Hourly",
           "Daily",
           "Weekly",
           "Monthly",
           "Annually"
          ]
        }
       "intervalDuration": 0,
       "RequestId": "I2nCtvyY8UuHsoSyrLe2QA==",
       "lastInstanceId": "AAAAAAAAAAAAAAAAAAAAAA==",
       "accountIds": [
         1
        ],
      },
    }
  ]
```

| Key               | Value                                                        |
| ----------------- | ------------------------------------------------------------ |
| RequestingUser    | **integer.** The User ID of the person requesting the report. |
| OMSId             | **integer.** The ID of the Order Management System on which the report was run. |
| reportFlavor      | **string.** The type of report. One of<br />Tradeactivity<br />Transaction<br />Treasury |
| createTime        | **string.** The time and date at which the request for the report was made, Microsoft Ticks format. |
| initialRunTime    | **string.** The time and date at which the report was first run, Microsoft Ticks format. |
| intervalStartTime | **string.** The start of the period that the report will cover, Microsoft Ticks format. |
| intervalEndTime   | **string.** The end of the period that the report will cover, Microsoft Ticks format. |
| RequestStatus     | **string.** The status of the request for the report. Each status returns one of:<br />Submitted<br />Validating<br />Scheduled<br />InProgress<br />Completed<br />Aborting<br />Aborted<br />UserCancelled<br />SysRetired<br />UserCancelPending |
| ReportFrequency   | **string.** When the report runs:<br />OnDemand<br />Hourly<br />Daily<br />Weekly<br />Monthly<br />Annually |
| intervalDuration  | **long integer.** The period that the report looks backward relative to the run date, in POSIX format. The system calculates *intervalDuration* between *intervalStartTime* and *intervalEndTime* and reports it in POSIX format. For example, say that you specify a 90-day start-to-end-date window for a report. The *intervalDuration* value returns a value equivalent to 90 days and represents the backward-looking period of the report. Say that you have set up a weekly report to look back 90 days. When the report runs again in a week's time, it again looks back 90 days -- but now those 90 days are offset by a week from the first report. |
| RequestId         | **string.** The ID of the original request. Request IDs are long strings unique within the Order Management System. |
| lastInstanceId    | **string.** For scheduled reports, the report ID of the most recent previously run report. This will be *null* for a Generate~Report call, because generated reports are all on-demand. |
| accountIds        | **integer array.** A comma-delimited array of account IDs whose trades are reported in the trade activity report. |



