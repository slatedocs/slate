### Subnetworks
Create and manage your subnetworks. Subnetworks belongs to a network.

<!-------------------- CREATE A SUBNETWORK -------------------->

#### Create a subnet

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request_body" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/subnetworks"
}'
```
> Request body example:

```json
{
  "name": "my-subnet",
	"shortRegion": "northamerica-northeast1",
	"ipCidrRange": "10.0.0.0/9",
	"network": "https://www.googleapis.com/compute/v1/projects/my-project/global/networks/my-network"
}
```

<code>POST /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/subnetworks</code>

Create a new subnetwork

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the instance
`shortRegion`<br/>*string* | A short version of the region name
`network`<br/>*string* | The selflink of the network
`ipCidrRange`<br/>*string* | The CIDR IP range of the subnetwork

Optional | &nbsp;
------- | -----------
`description`<br/>*string* | Description of the subnet