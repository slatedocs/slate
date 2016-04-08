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
  "type": "imap",
  "avatar_type": "inbox",
  "class": "inbox",
  "message_type": "email",
  "contact_source": "email",
  "alias": "support",
  "name": "CS",
  "address": "support@test.com",
  "address_editable": false,
  "send_as": "support@test.com",
  "color": "#E151E1",
  "num_new": 30,
  "num_unassigned": 30,
  "last_unassigned_date": 1423821859000,
  "sync_status": "synced",
  "account_status": "ok",
  "primed": true,
  "error_type": null,
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

This call will send you all the inboxes the current user can access.

The callback's `inboxes` parameter will contain an array of inbox.

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


