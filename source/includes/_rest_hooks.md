# Hook Endpoints

Netlify can trigger webhooks to do thing such as send email notifications or send slack messages on certain events.

The `/hooks` endpoint lets you control the hooks for your site.

## Get Hook Types
List hook types that you can configure. These describe what types of hooks are available currently and the information needed to create one.

### HTTP Request
``` http
GET /hooks/types HTTP/1.1
```

> Example response:

``` json
[
  {
  	"name": "url",
  	"fields": [{
  		"name": "url",
  		"options": {
  			"type": "string",
  			"title": "URL to notify"
  		}
  	}],
  	"events": ["submission_created", "deploy_created", "deploy_failed"]
  }
]
```

The response will contain:

- `name`: the name of this type of hook
- `fields`: a list of fields available for this hook. Unless the `optional` flag is specified, they are required.
  - `name`: the name of that field
  - `options`: the options available for this field. This will be specific to the type of field described.
- `events`: a list of events to which this hook can be registered

## Get Hooks for a Site

Each type has a series of fields that you need to set to create a new hook, and a list of events that they can be triggered by.

<aside class=notice>
This endpoint uses query parameters, not the url path
</aside>
<!-- TODO @matt could you site the spec on why? -->

``` http
GET /hooks?site_id={:site_id} HTTP/1.1
```

> Response:

``` json
[
  {
    "id": "5636b7a00d61eec2d6001004",
    "site_id": "0d3a9d2f-ef94-4380-93df-27ee400e2048",
    "type":"email",
    "event":"submission_created",
    "data": {"email":"test@example.com"},
    "created_at":"2015-10-20T21:51:51Z",
    "updated_at":"2015-10-20T21:51:51Z"
  }
]
```

## Create a new Hook

``` http
POST /hooks HTTP/1.1
```

> Example request body for a specific form to create an email hook

``` json
{
  "site_id": "0d3a9d2f-ef94-4380-93df-27ee400e2048",
  "form_id": "5235a7a00d61eec2d6001302",
  "type": "email",
  "event": "submission_created",
  "data": {
    "email": "test@example.com"
  }
}
```

All the fields but the `form_id` are required. The specifics of the `data` correspond to the `type` of hook being created.

`form_id` is optional and links the hook to a specific form within your site. You can also use `form_name` with the value of the `name` attribute of the form of your site as an alternative to `form_id`.

## Delete a hook
``` http
DELETE /hooks/{:hook_id} HTTP/1.1
```

<aside class=notice>
For outgoing webhooks, returning a `410 Gone` status code from the URL endpoint will trigger a deletion of the hook.
</aside>
