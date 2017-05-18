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
HTTP/1.1 200 OK
```

```json
{
  "id": "006b42be-2997-417f-ada5-e2d8c434f023",
  "session_id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
  "content": "Yes please",
  "content_type": "text",
  "sender_role": "end-user",
  "sent_at": "2017-05-05T13:26:41.842Z",
  "created_at": "2017-05-05T13:26:42.107Z"
}
```

This endpoint creates a [message](#messages) on behalf of a __customer__:

- Notifies the [conversational system](...) of the message

### Authentication

Requests are authenticated with the `HTTP_X_TWILIO_SIGNATURE` header.

### HTTP Request

`POST https://api.dirtylemon.com/v1/receive/twilio`

### Body params

Expected payload from [Twilio's webhook reference](...).

### Returns

A message object.


## Init.ai

> Example request for `MessageOutbound`

```shell
curl https://api.dirtylemon.com/v1/receive/init \
  -X POST \
  -H 'Content-Type: application/json' \
  -H 'X-Init-Ai-Secret: secret' \
  -d '{"event_type": "...", "data": { "content": "..." }}'
```

> Example response

```http
HTTP/1.1 200 OK
```

```json
{
    "id": "6e500324-ec66-44b4-8c0b-1d28dbeee868",
    "session_id": "35559e1d-0dcc-4872-9b26-bdffb56aef52",
    "content": "What would you like to order?",
    "content_type": "text",
    "sender_role": "init",
    "sent_at": "2017-05-05T13:14:34.113Z",
    "created_at": "2017-05-05T13:14:34.115Z"
  }
```

This endpoint acts as a proxy between both the Init.ai API and the conversational application.

When webhook event is `MessageOutbound`:

  - A [message](#messages) is created on behalf of __init.ai__
  - Notifies the [customer](#customers) of the message

<aside class="notice">
  <ul>
    <li>This will fail if the customer is unsubscribed.</li>
    <li>This will fail if the customer doesn't have a `phone_number` or `unconfirmed_phone_number`</li>
  </ul>
</aside>

When webhook event is `LogicInvocation`:

  - The event payload is forwarded to the conversational application

### Authentication

Requests are authenticated with the `X-Init-Ai-Secret` header.

### HTTP Request

`POST https://api.dirtylemon.com/v1/receive/init`

### Body params

Expected payload from [Init.ai's webhook reference](https://docs.init.ai/docs/webhooks). The `event_type` must be `MessageOutbound`.

### Returns

A message object.
