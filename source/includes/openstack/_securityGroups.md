### Security groups

Security groups manage network access to instances.

#### List security groups

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/securitygroups"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "1bd672f4-b274-4371-a792-b0a6c6778cc7",
            "name": "default",
            "description": "Default security group",
            "isDefault": true
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securitygroups</code>

Retrieve a list of all security groups in an environment.

| Attribute                  | Description                          |
| -------------------------- | ------------------------------------ |
| `id`<br/>*UUID*            | The security group's id.              |
| `name`<br/>*string*        | The security group's name.            |
| `description`<br/>*string* | A description of the group's purpose. |
| `isDefault`<br/>*boolean*  | If the security group is the default. |

#### Retrieve a security group

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/securitygroups/1bd672f4-b274-4371-a792-b0a6c6778cc7"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "1bd672f4-b274-4371-a792-b0a6c6778cc7",
        "name": "default",
        "description": "Default security group",
        "isDefault": true
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securitygroups/:id</code>

Retrieve information about a security group.

| Attribute                  | Description                          |
| -------------------------- | ------------------------------------ |
| `id`<br/>*UUID*            | The security group's id.              |
| `name`<br/>*string*        | The security group's name.            |
| `description`<br/>*string* | A description of the group's purpose. |
| `isDefault`<br/>*boolean*  | If the security group is the default. |

#### Create a security group

```shell
curl -X POST \
    -H "MC-Api-Key: your_api_key" \
    -H "Content-Type: application/json" \
    -d "request_body" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/securitygroups"
```
> Request body example:

```json
{
    "name": "security-group-1",
    "description": "My very first security group"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securitygroups</code>

Create a security group in an environment.

| Required        | Description                          |
| -------------------------- | ------------------------------------ |
| `name`<br/>*string*        | The security group's name.            |
| `description`<br/>*string* | A description of the group's purpose. |

#### Delete a security group

```shell
curl -X DELETE \
    -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/securitygroups/1bd672f4-b274-4371-a792-b0a6c6778cc7"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/securitygroups/:id</code>

Delete a security group.
