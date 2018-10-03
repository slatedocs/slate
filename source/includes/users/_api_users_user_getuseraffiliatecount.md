## GetUserAffiliateCount

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Gets a count of users who have been referred to the exchange by the identified user.

### Request

```json
{
  "OMSId":1,
  "UserId":1
}
```

| Key    | Value                                                        |
| ------ | ------------------------------------------------------------ |
| OMSId  | **integer.** The ID of the Order Management System on which the user operates. |
| UserId | **integer.** The ID of the user.                             |

### Response

```json
{
  "Count":0
}
```

| Key   | Value                                                        |
| ----- | ------------------------------------------------------------ |
| Count | **integer.** The count of exchange users who have been referred to the exchange by the user identified by *UserId* in the request. |


