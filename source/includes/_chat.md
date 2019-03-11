# Chat APIs

Requires authentication.

## Get My Data

Returns All Chats For Current Authorized User.

```APIs
GET https://dev.zoomsymbols.com/api/chat/getMyData
```

> Response

```json
{
  "result": {
     "directedConversations": [{
         "id": "24",
         "conversation_id": "24",
         "type": "direct",
         "is_private": true,
         "isPrivate": true,
         "listOrder": 1,
         "members": [{
             "id": "xxxxxxxxxxxxxxx",
             "username": "xxxxxxxxxxxx",
             "firstName": "xxxxxxxxxxxx",
             "lastName": "xxxxxxxxxxxx",
             "display_name": "xxxxxxxxxxxx",
             "displayName": "xxxxxxxxxxxx",
             "lastMessageTimetoken": 0
         }, {
             "id": "xxxxxxxxxxxxxxx",
             "username": "xxxxxxxxxxxx",
             "firstName": "xxxxxxxxxxxx",
             "lastName": "xxxxxxxxxxxx",
             "display_name": "xxxxxxxxxxxx",
             "displayName": "xxxxxxxxxxxx",
             "lastMessageTimetoken": 0
         }],
     "memberHistory": [],
     "metadata": {}
    ...
    ]
   ...
  }

}
```

## Search Users

Returns All Chats For Current Authorized User.

```APIs
GET https://dev.zoomsymbols.com/api/chat/searchUsers
```

> Parameters

```
queryString: your_query_string
```

> Response

```json
{
  "result": [
   ...
  ]
}
```

## Add Direct Conversation

Create a new direct conversation.

```APIs
POST https://dev.zoomsymbols.com/api/chat/addDirectConversation
```

> Parameters

```
members: conversation_participants
```

## Add Channel

Create a new channel.

```APIs
POST https://dev.zoomsymbols.com/api/chat/addChannel
```

> Parameters

```
members: channel_participants
is_private: true/false (channel's privacy)
name: channel_name
description: channel_description
```
