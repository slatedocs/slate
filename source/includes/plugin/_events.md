# Getting events from Front

```javascript
Front.on('conversation', function (data) {
    // triggered when a conversation is loaded
});

Front.on('no_conversation', function () {
    // triggered when no conversation is selected
});

Front.on('panel_visible', function (visible) {
    // triggered when your plugin becomes visible or invisible
    // you can also test Front.visible
});
```

Every time the current conversation changes, an event is sent to our library.

The data object sent to the callbacks of the event contains 4 fields:

* `contact` The conversation's contact
* `conversation` The conversation object
* `message` The topmost ( most recent ) message object
* `otherMessages` an array of messages

> The **contact** object will look like this :

```json
{
  "avatar_type": "contact",
  "class": "contact",
  "source": "email",
  "name": "John Doe",
  "handle": "john.doe@frontapp.com",
  "display_name": "John Doe",
  "job": null,
  "bio": null,
  "avatar": null,
  "initials": "J",
  "color": "hsl(47,60%,70%)",
  "inbox_alias": null,
  "message_type": null,
  "extra": null,
  "links": [],
  "num_notes": 0,
  "role": "reply-to"
}
```

> The **conversation** object will look like below, for clarity sake some objects have been removed:

```json
{
  "type": "conversation",
  "message_type": "email",
  "status": "unassigned",
  "archived": false,
  "trashed": false,
  "replied": false,
  "reacted": false,
  "subject": "test again",
  "summary": "Just testing some stuff",
  "updated_at": 1423381104000,
  "num_messages": 1,
  "has_attachments": false,
  "contact": {}, // Similar to the contact JSON above
  "inboxes": ["support"],
  "assignee": null,
  "followers": ["jane"],
  "tags": [],
  "draft_seeds": [],
  "seen_by": ["jane"],
  "reminders": [],
  "messages": [], // Similar to the message JSON below
  "drafts": [],
  "activities": [
    {
      "type": "assign",
      "class": "activity",
      "date": 1423590415662,
      "from": "jane",
      "assignee": "jane"
    }
  ],
  "link": "https://app.frontapp.com/api/1/noauth/open_in_front/L2luYm94ZXMvdW5pZmllZC9hbGwvb3Blbi83",
  "active": true
}
```

> The **message** object will look like below, message found in otherMessages will not have body field as they are only loaded when expanded.

```json
{
  "type": "email",
  "class": "message",
  "status": "imported",
  "ext_id": "086b97289e93b01b@frontapp.com",
  "from": {
    "avatar_type": "inbox",
    "class": "inbox",
    "source": "email",
    "name": "Test Support",
    "handle": "support@test.com",
    "display_name": "Test Support",
    "job": null,
    "bio": null,
    "avatar": null,
    "initials": "T",
    "color": "#E151E1",
    "inbox_alias": "test_support",
    "message_type": "email",
    "extra": null,
    "links": [],
    "num_notes": 0,
    "role": "from"
  },
  "recipients": [
    {
      "avatar_type": "inbox",
      "class": "inbox",
      "source": "email",
      "name": "Test Support",
      "handle": "support@test.com",
      "display_name": "Test Support",
      "job": null,
      "bio": null,
      "avatar": null,
      "initials": "T",
      "color": "#E151E1",
      "inbox_alias": "test_support",
      "message_type": "email",
      "extra": null,
      "links": [],
      "num_notes": 0,
      "role": "from"
    },
    {
      "avatar_type": "contact",
      "class": "contact",
      "source": "email",
      "name": "John Doe",
      "handle": "john.doe@frontapp.com",
      "display_name": "John Doe",
      "job": null,
      "bio": null,
      "avatar": null,
      "initials": "J",
      "color": "hsl(47,60%,70%)",
      "inbox_alias": null,
      "message_type": null,
      "extra": null,
      "links": [],
      "num_notes": 0,
      "role": "to"
    },
    {
      "avatar_type": "inbox",
      "class": "inbox",
      "source": "email",
      "name": "Test Support",
      "handle": "support@test.com",
      "display_name": "Test Support",
      "job": null,
      "bio": null,
      "avatar": null,
      "initials": "T",
      "color": "#E151E1",
      "inbox_alias": "test_support",
      "message_type": "email",
      "extra": null,
      "links": [],
      "num_notes": 0,
      "role": "reply-to"
    }
  ],
  "date": 1422909585000,
  "inbound": false,
  "blurb": "This is a test",
  "num_comments": 0,
  "comments": [],
  "subject": "More testing",
  "body": "This is a test", // body will only be loaded in the first message
  "attachments": [],
  "reply_to": {
    "avatar_type": "inbox",
    "class": "inbox",
    "source": "email",
    "name": "Test Support",
    "handle": "support@test.com",
    "display_name": "Test Support",
    "job": null,
    "bio": null,
    "avatar": null,
    "initials": "T",
    "color": "#E151E1",
    "inbox_alias": "test_support",
    "message_type": "email",
    "extra": null,
    "links": [],
    "num_notes": 0,
    "role": "reply-to"
  },
  "forwarded_by": null,
  "recipient_opened_date": null,
  "latest": true
}
```
