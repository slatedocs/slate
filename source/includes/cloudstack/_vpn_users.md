### VPN users

VPN users are the accounts that are allowed to connect to [remote access VPNs](#cloudstack-remote-access-vpns).

#### List VPN users
```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpnusers"
```
> The above command returns a JSON structured like this:

```json
{
    "data": [
        {
            "id": "5de76bf5-9f61-487a-a989-042b52882da4",
            "username": "wilson"
        }
    ],
    "metadata": {
        "recordCount": 1
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpnusers</code>

List VPN users.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the remote access VPN user
`username`<br/>*string* | The VPN user's username

#### Retrieve a VPN user
```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpnusers/5de76bf5-9f61-487a-a989-042b52882da4"
```
> The above command returns a JSON structured like this:

```json
{
    "data": {
        "id": "5de76bf5-9f61-487a-a989-042b52882da4",
        "username": "wilson"
    }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpnusers/:id</code>

Retrieve a VPN user.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the remote access VPN user
`username`<br/>*string* | The VPN user's username

#### Delete a VPN user
```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/vpnusers/5de76bf5-9f61-487a-a989-042b52882da4"
```
<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/vpnusers/:id</code>

Delete an existing remote access VPN user.