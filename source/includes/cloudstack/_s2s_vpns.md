### Site-to-site VPN


<!-------------------- LIST SITE-TO-SITE VPNS -------------------->

#### List site-to-site VPNs

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/sitetositevpns"

# Example:
```
```json
{
  "data": [
    {
        "id": "d49b2922-0581-4587-94df-6fe719327d0f",
        "name": "stargate",
        "gateway":"19.19.19.19",
        "cidr":"10.12.0.2/22",
        "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
        "ikeEncryptionAlgorithm": "3des",
        "ikeHashAlgorithm": "sha1",
        "ikeDhGroup":"modp1536",
        "ikeLifetime":86400,
        "espEncryptionAlgorithm":"3des",
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

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns</code>

Retrieve a list of all site-to-site VPNs in an [environment](#environments)

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the site-to-site VPN

Query Parameters | &nbsp;
---------- | -----
`vpc_id`<br/>*UUID* | Filter the list to only retrieve the site-to-site VPNs of a [VPC](#vpcs)

<!-------------------- RETRIEVE A SNAPSHOT -------------------->

#### Retrieve a site-to-site VPN

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/sitetositevpns/d49b2922-0581-4587-94df-6fe719327d0f"

# Example:
```
```json
{
  "data": {
      "id": "d49b2922-0581-4587-94df-6fe719327d0f",
      "name": "stargate",
      "state": "Connected",
      "vpcId": "3fe7d82a-f4c4-4552-ac3b-787fdafed4e7",
      "vpnCustomerGatewayId": "11e9e3cf-8607-4836-9caa-ea86dc35758f",
      "gateway":"19.19.19.19",
      "cidr":"10.12.0.2/22",
      "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
      "ikeEncryptionAlgorithm": "3des",
      "ikeHashAlgorithm": "sha1",
      "ikeDhGroup":"modp1536",
      "ikeLifetime":86400,
      "espEncryptionAlgorithm":"3des",
      "espHashAlgorithm":"sha1",
      "espPerfectForwardSecrecy":"modp1536",
      "espLifetime":3600,
      "dpd": false,
      "forceEncap": false
  }
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns/:id</code>

Retrieve information about a site-to-site VPN.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the site-to-site VPN
`name`<br/>*string* |  
`state`<br/>*string* |
`vpcId`<br/>*UUID* |
`vpnCustomerGatewayId`<br/>*UUID* |
`gateway`<br/>*string*  |
`cidr`<br/>*string*  |
`ipSecPsk`<br/>*string*  |
`ikeEncryptionAlgorithm`<br/>*string*  |
`ikeHashAlgorithm`<br/>*string*  |
`ikeDhGroup`<br/>*string*  | 
`ikeLifetime`<br/>*integer*  |
`espEncryptionAlgorithm`<br/>*string*  |
`espHashAlgorithm`<br/>*string*  |
`espPerfectForwardSecrecy`<br/>*string*  |
`espLifetime`<br/>*integer*  |
`dpd`<br/>*boolean*    | 
`forceEncap`<br/>*boolean* | 

<!-------------------- CREATE A SITE-TO-SITE VPN -------------------->

#### Create a site-to-site VPN

```shell

# Here is the absolute minimum information required to create a new site-to-site VPN:

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/sitetositevpns"

# Request should look like this
```
```json
{
      "name": "stargate",
      "vpcId": "3fe7d82a-f4c4-4552-ac3b-787fdafed4e7",
      "gateway":"19.19.19.19",
      "cidr":"10.12.0.2/22",
      "ipSecPsk": "WtOBS9GRux2XtJPtHY2TUvrv",
      "ikeEncryptionAlgorithm": "3des",
      "ikeHashAlgorithm": "sha1",
      "ikeDhGroup":"modp1536",
      "ikeLifetime":86400,
      "espEncryptionAlgorithm":"3des",
      "espHashAlgorithm":"sha1",
      "espPerfectForwardSecrecy":"modp1536",
      "espLifetime":3600,
      "dpd": false,
      "forceEncap": false
  }
```
 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns</code>

Create a site-to-site VPN

Required | &nbsp;
------ | -----------
`name`<br/>*string* |  
`vpcId`<br/>*UUID* |
`gateway`<br/>*string*  |
`cidr`<br/>*string*  |
`ipSecPsk`<br/>*string*  |
`ikeEncryptionAlgorithm`<br/>*string*  |
`ikeHashAlgorithm`<br/>*string*  |
`ikeDhGroup`<br/>*string*  | 
`ikeLifetime`<br/>*integer*  |
`espEncryptionAlgorithm`<br/>*string*  |
`espHashAlgorithm`<br/>*string*  |
`espPerfectForwardSecrecy`<br/>*string*  |
`espLifetime`<br/>*integer*  |

Optional | &nbsp;
------ | -----------
`dpd`<br/>*boolean*    | defaults to false
`forceEncap`<br/>*boolean* | defaults to false

<!-------------------- DELETE A SITE-TO-SITE VPN -------------------->


#### Delete a site-to-site VPN


```shell

# Example:

curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/sitetositevpns/d49b2922-0581-4587-94df-6fe719327d0f"
```

<code>DELETE /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns/:id</code>

Delete an existing site-to-site VPN.


<!-------------------- RESET A SITE-TO-SITE VPN -------------------->

#### Reset a site-to-site VPN

```shell

curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/compute-on/test_area/sitetositevpns/ca86b14f-20db-463d-b58a-9d3fa5959af2?operation=reset"

```
 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns/:id?operation=reset</code>

Reset a site-to-site VPN.