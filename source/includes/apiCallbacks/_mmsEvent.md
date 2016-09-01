## MMS Event
Events sent to your server for inbound and outbound MMS messages.

### Properties
| PROPERTY      | DESCRIPTION                                                                                                                                                                                                                                  |
|:--------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eventType     | The event type, value is `mms`.                                                                                                                                                                                                              |
| direction     | Direction of message<br> * `in` - a message that came from the telephone network to one of your numbers (an “inbound” message)<br>*`out` - a message that was sent from one of your numbers to the telephone network (an “outbound” message) |
| from          | The message sender’s telephone number (or short code).                                                                                                                                                                                       |
| to            | Message recipient telephone number (or short code).                                                                                                                                                                                          |
| messageId     | The unique id of the message resource for this event.                                                                                                                                                                                        |
| messageUri    | The full URL of the message resource.                                                                                                                                                                                                        |
| text          | The message contents.                                                                                                                                                                                                                        |
| applicationId | The application id associated with the phone number receiving the inbound messages.                                                                                                                                                          |
| time          | The time the message resource was created (UTC, follows the ISO 8601 format).                                                                                                                                                                |
| state         | Message state, values are `received` `queued` `sending` `sent` `error`                                                                                                                                                                       |
| media         | URIs of media files associate with the MMS message.                                                                                                                                                                                          |

#### Example: Inbound MMS

```
POST http://[External server URL]
```

```json
{
   "eventType":"mms",
   "to":"+12534483100",
   "from":"+15035555555",
   "time":"2015-08-04T21:50:12Z",
   "text":"Hello MMS!",
   "direction":"in",
   "applicationId":"a-rj7jf3fz7teaqupveqpug3i",
   "state":"received",
   "messageId":"m-dr4mcch2wfb6frcls677glq",
   "media":[
      "https://api.catapult.inetwork.com/v1/users/{user-id}/media/A3087419-73C2-4A03-BB39-06BF3B1C240F-m-dr4mcch2wfb6frcls677glq.jpg",
      "https://api.catapult.inetwork.com/v1/users/{user-id}/media/123_1-m-dr4mcch2wfb6frcls677glq.smil"
      ],
    "messageUri":"https://api.catapult.inetwork.com/v1/users/{user-id}/messages/m-dr4mcch2wfb6frcls677glq"
}
```
