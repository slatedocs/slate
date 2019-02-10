---
title: TSheets API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell: cURL
  - csharp: C#
  - java: Java
  - javascript: NodeJS
  - php: PHP
  - ruby: Ruby
  - python: Python
  - go: Go
 
toc_footers:
  - <a href='#'>Sign Up for a Developer Key</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - current_user
  - custom_fields
  - custom_field_items
  - effective_settings
  - files
  - geofence_configs
  - geolocations
  - groups
  - jobcodes
  - jobcode_assignments
  - last_modified
  - locations
  - locations_maps
  - managed_clients
  - notifications
  - reminders
  - reports
  - schedule_calendars
  - schedule_events
  - timesheets
  - timesheets_deleted
  - users
  - errors

search: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/lord/slate). Feel free to edit it and use it as a base for your own API's documentation.

# Authentication

> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

# Batch Item Status Codes
For each item created or updated, a `_status_code` and `_status_message` will be returned in the JSON response object indicating whether the operation succeeded. An additional field `_status_extra` containing more details about the failure may also be included.
