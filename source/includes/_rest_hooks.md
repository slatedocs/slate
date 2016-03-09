# Hook Endpoints

Netlify can trigger webhooks to do thing such as send email notifications or send slack messages on certain events.

The `/api/v1/hooks` endpoint lets you control the hooks for your site.

## Get Hook Types
List hook types that you can configure

### HTTP Request
`GET /api/v1/hooks/types` 

```json
[{
  "name": "url",
  "fields": [{"name": "url", "options": {"type": "string", "title": "URL to notify"}}],
  "events": ["submission_created", "deploy_created", "deploy_failed"]
}]
```

### Get Hooks for a Site

Each type has a series of fields that you need to set to create a new hook, and a list of events that they can be triggered by.

* `GET /api/v1/hooks?site_id=:my_site_id` returns a list of a hooks defined for a specific site

```json
[{
  "id": "5636b7a00d61eec2d6001004",
  "site_id": "0d3a9d2f-ef94-4380-93df-27ee400e2048",
  "type":"email",
  "event":"submission_created",
  "data": {"email":"test@example.com"},
  "created_at":"2015-10-20T21:51:51Z",
  "updated_at":"2015-10-20T21:51:51Z"
}]
```

### Create a new Hook

* `POST /api/v1/hooks` creates a new hook

An example request body for an email hook for a specific form in your site, would look like this:

```json
{
  "site_id": "0d3a9d2f-ef94-4380-93df-27ee400e2048",
  "form_id": "5235a7a00d61eec2d6001302",
  "type": "email",
  "event": "submission_created",
  "data": {"email": "test@example.com"}
}
```

Form ID is optional and links the hook to a specific form within your site. You can also use `form_name` with the value of the `name` attribute of the form of your site as an alternative to `form_id`.

### Delete a hook

* `DELETE /api/v1/hooks/:hook_id` removes the hook permanently

Note, for outgoing webhooks, returning a `410 Gone` status code from the URL endpoint will trigger a deletion of the hook.
