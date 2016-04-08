# Controlling Front
The javascript library exposes several helper functions to send commands to the app. Most functions accept either an alias or an object returned by `Front.fetchInboxes`, `Front.fetchAllowedTeammates` or `Front.fetchAllowedTags`.

## Unassign

```javascript
Front.unassign();
```

Unassign the currently selected conversation.

## Assign
```javascript
Front.assign('teammate_alias');
```

Assign the currently selected conversation to a teammate.

## Toggle archived

```javascript
Front.toggleArchive();
```

Toggle the archive flag of the currently selected conversations.

## Toggle trashed

```javascript
Front.toggleTrashed();
```

Toggle the trashed flag of the currently selected conversations.

## Compose new message

```javascript
Front.compose({
    to: 'someone@somewhere.com',
    subject: 'Optional subject',
    body: 'Optional body',
    tags: ['tag_alias_1', 'tag_alias_2'],
    inbox: 'inbox_alias'
});
```
Open a new message. Will do nothing if an inbox cannot be selected (for example, if you try to compose to a Twitter handle, but have no Twitter inbox).

The **options** object accepts the following fields :

* `to` is an optional recipient, that can be an email address, a phone number or a Twitter handle.
    * `html` or `text` (optional) is the content of your message. If you have any, a signature will be appended.
* `tags` (optional) will be used to tag the conversation. Can be a list of tag aliases or a list of objects with an alias property. If omitted, no tags will be applied. Tags can be retrieved from fetchAllowedTags.
* `inbox` is an optional inbox, retrievable from fetchInboxes. `inbox` can be either the inbox alias (String) or the inbox object (containing the `alias` property).

## Compose reply

```javascript
Front.reply({
    to: 'someone@somewhere.com',
    html: 'Optional HTML body',
    text: 'Optional text body',
    subject: 'Optional subject',
    tags: ['tag_alias_1', 'tag_alias_2'],
    send_now: false,
    mark_archived: false
}, replyAll);
```
Send a reply to the latest message of the current conversation. Will do nothing unless a conversation is selected.

The **options** object accepts the following fields :

* `html` or `text` (optional) is the content of your message. If you have any, a signature will be appended.
* `subject` (optional) will be used as subject for emails. If omitted, it will reply with the previous subject prefixed by "Re : ".
* `tags` (optional) will be used to tag the conversation. Can be a list of tag aliases or a list of objects with an alias property. If omitted, no tags will be applied. Tags can be retrieved from fetchAllowedTags.
* `send_now` (defaults to false) can send the reply immediately, if set to false, a composer will simply open.
* `mark_archived` (defaults to false) will trigger a send & archive is send_now is set to true. Ignored otherwise.
* `to` (optional) The recipient of your message. If omitted, it will automatically select the sender of the most recent message in the conversation.

The `replyAll` parameter will transform a simple reply in a reply all if set to true.

## Tagging/Untagging a conversation

```javascript
Front.attachTag('feature_request');
Front.detachTag('feature_request');
```

You can add or remove tags from a conversation. For this, you will need the alias of the tag. The alias is a URL-friendly, human-readable name for the tag that is unique to your company. You can find the alias of a tag by looking at your browser URL when you click on a tag in Front.


## Moving a conversation to an inbox

```javascript
Front.moveToInbox('contact');
```

You can move a conversation to an inbox. You can request a conversation to be moved to a team inbox not accessible by the user, but they will get a confirmation dialog (as they will lose access to the conversation).

## Search

```javascript
Front.search('search query terms');
```

Perform a search

## Insert HTML

```javascript
Front.insertHTML('Automatically inserted HTML');
```

Lets you insert HTML in the message composer where the user cursor is.

<aside class="warning">
<strong>Limitation</strong><br>
Inserting HTML is currently supported only when composing a reply (not in the new message composer)
</aside>

##  Add topic

```javascript
Front.addTopic({
    type: 'web',
    name: 'Link example',
    ext_link: 'http://example.com'
}, function() {
    console.log('done');
});
```

A topic is an external link attached to your conversation. It has a type, a name and an URL.

| Field     | Type      | Description                                                                     |
|-----------|-----------|---------------------------------------------------------------------------------|
| type      | String    | Type of the topic. Can be either `web`, `github`, `jira`, `trello` or `assana`. |
| name      | String    | Name of the link which will appear on the conversation.                         |
| ext_link  | String    | URL of the topic.                                                               |

## Set Width

```javascript
Front.setPanelWidth(400);
```

The plugin initially appears with a width of 300px. However, you can request more space very easily:
