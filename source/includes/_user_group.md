# User Groups

## The User Group Resource

<aside class="notice">
This section describes API features that are part of the Cloudify premium edition
</aside>

The User Group is a group of users.


### Attributes:

Attribute | Type | Description
--------- | ------- | -------
`id` | integer | Auto increment, unique identifier for the tenant.
`ldap_dn` | string | The distinguished name of corresponding LDAP group (if using LDAP).
`name` | string | The name of the user group.


## List User Groups

> Request Example - Get tenants and users counts

```shell
$ curl -X GET \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<password> \
    "http://<manager_ip>/api/v3.1/user-groups"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.list()

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
response = requests.get(
    url,
    auth=auth,
    headers=headers,
)
```

> Response Example - Get tenants and users counts

```json
{
  "items": [
    {
      "ldap_dn": "ldap_group_dn",
      "tenants": 0,
      "name": "group_name",
      "users": 0
    }
  ],
  "metadata": {
    "pagination": {
      "total": 1,
      "offset": 0,
      "size": 0
    }
  }
}
```

> Request Example - Get tenants and users details

```shell
$ curl -X GET \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<password> \
    "http://<manager_ip>/api/v3.1/user-groups?_get_data=true"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.list(_get_data=True)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups?_get_data=true'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
response = requests.get(
    url,
    auth=auth,
    headers=headers,
)
```

> Response Example - Get tenants and users details

```json
{
  "items": [
    {
      "ldap_dn": "ldap_group_dn",
      "tenants": {},
      "name": "group_name",
      "users": []
    }
  ],
  "metadata": {
    "pagination": {
      "total": 1,
      "offset": 0,
      "size": 0
    }
  }
}
```

`GET "{manager_ip}/api/v3.1/user-groups"`

List all user groups.

### Response
Field | Type | Description
--------- | ------- | -------
`items` | list | A list of `Group` resources.


## Get User Group

> Request Example - Get tenants and users counts

```shell
$ curl -X GET \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    "http://<manager_ip>/api/v3.1/user-groups/<group_name>"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.get('<group_name>')

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/<group_name>'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
response = requests.get(
    url,
    auth=auth,
    headers=headers,
)
```

> Response Example - Get tenants and users counts

```json
{
  "ldap_dn": "ldap_group_dn",
  "tenants": 0,
  "name": "<group_name>",
  "users": 0
}
```

> Request Example - Get tenants and users details

```shell
$ curl -X GET \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    "http://<manager_ip>/api/v3.1/user-groups/<group_name>?_get_data=true"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.get('<group_name>', _get_data=True)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/<group_name>?_get_data=true'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
response = requests.get(
    url,
    auth=auth,
    headers=headers,
)
```

> Response Example - Get tenants and users details

```json
{
  "ldap_dn": "ldap_group_dn",
  "tenants": {},
  "name": "<group_name>",
  "users": []
}
```

`GET "{manager_ip}/api/v3.1/user-groups/{group_name}"`

Retrieves a specific group.

### URI Parameters
* `group_name`: The name of the group to retrieve.

### Response
A `Group` resource.


## Create User Group

> Request Example - Get tenants and users counts

```shell
$ curl -X POST \
    -H "Content-Type: application/json" \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    -d '{"group_name": <group_name>, "ldap_group_dn": <ldap_group_dn>}' \
    "http://<manager_ip>/api/v3.1/user-groups"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.create(
    group_name='<group_name>',
    ldap_group_dn='<ldap_group_dn>',
)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
payload = {
    'group_name': '<group_name>',
    'ldap_group_dn': '<ldap_group_dn>',
}
response = requests.post(
    url,
    auth=auth,
    headers=headers,
    json=payload,
)
```

> Response Example - Get tenants and users counts

```json
{
  "ldap_dn": "<ldap_group_dn>",
  "tenants": 0,
  "name": "<group_name>",
  "users": 0
}
```

> Request Example - Get tenants and users details

```shell
$ curl -X POST \
    -H "Content-Type: application/json" \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    -d '{"group_name": <group_name>, "ldap_group_dn": <ldap_group_dn>}' \
    "http://<manager_ip>/api/v3.1/user-groups?_get_data=true"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.create(
    group_name='<group_name>',
    ldap_group_dn='<ldap_group_dn>',
    _get_data=True,
)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups?_get_data=true'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
payload = {
    'group_name': '<group_name>',
    'ldap_group_dn': '<ldap_group_dn>',
}
response = requests.post(
    url,
    auth=auth,
    headers=headers,
    json=payload,
)
```

> Response Example - Get tenants and users details

```json
{
  "ldap_dn": "<ldap_group_dn>",
  "tenants": {},
  "name": "<group_name>",
  "users": []
}
```

`POST -d '{"group_name": <group-name>, "ldap_group_dn": <ldap_group_dn>, "role": <group-system-role>}' "{manager-ip}/api/v3.1/user-groups"`

Creates a new user group.

### Request Body

Property | Type | Description
--------- | ------- | -----------
`group_name` | string | The group name.
`ldap_group_dn` | string | Optional parameter, The distinguishing name of the corresponding LDAP group, if appropriate.
`role` | string | Optional parameter, The name of the system role for the group (default: "default").

### Response
A `Group` resource.





## Delete User Group

> Request Example - Get tenants and users counts

```shell
$ curl -X DELETE \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    "http://<manager_ip>/api/v3.1/user-groups/<user_group_name_to_delete>"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.delete('<user_group_name_to_delete>')

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/<user_group_name_to_delete>'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
response = requests.delete(
    url,
    auth=auth,
    headers=headers,
)
```

> Response Example - Get tenants and users counts

```json
{
    "ldap_dn": "ldap_group_dn",
    "name": "<user_group_name_to_delete>",
    "tenants": 0,
    "users": 0
}
```

> Request Example - Get tenants and users details

```shell
$ curl -X DELETE \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    "http://<manager_ip>/api/v3.1/user-groups/<user_group_name_to_delete>?_get_data=true"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.delete('<user_group_name_to_delete>', _get_data=True)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/<user_group_name_to_delete>?_get_data=true'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
response = requests.delete(
    url,
    auth=auth,
    headers=headers,
)
```

> Response Example - Get tenants and users details

```json
{
    "ldap_dn": "ldap_group_dn",
    "name": "<user_group_name_to_delete>",
    "tenants": {},
    "users": []
}
```

`DELETE "{manager_ip}/api/v3.1/user-groups/{user_group_name_to_delete}"`

Deletes a user group.

### URI Parameters
* `user_group_name_to_delete`: The name of the user group to delete.

### Response
A `Group` resource.





## Add User to User Group

> Request Example - Get tenants and users counts

```shell
$ curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    -d '{"username": <username_to_add>, "group_name": <group_name>}' \
    "http://<manager_ip>/api/v3.1/user-groups/users"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.add_user('<username_to_add>', '<group_name>')

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/users'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
payload = {
    'username': '<username_to_add>'
    'group_name': '<group_name>',
}
response = requests.put(
    url,
    auth=auth,
    headers=headers,
    json=payload,
)
```

> Response Example - Get tenants and users counts

```json
{
  "ldap_dn": "ldap_group_dn",
  "tenants": 0,
  "name": "<group_name>",
  "users": 1
}
```

> Request Example - Get tenants and users details

```shell
$ curl -X PUT \
    -H "Content-Type: application/json" \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    -d '{"username": <username_to_add>, "group_name": <group_name>}' \
    "http://<manager_ip>/api/v3.1/user-groups/users?_get_data=true"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.add_user(
    '<username_to_add>',
    '<group_name>',
    _get_data=True,
)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/users?_get_data=true'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
payload = {
    'username': '<username_to_add>'
    'group_name': '<group_name>',
}
response = requests.put(
    url,
    auth=auth,
    headers=headers,
    json=payload,
)
```

> Response Example - Get tenants and users details

```json
{
  "ldap_dn": "ldap_group_dn",
  "tenants": {},
  "name": "<group_name>",
  "users": [
    "<username_to_add>"
  ]
}
```
`PUT "{manager_ip}/api/v3.1/user-groups/users"`

Add a user to user group.

### Request Body

Property | Type | Description
--------- | ------- | -----------
`username` | string | The name of the user to add to the group.
`group_name` | string | The name of the group to which to add the user.

### Response
A `Group` resource.





## Remove User from User Group

> Request Example - Get tenants and users counts

```shell
$ curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    -d '{"username": <username_to_remove>, "group_name": <group_name>}' \
    "http://<manager_ip>/api/v3.1/user-groups/users"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.remove_user('<username_to_remove>', '<group_name>')

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/users'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
payload = {
    'username': '<username_to_remove>'
    'group_name': '<group_name>',
}
response = requests.delete(
    url,
    auth=auth,
    headers=headers,
    json=payload,
)
```

> Response Example - Get tenants and users counts

```json
{
  "ldap_dn": "ldap_group_dn",
  "tenants": 0,
  "name": "<group_name>",
  "users": 0
}
```

> Request Example - Get tenants and users details

```shell
$ curl -X DELETE \
    -H "Content-Type: application/json" \
    -H "Tenant: <manager_tenant>" \
    -u <manager_username>:<manager_password> \
    -d '{"username": <username_to_remove>, "group_name": <group_name>}' \
    "http://<manager_ip>/api/v3.1/user-groups/users?_get_data=true"
```

```python
# Using Cloudify client
from cloudify_rest_client import CloudifyClient
client = CloudifyClient(
    host='<manager_ip>',
    username='<manager_username>',
    password='<manager_password>',
    tenant='<manager_tenant>',
)
client.user_groups.remove_user(
    '<username_to_remove>',
    '<group_name>',
    _get_data=True,
)

# Using requests
import requests
from requests.auth import HTTPBasicAuth

url = 'http://<manager_ip>/api/v3.1/user-groups/users?_get_data=true'
auth = HTTPBasicAuth('<manager_username>', '<manager_password>')
headers = {'Tenant': '<manager_tenant>'}
payload = {
    'username': '<username_to_remove>'
    'group_name': '<group_name>',
}
response = requests.delete(
    url,
    auth=auth,
    headers=headers,
    json=payload,
)
```

> Response Example - Get tenants and users details

```json
{
  "ldap_dn": "ldap_group_dn",
  "tenants": {},
  "name": "<group_name>",
  "users": []
}
```

`DELETE "{manager-ip}/api/v3.1/user-groups/users"`

Delete a user from a user group.

### Request Body

Property | Type | Description
--------- | ------- | -----------
`username` | string | The name of the user to remove from the group.
`group_name` | string | The name of the group from which to remove the user.

### Response
A `Group` resource.
