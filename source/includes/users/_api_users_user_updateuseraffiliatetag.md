## UpdateUserAffiliateTag

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Updates the user affiliate tag with new or revised information. An affiliate tag allows a user to encourage others to join the exchange and provides a way to track those new members back to the initiating user.

### Request

```json
{
    "omsId":0,
    "userId":0,
    "affiliateId":0,
    "affiliateTag":""
}
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| omsId        | **integer.** The ID of the Order Management System on which the user and his affiliate tag operates. |
| userId       | **integer.** The ID of the user whose affiliate tag you are modifying. |
| affiliateId  | **integer.** The ID of the affiliate.                        |
| affiliateTag | **string.** The alphanumeric tag used to identify new affiliating members. |

### Response

```json
{
  "result":true,
  "errormsg":"",
  "errorcode":0,
  "detail":""
 }
```
| Key    | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean.** A successful receipt of the unsubscribe request returns *true*; and unsuccessful receipt (an error condition) returns *false*. |
| errormsg  | **string.** A successful receipt of the unsubscribe request returns *null*; the *errormsg* parameter for an unsuccessful request returns one of the following messages:<br />Not Authorized (errorcode 20)<br />Invalid Request (errorcode 100)<br />Operation Failed (errorcode 101)<br />Server Error (errorcode 102)<br />Resource Not Found (errorcode 104) |
| errorcode | **integer.** A successful receipt of the unsubscribe request returns 0. An unsuccessful receipt returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string.** Message text that the system may send. Usually *null*. |
