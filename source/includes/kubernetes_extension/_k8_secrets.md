#### Secrets

<!-------------------- LIST SECRETS -------------------->

##### List secrets

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "default-token-xxxmt/default",
      "apiVersion": "v1",
      "encodedData": {
        "ca.crt": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN3akNDQWFxZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFTTVJBd0RnWURWUVFERXdkcmRXSmwKTFdOaE1CNFhEVEl3TURZeE1URTJNVGMxTjFvWERUTXdNRFl3T1RFMk1UYzFOMW93RWpFUU1BNEdBMVVFQXhNSAphM1ZpWlMxallUQ0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQUx5K2ZkWG9NMi80CjhWallYM0VJMHV5b2Y4clJjbkU3RjFDclFZc0RkNmNaV3IwbGpDemtXclk4QThGZUhHT3NYc3Q4V2wvNDltenMKWXVZYks1QXkyeWFNcWp3NnNZTnprMXIrZTZDUjFmaGdRNHpMNDREU1FsR2xVOHk3N2VpOHdOTVR6d09FOXIxMgpJdlFKVGNkS1llclFxNjZ5YTJuSklrNHo4Y2sxc2MzQVZmK1JSNXRaNWtGUUptRis5dHpickNFd2IxWUQ5RkdECjczQVNKSG9YK0wxRWtEYWRKU2NJYmdtWklxUlNwdkJBZHdGdlJLRnhId2VkcnE0b0JwZ0Z4RkEwMEJlM2dyMU0KYlhmL1p1VTZPRU1YbmY3VmNCT2g4QTgvbUYwT0htL3d4WXJ3bHVqc3oyVXlRUVNkTlZueHVpMmJrSm00UlUvNQpDVnEycElwY2o5TUNBd0VBQWFNak1DRXdEZ1lEVlIwUEFRSC9CQVFEQWdLa01BOEdBMVVkRXdFQi93UUZNQU1CCkFmOHdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRlJDdjh6cnAwNm1LRC9DWGVjVHpXdFhKbkVJR3dRY2F6eC8KSzZYSDgwaFFVbllKcDBBZkNlNlp1SjlMc2ZtalZhVmRSTjUyaGZmZ3RHZjU1TFkvUUMvdnE2Wkp6VklDVEdSMQpZclczY3Vld0k0b1hmUGJ0WWhUZks0TEk4M0p3dGJDYThTZTdNMFNsZnl4OWN1WlIxT2xiZ3kxbTF4MmlId1VlCklnblA0YzlnSG1aUmhFR2xnTkp1cDNVbVRkUi9KTnliMGdCVk9VdExldkV4cUpvNldhaHFyL1FnNmhZRHpsZzAKT0N2cGYwSFRLQUJRZklsldfikhbEU3BSRVhBYlNFbFR3aFpQRFJNSmNvYTNzRDhsam9JS1NFS0FvNkJKenFaNHg1Wk01ZwppLzZFS2EwRzU3enVMbk1vczhKU3FKUHhLU25SZ2ExckR1M0g2S2Nway8zNFVCUGZMQzg9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
        "namespace": "a3ViZS1zeXN0ZW0=",
        "token": "ZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklpSjkuZXlKcGMzTWlPaUpyZFdKbGNtNWxkR1Z6TDNObGNuWnBZMlZoWTJOdmRXNTBJaXdpYTNWaVpYSnVaWFJsY3k1cGJ5OXpaWEoyYVdObFlXTmpiM1Z1ZEM5dVlXMWxjM0JoWTJVaU9pSnJkV0psTFhONWMzUmxiU0lzSW10MVltVnlibVYwWlhNdWFXOHZjMlZ5ZG1salpXRmpZMjkxYm5RdmMyVmpjbVYlsdkjfkdfwTG01aGJXVWlPaUpqWVc1aGJDMTBiMnRsYmkwMk56bG9OeUlzSW10MVltVnlibVYwWlhNdWFXOHZjMlZ5ZG1salpXRmpZMjkxYm5RdmMyVnlkbWxqWlMxaFkyTnZkVzUwTG01aGJXVWlPaUpqWVc1aGJDSXNJbXQxWW1WeWJtVjBaWE11YVc4dmMyVnlkbWxqWldGalkyOTFiblF2YzJWeWRtbGpaUzFoWTJOdmRXNTBMblZwWkNJNkltUTVOamcyWVRWbExUUTBaak10TVRGbE9TMDVOakJrTFRBeU1EQTNZVGxoTURBeFppSXNJbk4xWWlJNkluTjVjM1JsYlRwelpYSjJhV05sWVdOamIzVnVkRHByZFdKbExYTjVjM1JsYlRwallXNWhiQ0o5LkN2LTZiWFdjQlU1VnZCZjJKSUVpc1BIOHZKYTllY01ra0JNbTg0dE9Qd3N1MVNnWUp3V2cwVlBFT2hnTzltdUNoMzFMTzRMOHpabklaeU0yUUNoRmo4TEtKcDJJU2FXa05Nb0c4RmJUcEtCWGNKd2FOZVNCMlo2M01LRnNyZlhQMnpkSmFjSGVuUi1KaTJsdW5rMmFRYnE3eFVreGxqdkc5SVVEY05aZmlrUllhbUVhd1hFeG1RYVhkalpGRWgwT2J2VDVsdGVVY2xYcXhIMFpzWktUNWRfYWttRmRZT3B3UVZOSUlDS0JxZmFZWjBULXliMmxmbDREYTFNUndNLV93TzVXNUdtbVo1UGdubGQxTjZqaGxEekladWp6cVFQSlh3MGU4V3VXVVlPX09YNDJ5YVVoM3pUS3F1ejhVTjVkS0pDcEF4WFd4RWFsZWV0MThMUFUwUQ=="
      },
      "kind": "Secret",
      "metadata": {},
      "type": "kubernetes.io/service-account-token"
    }
  ],
  "metadata": {
    "recordCount": 100
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets?cluster_id=:cluster_id</code>

Retrieve a list of all secrets in a given [environment](#administration-environments).

| Required                   | &nbsp;                                              |
| -------------------------- | --------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to list the secrets. |

| Attributes                  | &nbsp;                                                                     |
| --------------------------- | -------------------------------------------------------------------------- |
| `id` <br/>_string_          | The id of the secret.                                                      |
| `apiVersion` <br/>_string_  | The API version used to retrieve the secret.                               |
| `encodedData` <br/>_string_ | The data that the secret contains.                                         |
| `metadata` <br/>_object_    | The metadata of the secret.                                                |
| `kind` <br/>_string_        | A string value representing the REST resource that this object represents. |
| `type` <br/>_string_        | A string used to facilitate programmatic handling of a secret's data.      |

<!-------------------- GET A secret -------------------->

##### Get a secret

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets/default-token-xxxmt/default?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "default-token-xxxmt/default",
    "apiVersion": "v1",
    "encodedData": {
      "ca.crt": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUN3akNDQWFxZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFTTVJBd0RnWURWUVFERXdkcmRXSmwKTFdOaE1CNFhEVEl3TURZeE1URTJNVGMxTjFvWERUTXdNRFl3T1RFMk1UYzFOMW93RWpFUU1BNEdBMVVFQXhNSAphM1ZpWlMxallUQ0NBU0l3RFFZSktvWklodmNOQVFFQkJRQURnZ0VQQURDQ0FRb0NnZ0VCQUx5K2ZkWG9NMi80CjhWallYM0VJMHV5b2Y4clJjbkU3RjFDclFZc0RkNmNaV3IwbGpDemtXclk4QThGZUhHT3NYc3Q4V2wvNDltenMKWXVZYks1QXkyeWFNcWp3NnNZTnprMXIrZTZDUjFmaGdRNHpMNDREU1FsR2xVOHk3N2VpOHdOTVR6d09FOXIxMgpJdlFKVGNkS1llclFxNjZ5YTJuSklrNHo4Y2sxc2MzQVZmK1JSNXRaNWtGUUptRis5dHpickNFd2IxWUQ5RkdECjczQVNKSG9YK0wxRWtEYWRKU2NJYmdtWklxUlNwdkJBZHdGdlJLRnhId2VkcnE0b0JwZ0Z4RkEwMEJlM2dyMU0KYlhmL1p1VTZPRU1YbmY3VmNCT2g4QTgvbUYwT0htL3d4WXJ3bHVqc3oyVXlRUVNkTlZueHVpMmJrSm00UlUvNQpDVnEycElwY2o5TUNBd0VBQWFNak1DRXdEZ1lEVlIwUEFRSC9CQVFEQWdLa01BOEdBMVVkRXdFQi93UUZNQU1CCkFmOHdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBRlJDdjh6cnAwNm1LRC9DWGVjVHpXdFhKbkVJR3dRY2F6eC8KSzZYSDgwaFFVbllKcDBBZkNlNlp1SjlMc2ZtalZhVmRSTjUyaGZmZ3RHZjU1TFkvUUMvdnE2Wkp6VklDVEdSMQpZclczY3Vld0k0b1hmUGJ0WWhUZks0TEk4M0p3dGJDYThTZTdNMFNsZnl4OWN1WlIxT2xiZ3kxbTF4MmlId1VlCklnblA0YzlnSG1aUmhFR2xnTkp1cDNVbVRkUi9KTnliMGdCVk9VdExldkV4cUpvNldhaHFyL1FnNmhZRHpsZzAKT0N2cGYwSFRLQUJRZklsldfikhbEU3BSRVhBYlNFbFR3aFpQRFJNSmNvYTNzRDhsam9JS1NFS0FvNkJKenFaNHg1Wk01ZwppLzZFS2EwRzU3enVMbk1vczhKU3FKUHhLU25SZ2ExckR1M0g2S2Nway8zNFVCUGZMQzg9Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K",
      "namespace": "a3ViZS1zeXN0ZW0=",
      "token": "ZXlKaGJHY2lPaUpTVXpJMU5pSXNJbXRwWkNJNklpSjkuZXlKcGMzTWlPaUpyZFdKbGNtNWxkR1Z6TDNObGNuWnBZMlZoWTJOdmRXNTBJaXdpYTNWaVpYSnVaWFJsY3k1cGJ5OXpaWEoyYVdObFlXTmpiM1Z1ZEM5dVlXMWxjM0JoWTJVaU9pSnJkV0psTFhONWMzUmxiU0lzSW10MVltVnlibVYwWlhNdWFXOHZjMlZ5ZG1salpXRmpZMjkxYm5RdmMyVmpjbVYlsdkjfkdfwTG01aGJXVWlPaUpqWVc1aGJDMTBiMnRsYmkwMk56bG9OeUlzSW10MVltVnlibVYwWlhNdWFXOHZjMlZ5ZG1salpXRmpZMjkxYm5RdmMyVnlkbWxqWlMxaFkyTnZkVzUwTG01aGJXVWlPaUpqWVc1aGJDSXNJbXQxWW1WeWJtVjBaWE11YVc4dmMyVnlkbWxqWldGalkyOTFiblF2YzJWeWRtbGpaUzFoWTJOdmRXNTBMblZwWkNJNkltUTVOamcyWVRWbExUUTBaak10TVRGbE9TMDVOakJrTFRBeU1EQTNZVGxoTURBeFppSXNJbk4xWWlJNkluTjVjM1JsYlRwelpYSjJhV05sWVdOamIzVnVkRHByZFdKbExYTjVjM1JsYlRwallXNWhiQ0o5LkN2LTZiWFdjQlU1VnZCZjJKSUVpc1BIOHZKYTllY01ra0JNbTg0dE9Qd3N1MVNnWUp3V2cwVlBFT2hnTzltdUNoMzFMTzRMOHpabklaeU0yUUNoRmo4TEtKcDJJU2FXa05Nb0c4RmJUcEtCWGNKd2FOZVNCMlo2M01LRnNyZlhQMnpkSmFjSGVuUi1KaTJsdW5rMmFRYnE3eFVreGxqdkc5SVVEY05aZmlrUllhbUVhd1hFeG1RYVhkalpGRWgwT2J2VDVsdGVVY2xYcXhIMFpzWktUNWRfYWttRmRZT3B3UVZOSUlDS0JxZmFZWjBULXliMmxmbDREYTFNUndNLV93TzVXNUdtbVo1UGdubGQxTjZqaGxEekladWp6cVFQSlh3MGU4V3VXVVlPX09YNDJ5YVVoM3pUS3F1ejhVTjVkS0pDcEF4WFd4RWFsZWV0MThMUFUwUQ=="
    },
    "kind": "Secret",
    "metadata": {},
    "type": "kubernetes.io/service-account-token"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets/:id?cluster_id=:cluster_id</code>

Retrieve a secret and all its info in a given [environment](#administration-environments).

| Required                   | &nbsp;                                            |
| -------------------------- | ------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to get the secret. |

| Attributes                  | &nbsp;                                                                     |
| --------------------------- | -------------------------------------------------------------------------- |
| `id` <br/>_string_          | The id of the secret.                                                      |
| `apiVersion` <br/>_string_  | The API version used to retrieve the secret.                               |
| `encodedData` <br/>_string_ | The data that the secret contains.                                         |
| `metadata` <br/>_object_    | The metadata of the secret.                                                |
| `kind` <br/>_string_        | A string value representing the REST resource that this object represents. |
| `type` <br/>_string_        | A string used to facilitate programmatic handling of a secret's data.      |

<!-------------------- CREATE A SECRET -------------------->

##### Create a secret

```shell
curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Secret",
  "metadata": {
    "name": "mysecret"
  },
  "type": "Opaque",
  "stringData": {
    "username": "my-username",
    "password": "my-password"
  }
}

# OR

curl -X POST \
  -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets?cluster_id=:cluster_id"
  Content-Type: application/json
  {
  "apiVersion": "v1",
  "kind": "Secret",
  "metadata": {
    "name": "mysecret"
  },
  "type": "Opaque",
  "encodedData": {
    "username": "YWRtaW4=",
    "password": "MWYyZDFlMmU2N2Rm"
  }
}
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets?cluster_id=:cluster_id</code>

Create a secret in a given [environment](#administration-environments).

| Required Attributes           | &nbsp;                                               |
| ----------------------------- | ---------------------------------------------------- |
| `cluster_id` <br/>_string_    | The id of the cluster in which to delete the secret. |
| `apiVersion` <br/> _string_   | The api version (versioned schema) of the secret.    |
| `metadata` <br/>_object_      | The metadata of the secret.                          |
| `metadata.name` <br/>_string_ | The name of the secret.                              |

One of the following two attributes is also required.

| Attributes                 | &nbsp;                                                                |
| -------------------------- | --------------------------------------------------------------------- |
| `encodedData`<br/>_object_ | The base64 encoded data stored in the secret.                         |
| `stringData`<br/>_object_  | The non-base64 encoded data to be encoded when the secret is created. |

| Optional Attributes                | &nbsp;                                       |
| ---------------------------------- | -------------------------------------------- |
| `metadata.namespace` <br/>_string_ | The namespace in which the secret is created |

Return value:

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the create secret task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |

<!-------------------- DELETE SECRET -------------------->

##### Delete a secret

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/a_service/an_environment/secrets/default-token-xxxmt/default?cluster_id=a_cluster_id"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "1542bd45-4732-419b-87b6-4ea6ec695c2b",
  "taskStatus": "PENDING"
}
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/secrets/:id?cluster_id=:cluster_id</code>

Delete a secret from a given [environment](#administration-environments).

| Required                   | &nbsp;                                               |
| -------------------------- | ---------------------------------------------------- |
| `cluster_id` <br/>_string_ | The id of the cluster in which to delete the secret. |

| Attributes                 | &nbsp;                                          |
| -------------------------- | ----------------------------------------------- |
| `taskId` <br/>_string_     | The id corresponding to the delete secret task. |
| `taskStatus` <br/>_string_ | The status of the operation.                    |
