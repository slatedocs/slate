## LogOut

**Category:** Authentication<br />
**Permissions:** Public<br />
**Call Type:** Synchronous

**LogOut** ends the current websocket session.

### Request

There is no payload for a **LogOut** request.

```json
{ }
```

### Response

```json
{
  "result":true,
  "errormsg":null,
  "errorcode":0,
  "detail":null
}
```


| Key    | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean**. A successful logout returns *true*; an unsuccessful logout (an error condition) returns *false*. |
| errormsg  | **string**. A successful logout returns null; the *errormsg* parameter for an unsuccessful logout returns one of the following messages:<br />Not Authorized (errorcode 20)<br />Invalid Response (errorcode 100)<br />Operation Failed (errorcode 101)<br />Server Error (errorcode 102)<br />Resource Not Found (errorcode 104)<br /><br />Not Authorized and Resource Not Found are unlikely errors for a **LogOut**. |
| errorcode | **integer**. A successful logout returns *0*. An unsuccessful logout returns one of the errorcodes shown in the *errormsg* list. |
| detail    | **string**. Message text that the system may send. Usually *null*. |




