## Webhook object

|||
|---|---|
| **Managed by** | [Webhooks Resource](/api/stores/v2/webhooks)


## Properties

| Name | Type | Description |
| --- | --- | --- |
| `id` | `int` | A read-only value that uniquely identifies a webhook object. Do not attempt to set this value in a PUT or POST. |
| `client_id` | `string` | The OAuth client ID that uniquely identifies your application. Bigcommerce returns this name-value pair in the JSON body of its responses. |
| `store_hash` | `string` | The hash value that uniquely identifies the store. Your application does not need to set this value via the JSON object; instead, you pass it in the path of your API requests. |
| `scope` | `enum` | The events the webhook listens on. The full list of possibilities is in Getting Started: https://developer.bigcommerce.com/api/webhooks-getting-started. |
| `destination` | `string` | The fully qualified URI that Bigcommerce uses as a callback. At runtime, when one of the events your webhook is listening on occurs, Bigcommerce sends a POST request to this URI. Must be HTTPS. |
| `headers` | `object` | Optional name-value pairs that you can set when you create the webhook. Bigcommerce will include the name-value pair(s) in the HTTP header of its POST request to your callback URI at runtime. |
| `is_active` | `boolean` | Can contain one of three values: true | false | <blank>. Default is no value, i.e., blank. If false, the webhook is inactive and will not send POST requests to the callback URI if an event occurs. If true, the webhook is active. |
| `created_at` | `int` | The time at which the webhook was created |
| `updated_at` | `int` | The time at which the webhook was last updated |

