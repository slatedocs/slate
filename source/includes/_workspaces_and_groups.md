# WORKSPACE

A workspace is the top-level entity. Each workspace has its own API key and all groups, gateway, end devices...etc belong to a parent workspace.

A workspace has one owner (you) and can have multiple collaborators (enterprise plan only). No two workspaces may share the same API key, groups, gateways, or devices.

![Workspace Group Gateway End Devices Architecture](https://ik.imagekit.io/vgfzjbrn7/workspace-group-illustration.jpg)

# GROUPS

Groups are how you organize your Gateways and Devices. For example, a Group can represent a geographical grouping of devices or some other logical grouping that makes sense within your unique context.

For example, we've seen the following group types from our users:

- A group comprising all devices within the same building or same city.
- A group made of devices matching a particular aesthetic style (e.g. "only chrome-platted door locks").



## Group Object

Parameter | Type | Description
--------- | ---- | -----------
id | uuid | The ID of the Group
name | string | The name of the Group


## Get All Groups

```shell
curl -X GET \
  -u "${YOUR_API_KEY}:" \
  "https://api.getseam.com/v1/groups"
```

```ruby
require 'base64'
require 'rest-client'


token = Base64.strict_encode64("#{YOUR_API_KEY}:")
headers = {
  "Authorization": "Basic #{token}"
}

url = 'https://api.getseam.com/v1/groups'

RestClient.get(url, headers: headers)
```

> The above command returns JSON structured like this:

```json
[
    {
        "id": "512beb75-2538-47bf-b646-f39239d2e127",
        "name": "12119 robinridge ln"
    },
    {
        "id": "d8df1c9b-57db-44ee-80b3-2df525181f7f",
        "name": "210 Church St"
    },
]
```

This endpoint retrieves all of your workspace's groups.

### HTTP Request

`GET /v1/groups`
