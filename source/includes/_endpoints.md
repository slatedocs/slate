
# Teammates
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the teammate
email | string | Email address of the teammate
username | string | Username of the teammate (used for "@" mentions)
first_name | string | First name of the teammate
last_name | string | Last name of the teammate
is_admin | boolean | Whether or not the teammate is an admin in your company
is_available | boolean | Whether or not the teammate is available
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the teammate
_links.related | object | 
_links.related.inboxes | string | URL of the teammate's inboxes
_links.related.conversations | string | URL of the teammate's conversation

A teammate is a Front user, a member of your company.

A teammate can be available or not (determined by the boolean `is_available`). When a conversation is assigned to an unavailable teammate, to avoid it to be hidden from the other teammates, it gets unassigned automatically.



## List team
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/teammates'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/teammates"
  },
  "_results": [
    {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
    }
  ]
}
```
Lists the teammates in your company.



### HTTP Request

`GET https://api2.frontapp.com/teammates`
## Get teammate
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/teammates/${TEAMMATE_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "tea_55c8c149",
  "email": "leela@planet-express.com",
  "username": "leela",
  "first_name": "Leela",
  "last_name": "Turanga",
  "is_admin": true,
  "is_available": true,
  "_links": {
    "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
    "related": {
      "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
      "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
    }
  }
}
```
Fetches the information of a teammate. See [resource aliases](#resource-aliases) to fetch by email.



### HTTP Request

`GET https://api2.frontapp.com/teammates/{teammate_id}`
### Parameters


Name | Type | Description
-----|------|------------
teammate_id | string | Id or email of the requested teammate

## Update teammate
```shell

curl --include \
     --request PATCH \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"username\": \"bender\",
  \"first_name\": \"Bender\",
  \"last_name\": \"Rodriguez\",
  \"is_admin\": true,
  \"is_available\": false
}" \
'https://api2.frontapp.com/teammates/${TEAMMATE_ID}'
```

```node

```

> Response **204**

Updates the information of a teammate.



### HTTP Request

`PATCH https://api2.frontapp.com/teammates/{teammate_id}`
### Parameters


Name | Type | Description
-----|------|------------
teammate_id | string | Id or email of the requested teammate

### Body


Name | Type | Description
-----|------|------------
username | string (optional) | New username. It must be unique and can only contains lowercase letters, numbers and underscores.
first_name | string (optional) | New first name
last_name | string (optional) | New last name
is_admin | boolean (optional) | New admin status
is_available | boolean (optional) | New availability status

## List teammate conversations
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/teammates/${TEAMMATE_ID}/conversations?q=${Q}&page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
  },
  "_results": [
    {
      "id": "cnv_55c8c149",
      "subject": "You broke my heart, Hubert.",
      "status": "archived",
      "assignee": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "recipient": {
        "handle": "calculon@momsbot.com",
        "role": "to",
        "_links": {
          "related": {
            "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
          }
        }
      },
      "tags": [
        {
          "id": "tag_55c8c149",
          "name": "Robots",
          "_links": {
            "self": "https://api2.frontapp.com/tags/tag_55c8c149",
            "related": {
              "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
            }
          }
        }
      ],
      "last_message": {
        "id": "msg_55c8c149",
        "type": "email",
        "is_inbound": true,
        "created_at": 1453770984.123,
        "blurb": "Anything less than immortality is a...",
        "author": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
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
        "attachments": [
          {
            "filename": "attachment.jpg",
            "url": "http://example.com/attachment.jpg",
            "content_type": "image/jpeg",
            "size": 10000
          }
        ],
        "_links": {
          "self": "https://api2.frontapp.com/messages/msg_55c8c149",
          "related": {
            "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
            "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
        "related": {
          "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
          "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
          "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
          "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
          "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
        }
      }
    }
  ]
}
```
Lists the conversations assigned to a teammate in reverse chronological order (newest first).



### HTTP Request

`GET https://api2.frontapp.com/teammates/{teammate_id}/conversations?q={q}&page={page}`
### Parameters


Name | Type | Description
-----|------|------------
teammate_id | string | Id or email of the teammate
q | object (optional) | Search query. See Search Parameters
page | number (optional) | Number of the page requested

## List teammate inboxes
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/teammates/${TEAMMATE_ID}/inboxes'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes"
  },
  "_results": [
    {
      "id": "inb_55c8c149",
      "address": "team@planet-express.com",
      "type": "email",
      "name": "Team",
      "send_as": "team@planet-express.com",
      "_links": {
        "self": "https://api2.frontapp.com/inboxes/inb_55c8c149",
        "related": {
          "teammates": "https://api2.frontapp.com/inboxes/inb_55c8c149/teammates",
          "conversations": "https://api2.frontapp.com/inboxes/inb_55c8c149/conversations",
          "channels": "https://api2.frontapp.com/inboxes/inb_55c8c149/channels"
        }
      }
    }
  ]
}
```
Lists the inboxes a teammate has access to.



### HTTP Request

`GET https://api2.frontapp.com/teammates/{teammate_id}/inboxes`
### Parameters


Name | Type | Description
-----|------|------------
teammate_id | string | Id or email of the teammate

# Inboxes
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier for the inbox
address | string | **DEPRECATED** Address receiving the messages
type | enum | **DEPRECATED** Type of the inbox
name | string | Name of the inbox
send_as | string (optional) | **DEPRECATED** Address which appears as the sender for messages sent from Front
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the inbox
_links.related | object | 
_links.related.teammates | string | URL of the list of teammates that can access the inbox
_links.related.conversations | string | URL of the list of conversations included in this inbox
_links.related.channels | string | URL of the list of channels sending messages to this inbox

An inbox is a container of messages.

Messages are sent from and received by [channels](#channels) which then post the messages into the configured inbox.



## List inboxes
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/inboxes'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/inboxes"
  },
  "_results": [
    {
      "id": "inb_55c8c149",
      "address": "team@planet-express.com",
      "type": "email",
      "name": "Team",
      "send_as": "team@planet-express.com",
      "_links": {
        "self": "https://api2.frontapp.com/inboxes/inb_55c8c149",
        "related": {
          "teammates": "https://api2.frontapp.com/inboxes/inb_55c8c149/teammates",
          "conversations": "https://api2.frontapp.com/inboxes/inb_55c8c149/conversations",
          "channels": "https://api2.frontapp.com/inboxes/inb_55c8c149/channels"
        }
      }
    }
  ]
}
```
Lists all the team inboxes in your company.



### HTTP Request

`GET https://api2.frontapp.com/inboxes`
## Create an inbox
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"name\": \"Delivery support\",
  \"teammate_ids\": []
}" \
'https://api2.frontapp.com/inboxes'
```

```node

```

> Response **201**

```json
{
  "id": "inb_55c8c149",
  "name": "Delivery support"
}
```
Creates a team inbox with no channel associated to it (see [Create a channel](#create-a-channel)).



### HTTP Request

`POST https://api2.frontapp.com/inboxes`
### Body


Name | Type | Description
-----|------|------------
name | string | Name of the inbox
teammate_ids | array (optional) | List of all the teammate ids who will have access to this inbox. If omitted, it will automatically select all the administrators in your company.

## Get inbox
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/inboxes/${INBOX_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "inb_55c8c149",
  "address": "team@planet-express.com",
  "type": "email",
  "name": "Team",
  "send_as": "team@planet-express.com",
  "_links": {
    "self": "https://api2.frontapp.com/inboxes/inb_55c8c149",
    "related": {
      "teammates": "https://api2.frontapp.com/inboxes/inb_55c8c149/teammates",
      "conversations": "https://api2.frontapp.com/inboxes/inb_55c8c149/conversations",
      "channels": "https://api2.frontapp.com/inboxes/inb_55c8c149/channels"
    }
  }
}
```
Fetches the information of an inbox. See [resource aliases](#resource-aliases) to fetch by address.



### HTTP Request

`GET https://api2.frontapp.com/inboxes/{inbox_id}`
### Parameters


Name | Type | Description
-----|------|------------
inbox_id | string | Id of the requested inbox

## List inbox channels
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/inboxes/${INBOX_ID}/channels'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/inboxes/inb_55c8c149/channels"
  },
  "_results": [
    {
      "_links": {
        "self": "https://api2.frontapp.com/channels/cha_55c8c149",
        "related": {
          "inbox": "https://api2.frontapp.com/channels/cha_55c8c149/inbox"
        }
      },
      "id": "cha_55c8c149",
      "address": "team@planet-express.con",
      "type": "email",
      "send_as": "team@planet-express.com",
      "settings": {}
    }
  ]
}
```
Lists the channels linked to an inbox.



### HTTP Request

`GET https://api2.frontapp.com/inboxes/{inbox_id}/channels`
### Parameters


Name | Type | Description
-----|------|------------
inbox_id | string | Id of the requested inbox

## List inbox conversations
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/inboxes/${INBOX_ID}/conversations?q=${Q}&page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/inboxes/inb_55c8c149/conversations"
  },
  "_results": [
    {
      "id": "cnv_55c8c149",
      "subject": "You broke my heart, Hubert.",
      "status": "archived",
      "assignee": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "recipient": {
        "handle": "calculon@momsbot.com",
        "role": "to",
        "_links": {
          "related": {
            "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
          }
        }
      },
      "tags": [
        {
          "id": "tag_55c8c149",
          "name": "Robots",
          "_links": {
            "self": "https://api2.frontapp.com/tags/tag_55c8c149",
            "related": {
              "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
            }
          }
        }
      ],
      "last_message": {
        "id": "msg_55c8c149",
        "type": "email",
        "is_inbound": true,
        "created_at": 1453770984.123,
        "blurb": "Anything less than immortality is a...",
        "author": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
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
        "attachments": [
          {
            "filename": "attachment.jpg",
            "url": "http://example.com/attachment.jpg",
            "content_type": "image/jpeg",
            "size": 10000
          }
        ],
        "_links": {
          "self": "https://api2.frontapp.com/messages/msg_55c8c149",
          "related": {
            "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
            "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
        "related": {
          "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
          "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
          "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
          "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
          "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
        }
      }
    }
  ]
}
```
Lists the conversations which appear in an inbox.



### HTTP Request

`GET https://api2.frontapp.com/inboxes/{inbox_id}/conversations?q={q}&page={page}`
### Parameters


Name | Type | Description
-----|------|------------
inbox_id | string | Id of the requested inbox
q | object (optional) | Search query. See Search Parameters
page | number (optional) | Number of the page requested

## List inbox teammates
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/inboxes/${INBOX_ID}/teammates'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/inboxes/inb_55c8c149/teammates"
  },
  "_results": [
    {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
    }
  ]
}
```
Lists the teammates who can access an inbox.



### HTTP Request

`GET https://api2.frontapp.com/inboxes/{inbox_id}/teammates`
### Parameters


Name | Type | Description
-----|------|------------
inbox_id | string | Id of the requested inbox

# Channels
> 
Name | Type | Description
-----|------|------------
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the inbox.
_links.related | object | 
_links.related.inbox | string | URL of the inbox to which the channel is sending messages.
id | string | Unique identifier for the channel.
address | string | Address receiving the messages.
type | enum | Type of the channel.
send_as | string (optional) | Address which appears as the sender for messages sent from Front.
settings | object | 

A channel is a resource which can send and receive messages.

Here is the list of existing channel types:

| Type        | Description                                                                                |
|-------------|--------------------------------------------------------------------------------------------|
| `smtp`      | For emails managed via SMTP.                                                               |
| `imap`      | For emails managed via IMAP.                                                               |
| `sms`       | Linked to a Twilio account.                                                                |
| `twitter`   | Linked to a Twitter account.                                                               |
| `facebook`  | Linked to a Facebook page.                                                                 |
| `smooch`    | Linked to a Smooch account.                                                                |
| `intercom`  | Linked to an Intercom account.                                                             |
| `truly`     | Linked to a truly account.                                                                 |
| `custom`    | For messages sent and received only through the API (cf [Custom inboxes](#custom-inboxes)).|



## List channels
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/channels'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/channels"
  },
  "_results": [
    {
      "_links": {
        "self": "https://api2.frontapp.com/channels/cha_55c8c149",
        "related": {
          "inbox": "https://api2.frontapp.com/channels/cha_55c8c149/inbox"
        }
      },
      "id": "cha_55c8c149",
      "address": "team@planet-express.con",
      "type": "email",
      "send_as": "team@planet-express.com",
      "settings": {}
    }
  ]
}
```
Lists all the shared channels available in your company.



### HTTP Request

`GET https://api2.frontapp.com/channels`
## Get a channel
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/channels/${CHANNEL_ID}'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/channels/cha_55c8c149",
    "related": {
      "inbox": "https://api2.frontapp.com/channels/cha_55c8c149/inbox"
    }
  },
  "id": "cha_55c8c149",
  "address": "team@planet-express.con",
  "type": "email",
  "send_as": "team@planet-express.com",
  "settings": {}
}
```
Fetches the information of a channel. See [resource aliases](#resource-aliases) to fetch by address.



### HTTP Request

`GET https://api2.frontapp.com/channels/{channel_id}`
### Parameters


Name | Type | Description
-----|------|------------
channel_id | string | Id of the requested channel

## Update a channel settings
```shell

curl --include \
     --request PATCH \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"settings\": {
    \"webhook_url\": \"http://example.com\"
  }
}" \
'https://api2.frontapp.com/channels/${CHANNEL_ID}'
```

```node

```

> Response **204**

Updates the settings of a channel.

<aside class="info">
As of today, you can only update the settings of a <a href="#custom-channels">custom channel</a> with the API.
</aside>



### HTTP Request

`PATCH https://api2.frontapp.com/channels/{channel_id}`
### Parameters


Name | Type | Description
-----|------|------------
channel_id | string | Id of the requested channel

### Body


Name | Type | Description
-----|------|------------
settings | object | 
settings.webhook_url | string (optional) | `custom` type only. URL to which will be sent the replies of a custom message.

## Create a channel
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"type\": \"custom\",
  \"settings\": {
    \"webhook_url\": \"http://example.com\"
  }
}" \
'https://api2.frontapp.com/inboxes/${INBOX_ID}/channels'
```

```node

```

> Response **201**

```json
{
  "id": "cha_55c8c149",
  "type": "custom",
  "address": "dw0a0b7aeg36cb56",
  "sendAs": "dw0a0b7aeg36cb56",
  "settings": {
    "webhook_url": "http://example.com"
  }
}
```
Creates a channel linked to the requested inbox.

<aside class="info">
As of today, you can only create a <a href="#custom-channels">custom channel</a> with the API.
</aside>



### HTTP Request

`POST https://api2.frontapp.com/inboxes/{inbox_id}/channels`
### Parameters


Name | Type | Description
-----|------|------------
inbox_id | string | Id of the inbox into which the channel messages will go.

### Body


Name | Type | Description
-----|------|------------
type | enum | Type of the channel.
settings | object | 
settings.webhook_url | string (optional) | `custom` type only. URL to which will be sent the replies of a custom message.

## Get channel inbox
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/channels/${CHANNEL_ID}/inbox'
```

```node

```

> Response **200**

```json
{
  "id": "inb_55c8c149",
  "address": "team@planet-express.com",
  "type": "email",
  "name": "Team",
  "send_as": "team@planet-express.com",
  "_links": {
    "self": "https://api2.frontapp.com/inboxes/inb_55c8c149",
    "related": {
      "teammates": "https://api2.frontapp.com/inboxes/inb_55c8c149/teammates",
      "conversations": "https://api2.frontapp.com/inboxes/inb_55c8c149/conversations",
      "channels": "https://api2.frontapp.com/inboxes/inb_55c8c149/channels"
    }
  }
}
```
Fetches the inbox to which the channel is linked to.



### HTTP Request

`GET https://api2.frontapp.com/channels/{channel_id}/inbox`
### Parameters


Name | Type | Description
-----|------|------------
channel_id | string | Id of the requested channel

# Conversations
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the conversation
subject | string | Subject of the conversation
status | enum (optional) | Status of the conversation
assignee | Teammate (optional) | Partial representation of the teammate assigned to the conversation
recipient | Recipient | Main recipient of the conversation
tags | array | List of the tags for this conversation
last_message | Message | List of partial representation of the messages inside the conversation
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the conversation
_links.related | object | 
_links.related.events | string | URL of the activities related to the conversation
_links.related.followers | string | URL of the teammates following the conversation
_links.related.messages | string | URL of the list of messages in the conversation
_links.related.comments | string | URL of the comments for the conversation
_links.related.inboxes | string | URL of the inboxes in which the conversation appears

A conversation is a unique thread of messages. It can appear in one or more inboxes (eg: if you receive an email on contact@ where support@ is Cced).

Even if a conversation messages can have multiple recipients, the conversation resource will always have only one. The main recipient of a conversation can change over the time depending on each message received. It will generally be the sender of the last incomming message.



## List conversations
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations?q=${Q}&page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/conversations"
  },
  "_results": [
    {
      "id": "cnv_55c8c149",
      "subject": "You broke my heart, Hubert.",
      "status": "archived",
      "assignee": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "recipient": {
        "handle": "calculon@momsbot.com",
        "role": "to",
        "_links": {
          "related": {
            "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
          }
        }
      },
      "tags": [
        {
          "id": "tag_55c8c149",
          "name": "Robots",
          "_links": {
            "self": "https://api2.frontapp.com/tags/tag_55c8c149",
            "related": {
              "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
            }
          }
        }
      ],
      "last_message": {
        "id": "msg_55c8c149",
        "type": "email",
        "is_inbound": true,
        "created_at": 1453770984.123,
        "blurb": "Anything less than immortality is a...",
        "author": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
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
        "attachments": [
          {
            "filename": "attachment.jpg",
            "url": "http://example.com/attachment.jpg",
            "content_type": "image/jpeg",
            "size": 10000
          }
        ],
        "_links": {
          "self": "https://api2.frontapp.com/messages/msg_55c8c149",
          "related": {
            "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
            "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
        "related": {
          "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
          "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
          "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
          "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
          "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
        }
      }
    }
  ]
}
```
Lists all the conversations in your company in reverse chronological order (latest updated first).



### HTTP Request

`GET https://api2.frontapp.com/conversations?q={q}&page={page}`
### Parameters


Name | Type | Description
-----|------|------------
q | object (optional) | Search query. See Search Parameters
page | number (optional) | Number of the page requested

## Get conversation
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "cnv_55c8c149",
  "subject": "You broke my heart, Hubert.",
  "status": "archived",
  "assignee": {
    "id": "tea_55c8c149",
    "email": "leela@planet-express.com",
    "username": "leela",
    "first_name": "Leela",
    "last_name": "Turanga",
    "is_admin": true,
    "is_available": true,
    "_links": {
      "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
      "related": {
        "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
        "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
      }
    }
  },
  "recipient": {
    "handle": "calculon@momsbot.com",
    "role": "to",
    "_links": {
      "related": {
        "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
      }
    }
  },
  "tags": [
    {
      "id": "tag_55c8c149",
      "name": "Robots",
      "_links": {
        "self": "https://api2.frontapp.com/tags/tag_55c8c149",
        "related": {
          "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
        }
      }
    }
  ],
  "last_message": {
    "id": "msg_55c8c149",
    "type": "email",
    "is_inbound": true,
    "created_at": 1453770984.123,
    "blurb": "Anything less than immortality is a...",
    "author": {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
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
    "attachments": [
      {
        "filename": "attachment.jpg",
        "url": "http://example.com/attachment.jpg",
        "content_type": "image/jpeg",
        "size": 10000
      }
    ],
    "_links": {
      "self": "https://api2.frontapp.com/messages/msg_55c8c149",
      "related": {
        "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
        "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
      }
    }
  },
  "_links": {
    "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
    "related": {
      "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
      "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
      "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
      "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
      "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
    }
  }
}
```
Fetches the information of a conversation.



### HTTP Request

`GET https://api2.frontapp.com/conversations/{conversation_id}`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation

## Update conversation
```shell

curl --include \
     --request PATCH \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"assignee_id\": \"alt:email:fry@planet-express.com\",
  \"status\": \"archived\",
  \"tags\": [
    \"time travel\"
  ]
}" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}'
```

```node

```

> Response **204**

Updates a conversation. You can:

* Assign or unassign a conversation by sending an `assignee_id`

* Update the tags of a conversation by sending an array `tags` containing the names of the all the tag of a conversation (unknown tags will be automatically created)

* Archive a conversation by sending `archived` in `status`

* Delete a conversation by sending `deleted` in `status`

* Mark a conversation as spam by sending `spam` in `status`

* Unarchive or restore a conversation  by sending `open` in `status`



### HTTP Request

`PATCH https://api2.frontapp.com/conversations/{conversation_id}`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation

### Body


Name | Type | Description
-----|------|------------
assignee_id | string (optional) | ID or email of the teammate to assign the conversation to. Set it to null to unassign.
status | enum (optional) | New status of the conversation
tags | array (optional) | List of all the tag names replacing the old conversation tags

## List conversation inboxes
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/inboxes'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
  },
  "_results": [
    {
      "id": "inb_55c8c149",
      "address": "team@planet-express.com",
      "type": "email",
      "name": "Team",
      "send_as": "team@planet-express.com",
      "_links": {
        "self": "https://api2.frontapp.com/inboxes/inb_55c8c149",
        "related": {
          "teammates": "https://api2.frontapp.com/inboxes/inb_55c8c149/teammates",
          "conversations": "https://api2.frontapp.com/inboxes/inb_55c8c149/conversations",
          "channels": "https://api2.frontapp.com/inboxes/inb_55c8c149/channels"
        }
      }
    }
  ]
}
```
Lists the inboxes in which a conversation appears.



### HTTP Request

`GET https://api2.frontapp.com/conversations/{conversation_id}/inboxes`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation

## List conversation followers
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/followers'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers"
  },
  "_results": [
    {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
    }
  ]
}
```
Lists the teammates following a conversation.



### HTTP Request

`GET https://api2.frontapp.com/conversations/{conversation_id}/followers`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation

## List conversation events
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/events?page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/conversations/cnv_55c8c149/events"
  },
  "_results": [
    {
      "id": "evt_55c8c149",
      "type": "assign",
      "emitted_at": 1453770984.123,
      "source": {
        "_meta": {
          "type": "rule"
        },
        "data": {
          "id": "rul_55c8c149",
          "name": "Important deliveries",
          "actions": [
            "Assign to Leela Turanga"
          ],
          "_links": {
            "self": "https://api2.frontapp.com/rules/rul_55c8c149"
          }
        }
      },
      "target": {
        "_meta": {
          "type": "teammate"
        },
        "data": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
        }
      },
      "conversation": {
        "id": "cnv_55c8c149",
        "subject": "You broke my heart, Hubert.",
        "status": "archived",
        "assignee": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
        },
        "recipient": {
          "handle": "calculon@momsbot.com",
          "role": "to",
          "_links": {
            "related": {
              "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
            }
          }
        },
        "tags": [
          {
            "id": "tag_55c8c149",
            "name": "Robots",
            "_links": {
              "self": "https://api2.frontapp.com/tags/tag_55c8c149",
              "related": {
                "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
              }
            }
          }
        ],
        "last_message": {
          "id": "msg_55c8c149",
          "type": "email",
          "is_inbound": true,
          "created_at": 1453770984.123,
          "blurb": "Anything less than immortality is a...",
          "author": {
            "id": "tea_55c8c149",
            "email": "leela@planet-express.com",
            "username": "leela",
            "first_name": "Leela",
            "last_name": "Turanga",
            "is_admin": true,
            "is_available": true,
            "_links": {
              "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
              "related": {
                "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
                "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
              }
            }
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
          "attachments": [
            {
              "filename": "attachment.jpg",
              "url": "http://example.com/attachment.jpg",
              "content_type": "image/jpeg",
              "size": 10000
            }
          ],
          "_links": {
            "self": "https://api2.frontapp.com/messages/msg_55c8c149",
            "related": {
              "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
              "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
            }
          }
        },
        "_links": {
          "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
          "related": {
            "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
            "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
            "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
            "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
            "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/events/evt_55c8c149"
      }
    }
  ]
}
```
List of all the events that occured for a conversation in reverse chronological order (newest first).



### HTTP Request

`GET https://api2.frontapp.com/conversations/{conversation_id}/events?page={page}`
### Parameters


Name | Type | Description
-----|------|------------
page | number (optional) | Number of the page requested
conversation_id | string | Id of the requested conversation

## List conversation messages
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/messages?page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages"
  },
  "_results": [
    {
      "id": "msg_55c8c149",
      "type": "email",
      "is_inbound": true,
      "created_at": 1453770984.123,
      "blurb": "Anything less than immortality is a...",
      "author": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
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
      "attachments": [
        {
          "filename": "attachment.jpg",
          "url": "http://example.com/attachment.jpg",
          "content_type": "image/jpeg",
          "size": 10000
        }
      ],
      "_links": {
        "self": "https://api2.frontapp.com/messages/msg_55c8c149",
        "related": {
          "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
          "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
        }
      }
    }
  ]
}
```
Lists all the messages sent or received in a conversation in reverse chronological order (newest first).



### HTTP Request

`GET https://api2.frontapp.com/conversations/{conversation_id}/messages?page={page}`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation
page | number (optional) | Number of the page requested

# Comments
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the comment
author | Teammate | Teammate who wrote the comment
body | string | Content of the comment
posted_at | number | Date at which the comment have been posted
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the comment
_links.related | object | 
_links.related.conversation | string | URL of the conversation from which the comment belongs
_links.related.mentions | string | URL of the teammates mentionned in a comment

A comment is a private message written by a teammate visible only to the other teammates. It is never sent and cannot be shared outside of Front.



## Create comment
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"author_id\": \"alt:email:leela@planet-express.com\",
  \"body\": \"@bender, I thought you were supposed to be cooking for this party.\"
}" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/comments'
```

```node

```

> Response **201**

```json
{
  "id": "com_55c8c149",
  "author": {
    "id": "tea_55c8c149",
    "email": "leela@planet-express.com",
    "username": "leela",
    "first_name": "Leela",
    "last_name": "Turanga",
    "is_admin": true,
    "is_available": true,
    "_links": {
      "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
      "related": {
        "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
        "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
      }
    }
  },
  "body": "@bender, I thought you were supposed to be cooking for this party.",
  "posted_at": 1453770984.123,
  "_links": {
    "self": "https://api2.frontapp.com/comments/inb_55c8c149",
    "related": {
      "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
      "mentions": "https://api2.frontapp.com/comments/com_55c8c149/mentions"
    }
  }
}
```
Adds a comment to a conversation.



### HTTP Request

`POST https://api2.frontapp.com/conversations/{conversation_id}/comments`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation

### Body


Name | Type | Description
-----|------|------------
author_id | string | ID or email of the teammate creating the comment
body | string | Content of the comment

## List conversation comments
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/comments'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments"
  },
  "_results": [
    {
      "id": "com_55c8c149",
      "author": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "body": "@bender, I thought you were supposed to be cooking for this party.",
      "posted_at": 1453770984.123,
      "_links": {
        "self": "https://api2.frontapp.com/comments/inb_55c8c149",
        "related": {
          "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
          "mentions": "https://api2.frontapp.com/comments/com_55c8c149/mentions"
        }
      }
    }
  ]
}
```
Lists of all the comments written in a conversation in reverse chronological order (newest first).



### HTTP Request

`GET https://api2.frontapp.com/conversations/{conversation_id}/comments`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the requested conversation

## Get comment
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/comments/${COMMENT_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "com_55c8c149",
  "author": {
    "id": "tea_55c8c149",
    "email": "leela@planet-express.com",
    "username": "leela",
    "first_name": "Leela",
    "last_name": "Turanga",
    "is_admin": true,
    "is_available": true,
    "_links": {
      "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
      "related": {
        "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
        "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
      }
    }
  },
  "body": "@bender, I thought you were supposed to be cooking for this party.",
  "posted_at": 1453770984.123,
  "_links": {
    "self": "https://api2.frontapp.com/comments/inb_55c8c149",
    "related": {
      "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
      "mentions": "https://api2.frontapp.com/comments/com_55c8c149/mentions"
    }
  }
}
```
Fetches the information of a comment.



### HTTP Request

`GET https://api2.frontapp.com/comments/{comment_id}`
### Parameters


Name | Type | Description
-----|------|------------
comment_id | string | Id of the comment

## List comment mentions
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/comments/${COMMENT_ID}/mentions'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/comments/com_55c8c149/mentions"
  },
  "_results": [
    {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
    }
  ]
}
```
Lists the teammates mentionned in a comment.



### HTTP Request

`GET https://api2.frontapp.com/comments/{comment_id}/mentions`
### Parameters


Name | Type | Description
-----|------|------------
comment_id | string | Id of the comment

# Messages
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the message
type | enum | Type of the message
is_inbound | boolean | Whether or not the message has been received or sent
created_at | number | Date at which the message as been sent or received
blurb | string | Preview of the message body
author | Teammate (optional) | In case of a message sent from Front by a teammate, it will include the teammate who sent it
recipients | array | List of the message recipients
body | string | Body of the message
text | string (optional) | Text version of the body for email messages
attachments | array | List of files attached to the message
metadata | object (optional) | Optional metadata about the message
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the message
_links.related | object | 
_links.related.conversation | string | URL of the parent conversation
_links.related.message_replied_to | string (optional) | URL of the message which have been replied to

A message is a resource which can be either received or sent via an inbox. Messages are grouped by conversations.

A message can be either inbound (received) or outbound (sent). You can know if a message has been received or sent thanks to the boolean `is_inbound`.



## Get  message
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/messages/${MESSAGE_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "msg_55c8c149",
  "type": "email",
  "is_inbound": true,
  "created_at": 1453770984.123,
  "blurb": "Anything less than immortality is a...",
  "author": {
    "id": "tea_55c8c149",
    "email": "leela@planet-express.com",
    "username": "leela",
    "first_name": "Leela",
    "last_name": "Turanga",
    "is_admin": true,
    "is_available": true,
    "_links": {
      "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
      "related": {
        "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
        "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
      }
    }
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
  "attachments": [
    {
      "filename": "attachment.jpg",
      "url": "http://example.com/attachment.jpg",
      "content_type": "image/jpeg",
      "size": 10000
    }
  ],
  "_links": {
    "self": "https://api2.frontapp.com/messages/msg_55c8c149",
    "related": {
      "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
      "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
    }
  }
}
```
Fetches the information of a message.



### HTTP Request

`GET https://api2.frontapp.com/messages/{message_id}`
### Parameters


Name | Type | Description
-----|------|------------
message_id | string | Id of the requested message

## Send a message
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"author_id\": \"alt:email:leela@planet-exress.com\",
  \"subject\": \"Good news everyone!\",
  \"body\": \"Why is Zoidberg the only one still alone?\",
  \"text\": \"Why is Zoidberg the only one still alone?\",
  \"options\": {
    \"archive\": true
  },
  \"to\": [
    \"calculon@momsbot.com\"
  ],
  \"cc\": [],
  \"bcc\": []
}" \
'https://api2.frontapp.com/channels/${CHANNEL_ID}/messages'
```

```node

```

> Response **202**

Sends a new message from a channel. It will create a new conversation.



### HTTP Request

`POST https://api2.frontapp.com/channels/{channel_id}/messages`
### Parameters


Name | Type | Description
-----|------|------------
channel_id | string | Id or address of the channel from which to send the message

### Body


Name | Type | Description
-----|------|------------
author_id | string (optional) | ID or email of the teammate on behalf of whom the answer is sent
subject | string (optional) | Subject of the message for email message
body | string | Body of the message
text | string (optional) | Text version of the body for messages with non-text body
options | object (optional) | Sending options
options.archive | boolean (optional) | Archive the conversation right when sending the reply (default: `true`)
to | array | List of the recipient handles who will receive this message
cc | array (optional) | List of the recipient handles who will receive a copy of this message
bcc | array (optional) | List of the recipient handles who will receive a blind copy of this message

## Send a reply
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"author_id\": \"alt:email:leela@planet-exress.com\",
  \"subject\": \"Good news everyone!\",
  \"body\": \"Why is Zoidberg the only one still alone?\",
  \"text\": \"Why is Zoidberg the only one still alone?\",
  \"options\": {
    \"archive\": true
  },
  \"channel_id\": \"cha_55c8c149\",
  \"to\": [],
  \"cc\": [],
  \"bcc\": []
}" \
'https://api2.frontapp.com/conversations/${CONVERSATION_ID}/messages'
```

```node

```

> Response **202**

Replies to a conversation by sending a message and appending it to the conversation.



### HTTP Request

`POST https://api2.frontapp.com/conversations/{conversation_id}/messages`
### Parameters


Name | Type | Description
-----|------|------------
conversation_id | string | Id of the conversation

### Body


Name | Type | Description
-----|------|------------
author_id | string (optional) | ID or email of the teammate on behalf of whom the answer is sent
subject | string (optional) | Subject of the message for email message
body | string | Body of the message
text | string (optional) | Text version of the body for messages with non-text body
options | object (optional) | Sending options
options.archive | boolean (optional) | Archive the conversation right when sending the reply (default: `true`)
channel_id | string (optional) | Channel through which to send the message. Defaults to the original conversation channel. For imported messages or messages received on multiple channels, you **MUST** specify a channel ID.
to | array (optional) | List of the recipient handles who will receive this message. By default it will use the recipients of the last received message.
cc | array (optional) | List of the recipient handles who will receive a copy of this message. By default it will use the cc'ed recipients of the last received message.
bcc | array (optional) | List of the recipient handles who will receive a blind copy of this message

## Import a message
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"sender\": {
    \"handle\": \"@calculon\",
    \"source\": \"twitter\"
  },
  \"subject\": \"100th-delivery party\",
  \"body\": \"Why am I not invited?\",
  \"body_format\": \"html\",
  \"metadata\": {
    \"external_id\": \"\"
  }
}" \
'https://api2.frontapp.com/inboxes/${INBOX_ID}/import'
```

```node

```

> Response **202**

Adds a new message into an inbox.

<aside class="info">
Imported messages and conversations will <strong>NOT</strong> be linked to any channels until a reply is sent. When replying to a conversation with no channels, you <strong>MUST</strong> choose from which channel to send the message.
</aside>



### HTTP Request

`POST https://api2.frontapp.com/inboxes/{inbox_id}/import`
### Parameters


Name | Type | Description
-----|------|------------
inbox_id | string | Id of the requested inbox

### Body


Name | Type | Description
-----|------|------------
sender | Contact handle | Sender of the message
subject | string (optional) | Subject of the message
body | string | Body of the message
body_format | enum (optional) | Format of the body (default: `[object Object]`)
metadata | object | 
metadata.external_id | string | Unique external identifier
metadata.thread_ref | string (optional) | Custom reference which will be used to thread messages. If you ommit this field, we'll thread the messages by sender
metadata.headers | object (optional) | Optional object for you to put message related information which will be kept in Front

## Receive a custom message
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"sender\": {
    \"name\": \"hermes\",
    \"handle\": \"hermes_123\"
  },
  \"subject\": \"Question\",
  \"body\": \"Didn't we used to be a delivery company?\",
  \"body_format\": \"html\",
  \"metadata\": {}
}" \
'https://api2.frontapp.com/channels/${CHANNEL_ID}/incoming_messages'
```

```node

```

> Response **202**

Simulate the reception of an incoming message. This endpoint is available for [custom channels](#custom-channels) **ONLY**.



### HTTP Request

`POST https://api2.frontapp.com/channels/{channel_id}/incoming_messages`
### Parameters


Name | Type | Description
-----|------|------------
channel_id | string | Id of the requested custom channel

### Body


Name | Type | Description
-----|------|------------
sender | object | Data of the sender
sender.contact_id | string (optional) | ID of the contact in Front corresponding to the sender
sender.name | string (optional) | Name of the sender
sender.handle | string | Handle of the sender. It can be any string used to uniquely identify the sender
subject | string (optional) | Subject of the message
body | string | Body of the message
body_format | enum (optional) | Format of the body (default: `[object Object]`)
metadata | object (optional) | Optional metadata about the message
metadata.thread_ref | string (optional) | Custom reference which will be used to thread messages. If you ommit this field, we'll thread by sender instead

# Contacts
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the contact
name | string | Contact name
description | string | Contact description
avatar_url | string | URL of the contact's avatar
is_spammer | boolean | Whether or not the contact is a spammer
links | array | A set of URL associated to the contact
handles | array | List of the handles and sources with which the contact is reachable.
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the contact
_links.related | object | 
_links.related.notes | string | URL to list the notes associated to the contact
_links.related.conversations | string | URL to list the URL associated to the contact

A contact is a person/entity with whom you have communicated.

A contact has several handles to send messages to it. A handle has a source to identify which inbox can send message to this contact:

| Source    | Description      | Example of handle       |
|-----------|------------------|-------------------------|
| `email`   | An email address | `calculon@pmomsbot.com` |
| `phone`   | A phone number   | `+123445678900 `        |
| `twitter` | A twitter handle | `@calculon`             |

Each pair handle/source is unique in your company. If you want to move an existing handle from one contact to an other, you need to delete it from the first one and add it to the other one.



## List contacts
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/contacts?page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/contacts"
  },
  "_results": [
    {
      "id": "ctc_55c8c149",
      "name": "Calculon",
      "description": "#vip #robot #RIP",
      "avatar_url": "http://example.com/calculon.jpg",
      "is_spammer": true,
      "links": [
        "http://example.com"
      ],
      "handles": [
        {
          "handle": "@calculon",
          "source": "twitter"
        }
      ],
      "_links": {
        "self": "https://api2.frontapp.com/contacts/ctc_55c8c149",
        "related": {
          "notes": "https://api2.frontapp.com/contacts/ctc_55c8c149/notes",
          "conversations": "https://api2.frontapp.com/contacts/ctc_55c8c149/conversations"
        }
      }
    }
  ]
}
```
List all the contacts in your company in alphabetical order.



### HTTP Request

`GET https://api2.frontapp.com/contacts?page={page}`
### Parameters


Name | Type | Description
-----|------|------------
page | number (optional) | Number of the page requested

## Get contact
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "ctc_55c8c149",
  "name": "Calculon",
  "description": "#vip #robot #RIP",
  "avatar_url": "http://example.com/calculon.jpg",
  "is_spammer": true,
  "links": [
    "http://example.com"
  ],
  "handles": [
    {
      "handle": "@calculon",
      "source": "twitter"
    }
  ],
  "_links": {
    "self": "https://api2.frontapp.com/contacts/ctc_55c8c149",
    "related": {
      "notes": "https://api2.frontapp.com/contacts/ctc_55c8c149/notes",
      "conversations": "https://api2.frontapp.com/contacts/ctc_55c8c149/conversations"
    }
  }
}
```
Fetches the information of a contact. See [resource aliases](#resource-aliases) to fetch by handle.



### HTTP Request

`GET https://api2.frontapp.com/contacts/{contact_id}`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

## Update a contact
```shell

curl --include \
     --request PATCH \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"name\": \"Calculon\",
  \"description\": \"#vip #robot #RIP\",
  \"avatar_url\": \"http://example.com/calculon.jpg\",
  \"is_spammer\": true,
  \"links\": [
    \"http://example.com\"
  ]
}" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}'
```

```node

```

> Response **204**

Updates a contact information.



### HTTP Request

`PATCH https://api2.frontapp.com/contacts/{contact_id}`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

### Body


Name | Type | Description
-----|------|------------
name | string (optional) | Contact name
description | string (optional) | Contact description
avatar_url | string (optional) | URL of the contact's avatar
is_spammer | boolean (optional) | Whether or not the contact is marked as a spammer
links | array (optional) | List of all the links of a contact

## Create contact
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"name\": \"Calculon\",
  \"description\": \"#vip #robot #RIP\",
  \"avatar_url\": \"http://example.com/calculon.jpg\",
  \"is_spammer\": true,
  \"links\": [
    \"http://example.com\"
  ],
  \"handles\": [
    {
      \"handle\": \"@calculon\",
      \"source\": \"twitter\"
    }
  ]
}" \
'https://api2.frontapp.com/contacts'
```

```node

```

> Response **201**

```json
{
  "id": "ctc_55c8c149",
  "name": "Calculon",
  "description": "#vip #robot #RIP",
  "avatar_url": "http://example.com/calculon.jpg",
  "is_spammer": true,
  "links": [
    "http://example.com"
  ],
  "handles": [
    {
      "handle": "@calculon",
      "source": "twitter"
    }
  ],
  "_links": {
    "self": "https://api2.frontapp.com/contacts/ctc_55c8c149",
    "related": {
      "notes": "https://api2.frontapp.com/contacts/ctc_55c8c149/notes",
      "conversations": "https://api2.frontapp.com/contacts/ctc_55c8c149/conversations"
    }
  }
}
```
Creates a new contact.



### HTTP Request

`POST https://api2.frontapp.com/contacts`
### Body


Name | Type | Description
-----|------|------------
name | string (optional) | Contact name
description | string (optional) | Contact description
avatar_url | string (optional) | URL of the contact's avatar
is_spammer | boolean (optional) | Whether or not the contact is marked as a spammer
links | array (optional) | List of all the links of a contact
handles | array | List of the handles of a contact

## Delete contact
```shell

curl --include \
     --request DELETE \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}'
```

```node

```

> Response **204**

Deletes a contact.



### HTTP Request

`DELETE https://api2.frontapp.com/contacts/{contact_id}`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

## List contact conversations
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}/conversations?q=${Q}&page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/contacts/ctc_55c8c149/conversations"
  },
  "_results": [
    {
      "id": "cnv_55c8c149",
      "subject": "You broke my heart, Hubert.",
      "status": "archived",
      "assignee": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "recipient": {
        "handle": "calculon@momsbot.com",
        "role": "to",
        "_links": {
          "related": {
            "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
          }
        }
      },
      "tags": [
        {
          "id": "tag_55c8c149",
          "name": "Robots",
          "_links": {
            "self": "https://api2.frontapp.com/tags/tag_55c8c149",
            "related": {
              "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
            }
          }
        }
      ],
      "last_message": {
        "id": "msg_55c8c149",
        "type": "email",
        "is_inbound": true,
        "created_at": 1453770984.123,
        "blurb": "Anything less than immortality is a...",
        "author": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
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
        "attachments": [
          {
            "filename": "attachment.jpg",
            "url": "http://example.com/attachment.jpg",
            "content_type": "image/jpeg",
            "size": 10000
          }
        ],
        "_links": {
          "self": "https://api2.frontapp.com/messages/msg_55c8c149",
          "related": {
            "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
            "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
        "related": {
          "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
          "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
          "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
          "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
          "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
        }
      }
    }
  ]
}
```
Lists all the conversations with a contact in reverse chronological order (newest first).



### HTTP Request

`GET https://api2.frontapp.com/contacts/{contact_id}/conversations?q={q}&page={page}`
### Parameters


Name | Type | Description
-----|------|------------
q | object (optional) | Search query. See Search Parameters
page | number (optional) | Number of the page requested
contact_id | string | Id or alias of the requested contact

# Contact handles
> 
Name | Type | Description
-----|------|------------
handle | string | Handle used to reach the contact. Can be an email address, a twitter, handle, a phone number, ...
source | enum | Can be 'twitter', 'email' or 'phone'.



## Add contact handle
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"handle\": \"@calculon\",
  \"source\": \"twitter\"
}" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}/handles'
```

```node

```

> Response **204**

Adds a new handle/source to a contact.



### HTTP Request

`POST https://api2.frontapp.com/contacts/{contact_id}/handles`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

### Body


Name | Type | Description
-----|------|------------
handle | string | Handle used to reach the contact. Can be an email address, a twitter, handle, a phone number, ...
source | enum | Can be 'twitter', 'email' or 'phone'.

## Delete contact handle
```shell

curl --include \
     --request DELETE \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"handle\": \"@calculon\",
  \"source\": \"twitter\"
}" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}/handles'
```

```node

```

> Response **204**

Removes a handle/source from a contact.



### HTTP Request

`DELETE https://api2.frontapp.com/contacts/{contact_id}/handles`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

### Body


Name | Type | Description
-----|------|------------
handle | string | Handle used to reach the contact. Can be an email address, a twitter, handle, a phone number, ...
source | enum | Can be 'twitter', 'email' or 'phone'.

# Contact notes
> 
Name | Type | Description
-----|------|------------
author | Teammate | Teammate who wrote the note
body | string | Content of the note
created_at | number | Date at which the note have been created



## List contact notes
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}/notes'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/contacts/ctc_55c8c149/notes"
  },
  "_results": [
    {
      "author": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "body": "Calculon is a celebrated actor",
      "created_at": 1453770984.123
    }
  ]
}
```
Lists the notes added to a contact.



### HTTP Request

`GET https://api2.frontapp.com/contacts/{contact_id}/notes`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

## Add a note
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"author_id\": \"alt:email:leela@planet-express.com\",
  \"body\": \"Calculon is a celebrated actor\"
}" \
'https://api2.frontapp.com/contacts/${CONTACT_ID}/notes'
```

```node

```

> Response **201**

```json
{
  "author": {
    "id": "tea_55c8c149",
    "email": "leela@planet-express.com",
    "username": "leela",
    "first_name": "Leela",
    "last_name": "Turanga",
    "is_admin": true,
    "is_available": true,
    "_links": {
      "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
      "related": {
        "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
        "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
      }
    }
  },
  "body": "Calculon is a celebrated actor",
  "created_at": 1453770984.123
}
```
Adds a new note to a contact.



### HTTP Request

`POST https://api2.frontapp.com/contacts/{contact_id}/notes`
### Parameters


Name | Type | Description
-----|------|------------
contact_id | string | Id or alias of the requested contact

### Body


Name | Type | Description
-----|------|------------
author_id | string | ID or email of the teammate creating the comment
body | string | Content of the note

# Tags
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the tag
name | string | Name of the tag
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the tag
_links.related | object | 
_links.related.conversations | string | URL of the list of conversations tagged with this tag

A tag is a label that can be used to classify conversations.



## List tags
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/tags'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/tags"
  },
  "_results": [
    {
      "id": "tag_55c8c149",
      "name": "Robots",
      "_links": {
        "self": "https://api2.frontapp.com/tags/tag_55c8c149",
        "related": {
          "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
        }
      }
    }
  ]
}
```
Lists all the tags available in your company.



### HTTP Request

`GET https://api2.frontapp.com/tags`
## Create tag
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"name\": \"Robots\"
}" \
'https://api2.frontapp.com/tags'
```

```node

```

> Response **201**

```json
{
  "id": "tag_55c8c149",
  "name": "Robots",
  "_links": {
    "self": "https://api2.frontapp.com/tags/tag_55c8c149",
    "related": {
      "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
    }
  }
}
```
Creates a new tag.



### HTTP Request

`POST https://api2.frontapp.com/tags`
### Body


Name | Type | Description
-----|------|------------
name | string | Name of the tag to create

## Get tag
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/tags/${TAG_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "tag_55c8c149",
  "name": "Robots",
  "_links": {
    "self": "https://api2.frontapp.com/tags/tag_55c8c149",
    "related": {
      "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
    }
  }
}
```
Fetches the information of a tag.



### HTTP Request

`GET https://api2.frontapp.com/tags/{tag_id}`
### Parameters


Name | Type | Description
-----|------|------------
tag_id | string | ID of the requested tag

## List tag conversations
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/tags/${TAG_ID}/conversations?q=${Q}&page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
  },
  "_results": [
    {
      "id": "cnv_55c8c149",
      "subject": "You broke my heart, Hubert.",
      "status": "archived",
      "assignee": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
      },
      "recipient": {
        "handle": "calculon@momsbot.com",
        "role": "to",
        "_links": {
          "related": {
            "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
          }
        }
      },
      "tags": [
        {
          "id": "tag_55c8c149",
          "name": "Robots",
          "_links": {
            "self": "https://api2.frontapp.com/tags/tag_55c8c149",
            "related": {
              "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
            }
          }
        }
      ],
      "last_message": {
        "id": "msg_55c8c149",
        "type": "email",
        "is_inbound": true,
        "created_at": 1453770984.123,
        "blurb": "Anything less than immortality is a...",
        "author": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
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
        "attachments": [
          {
            "filename": "attachment.jpg",
            "url": "http://example.com/attachment.jpg",
            "content_type": "image/jpeg",
            "size": 10000
          }
        ],
        "_links": {
          "self": "https://api2.frontapp.com/messages/msg_55c8c149",
          "related": {
            "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
            "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
        "related": {
          "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
          "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
          "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
          "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
          "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
        }
      }
    }
  ]
}
```
Lists all the conversations tagged with a specific tag.



### HTTP Request

`GET https://api2.frontapp.com/tags/{tag_id}/conversations?q={q}&page={page}`
### Parameters


Name | Type | Description
-----|------|------------
tag_id | string | ID of the requested tag
q | object (optional) | Search query. See Search Parameters
page | number (optional) | Number of the page requested

# Rules
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the rule
name | string | Name of the rule
actions | array | List of the rule's actions description
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the rule

A rule is a set of conditions which will trigger automatic actions when they are met.

Since the set of conditions and actions associated to a rule can be quite complicated, the API exposes a human readable version of those.



## List rules
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/rules'
```

```node

```

> Response **200**

```json
{
  "_links": {
    "self": "https://api2.frontapp.com/rules"
  },
  "_results": [
    {
      "id": "rul_55c8c149",
      "name": "Important deliveries",
      "actions": [
        "Assign to Leela Turanga"
      ],
      "_links": {
        "self": "https://api2.frontapp.com/rules/rul_55c8c149"
      }
    }
  ]
}
```
Lists all the shared rules in your company. Individual rules are currently not accessible with the API.



### HTTP Request

`GET https://api2.frontapp.com/rules`
## Get rule
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/rules/${RULE_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "rul_55c8c149",
  "name": "Important deliveries",
  "actions": [
    "Assign to Leela Turanga"
  ],
  "_links": {
    "self": "https://api2.frontapp.com/rules/rul_55c8c149"
  }
}
```
Fetches the definition of a rule.



### HTTP Request

`GET https://api2.frontapp.com/rules/{rule_id}`
### Parameters


Name | Type | Description
-----|------|------------
rule_id | string | ID of the requested rule

# Events
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier of the event
type | enum | Type of event
emitted_at | number | Date at which the event has been emitted
source | object | The event's source
source._meta | object | Metadata about the resource
source._meta.type | enum | 
source.data | enum (optional) | The resource which triggered the event
target | object (optional) | Partial representation (type & id) of the event's target
target._meta | object | Metadata about the resource
target._meta.type | enum | 
target.data | enum (optional) | The resource which received the event
conversation | Conversation | The conversation on which the event happened
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the event

An event is created everytime something interesting is happenning in Front. You'll find in the table bellow the description of all the types of event that exist:

| Type              | Description                                           |
|-------------------|-------------------------------------------------------|
| `assign`          | When a conversation is assigned to a teammate         |
| `unassign`        | When the assignee of a conversation is removed        |
| `archive`         | When a conversation is archived                       |
| `reopen`          | When a conversation is unarchived                     |
| `trash`           | When a conversation is deleted                        |
| `restore`         | When a conversation is removed from trash             |
| `comment`         | When a teammate comments on a conversation            |
| `mention`         | When a teammate mention another teammate              |
| `inbound`         | When an incoming message is received into an inbox    |
| `outbound`        | When an outbound message is sent from an inbox        |
| `move`            | When a conversation is moved to an inbox              |
| `forward`         | When a message is forwarded                           |
| `tag`             | When a conversation is tagged                         |
| `untag`           | When a conversation is untagged                       |
| `sending_error`   | When an inbox cannot send a message                   |
| `reminder`        | When a conversation is unarchived by a reminder       |
| `out_reply`       | When areply is sent                                   |

> *Example:*
> Event preview of a rule assigning a conversation to a teammate:

```json
{
    "_links"      : { "self": "https://api2.frontapp.com/events/evt_55c8c149" },
    "id"          : "evt_55c8c149",
    "type"        : "assign",
    "emitted_at"  : 1453770984.123,
    "source"      : {
        "_meta" : { "type": "rule" },
        "_links": { "self": "https://api2.frontapp.com/rules/rul_55c8c149" },
        "id"    : "rul_55c8c149"
    },
    "target"      : {
        "_meta" : { "type": "teammate" },
        "_links": { "self": "https://api2.frontapp.com/teammates/tea_55c8c149" },
        "id"    : "tea_55c8c149"
    },
    "conversation": {
        "_links": {
            "self"   : "https://api2.frontapp.com/conversations/cnv_55c8c149",
            "related": {
                "events"   : "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
                "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
                "messages" : "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
                "comments" : "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
                "inboxes"  : "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
            }
        },
        "id"    : "cnv_55c8c149"
    }
}
```

When receiving an event from Front (either via a [webhook](#webhooks) or via a [custom inbox](#custom-inboxes) callback), you will receive the preview of the event.
As the callback URL you provided is public, you should not blindly trust any incoming requests. This is why we're sending only a preview of the event.

An event preview has the exact same structure as the full event except that its `source`, `target` and `conversation` only contain an ID, a link to the resource itself and a type.
You can then either request the detailed event or each resources separately by following their respective `_links`.



## List events
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/events?q=${Q}&page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/events"
  },
  "_results": [
    {
      "id": "evt_55c8c149",
      "type": "assign",
      "emitted_at": 1453770984.123,
      "source": {
        "_meta": {
          "type": "rule"
        },
        "data": {
          "id": "rul_55c8c149",
          "name": "Important deliveries",
          "actions": [
            "Assign to Leela Turanga"
          ],
          "_links": {
            "self": "https://api2.frontapp.com/rules/rul_55c8c149"
          }
        }
      },
      "target": {
        "_meta": {
          "type": "teammate"
        },
        "data": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
        }
      },
      "conversation": {
        "id": "cnv_55c8c149",
        "subject": "You broke my heart, Hubert.",
        "status": "archived",
        "assignee": {
          "id": "tea_55c8c149",
          "email": "leela@planet-express.com",
          "username": "leela",
          "first_name": "Leela",
          "last_name": "Turanga",
          "is_admin": true,
          "is_available": true,
          "_links": {
            "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
            "related": {
              "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
              "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
            }
          }
        },
        "recipient": {
          "handle": "calculon@momsbot.com",
          "role": "to",
          "_links": {
            "related": {
              "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
            }
          }
        },
        "tags": [
          {
            "id": "tag_55c8c149",
            "name": "Robots",
            "_links": {
              "self": "https://api2.frontapp.com/tags/tag_55c8c149",
              "related": {
                "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
              }
            }
          }
        ],
        "last_message": {
          "id": "msg_55c8c149",
          "type": "email",
          "is_inbound": true,
          "created_at": 1453770984.123,
          "blurb": "Anything less than immortality is a...",
          "author": {
            "id": "tea_55c8c149",
            "email": "leela@planet-express.com",
            "username": "leela",
            "first_name": "Leela",
            "last_name": "Turanga",
            "is_admin": true,
            "is_available": true,
            "_links": {
              "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
              "related": {
                "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
                "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
              }
            }
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
          "attachments": [
            {
              "filename": "attachment.jpg",
              "url": "http://example.com/attachment.jpg",
              "content_type": "image/jpeg",
              "size": 10000
            }
          ],
          "_links": {
            "self": "https://api2.frontapp.com/messages/msg_55c8c149",
            "related": {
              "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
              "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
            }
          }
        },
        "_links": {
          "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
          "related": {
            "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
            "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
            "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
            "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
            "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
          }
        }
      },
      "_links": {
        "self": "https://api2.frontapp.com/events/evt_55c8c149"
      }
    }
  ]
}
```
Lists all the detailed events which occured in the inboxes of your company ordered in reverse chronological order (newest first).

<aside class="notice">
  Depending on how active your inboxes are, the events can pile up rather quickly.
  We recommend the use of `before` search parameter to ensure that the events in each page won't change over the time (see <a href="#search-criteria-for-events">Search criteria for events</a>).
</aside>



### HTTP Request

`GET https://api2.frontapp.com/events?q={q}&page={page}`
### Parameters


Name | Type | Description
-----|------|------------
q | object (optional) | Search query. See Search Parameters
page | number (optional) | Number of the page requested

## Get event
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/events/${EVENT_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "evt_55c8c149",
  "type": "assign",
  "emitted_at": 1453770984.123,
  "source": {
    "_meta": {
      "type": "rule"
    },
    "data": {
      "id": "rul_55c8c149",
      "name": "Important deliveries",
      "actions": [
        "Assign to Leela Turanga"
      ],
      "_links": {
        "self": "https://api2.frontapp.com/rules/rul_55c8c149"
      }
    }
  },
  "target": {
    "_meta": {
      "type": "teammate"
    },
    "data": {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
    }
  },
  "conversation": {
    "id": "cnv_55c8c149",
    "subject": "You broke my heart, Hubert.",
    "status": "archived",
    "assignee": {
      "id": "tea_55c8c149",
      "email": "leela@planet-express.com",
      "username": "leela",
      "first_name": "Leela",
      "last_name": "Turanga",
      "is_admin": true,
      "is_available": true,
      "_links": {
        "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
        "related": {
          "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
          "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
        }
      }
    },
    "recipient": {
      "handle": "calculon@momsbot.com",
      "role": "to",
      "_links": {
        "related": {
          "contact": "https://api2.frontapp.com/contacts/ctc_55c8c149"
        }
      }
    },
    "tags": [
      {
        "id": "tag_55c8c149",
        "name": "Robots",
        "_links": {
          "self": "https://api2.frontapp.com/tags/tag_55c8c149",
          "related": {
            "conversations": "https://api2.frontapp.com/tags/tag_55c8c149/conversations"
          }
        }
      }
    ],
    "last_message": {
      "id": "msg_55c8c149",
      "type": "email",
      "is_inbound": true,
      "created_at": 1453770984.123,
      "blurb": "Anything less than immortality is a...",
      "author": {
        "id": "tea_55c8c149",
        "email": "leela@planet-express.com",
        "username": "leela",
        "first_name": "Leela",
        "last_name": "Turanga",
        "is_admin": true,
        "is_available": true,
        "_links": {
          "self": "https://api2.frontapp.com/teammates/tea_55c8c149",
          "related": {
            "inboxes": "https://api2.frontapp.com/teammates/tea_55c8c149/inboxes",
            "conversations": "https://api2.frontapp.com/teammates/tea_55c8c149/conversations"
          }
        }
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
      "attachments": [
        {
          "filename": "attachment.jpg",
          "url": "http://example.com/attachment.jpg",
          "content_type": "image/jpeg",
          "size": 10000
        }
      ],
      "_links": {
        "self": "https://api2.frontapp.com/messages/msg_55c8c149",
        "related": {
          "conversation": "https://api2.frontapp.com/conversations/cnv_55c8c149",
          "message_replied_to": "https://api2.frontapp.com/messages/msg_1ab23cd4"
        }
      }
    },
    "_links": {
      "self": "https://api2.frontapp.com/conversations/cnv_55c8c149",
      "related": {
        "events": "https://api2.frontapp.com/conversations/cnv_55c8c149/events",
        "followers": "https://api2.frontapp.com/conversations/cnv_55c8c149/followers",
        "messages": "https://api2.frontapp.com/conversations/cnv_55c8c149/messages",
        "comments": "https://api2.frontapp.com/conversations/cnv_55c8c149/comments",
        "inboxes": "https://api2.frontapp.com/conversations/cnv_55c8c149/inboxes"
      }
    }
  },
  "_links": {
    "self": "https://api2.frontapp.com/events/evt_55c8c149"
  }
}
```
Fetches the full details of an event.



### HTTP Request

`GET https://api2.frontapp.com/events/{event_id}`
### Parameters


Name | Type | Description
-----|------|------------
event_id | string | The ID of the requested event

# Analytics

To get statistics about activities happening in Front, you need to requests the correspondig metrics of the analytics.

Each metrics can be either:

* A scalar: this is a single value (a number, duration, percentage or string).

* A table: this is a set of different values for a set of resources.

* A time graph: this is a unique value decomposed in multiple values over the requested time range.

**Scalar metrics available:**

| Name                          | Type       | Description                                                      |
|-------------------------------|------------|------------------------------------------------------------------|
| `avg_conversations_per_day`   | Number     | Average number of conversations occuring per day                 |
| `avg_first_response_time`     | Duration   | Average time for your teammates to send the first reply          |
| `avg_replies_to_resolve`      | Number     | Average number of replies to resolve a conversation              |
| `avg_resolution_time`         | Duration   | Average time for a conversation to be resolved                   |
| `avg_response_time`           | Duration   | Average time for your teammate to reply to a message             |
| `busiest_day`                 | String     | Name of the day where you receive the most messages              |
| `busiest_time`                | String     | Hour of the day where you receive the most messages              |
| `num_active_conversations`    | Number     | Number of conversation which received at least one message       |
| `num_customers_helped`        | Number     | Number of unique customer with which your teammates interacted   |
| `num_messages_received`       | Number     | Total number of messages received                                |
| `num_new_conversations`       | Number     | Number of new conversations                                      |
| `num_replies_sent`            | Number     | Number of replies sent                                           |
| `pct_resolved_on_first_reply` | Percentage | Percentage of conversations resolved on the first reply          |

**Table metrics available:**

| Name                      | Resource type      | Values                                                                                                                                                                                                         |
|---------------------------|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `customers_table`         | List of customers  | Number of messages, average first reply time, average response time and average resolution time                                                                                                                |
| `first_response_histo`    | List of duration   | Percentage of first responses sent for each duration                                                                                                                                                           |
| `resolution_histo`        | List of duration   | Percentage of resolved conversation for each duration                                                                                                                                                          |
| `response_histo`          | List of duration   | Percentage of responses sent for each duration                                                                                                                                                                 |
| `tags_table`              | List of tags       | Number of messages, average number of messages per conversation, number of archived conversations, number of open conversations, total number of conversations                                                 |
| `team_table`              | List of teammates  | Number of conversation, average number of messages per conversation, average time to react to a conversation, number of messages, number of sent messages, number of replies sent, number of messages composed |
| `top_conversations_table` | Top 3 teammates    | Number of conversations                                                                                                                                                                                        |
| `top_reaction_time_table` | Top 3 teammates    | Time to react to a conversation                                                                                                                                                                                |
| `top_replies_table`       | Top 3 teammates    | Number of replies sent                                                                                                                                                                                         |

**Time graph metrics available:**

| Name                      | Description                                                   |
|---------------------------|---------------------------------------------------------------|
| `customers_helped_graph`  | Number of unique customer which received at least one message |
| `first_response_graph`    | Average time for your teammate to send the first reply        |
| `messages_received_graph` | Number of messages received                                   |
| `new_conversations_graph` | Number of new conversations                                   |
| `replies_sent_graph`      | Number of replies sent                                        |
| `resolution_graph`        | Average time to resolve a conversation                        |
| `response_graph`          | Average time for your teammate to reply to a message          |

Each metrics contains the value for the requested time period (in the field named `v`) as well as the value for the previous period (in the field named `p`).

Depending on the date range you request the analytics, it can take some time to process it. This is why you might need to send multiple requests to get the results. To help you estimate the remaining time, the server response will contain a `progress` field containing a number ranging from 0 to 100 which isthe percentage of the analytics processed.



## Get analytics
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/analytics/?inbox_ids=${INBOX_IDS}&tag_ids=${TAG_IDS}&start=${START}&end=${END}&timezone=${TIMEZONE}&metrics=${METRICS}'
```

```node

```

> Response **200**

```json
{
  "status": "pending",
  "progress": 42,
  "metrics": [
    {
      "id": "avg_conversations_per_day",
      "metric_type": "scalar",
      "t": "num",
      "v": 42,
      "p": 24
    },
    {
      "id": "first_response_histo",
      "metric_type": "table",
      "columns": [
        {
          "id": "time",
          "label": "Time",
          "type": "num"
        },
        {
          "id": "pct_replies",
          "label": "Replies %",
          "type": "num"
        }
      ],
      "rows": [
        [
          {
            "t": "str",
            "v": "< 15mn",
            "p": "< 15mn"
          },
          {
            "t": "pct",
            "v": "12",
            "p": "50"
          }
        ]
      ]
    },
    {
      "id": "first_response_graph",
      "metric_type: `time_graph`": "",
      "vals": [
        {
          "t": "dur",
          "v": 42,
          "p": 24,
          "label": "January",
          "start": 1451785860,
          "end": 1454464260
        }
      ]
    }
  ]
}
```
Fetches the metrics correspondig to the parameters.



### HTTP Request

`GET https://api2.frontapp.com/analytics/?inbox_ids={inbox_ids}&tag_ids={tag_ids}&start={start}&end={end}&timezone={timezone}&metrics={metrics}`
### Parameters


Name | Type | Description
-----|------|------------
inbox_ids | array (optional) | List of inbox IDs to include in the generated analytics
tag_ids | array (optional) | List of tag IDs to include in the generated analytics
start | number | Timestamp from which the analytics will start
end | number | Timestamp from which the analytics will end
timezone | string (optional) | Name of the timezone to format the dates. If omitted, the export will use UTC.
metrics | array | List of the metrics to include in the analytics

# Exports
> 
Name | Type | Description
-----|------|------------
id | string | Unique identifier for the export.
status | enum | Status of the export.
progress | number | Number ranging from 0 to 100 corresponding to the percentage of the export processed.
url | string (optional) | URL of the generated export. Will be null until the status is "done".
filename | string (optional) | Name of the file of the generated export. Will be null until the status is "done".
size | number | Size (in bytes) of the export file.
created_at | number | Date at which the export has been created.
query | Export to create | Query data used to generate the export.
_links | object | See [Response body Structure - Links](#links)
_links.self | string | URL of the export URL

Front can generate exports of your data for a specific timeframe and/or specific inboxes, teammates or tags.

Since an export takes some time to process, it has a `status` which can be either:

* `pending` when the export is still generating

* `done` once the export has been generated

* `failed` in case the generation failed

Once the export has been generated, you can download it with its `url`.

### Format

Exports are formatted as a [CSV](https://en.wikipedia.org/wiki/Comma-separated_values) files. The export will contain 1 line per message received in the given time period.

**If a message appears in multiple inboxes, it will appear once for each inbox**.

Below is table of the field names & descriptions that will be included in the export.

| Name              | Desctiption                                                                                                                                       |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Message ID        | Internal Front ID of the message                                                                                                                  |
| Conversation ID   | Internal Front ID of the entire conversation                                                                                                      |
| Direction         | Either `Inbound` or `Outbound`                                                                                                                    |
| Status            | Status of the conversation: `unassigned`, `assigned`, `archived`, or `trashed`.                                                                   |
| Inbox             | Name of the inbox where the message was initially sent. If the message appeared in multiple inboxes, it will appear multiple times.               |
| Message Date      | `YYYY-MM-DD HH:mm:ss` format, in the requested timezone.                                                                                          |
| Response time     | Duration (in seconds) between an inbound message and the next outbound message in the same conversation.                                          |
| Handle time       | Total duration (in seconds) that a contact was kept waiting for a reply from the team during an assignment. Metric is calculated per assignment.  |
| Assignee          | Username of the assignee, if any                                                                                                                  |
| Contact name      | Contact's first & last name                                                                                                                       |
| Contact handle    | Contact's email address, twitter handle, or phone number - depending on the source of the message.                                                |
| Extract           | Sample of the message                                                                                                                             |
| Tags              | Tags attached to the conversation.                                                                                                                |

**Timezone**

All dates in the the export are presented in the same timezone. If the export was requested from the app (by clicking on "Request Export"), it will be in the timezone of the user. If the export is requested with the API, the timezone can be manually defined (or defaults to UTC).

**Response time**

Response time is always calculated from the point of view of a customer: how did it take for your company to reply?

Most of the time, the response time is the difference between an inbound message from a customer and the next reply from your team.

If your team replies several times to the same message, the response time is the time since the previous reply.

**Assignments and Handle time**

Most of the time, only one discussion happens within a conversation. That is: a customer will open a conversation to ask a specific thing and if they want to ask another one, they will open a new discussion.

However, this is not always the case:

* A customer might decide to reply to an existing conversation even if they are asking for something new.

* Several teammates might write in one conversation.

Because of this, Front will compute a **handle time** to the last message if:

* the conversation is reassigned to a different teammate.

* the conversation is inactive for **4 days**.



## List exports
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/exports?page=${PAGE}'
```

```node

```

> Response **200**

```json
{
  "_pagination": {},
  "_links": {
    "self": "https://api2.frontapp.com/exports"
  },
  "_results": [
    {
      "id": "exp_55c8c149",
      "status": "pending",
      "progress": 42,
      "url": "http://exports.frontapp.com/planet-express/export.csv",
      "filename": "export.csv",
      "size": 1000,
      "created_at": 1453770984.123,
      "query": {
        "inbox_id": "alt:address:team@planet-express.com",
        "teammate_id": "alt:email:fry@planet-express.com",
        "start": 1428889003,
        "end": 1428889008,
        "timezone": "America/New_York"
      },
      "_links": {
        "self": "https://api2.frontapp.com/exports/exp_55c8c149"
      }
    }
  ]
}
```
Lists all the exports generated in your company.



### HTTP Request

`GET https://api2.frontapp.com/exports?page={page}`
### Parameters


Name | Type | Description
-----|------|------------
page | number (optional) | Number of the page requested

## Get export
```shell

curl --include \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
'https://api2.frontapp.com/exports/${EXPORT_ID}'
```

```node

```

> Response **200**

```json
{
  "id": "exp_55c8c149",
  "status": "pending",
  "progress": 42,
  "url": "http://exports.frontapp.com/planet-express/export.csv",
  "filename": "export.csv",
  "size": 1000,
  "created_at": 1453770984.123,
  "query": {
    "inbox_id": "alt:address:team@planet-express.com",
    "teammate_id": "alt:email:fry@planet-express.com",
    "start": 1428889003,
    "end": 1428889008,
    "timezone": "America/New_York"
  },
  "_links": {
    "self": "https://api2.frontapp.com/exports/exp_55c8c149"
  }
}
```
Fetches the information of an export.



### HTTP Request

`GET https://api2.frontapp.com/exports/{export_id}`
### Parameters


Name | Type | Description
-----|------|------------
export_id | string | ID of the requested export

## Create export
```shell

curl --include \
     --request POST \
     --header "Content-Type: application/json" \
     --header "Authorization: Bearer {your_token}" \
     --header "Accept: application/json" \
     --data-binary "{
  \"inbox_id\": \"alt:address:team@planet-express.com\",
  \"teammate_id\": \"alt:email:fry@planet-express.com\",
  \"start\": 1428889003,
  \"end\": 1428889008,
  \"timezone\": \"America/New_York\"
}" \
'https://api2.frontapp.com/exports'
```

```node

```

> Response **201**

```json
{
  "id": "exp_55c8c149",
  "status": "pending",
  "progress": 42,
  "url": "http://exports.frontapp.com/planet-express/export.csv",
  "filename": "export.csv",
  "size": 1000,
  "created_at": 1453770984.123,
  "query": {
    "inbox_id": "alt:address:team@planet-express.com",
    "teammate_id": "alt:email:fry@planet-express.com",
    "start": 1428889003,
    "end": 1428889008,
    "timezone": "America/New_York"
  },
  "_links": {
    "self": "https://api2.frontapp.com/exports/exp_55c8c149"
  }
}
```
Requests the creation of a new export



### HTTP Request

`POST https://api2.frontapp.com/exports`
### Body


Name | Type | Description
-----|------|------------
inbox_id | string (optional) | ID of the inbox to export the analytics for. If omitted, the export will contain all the inboxes.
teammate_id | string (optional) | ID of the teammate to export the analytics for. If omitted, the export will contain all the teammates.
tag_id: `tag_55c8c149` | string (optional) | ID the tag to export the analytics for. If omitted, the export will contain all the tags.
start | number | Start time of the data to include in the export.
end | number | End time of the data to include in the export.
timezone | string (optional) | Name of the timezone to format the dates. If omitted, the export will use UTC.
