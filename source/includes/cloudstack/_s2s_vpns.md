### Site-to-site VPNs

A site-to-site VPN allows multiple sites to establish a secure connection over the public network. In our case, we are talking about a secure connection between your VPC and another network (e.g. VPC, offices).

<!-------------------- LIST SITE-TO-SITE VPNS -------------------->

#### List site-to-site VPNs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sitetositevpns"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
        "id": "d49b2922-0581-4587-94df-6fe719327d0f",
        "name": "stargate",
        "state": "Connected",
        "vpcId": "3fe7d82a-f4c4-4552-ac3b-787fdafed4e7",
        "gateway":"19.19.19.19",
        "cidrList":"10.12.0.2/22,10.0.0.0/24",
        "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
        "ikeEncryptionAlgorithm": "aes256",
        "ikeHashAlgorithm": "sha1",
        "ikeDhGroup":"modp1536",
        "ikeLifetime":86400,
        "espEncryptionAlgorithm":"aes256",
        "espHashAlgorithm":"sha1",
        "espPerfectForwardSecrecy":"modp1536",
        "espLifetime":3600,
        "dpd": false,
        "forceEncap": false
    }
  ],
  "metadata": {
    "recordCount": 1
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sitetositevpns</code>

Retrieve a list of all site-to-site VPNs in an [environment](#administration-environments).

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the site-to-site VPN
`name`<br/>*string* | The name of the site-to-site VPN
`state`<br/>*string* | The state of the site-to-site VPN. Can be Connected, Pending, Disconnected or Error. If disconnected, you can try to use the [reset](#cloudstack-reset-the-connection-of-a-site-to-site-vpn) operation
`vpcId`<br/>*UUID* | The VPC for which the site-to-site VPN was created.
`gateway`<br/>*string*  | The gateway of the network you want to connect to. NOTE: you cannot use a gateway that has already been used by a site-to-site VPN in your environment
`cidrList`<br/>*string*  | Comma-separated list of CIDRs of the networks you want to connect to.
`ipSecPsk`<br/>*string*  | IPSec pre-shared key.
`ikeEncryptionAlgorithm`<br/>*string*  | The Internet Key Exchange (IKE) policy for phase-1. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`ikeHashAlgorithm`<br/>*string*  | The IKE hash for phase-1. The supported hash algorithms are SHA1 and MD5.
`ikeDhGroup`<br/>*string*  | A public-key cryptography protocol which allows two parties to establish a shared secret over an insecure communications channel. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`ikeLifetime`<br/>*integer*  | The phase-1 lifetime of the security association in seconds.
`espEncryptionAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) algorithm within phase-2. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`espHashAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) hash for phase-2. Supported hash algorithms are SHA1 and MD5.
`espPerfectForwardSecrecy`<br/>*string*  | Perfect Forward Secrecy (or PFS) is the property that ensures that a session key derived from a set of long-term public and private keys will not be compromised. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`espLifetime`<br/>*integer*  | The phase-2 lifetime of the security association in seconds
`dpd`<br/>*boolean*    | A method to detect an unavailable Internet Key Exchange (IKE) peer.
`forceEncap`<br/>*boolean* | Force encapsulation for NAT Traversal

Query Parameters | &nbsp;
---------- | -----
`vpc_id`<br/>*UUID* | Filter the list to only retrieve the site-to-site VPNs of a [VPC](#cloudstack-vpcs)

<!-------------------- RETRIEVE A SITE-TO-SITE VPN -------------------->

#### Retrieve a site-to-site VPN

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sitetositevpns/d49b2922-0581-4587-94df-6fe719327d0f"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
      "id": "d49b2922-0581-4587-94df-6fe719327d0f",
      "name": "stargate",
      "state": "Connected",
      "vpcId": "3fe7d82a-f4c4-4552-ac3b-787fdafed4e7",
      "gateway":"19.19.19.19",
      "cidrList":"10.12.0.2/22,10.0.0.0/24",
      "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
      "ikeEncryptionAlgorithm": "aes256",
      "ikeHashAlgorithm": "sha1",
      "ikeDhGroup":"modp1536",
      "ikeLifetime":86400,
      "espEncryptionAlgorithm":"aes256",
      "espHashAlgorithm":"sha1",
      "espPerfectForwardSecrecy":"modp1536",
      "espLifetime":3600,
      "dpd": false,
      "forceEncap": false
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sitetositevpns/:id</code>

Retrieve information about a site-to-site VPN.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the site-to-site VPN
`name`<br/>*string* | The name of the site-to-site VPN
`state`<br/>*string* | The state of the site-to-site VPN. Can be Connected, Pending, Disconnected or Error. If disconnected, you can try to use the [reset](#cloudstack-reset-the-connection-of-a-site-to-site-vpn) operation
`vpcId`<br/>*UUID* | The VPC for which the site-to-site VPN was created.
`gateway`<br/>*string*  | The gateway of the network you want to connect to. NOTE: you cannot use a gateway that has already been used by a site-to-site VPN in your environment
`cidrList`<br/>*string*  | Comma-separated list of CIDRs of the networks you want to connect to.
`ipSecPsk`<br/>*string*  | IPSec pre-shared key.
`ikeEncryptionAlgorithm`<br/>*string*  | The Internet Key Exchange (IKE) policy for phase-1. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`ikeHashAlgorithm`<br/>*string*  | The IKE hash for phase-1. The supported hash algorithms are SHA1 and MD5.
`ikeDhGroup`<br/>*string*  | A public-key cryptography protocol which allows two parties to establish a shared secret over an insecure communications channel. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`ikeLifetime`<br/>*integer*  | The phase-1 lifetime of the security association in seconds.
`espEncryptionAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) algorithm within phase-2. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`espHashAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) hash for phase-2. Supported hash algorithms are SHA1 and MD5.
`espPerfectForwardSecrecy`<br/>*string*  |  Perfect Forward Secrecy (or PFS) is the property that ensures that a session key derived from a set of long-term public and private keys will not be compromised. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`espLifetime`<br/>*integer*  | The phase-2 lifetime of the security association in seconds
`dpd`<br/>*boolean*    | A method to detect an unavailable Internet Key Exchange (IKE) peer.
`forceEncap`<br/>*boolean* | Force encapsulation for NAT Traversal

<!-------------------- CREATE A SITE-TO-SITE VPN -------------------->

#### Create a site-to-site VPN

```shell
# Here is the absolute minimum information required to create a new site-to-site VPN:
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sitetositevpns"
```
> Request body example:

```json
{
      "name": "stargate",
      "vpcId": "3fe7d82a-f4c4-4552-ac3b-787fdafed4e7",
      "gateway":"19.19.19.19",
      "cidrList":"10.12.0.2/22,10.0.0.0/24",
      "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
      "ikeEncryptionAlgorithm": "aes256",
      "ikeHashAlgorithm": "sha1",
      "ikeDhGroup":"modp1536",
      "ikeLifetime":86400,
      "espEncryptionAlgorithm":"aes256",
      "espHashAlgorithm":"sha1",
      "espPerfectForwardSecrecy":"modp1536",
      "espLifetime":3600,
      "dpd": false,
      "forceEncap": false
  }
```
 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sitetositevpns</code>

Create a site-to-site VPN.

Required | &nbsp;
------ | -----------
`name`<br/>*string* | The name of the site-to-site VPN. Must be unique in the environment.
`vpcId`<br/>*UUID* | The VPC for which the site-to-site VPN was created.
`gateway`<br/>*string*  | The gateway of the network you want to connect to. NOTE: you cannot use a gateway that has already been used by a site-to-site VPN in your environment
`cidrList`<br/>*string*  | Comma-separated list of CIDRs of the networks you want to connect to.
`ipSecPsk`<br/>*string*  | IPSec pre-shared key.
`ikeEncryptionAlgorithm`<br/>*string*  | The Internet Key Exchange (IKE) policy for phase-1. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`ikeHashAlgorithm`<br/>*string*  | The IKE hash for phase-1. The supported hash algorithms are SHA1 and MD5.
`ikeDhGroup`<br/>*string*  | A public-key cryptography protocol which allows two parties to establish a shared secret over an insecure communications channel. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`ikeLifetime`<br/>*integer*  | The phase-1 lifetime of the security association in seconds.
`espEncryptionAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) algorithm within phase-2. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`espHashAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) hash for phase-2. Supported hash algorithms are SHA1 and MD5.
`espPerfectForwardSecrecy`<br/>*string*  |  Perfect Forward Secrecy (or PFS) is the property that ensures that a session key derived from a set of long-term public and private keys will not be compromised. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`espLifetime`<br/>*integer*  | The phase-2 lifetime of the security association in seconds

Optional | &nbsp;
------ | -----------

`dpd`<br/>*boolean*    | A method to detect an unavailable Internet Key Exchange (IKE) peer. Defaults to false
`forceEncap`<br/>*boolean* | Force encapsulation for NAT Traversal. Defaults to false

<!-------------------- UPDATE A SITE-TO-SITE VPN -------------------->

#### Update a site-to-site VPN

```shell
# Here is the absolute minimum information required to update a site-to-site VPN:
curl -X PUT \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sitetositevpns/d49b2922-0581-4587-94df-6fe719327d0f"
```
> Request body example:

```json
{
      "name": "stargate",
      "gateway":"19.19.19.19",
      "cidrList":"10.12.0.2/22,10.0.0.0/24",
      "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
      "ikeEncryptionAlgorithm": "aes256",
      "ikeHashAlgorithm": "sha1",
      "ikeDhGroup":"modp1536",
      "ikeLifetime":86400,
      "espEncryptionAlgorithm":"aes256",
      "espHashAlgorithm":"sha1",
      "espPerfectForwardSecrecy":"modp1536",
      "espLifetime":3600,
      "dpd": false,
      "forceEncap": false
  }
```
 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sitetositevpns/:id</code>

Update a site-to-site VPN.

Optional | &nbsp;
------ | -----------
`name`<br/>*string* | The name of the site-to-site VPN. Must be unique in the environment.
`gateway`<br/>*string*  | The gateway of the network you want to connect to. NOTE: you cannot use a gateway that has already been used by a site-to-site VPN in your environment
`cidrList`<br/>*string*  | Comma-separated list of CIDRs of the networks you want to connect to.
`ipSecPsk`<br/>*string*  | IPSec pre-shared key.
`ikeEncryptionAlgorithm`<br/>*string*  | The Internet Key Exchange (IKE) policy for phase-1. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`ikeHashAlgorithm`<br/>*string*  | The IKE hash for phase-1. The supported hash algorithms are SHA1 and MD5.
`ikeDhGroup`<br/>*string*  | A public-key cryptography protocol which allows two parties to establish a shared secret over an insecure communications channel. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`ikeLifetime`<br/>*integer*  | The phase-1 lifetime of the security association in seconds.
`espEncryptionAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) algorithm within phase-2. The supported encryption algorithms are AES128, AES192, AES256, and 3DES.
`espHashAlgorithm`<br/>*string*  | Encapsulating Security Payload (ESP) hash for phase-2. Supported hash algorithms are SHA1 and MD5.
`espPerfectForwardSecrecy`<br/>*string*  |  Perfect Forward Secrecy (or PFS) is the property that ensures that a session key derived from a set of long-term public and private keys will not be compromised. The supported options are Group-5 (1536-bit) and Group-2 (1024-bit).
`espLifetime`<br/>*integer*  | The phase-2 lifetime of the security association in seconds
`dpd`<br/>*boolean*    | A method to detect an unavailable Internet Key Exchange (IKE) peer. Defaults to false
`forceEncap`<br/>*boolean* | Force encapsulation for NAT Traversal. Defaults to false

<!-------------------- DELETE A SITE-TO-SITE VPN -------------------->


#### Delete a site-to-site VPN


```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sitetositevpns/d49b2922-0581-4587-94df-6fe719327d0f"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sitetositevpns/:id</code>

Delete an existing site-to-site VPN.


<!-------------------- RESET A SITE-TO-SITE VPN -------------------->

#### Reset the connection of a site-to-site VPN

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/compute-on/test_area/sitetositevpns/ca86b14f-20db-463d-b58a-9d3fa5959af2?operation=reset"
```
 <code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/sitetositevpns/:id?operation=reset</code>

Reset a site-to-site VPN.
