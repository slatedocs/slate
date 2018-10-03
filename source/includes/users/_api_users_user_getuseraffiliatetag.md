## GetUserAffiliateTag

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Returns an array of affiliate tags associated with the identified user. The exchange can use an affiliate tag to identify new users who join the exchange as a result of a recommendation from the identified user. A user may have multiple affiliate tags.

### Request

```json
{
  "userId":0,
  "omsId":0
}
```

| Key    | Value                                                        |
| ------ | ------------------------------------------------------------ |
| userId | **integer.** The ID of the user whose affiliate tag you want to retrieve. |
| omsId  | **integer.** The ID of the Order Management System on which the user operates. |

### Response

The response is an array of affiliate tag information, with an object for each affiliate tag associated with the user.

```json
[
  {
     "omsId":0,
     "userId":0,
     "affiliateId":0,
     "affiliateTag":""
  }
]
```

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| omsId        | **integer.** The ID of the Order Management System on which the user operates. This echoes the *omsId* in the request. |
| userId       | **integer.** The ID of the user whose affiliate tag is returned. Echoes the *userId* in the request. |
| affiliateId  | **integer.** The ID of the affiliate.                        |
| affiliateTag | **string.** The tag that the user can share.                 |


