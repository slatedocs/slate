# Receive

The receive endpoints allows external services to notify DirtyLemon of [messages](#messages) being sent by customers or [conversational systems](...).

## Twilio

> Example request

```shell
curl https://api.dirtylemon.com/v1/receive/twilio \
  -X POST \
  -H 'Content-Type: application/json' \
  -d '{"From": "...", "Body": "..."}'
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "23940470-12b3-42ad-8784-500915ad61a5",
  "session_id": "d57dc142-23ce-4c39-a03b-9ebdc8497ba3",
  "content": "Hey ho!",
  "content_type": "text",
  "sender_role": "end-user",
  "sent_at": "2016-12-20T20:50:42.708Z",
  "created_at": "2017-04-25T20:58:41.633Z",
  "updated_at": "2017-04-25T20:58:41.633Z"
}
```

This endpoint creates a [message](#messages) on behalf of a __customer__:

- Notifies the [conversational system](...) of the message

### HTTP Request

`POST https://api.dirtylemon.com/v1/receive/twilio`

### Body params

Expected payload from [Twilio's webhook reference](...).

### Returns

A message object.


## Init.ai

> Example request

```shell
curl https://api.dirtylemon.com/v1/receive/init \
  -X POST \
  -H 'Content-Type: application/json' \
  -H 'X-Init-Ai-Secret: secret' \
  -d '{"event_type": "...", "data": { "content": "..." }}'
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{
  "id": "23940470-2fb3-42ad-8784-500915ad61a5",
  "session_id": "d57dc142-23ce-4ce5-a03b-9ebdc8497ba3",
  "content": "What's shea weber's plus-minus?",
  "content_type": "text",
  "sender_role": "init",
  "sent_at": "2016-12-20T20:50:42.708Z",
  "created_at": "2017-04-25T20:58:41.633Z",
  "updated_at": "2017-04-25T20:58:41.633Z"
}
```

This endpoint creates a [message](#messages) on behalf of __init.ai__:

- Notifies the [customer](#customers) of the message

<aside class="notice">
  Calls on this action will fail if the customer isn't confirmed.
</aside>

### HTTP Request

`POST https://api.dirtylemon.com/v1/receive/init`

### Body params

Expected payload from [Init.ai's webhook reference](https://docs.init.ai/docs/webhooks). The `event_type` must be `MessageOutbound`.

### Returns

A message object.
