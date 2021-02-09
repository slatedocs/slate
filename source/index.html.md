---
title: BBOXX Smart Solar API Reference

language_tabs:
  - python
  - js

toc_footers:
  - <a href='https://github.com/tripit/slate'>Documentation Powered by Slate</a>

includes:
  - introduction

  - schema
  - action_types
  - action_type_product_type_linker
  - alerts
  - alert_types
  - alert_type_entity_anti_linker
  - alert_type_product_type_linker
  - alert_type_state_type_linker
  - analysis_history
  - appliance_action_type_appliance_type_linker
  - appliance_action_types
  - appliance_part_type_replacement_linker
  - appliance_part_types
  - appliance_repair_appliance_action_type_linker
  - appliance_repair_appliance_part_type_linker
  - appliance_repair_appliance_symptom_linker
  - appliance_repairs
  - appliances
  - appliance_symptom_appliance_type_linker
  - appliance_symptoms
  - appliance_types
  - balances
  - battery_test_results
  - channels
  - connections
  - default_energy_limits
  - enable_history
  - entities
  - entity_facility_linker
  - factory_logs
  - final_balances
  - home2_stock_preparation_trackings
  - hubs
  - influx_shard_datas
  - latest_softwares
  - networks
  - parameters
  - parameter_types
  - part_product_linker
  - parts
  - part_type_categories
  - part_type_product_type_linker
  - part_type_replacement_linker
  - part_types
  - payment_commands
  - product_notes
  - product_parameters
  - product_parts
  - product_product_group_linker
  - products
  - product_software_linker
  - product_types
  - product_type_software_version_type_linker
  - repair_action_type_linker
  - repair_part_type_linker
  - repair_product_linker
  - repairs
  - repair_symptom_type_linker
  - repair_workflow_events
  - repair_workflow_history
  - repair_workflow_selectors
  - repair_workflow_states
  - repair_centres
  - rtc_connection_history
  - rtc_dead_letter
  - rtc_dead_letters
  - rtc_fallback_message_history
  - rtc_message_history
  - rtc_mo_message_history
  - serials
  - shops
  - sim_part_type_sim_provider_linker
  - sim_provider_network_linker
  - sim_providers
  - sms_histories
  - software_version_types
  - states
  - state_types
  - subscribers
  - symptom_type_product_type_linker
  - symptom_types
  - test_jig_test_results
  - user_repair_centre_links

  - product_actions
  - create_hub2
  - create_enterprise
  - create_product_home2
  - create_product_hub2
  - create_product_enterprise
  - enable
  - disable
  - update_software
  - lock_software
  - expire_software_updates
  - assign_entity
  - change_entity
  - remove_entity
  - enable_tamper_switch
  - disable_tamper_switch
  - send_wakeup
  - product_parts
  - product_change_states
  - product_locations
  - parameters
  - parameter_history
  - connectivity_reliability_rate
  - available_networks
  - command_request
  - sync
  - status_update
  - rtc_online_status
  - force_connection
  - get_repair
  - suggest_energy_limit
  - upload_tool_log

  - product_data

  - part_actions
  - create_tiger_pcb
  - create_hyena_pcb

  - repair_actions
  - current_state
  - send_inputs
  - send_event
  - history
  - list_current_states
  - irt_input_specifications
  - irt_event_specifications

  - rtc_dead_letter_actions
  - rtc_import_mo_dead_letters
  - rtc_import_mt_reply_dead_letters
  - replay
  - discard
  - decode

  - custom_endpoints
  - home
  - auth_login
  - validate_user
  - validate_user_and_password
  - dashboard2
  - dismiss_alert
  - pub_sub

  - dcm

  - using_the_api
  - authentication_and_permissions
  - unit_connections
  - meta_data
  - query_format
  - errors
  - internationalization

search: true

code_clipboard: true
---

# Introduction

Welcome to the Kittn API! You can use our API to access Kittn API endpoints, which can get information on various cats, kittens, and breeds in our database.

We have language bindings in Shell, Ruby, Python, and JavaScript! You can view code examples in the dark area to the right, and you can switch the programming language of the examples with the tabs in the top right.

This example API documentation page was created with [Slate](https://github.com/slatedocs/slate). Feel free to edit it and use it as a base for your own API's documentation.

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
curl "api_endpoint_here" \
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

# Kittens

## Get All Kittens

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Get a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Delete a Specific Kitten

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2" \
  -X DELETE \
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete
