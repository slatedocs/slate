## AddUserAffiliateTag

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Associates a user affiliate tag to a user. An affiliate tag allows a user to encourage others to join the exchange and provides a way to track those new members back to the initiating user.

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
| omsId        | **integer.** The ID of the Order Management System on which the user operates. |
| userId       | **integer.** The user's ID.                                  |
| affiliateId  | **integer.** The affiliate ID.                               |
| affiliateTag | **string.** The alphanumeric tag used to identify new affiliating members. |

###Response

```json
{
  "result":true,
  "errormsg":"",
  "errorcode":0,
  "detail":""
}
```

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean.** *True* signifies that the server has received the request to associate the affiliate tag with a specific user (not that it has done so); *false* signifies an error. |
| errormsg  | **string.** A successful response returns *null*; the *errormsg* parameter for an unsuccessful response returns one of the following messages: Not Authorized (*errorcode* 20), Invalid Request (*errorcode* 100), Operation Failed (*errorcode* 101), Server Error (*errorcode* 102), Resource Not Found (*errorcode* 104) |
| errorcode | **integer.** A successful response returns 0. An unsuccessful response returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string.** Message text that the system may send. Usually *null*. |


