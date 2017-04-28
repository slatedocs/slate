# Accessing Front data

The plugin API enables you to extract some data from Front, always remember that these data are relative to the teammate using the plugin, if teammate A does not have access to inbox B then you will not see inbox B when calling `fetchInboxes()`.

Fetching data through the plugin API is asynchronous, this means that you will need to provide the js library with a callback every time you want to retrieve data.

Please also note that the data you extract from these calls is just a snapshot of Front's state when you asked for it, any updates happening afterward will not update the data you received nor call your callback again.

## User Profile

```json
{
    "url": "/api/1/companies/planet_express/team/bender",
    "alias": "bender",
    "given_name": "Bender",
    "family_name": "Rodriguez",
    "email": "bender@planet-express.com",
    "avatar": "https://nibbler.frontapp.com/api/1/noauth/avatars/123",
    "admin": true
}
```

You can get basic info about the user currently connected to Front by accessing `Front.user`. Keep in mind that the profile might change over time if the user changes their profile.

## Fetch Inboxes

```javascript
Front.fetchInboxes(function (inboxes) {
    if (!inboxes) return;

    console.log(inboxes);
});
```

> Sample JSON for an inbox

```json
{
  "avatar_type": "inbox",
  "class": "inbox",
  "alias": "support",
  "name": "CS",
  "color": "#E151E1",
  "num_new": 30,
  "num_unassigned": 30,
  "last_unassigned_date": 1423821859000,
  "participants": [
    "john"
  ],
  "tags": [
    "test",
    "important"
  ],
  "owner": null,
  "settings": {
    "auto_assign": true,
    "attachment_size_limit": 9437184
  }
}
```

This call will send you all the inboxes accessible by the current user (private and shared).

The callback's `inboxes` parameter will contain an array of inboxes.

## Fetch Channels

```javascript
Front.fetchChannels(function (channels) {
    if (!channels) return;

    console.log(channels);
});
```

> Sample JSON for a channel

```json
{
  "id": "cha_123",
  "type": "imap",
  "type_name": "email",
  "is_private": false,
  "message_type": "email",
  "address": "contact@company.com",
  "send_as": "contact@company.com"
},
```

This call will send you all the channels accessible by the current user.

The callback's `channels` parameter will contain an array of channels.

## Fetch teammates

```javascript
Front.fetchAllowedTeammates(function (teammates) {
    if (!teammates) return;

    console.log(teammates);
});
```

> Sample JSON for a teammate

```json
{
  "avatar_type": "teammate",
  "class": "teammate",
  "alias": "john",
  "email": "john@test.com",
  "display_name": "John Doe",
  "given_name": "John",
  "family_name": "Doe",
  "avatar": "/img/avatars/default-avatar-03.jpg",
  "account_status": "active",
  "admin": true,
  "available": true,
  "color": "hsl(91,60%,70%)",
  "initials": "B",
  "num_assigned_received": 0,
  "num_assigned_sent": 0,
  "num_followed": 0,
  "num_drafts": 2,
  "num_unseen_notifications": 0,
  "has_unseen_assigned": false,
  "precog": null
}
```

This call will send you the teammates that have access to the current conversation.

The callback's `teammates` parameter will contain an array of teammate.

## Fetch tags

```javascript
Front.fetchAllowedTags(function (tags) {
    if (!tags) return;

    console.log(tags);
});
```

> Sample JSON for a tag

```json
{
  "alias": "tag_alias",
  "name": "Alias name"
}
```

This call will send you the tags available for the current conversation.

The callback's `tags` parameter will contain an array of tag.

## Fetch notes

```javascript
Front.fetchNotes(function (notes) {
    console.log(notes);
});
```

> Sample JSON for a note

```json
{
  "body": "Awesome note!",
  "text": "Awesome note!",
  "html": "<p>Awesome note!</p>\n",
  "date": 1456348516603,
  "author": "teammate"
}
```

This call will send you the notes written for the conversation recipient.

The callback's `notes` parameter will contain an array of note.

## Fetch draft

```javascript
Front.fetchDraft(function (draft) {
    console.log(draft);
});
```

> Sample JSON for a draft

```json
{
  "attachments" : [],
  "ext_id" : "43bb19b05566bc60e0094b2238b318f3@frontapp.com",
  "status" : "draft-compose",
  "id" : "msg_4zd7",
  "body" : "<div>Some HTML body</div>",
  "inbound" : false,
  "recipients" : [
    {
      "display_name" : "Awesome recipient",
      "role" : "from",
      "handle" : "awesome@recipient.com"
    }
  ],
  "from" : {
    "display_name" : "A teammate",
    "handle": "ateammate@frontapp.com"
  },
  "date" : 1493391443349,
  "blurb" : "Some HTML body",
  "type" : "email",
  "subject" : "Re: a message"
}
```


This call will send you the draft of the current conversation.
If the conversation has no draft, the `draft` value in the callback will be `null`, else, it will look like any other message object representation.



