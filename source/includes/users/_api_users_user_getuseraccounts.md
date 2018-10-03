## GetUserAccounts

**Category:** User<br />
**Permissions:** Operator, Trading, AccountReadOnly<br />
**Call Type:** Synchronous

Returns a list of account IDs for a given user. More than one user may be associated with a given account. 

### Request

```json
{
  "omsId": 0,
  "userId": 0,
  "userName": "",
}
```

| Key   | Value                                                        |
| -------- | ------------------------------------------------------------ |
| OMSId    | **integer**. The Order Management System on which the user has one ore more accounts. |
| UserId   | **integer**. The ID of the user whose accounts you want to return. |
| UserName | **string**. The name of the user.                            |

### Response

The response returns list of comma-separated account IDs.

```json
{
  0, // a list of account IDs
}
```

