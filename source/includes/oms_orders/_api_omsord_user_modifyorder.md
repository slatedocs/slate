## ModifyOrder

**Category:** User<br />
**Permissions:** Operator, Trading<br />
**Call Type:** Synchronous

Reduces an order’s quantity without losing priority in the order book. An order’s quantity can only be reduced. The other call that can modify an order &mdash; **CancelReplaceOrder** &mdash; resets order book priority, but you can use it to increase an order.

<aside class="notice"><strong>Note:</strong> <strong>ModifyOrder</strong> does not surrender or reset order book priority.</aside>

### Request

```json
{
  "OMSId": 0,
  "OrderId": 0,
  "InstrumentId": 0,
  "PreviousOrderRevision": 0,
  "Quantity": 0 
}
```

| Key                   | Value                                                        |
| --------------------- | ------------------------------------------------------------ |
| OMSId                 | **integer.** The ID of the Order Management System where the original order was placed. |
| OrderId               | **long integer.** The ID of the order to be modified. The ID was supplied by the server when the order was created. |
| InstrumentId          | **integer.** The ID of the instrument traded in the order.   |
| PreviousOrderRevision | **integer.** The order revision number at the time you make the modification order. This ensures that you have the latest order state at the time you make the request. |
| Quantity              | **real.** The new quantity of the order. This value can only be reduced from a previous quantity. |

### Response

```json
{
  "result": false,
  "errormsg": "",
  "errorcode": 0,
  "detail": "",
}
```

The response acknowledges the successful receipt of your request to modify an order; it does not indicate that the order has been modified. To find if an order has been modified, check using **GetOpenOrders** and **GetOrderHistory.**

| Key       | Value                                                        |
| --------- | ------------------------------------------------------------ |
| result    | **Boolean.** The successful receipt of a modify order request returns *true*; otherwise, returns *false*. This is the acknowledgment of receipt of the request to modify, not a confirmation that the modification has taken place. |
| errormsg  | **string.** A successful receipt of a modify request returns *null*; the *errormsg* parameter for an unsuccessful request returns one of the following messages:<br />Not Authorized (errorcode 20)<br />Invalid Request (errorcode 100)<br />Operation Failed (errorcode 101)<br />Server Error (errorcode 102)<br />Resource Not Found (errorcode 104) |
| errorcode | **integer.** The receipt of a successful request to modify returns 0. An unsuccessful request returns one of the *errorcodes* shown in the *errormsg* list. |
| detail    | **string.** Message text that the system may send. Usually *null*. |

