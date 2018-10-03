## CancelQuote

**Category:** User<br />
**Permissions:** Operator, Marketmaker<br />
**Call Type:** Synchronous

Cancels a quote that has not been executed yet.

<aside class="notice"><strong>Note:</strong> Quoting is not enabled for the retail end user of the Cubobit software. Only registered market participants or marketmakers may quote. Only a user with Operator permission can cancel quotes for another user.</aside>

### Request

```json
{
    "omsId": 0,
    "accountId": 0,
    "instrumentId": 0,
    "bidQuoteId": 0,
    "askQuoteId": 0
}
```

You must identify the quote to be canceled by both *BidQuoteId* and *AskQuoteId*, which were supplied by the system when the quote was created. You can optionally identify the canceled quote using *AccountId* and *InstrumentId*. If the call does not include *AccountId*, the call assumes the default *AccountId* for the logged-in user; if the call does not include *InstrumentId*, the call operates on any instruments quoted by the account.

| Key          | Value                                                        |
| ------------ | ------------------------------------------------------------ |
| omsId        | **integer.** The ID of the Order Management System where the quote was requested. Required. |
| accountId    | **integer.** The ID of the account that requested the quote. *Conditionally optional*. |
| instrumentId | **long integer.** The ID of the instrument being quoted. *Conditionally optional*. |
| bidQuoteId   | **integer.** The ID of the bid quote. *Required*.            |
| askQuoteId   | **integer.** The ID of the ask quote. *Required*.            |

### Response

```json
{
  "BidResult": "{
    "result": true,
    "errormsg": "",
    "errorcode": 0,
    "detail": "",
  }",
  "AskResult": "{
    "result": true,
    "errormsg": "",
    "errorcode": 0,
    "detail": "",
  }"
}
```

Returns two json objects, one for Bid and one for Ask.

The response to **CancelQuote** verifies that the call was received, not that the quote has been canceled successfully. Individual event updates to the user show quotes as they cancel. To verify that a quote has been canceled, use **GetOpenQuotes.**

| Key       | Value                                                      |
| --------- | ---------------------------------------------------------- |
| BidResult | **object.** Returns a response object for Bid (see below). |
| AskResult | **object.** Returns a response object for Ask.             |

Objects for both *BidResult* and *AskResult*:

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean.** A successful receipt of the cancelation returns *true*; and unsuccessful receipt of the cancelation (an error condition) returns *false*. |
| errormsg  | **string.** A successful receipt of the cancelation returns *null*; the *errormsg* parameter for an unsuccessful receipt returns one of the following messages:<br />Not Authorized (errorcode 20)<br />Invalid Request (errorcode 100)<br />Operation Failed (errorcode 101)<br />Server Error (errorcode 102)<br />Resource Not Found (errorcode 104) |
| errorcode | **integer.** A successful receipt of the cancelation returns 0. An unsuccessful receipt returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string.** Message text that the system may send. Usually null. |


