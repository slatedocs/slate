## CancelOrder

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Cancels an open order that has been placed but has not yet been fully executed. 

A user with Trading permission can cancel an order only for an account with which he is associated; a user with Operator permission can cancel an order for any account.


### Request

```json
{
  "OMSId": 0,
  "AccountId": 0,  // conditionally optional
  "ClientOrderId": 0,  // conditionally optional
  "OrderId": 0,    // conditionally optional
}
```

The OMS ID and the Order ID precisely identify the order you wish to cancel. The Order ID is unique across an OMS.

If you specify the OMS ID and the Account ID, you must also specify at least the Client Order ID. The OMS is unable to identify the order using only the OMS ID and the Client Order ID, as the Client Order ID may not be unique.

| Key           | Value                                                        |
| ------------- | ------------------------------------------------------------ |
| OMSId         | **integer.** The Order Management System on which the order exists. *Required*. |
| AccountId     | **integer.** The ID of the account under which the order was placed. *Conditionally optional*. |
| ClientOrderId | **long integer.** A user-assigned ID for the order (like a purchase-order number assigned by a company). *ClientOrderId* defaults to 0. *Conditionally optional.* |
| OrderId       | **long integer.** The order to be canceled. *Conditionally optional*. |

### Response

```json
{
  "result": true,
  "errormsg": "",
  "errorcode": 0,
  "detail": "",
}
```

The response to **CancelOrder** verifies that the call was received, not that the order has been canceled successfully. Individual event updates to the user show order cancellation. To verify that an order has been canceled, call **GetOrderStatus** or **GetOpenOrders.** 

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean.** Returns *true* if the call to cancel the order has been successfully received, otherwise returns *false*. |
| errormsg  | **string.** A successful receipt of a call to cancel an order returns *null*; the *errormsg* parameter for an unsuccessful call to cancel an order returns one of the following messages:<br />Not Authorized (errorcode 20)<br />Invalid Request (errorcode 100)<br />Operation Failed (errorcode 101)<br />Server Error (errorcode 102)<br />Resource Not Found (errorcode 104) |
| errorcode | **integer.** A successfully received call to cancel an order returns 0. An unsuccessfully received call to cancel an order returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string.** Message text that the system may send. The contents of this parameter are usually null. |

