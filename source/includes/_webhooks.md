# Webhooks

Webhooks allow you to be notified of events that happen on your Affinity instance. For example, your app can be notified when a list is created, a field value is updated, a person is deleted, and more. These events will fire immediately after the corresponding action takes place.

## Create a Webhook Subscription

We don't currently support this via the API. Please reach out to support@affinity.co with the URL you would like us to POST webhooks to.

## Supported Webhook Events

### List Events
- 'list.created'
- 'list.updated'
- 'list.deleted'
- 'list_entry.created'
- 'list_entry.deleted'

### Note Events
- 'note.created'
- 'note.updated'
- 'note.deleted'

### Field Events
- 'field.created'
- 'field.updated'
- 'field.deleted'
- 'field_value.created'
- 'field_value.updated'
- 'field_value.deleted'

### Person Events
- 'person.created'
- 'person.updated'
- 'person.deleted'

### Organization Events
- 'organization.created'
- 'organization.updated'
- 'organization.deleted'

### Opportunity Events
- 'opportunity.created'
- 'opportunity.updated'
- 'opportunity.deleted'

### Entity File Events
- 'file.created'
- 'file.deleted'

## Limitations

- A webhook subscription automatically subscribes to all events, there is currently
no way to only subscribe to certain events.
- The following triggers will not create webhook events:
	- resources created/updated/deleted via our importer tool
	- resources created/updated/deleted via Email Bot.
	- organizations created automatically based on email/event interactions.
	- field values created/updated/deleted in automated global organization fields (i.e. location, last round raised, etc.)