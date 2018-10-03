## CancelUserReport

**Category:** Users<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

You can generate or schedule a variety of reports through this API on demand. This call cancels a scheduled report by its report ID. **GetUserReportTickets** can provide a list of GUIDs for scheduled reports.

### Request
```json
{
  "UserReportId": guid-as-a-string //GUID not GUIDE
}
```

| Key     | Value                                                        |
| ---------- | ------------------------------------------------------------ |
| UserReport | **string**. The GUID is a globally unique ID string that identifies the user report to be canceled. The Order Management System provides this ID when you create a report. |

### Response
```json
{
  "result": true,
  "errormsg": "",
  "errorcode": 0,
  "detail": "",
}
```
The response to **CancelUserReport** verifies that the call was received, not that the user report has been canceled successfully. Individual event updates sent to the user show cancellations. To verify that a report has been canceled, call **GetUserReportTickets**  or **GetUserReportWriterResultRecords**.

| Key    | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean**. A successful receipt of the cancellation returns true; and unsuccessful receipt of the cancellation (an error condition) returns false. |
| errormsg  | **string**. A successful receipt of the cancellation returns null; the *errormsg* parameter for an unsuccessful receipt returns one of the following messages: Not Authorized (errorcode 20, Invalid Request (errorcode 100), Operation Failed (errorcode 101), Server Error (errorcode 102), Resource Not Found (errorcode 104) |
| errorcode | **integer**. A successful receipt of the cancellation returns 0. An unsuccessful receipt returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string**. Message text that the system may send. Usually *null*. |

