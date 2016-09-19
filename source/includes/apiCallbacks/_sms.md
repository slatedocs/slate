## SMS Event
Bandwidth API sends this event to the application when an SMS is sent or received.

### Properties
| Property            | Description                                                                                                                                                                                                                                      |
|:--------------------|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType           | The event type, value is `sms`.                                                                                                                                                                                                                  |
| direction           | Direction of message, <br>* `in` - a message that came from the telephone network to one of your numbers (an “inbound” message) <br> * `out` - a message that was sent from one of your numbers to the telephone network (an “outbound” message) |
| from                | The message sender’s telephone number (or short code).                                                                                                                                                                                           |
| to                  | Message recipient telephone number (or short code).                                                                                                                                                                                              |
| messageId           | The unique id of the message resource for this event.                                                                                                                                                                                            |
| messageUri          | The full URL of the message resource.                                                                                                                                                                                                            |
| text                | The message’s text contents.                                                                                                                                                                                                                     |
| applicationId       | The application id associated with the phone number receiving the inbound message.                                                                                                                                                               |
| time                | The time the message resource was created (UTC, follows the ISO 8601 format).                                                                                                                                                                    |
| state               | Message state, values are received queued sending sent error                                                                                                                                                                                     |
| deliveryState       | One of the message delivery states `waiting` `delivered` `not-delivered`                                                                                                                                                                         |
| deliveryCode        | Numeric value of deliver code, see values [here](#message-delivery-code).                                                                                                                                                                        |
| deliveryDescription | Message delivery description for the respective delivery code.                                                                                                                                                                                   |

```json
{
  "eventType": "string",
  "direction": "string",
  "from": "string",
  "to": "string",
  "messageId": "string",
  "messageUri": "string",
  "text": "string",
  "applicationId": "string",
  "time": "date",
  "state": "string",
  "deliveryState": "string",
  "deliveryCode": "string",
  "deliveryDescription": "string"
}
```
#### Example: Incoming SMS Event

```
POST http://[External server URL]
```

```json
{
 "eventType":"sms",
 "direction":"in",
 "messageId": "{messageId}",
 "messageUri": "https://api.catapult.inetwork.com/v1/users/{userId}/messages/{messageId}",
 "from":"+13233326955",
 "to":"+13865245000",
 "text":"Example",
 "applicationId":"{appId}",
 "time":"2012-11-14T16:13:06.076Z",
 "state":"received"
}
```

#### Example: Outgoing SMS Event
```
POST http://[External server URL]
```

```json
{
   "eventType":"sms",
   "direction":"out",
   "messageId": "{messageId}",
   "messageUri": "https://api.catapult.inetwork.com/v1/users/{userId}/messages/{messageId}",
   "from":"+13233326955",
   "to":"+13865245000",
   "text":"Example",
   "time":"2012-11-14T16:13:06.076Z",
   "state":"sent"
}
```
#### Example: Outgoing SMS with Delivery Request Event
```
POST http://[External server URL]
```

```json
{
   "eventType":"sms",
   "direction":"in",
   "messageId": "{messageId}",
   "messageUri": "https://api.catapult.inetwork.com/v1/users/{userId}/messages/{messageId}",
   "from":"+13233326955",
   "to":"+13865245000",
   "text":"Example",
   "applicationId":"{appId}",
   "time":"2012-11-14T16:13:06.076Z",
   "state":"received"
}
```
