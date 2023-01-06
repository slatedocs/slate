# Account

## Create company groups

```shell
curl https://api.simplyprint.io/{id}/account/settings/rank/Create \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "ranks": [
    {
      "title": "name of group",
      "description": "group description",
      "sort_order": 3,
      "permissions": "{\"view_news\":true,\"org_admin\":true,\"panel_printing\":true,\"printer_restart\":true,\"printer_edit\":true,\"bed_leveling\":true,\"gcode_profiles\":true,\"printer_settings\":true,\"filament_settings\":true,\"change_filament\":true,\"create_filament\":true,\"see_filament_tab\":true,\"view_users\":true,\"change_user_rank\":true,\"manual_user_email_confirm\":true,\"invite_users\":true,\"delete_user\":true,\"org_user_registration_settings\":true,\"org_hub_settings\":true,\"org_rank_management\":true,\"org_view_statistics\":true,\"refill_quota\":true,\"custom_slicer_profiles\":true,\"org_profiles\":true,\"all_slicer_modes\":true,\"queue_remove_all\":true,\"org_api\":true,\"create_org_folder\":true,\"cancel_others\":true,\"see_who_printed\":true,\"max_print_size\":[],\"default_slicer_mode\":2}"
    }
  ]
}
```

> Success response

```json
{
  "status": true,
  "message": null,
  "data": [
    {
      "title": "name of group",
      "description": "group description",
      "company_id": 2,
      "company_type": 2,
      "sort_order": 3,
      "permissions": "{\"view_news\":true,\"org_admin\":true,\"panel_printing\":true,\"printer_restart\":true,\"printer_edit\":true,\"bed_leveling\":true,\"gcode_profiles\":true,\"printer_settings\":true,\"filament_settings\":true,\"change_filament\":true,\"create_filament\":true,\"see_filament_tab\":true,\"view_users\":true,\"change_user_rank\":true,\"manual_user_email_confirm\":true,\"invite_users\":true,\"delete_user\":true,\"org_user_registration_settings\":true,\"org_hub_settings\":true,\"org_rank_management\":true,\"org_view_statistics\":true,\"refill_quota\":true,\"custom_slicer_profiles\":true,\"org_profiles\":true,\"all_slicer_modes\":true,\"queue_remove_all\":true,\"org_api\":true,\"create_org_folder\":true,\"cancel_others\":true,\"see_who_printed\":true,\"max_print_size\":[],\"default_slicer_mode\":2}",
      "id": 319
    }
  ]
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `ORG_RANK_MANAGEMENT` |

This endpoint creates a new group in the company.

### Request

`POST /{id}/account/settings/rank/Create`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `ranks` | array | yes | Array of groups to create. |
| `ranks[].title` | string | yes | The name of the group. |
| `ranks[].description` | string | no | The description of the group. |
| `ranks[].sort_order` | integer | yes | The sort index of the group. |
| `ranks[].permissions` | string | yes | JSON string of the permissions of the group. For more information, see [Permissions](#permissions). |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `data` | array | Array of the created groups. |

## Update company groups

```shell
curl https://api.simplyprint.io/{id}/account/settings/rank/Update \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "ranks": [
    {
      "id": 319,
      "title": "TITLE",
      "description": "DESCRIPTION",
      "permissions": "{\"view_news\":true,\"org_admin\":true,\"panel_printing\":true,\"printer_restart\":true,\"printer_edit\":true,\"bed_leveling\":true,\"gcode_profiles\":true,\"printer_settings\":true,\"filament_settings\":true,\"change_filament\":true,\"create_filament\":true,\"see_filament_tab\":true,\"view_users\":true,\"change_user_rank\":true,\"manual_user_email_confirm\":true,\"invite_users\":true,\"delete_user\":true,\"org_user_registration_settings\":true,\"org_hub_settings\":true,\"org_rank_management\":true,\"org_view_statistics\":true,\"refill_quota\":true,\"custom_slicer_profiles\":true,\"org_profiles\":true,\"all_slicer_modes\":true,\"queue_remove_all\":true,\"org_api\":true,\"create_org_folder\":true,\"cancel_others\":true,\"see_who_printed\":true,\"max_print_size\":[],\"default_slicer_mode\":2}",
      "sort_order": 3,
    }
  ]
}
```

> Success repsonse

```json
{
  "status": true,
  "message": null,
  "data": [
    {
      "id": 319,
      "title": "NAME",
      "description": "DESCRIPTION",
      "company_id": 2,
      "company_type": 2,
      "permissions": "{\"view_news\":true,\"org_admin\":true,\"panel_printing\":true,\"printer_restart\":true,\"printer_edit\":true,\"bed_leveling\":true,\"gcode_profiles\":true,\"printer_settings\":true,\"filament_settings\":true,\"change_filament\":true,\"create_filament\":true,\"see_filament_tab\":true,\"view_users\":true,\"change_user_rank\":true,\"manual_user_email_confirm\":true,\"invite_users\":true,\"delete_user\":true,\"org_user_registration_settings\":true,\"org_hub_settings\":true,\"org_rank_management\":true,\"org_view_statistics\":true,\"refill_quota\":true,\"custom_slicer_profiles\":true,\"org_profiles\":true,\"all_slicer_modes\":true,\"queue_remove_all\":true,\"org_api\":true,\"create_org_folder\":true,\"cancel_others\":true,\"see_who_printed\":true,\"max_print_size\":[],\"default_slicer_mode\":2}",
      "sort_order": 3,
      "created": "2023-01-03 14:35:28"
    }
  ]
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `ORG_RANK_MANAGEMENT` |

This endpoint updates the groups in the company.

### Request

`POST /{id}/account/settings/rank/Update`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `ranks` | array | yes | Array of groups to update. |
| `ranks[].id` | integer | yes | The id of the group to update. |
| `ranks[].title` | string | no | The name of the group. |
| `ranks[].description` | string | no | The description of the group. |
| `ranks[].permissions` | string | no | JSON string of the permissions of the group. For more information, see [Permissions](#permissions). |
| `ranks[].sort_order` | integer | no | The sort index of the group. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `data` | array | Array of the updated groups. |
| `data[].id` | integer | The id of the group. |
| `data[].title` | string | The name of the group. |
| `data[].description` | string | The description of the group. |
| `data[].company_id` | integer | The id of the company. |
| `data[].company_type` | integer | The type of the company. |
| `data[].permissions` | string | JSON string of the permissions of the group. For more information, see [Permissions](#permissions). |
| `data[].sort_order` | integer | The sort order of the group. |
| `data[].created` | string | The date and time the group was created. |

## Get company groups

```shell
curl https://api.simplyprint.io/{id}/account/GetGroups \
  -X GET \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "groups": [
    {
      "id": 112,
      "name": "Administrator"
    },
    {
      "id": 151,
      "name": "Manager"
    },
    {
      "id": 153,
      "name": "User"
    }
  ]
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `ORG_RANK_MANAGEMENT` |

This endpoint returns a list of groups that exist in the company.

### Request

`GET /{id}/account/GetGroups`

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `groups` | array | Array of group objects. |
| `groups[].id` | integer | Group ID. |
| `groups[].name` | string | Group name. |

## Delete company group

```shell
curl https://api.simplyprint.io/{id}/account/settings/rank/Delete \
  -X POST \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Request body

```json
{
  "id": 112,
  "replacementRankId": 151
}
```

> Success response

```json
{
  "status": true,
  "message": null,
}
```

<aside class="notice">
  This endpoint requires the <b>Print Farm</b> plan.
</aside>

| Required permissions |
| -------------------- |
| `ORG_RANK_MANAGEMENT` |

### Request

`POST /{id}/account/settings/rank/Delete`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `id` | integer | yes | The id of the group to delete. |
| `replacementRankId` | integer | maybe | The id of the group to replace the deleted group with.<br>This is only required if the group has users. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
