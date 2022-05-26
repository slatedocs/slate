### SSH keys
SSH keys can be assigned to default users of instances by using the [associate SSH key](#cloudstack-associate-an-ssh-key-to-an-instance) operation.

<!-------------------- LIST SSH KEYS -------------------->

#### List SSH keys

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sshkeys"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [{
    "name": "mellon",
    "fingerprint": "91:8d:71:ca:2d:2c:ad:97:26:db:cb:c3:df:9a:e9:b6"
  }],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sshkeys</code>

Retrieve a list of all SSH keys in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the SSH key
`fingerprint`<br/>*string* | A short sequence of bytes used to identify the SSH key.


<!-------------------- RETRIEVE AN SSH KEY -------------------->


#### Retrieve an SSH key

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sshkeys/mellon"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "name": "mellon",
    "fingerprint": "91:8d:71:ca:2d:2c:ad:97:26:db:cb:c3:df:9a:e9:b6"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sshkeys/:name</code>

Retrieve information about an SSH key of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the SSH key
`fingerprint`<br/>*string* | A short sequence of bytes used to identify the SSH key.
