# ACTION REQUESTS

Actions are how we interact with end devices, such as locking a door or
turning off a light.

Action Requests are a special way of encapsulating a request for a device
to perform an action and we discuss them in-depth in the
[Understanding Action Requests](#understanding-action-requests) section.


## Action Request Object

```json
{
    "id": "cb41f7cf-b49d-4e8b-856c-5e12d1b8ca48",
    "device_id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "data": {
        "set_code": {
            "code": "8888",
            "slot_id": 3
        }
    },
    "status": "pending",
    "created_at": "2020-02-10T01:33:19.955Z",
    "updated_at": "2020-02-10T01:33:19.955Z",
}
```

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Action Request
device_id | uuid | The ID of the Device that received the Action Request
data | object | The key contains the action name, and the values contain the inputs issued for the action
status | string | The status of the Action Request
created_at | datetime | Datetime when the Action Request was created
updated_at | datetime | Datetime when the Action Request was last updated

## Understanding Action Requests

Each time we issue an action request for a specific end device, the Weaver API creates an `ActionRequest` object and returns its reference. It also forwards the action request to the specific device via the Weaver Gateway.

### The Action Request Lifecycle

You will notice that the `ActionRequest` object has a `status` field which indicates the state of the action.

![Action Request Lifecycle](https://i.imgur.com/WMETML2.jpg)

When an `action_request` object is created, its initial `status` will be `initialized`. This is because in the IoT world, **everything is asynchronous**, meaning that action_requests can take on the order of seconds, minutes, or even days to complete.

When the Gateway has forwarded the action request to the device, the status of the action request will automatically update to `pending`.

Finally, when the command has been successfully completed by the end device, its status will update to `completed`.

### Tracking the Progress of an Action Request
When you initiate an action, the API will create an action request object and return its reference. You can then receive updates on the status of the action by fetching the Action Request again or via a predefined HTTP Webhook (upcoming feature).
