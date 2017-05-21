# Snapshots

## The Snapshot Resource

### Attributes:


Attribute | Type | Description
--------- | ------- | -------
`created_at` | [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) | The time the snapshot was uploaded to or created on the manager.
`error` | string | Message of an error if snapshot creation failed.
`id` | string | A unique identifier of the snapshot.
`status` | string | Status of the snapshot. One of created/failed/uploading/uploaded.

## List Snapshots

> Request Example

```shell
$ curl -X GET \
    --header "Tenant: <manager-tenant>" \
    -u <manager-username>:<manager-password> \
    "http://<manager-ip>/api/v3/snapshots?_include=id"
```

```python
# Using CloudifyClient
snapshots = client.snapshots.list(_include=['id'])
for snapshot in snapshots:
    print snapshot

# Using requests
url = 'http://<manager-ip>/api/v3/snapshots'
headers = {'Tenant': '<manager-tenant>'}
querystring = {'_include': 'id'}
response = requests.get(
    url,
    auth=HTTPBasicAuth('<manager-username>', '<manager-password>'),
    headers=headers,
    params=querystring,
)
response.json()
```

> Response Example

```json
{
  "items": [
    {
      "id": "snapshot1"
    },
    {
      "id": "snapshot2"
    },
    {
      "id": "snapshot3"
    }
  ],
  "metadata": {
    "pagination": {
      "total": 3,
      "offset": 0,
      "size": 0
    }
  }
}
```

`GET "{manager-ip}/api/v3/snapshots"`

Lists all snapshots.


### Response

Attribute | Type | Description
--------- | ------- | -------
`items` | list | A list of [Snapshot](#the-snapshot-resource) resources.


## Create Snapshot

> Requests Example

```shell
$ curl -X PUT \
    --header "Tenant: <manager-tenant>" \
    -u <manager-username>:<manager-password> \
    "http://<manager-ip>/api/v3/snapshots/<snapshot-id>"
```

```python
# Using CloudifyClient
client.snapshots.create(
    snapshot_id='<snapshot-id>',
    include_metrics=False,
    include_credentials=False,
)


# Using requests
url = 'http://<manager-ip>/api/v3/snapshots/<snapshot-id>'
headers = {
    'Content-Type': 'application/json',
    'Tenant': '<manager-tenant>',
}
payload = {}
response = requests.put(
    url,
    auth=HTTPBasicAuth('<manager-username>', '<manager-password>'),
    headers=headers,
    json=payload,
)
response.json()
```

> Response Example

```json
{
  "status": "pending",
  "parameters": {
    "include_metrics": false,
    "config": {
      "postgresql_db_name": "cloudify_db",
      "default_tenant_name": "default_tenant",
      "postgresql_bin_path": "/usr/pgsql-9.5/bin/",
      "failed_status": "failed",
      "postgresql_username": "cloudify",
      "db_port": 9200,
      "postgresql_password": "cloudify",
      "created_status": "created",
      "db_address": "localhost",
      "file_server_root": "/opt/manager/resources",
      "postgresql_host": "localhost"
    },
    "include_credentials": true,
    "snapshot_id": "snapshot4"
  },
  "is_system_workflow": true,
  "blueprint_id": null,
  "tenant_name": "default_tenant",
  "created_at": "2017-05-11T16:16:45.948Z",
  "created_by": "admin",
  "private_resource": false,
  "workflow_id": "create_snapshot",
  "error": "",
  "deployment_id": null,
  "id": "bb9cd6df-7acd-4649-9fc1-fe062759cde8"
}
```

`PUT "{manager-ip}/api/v3/snapshots/{snapshot-id}"`

Creates a new snapshot.

### URI Parameters
* `snapshot-id`: The id of the new snapshot.

### Request Body
Property | Type | Description
--------- | ------- | -----------
`include_metrics` | string | Specifies whether metrics stored in InfluxDB should be included in the created snapshot. It defaults to false.
`include_credentials` | string | Specifies whether agent SSH keys (including those specified in uploaded blueprints) should be included in the created snapshot. It defaults to false.

### Response
An [Execution](#the-execution-resource) resource representing the create snapshot workflow execution.


## Delete Snapshot

> Requests Example

```shell
$ curl -X DELETE \
    --header "Tenant: <manager-tenant>" \
    -u <manager-username>:<manager-password> \
    "http://<manager-ip>/api/v3/snapshots/<snapshot-id>"
```

```python
# Using CloudifyClient
client.snapshots.delete(snapshot_id='<snapshot-id>')

# Using requests
url = 'http://<manager-ip>/api/v3/snapshots/<snapshot-id>'
headers = {'Tenant': '<manager-tenant>'}
response = requests.get(
    url,
    auth=HTTPBasicAuth('<manager-username>', '<manager-password>'),
    headers=headers,
)
response.json()
```

> Example Response

```json
{
  "status": "uploaded",
  "tenant_name": "default_tenant",
  "created_at": "2017-05-11T17:04:22.989Z",
  "created_by": "admin",
  "private_resource": false,
  "error": "",
  "id": "snapshot4"
}
```

`DELETE "{manager-ip}/api/v3/snapshots/{snapshot-id}"`

Deletes an existing snapshot.

### URI Parameters
* `snapshot-id`: The id of the snapshot to be deleted.

### Response
An empty [Snapshot](#the-snapshot-resource) resource, with one non-empty field (its id).

## Restore Snapshot

> Requests Example

```shell
curl -s -X POST \
    --header "Content-Type: application/json" \
    --header "Tenant: <manager-tenant>" \
    -u <manager-username>:<manager-password> \
    -d '{"tenant_name": "<manager-tenant>", "recreate_deployments_envs": true, "force": false, "restore_certificates": false, "no_reboot": false}' \
    "http://<manager-ip>/api/v3/snapshots/<snapshot-id>/restore"
```

```python
# Using CloudifyClient
client.snapshots.restore(snapshot_id='<snapshot-id>', tenant_name='<manager-tenant>')

# Using requests
url = 'http://<manager-ip>/api/v3/snapshots/<snapshot-id>/restore'
headers = {
    'Content-Type': 'application/json',
    'Tenant': '<manager-tenant>',
}
payload = {
    'tenant_name': '<manager_tenant>',
    'recreate_deployments_envs': True,
    'force': False,
    'restore_certificates': False,
    'no_reboot': False
}
response = requests.post(
    url,
    auth=HTTPBasicAuth('<manager-username>', '<manager-password>'),
    headers=headers,
    json=payload,
)
response.json()
```

> Example Response

```json
{
  "status": "pending",
  "tenant_name": "default_tenant",
  "created_at": "2017-05-11T17:23:30.779Z",
  "created_by": "admin",
  "private_resource": false,
  "error": "",
  "id": "1cadbb76-4532-4eae-a139-80bff328944d"
}
```

`POST "{manager-ip}/api/v3/snapshots/{snapshot-id}/restore"`

Restores the specified snapshot on the manager.

### URI Parameters
* `snapshot-id`: The id of the snapshot to be restored.

### Request Body
Property | Default | Description
---------|---------|-------------
`force`  |  false  | Specifies whether to force restoring the snapshot on a manager that already contains blueprints/deployments.
`recreate_deployments_envs` | true | Specifies whether deployment environments should be created for restored deployments.
`tenant_name` | true | In case of restoring a snapshot from a version prior to 4.0.0, it specifies the name of a new tenant that the snapshot will be restored into. Otherwise - not relevant.
`restore_certificates` | true | Specifies whether to try and restore the certificates from the snapshot and use them to override the current Manager certificates (it only happens if the snapshot's certificates metadata do not match the Manager's certificates metadata). Useful when there are live agents from an old Manager (the one that created the snapshot) and we wish to control them with the current Manager. At the end of the execution the Manager will automatically reboot - unless the `no_reboot` property is `True`.
`no_reboot` | true | Only relevant when the property `restore_certificates` is `True`. Specifies whether to skip the automatic reboot at the end of the snapshot restore execution. It is not recommended to use this option since the Manager will not function well after certificates restore without a reboot. In that case, it is expected of the user to manually reboot.

### Response
An [Execution](#the-execution-resource) resource representing the restore snapshot workflow execution.


## Download Snapshot

> Request Example

```shell
$ curl -X GET \
    --header "Tenant: <manager-tenant>" \
    -u <manager-username>:<manager-password> \
    "http://<manager-ip>/api/v3/snapshot/<snapshot-id>/archive" > <snapshot-archive-filename>.zip
```

```python
# Using CloudifyClient
client.snapshots.download(
    snapshot_id='<snapshot-id>',
    output_file='<snapshot-archive-filename>.zip',
)

# Using requests
url = 'http://<manager-ip>/api/v3/snapshot/<snapshot-id>/archive'
headers = {'Tenant': '<manager-tenant>'}
response = requests.get(
    url,
    auth=HTTPBasicAuth('<manager-username>', '<manager-password>'),
    headers=headers,
)
with open('<snapshot-archive-filename>.wgn', 'wb') as snapshot_archive:
    snapshot_archive.write(response.content)
```

`GET "{manager-ip}/api/v3/snapshots/{snapshot-id}/archive"`

Downloads an existing snapshot.

### URI Parameters
* `snapshot-id`: The id of the snapshot to be downloaded.

### Response
A streamed response (content type `application/octet-stream`), which is a zip archive containing the snapshot data.

## Upload Snapshot

> Request Example

```shell
$ curl -X PUT \
    --header "Tenant: <manager-tenant>" \
    -u <manager-username>:<manager-password> \
    "http://<manager-ip>/api/v3/snapshots/archive?snapshot_archive_url=http://url/to/archive.zip"
```

```python
# Using CloudifyClient
client.snapshots.upload(
    snapshot_id='<snapshot-id>',
    snapshot_path='http://url/to/archive.zip',
)

# Using requests
url = 'http://<manager-ip>/api/v3/snapshots/archive'
headers = {'Tenant': '<manager-tenant>'}
querystring = {'snapshot_archive_url': 'http://url/to/archive.zip'}
response = requests.post(
    url,
    auth=HTTPBasicAuth('<manager-username>', '<manager-password>'),
    headers=headers,
    params=querystring,
)
response.json()

```

> Response Example

```json
{
  "status": "uploaded",
  "tenant_name": "default_tenant",
  "created_at": "2017-05-11T18:13:25.912Z",
  "created_by": "admin",
  "private_resource": false,
  "error": "",
  "id": "snapshot5"
}
```


`PUT "{manager-ip}/api/v3/snapshots/{snapshot-id}/archive"`

Uploads a snapshot to the Cloudify Manager.
The call expects a `application/octet-stream` content type where the content is a zip archive.
It is possible to upload a snapshot from a URL by specifying the URL in the `snapshot_archive_url` request body property.

### URI Parameters
* `snapshot-id`: The id of the snapshot to be uploaded.

### Request Body
Property | Type | Description
---------|---------|-------------
`snapshot_archive_url` | string | Optional parameter specifying a url to a snapshot that will be uploaded to the manager.

### Response
A [Snapshot](#the-snapshot-resource) resource.
