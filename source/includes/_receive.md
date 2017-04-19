# Receive

The receive endpoints allows external services to notify DirtyLemon of [messages](#messages) being sent by customers or [conversational systems](...).

## Twilio

> Example request

```shell
curl https://api.dirtylemon.com/v1/receive/twilio \
  -X POST \
  -H 'Content-Type: application/json' \
  -d '{"From": "...", "Body": "..." }'
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{}
```

This endpoint creates a [message](#messages) on behalf of a __customer__:

- Notifies the [conversational system](...) of the message

### HTTP Request

`POST https://api.dirtylemon.com/v1/receive/twilio`

### Body params

Expected payload from [Twilio's webhook reference](...).

## Init.ai

> Example request

```shell
curl https://api.dirtylemon.com/v1/receive/init \
  -X POST \
  -H 'Content-Type: application/json' \
  -d '{"event_type": "...", "data": { "content": "..." }}'
```

> Example response

```http
HTTP/1.1 201 CREATED
```

```json
{}
```

This endpoint creates a [message](#messages) on behalf of __init.ai__:

- Notifies the [customer](#customers) of the message

### HTTP Request

`POST https://api.dirtylemon.com/v1/receive/init`

### Body params

Expected payload from [Init.ai's webhook reference](https://docs.init.ai/docs/webhooks).
