### SSH keys

SSH keys are managed at the [environment](#administration-environments) level.

<!-------------------- LIST SSH KEYS -------------------->

#### List SSH keys

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sshkeys"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "user1",
      "name": "user1",
      "publicKey": "ssh-rsa mypublickey user1@host.com"
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sshkeys</code>

Retrieve a list of all SSH keys in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The SSH key's id.
`name`<br/>*string* | The name of the SSH key.
`publicKey`<br/>*string* | A string representing the protocol, public key and username. [GCP SSH keys documentation](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys#sshkeyformat)

<!-------------------- RETRIEVE AN SSH KEY -------------------->

#### Retrieve an SSH key

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sshkeys/user1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "user1",
    "name": "user1",
    "publicKey": "ssh-rsa mypublickey user1@host.com"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sshkeys/:id</code>

Retrieve information about an SSH key of an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*string* | The SSH key's id.
`name`<br/>*string* | The name of the SSH key.
`publicKey`<br/>*string* | A string representing the protocol, public key and username. [GCP SSH keys documentation](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys#sshkeyformat)

<!-------------------- ADD AN SSH KEY -------------------->

#### Add an SSH key
```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sshkeys"
```
> Request body example:

```json
{
  "name": "user1",
  "publicKey": "ssh-rsa mypublickey user1@host.com"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sshkeys</code>

Add an SSH key to the [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`name`<br/>*string* | The name of the SSH key.
`publicKey`<br/>*string* | A string representing the protocol, public key and username. [GCP SSH keys documentation](https://cloud.google.com/compute/docs/instances/adding-removing-ssh-keys#sshkeyformat)

<!-------------------- DELETE AN SSH KEY -------------------->

#### Delete an SSH key

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v1/services/gcp/test-area/sshkeys/user1"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sshkeys/:name</code>

Delete an existing SSH key from the [environment](#administration-environments).