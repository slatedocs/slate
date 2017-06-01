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
        "id": "d49b2922-0581-4587-94df-6fe719327d0f"
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
    "id": "d49b2922-0581-4587-94df-6fe719327d0f"
  }
}
```

<code>GET /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns/:id</code>

Retrieve information about a site-to-site VPN.

Attributes | &nbsp;
---------- | -----
`id`<br/>*UUID* | The id of the site-to-site VPN


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

}
```
 <code>POST /services/<a href="#service-connections">:service_code</a>/<a href="#environments">:environment_name</a>/sitetositevpns</code>

Create a site-to-site VPN

Required | &nbsp;
------ | -----------


Optional | &nbsp;
------ | -----------

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