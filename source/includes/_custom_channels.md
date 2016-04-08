# Custom channels

A custom channel lets you control how messages are received and sent via HTTP calls.
You can use custom channels to integrate Front with platforms that are not officially supported.

## Create a custom channel

* Go to Settings > Inboxes
* Click on "Create an inbox" and choose the **Custom** type
* Choose a name for your inbox
* Define a callback URL

## Receive messages

See [Receive a custom message](#receive-a-custom-message) endpoint documentation.

## Sending messages

> In case of a teammate sending a message, this is what the request body your endpoint would receive:

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/messages/msg_55c8c149",
    "related": {
      "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
      "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
    }
  },
  "id": "msg_55c8c149",
  "type": "custom",
  "is_inbound": false,
  "created_at": 1453770984.123,
  "blurb": "Anything less than immortality is a...",
  "author": {
    "_links": {
      "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
      "related": {
        "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
        "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
      }
    },
    "id": "tea_55c8c149",
    "email": "leela@planet-express.com",
    "username": "leela",
    "first_name": "Leela",
    "last_name": "Turanga",
    "is_admin": true,
    "is_available": true
  },
  "recipients": [
    {
      "handle": "calculon@momsbot.com",
      "role": "to",
      "_links": {
        "related": {
          "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
        }
      }
    }
  ],
  "body": "Anything less than immortality is a complete waste of time.",
  "text": "Anything less than immortality is a complete waste of time.",
  "attachments": [],
  "metadata": {}
}
```

Whenever a message is sent from Front (either by a rule or by a teammate), a **POST** HTTP request will be issued to the callback URL you defined. The request body will contain the data of the message sent just like if fetched it.
