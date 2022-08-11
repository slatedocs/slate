### Clusters
List your Kubernetes clusters.

<!-------------------- LIST CLUSTERS -------------------->

#### List clusters

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/aws/test-area/clusters"
```
> The above command returns a JSON structured like this:

```json
{
  "data": [
    {
      "id": "test-cluster-1",
      "name": "test-cluster-1",
      "status": "ACTIVE",
      "endpoint": "https://2CEF4912C1CF0F97B068143243A7720B.gr7.us-east-1.eks.amazonaws.com",
      "creationTimestamp": "2022-06-30 12:57:11",
      "addressRange": "10.100.0.0/16",
      "vpcName": "vpc-0c11473c060163620",
      "subnetNames": [
          "subnet-0788e84e9f74187fc",
          "subnet-07fbc2fe11acae389",
          "subnet-00d68e63b69ebebbc",
          "subnet-06fcc57288a2df042",
          "subnet-04fd0e04992598e85"
      ],
      "totalMemory": 2.0,
      "totalVcpus": 4,
      "numberOfNodes": 2,
      "version": "1.22",
      "caCert": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeU1EY3hNekEwTlRBeE5Wb1hEVE15TURjeE1EQTBOVEF4TlZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTWx5CmZ5QmZhTThUZENLSzJuZ7VlK3RIVC9EZjBPL2h4SEMrUi9LUU0rL3dTckNoRTRHdGdNT1hHc2tqbCsyWjFEWSsKbnRqTVlGOXVFaS9KWVlMaHB5blhkeCtZajd9bXVFK3JoQUhvQ0Y3dzg2VXN1Z1pITkFDcmE1YzNOWkpmWUdiRApqNkVxU0l0VUhVUG5NNkdnRlkwam9DcXlmUlI0Mk9JdWVQTjlDS2UrMzJyTjY0akVsZDc1THdQS2U2RWhRdllmClUyLzcyRFFJTHMyRHJXbGpOdGZmdi9DbGxQZy85TDVMSHpWdWRXNDcxeFBOZVZnQ3hOTlFMTlRaV1J1UFc4TGcKYnFqUWUvTEc4aHlQMWt2QlhMOXpPdGs0SFMxT01jejIzMzhlRjNvRk9Db1BVSytQTDE0N0ZXNENBZWRhWmtLagpJTVRVc3Z4dW5LZk1CTEhQek0wQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZOY25DMVhjZG5xL1RtTCs0VWhRUVZsWG5UcnVNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRXdnRUJBRGVOWm83UkdVWTJidFRZRVdFdwplYlFsUzh2WlBZWnhkUk9TR2I1cTNYTm5MTmNDNVA2TmJkT3Zkb1BIbDkzc2dFWFcxdnhvNWErTTF0WWp5dDB2CjZobkJxcFNydWhSVTVDVWFnYVRjcWNhMURkUWlMTzhuLm1uM003dHZiZ3BRYzJzY3hIdW10MUw4Zk9SdDg3YU8KTDNyMzN0VDhmNkFlL0xRVHY1RFBWcnJ1MHFveUtDdFA0YWRmS21TNW5tNXdUT2dqSDdkRHdtR3cyTFdlbDFGYgo2MUxJVWFKZFA0dXhXN3R2UExOUXBERmNKOUwxSSsyeHE2S2h2NGlFdjJEb3ArNHlLQjd6Z3cvbVdnOFhOS1M4Clc4cElxQzhFQmY5R0ZzMVUzbFpBMFFkWEVrNjRHWXlLL0lqb0tFTlBhaVRxSVNWNG5VQm82cW5YZUxtOEtTTFYKTlR3PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
      "amazonResourceName": "arn:aws:eks:us-east-1:818164164244:cluster/test-cluster-1"
    },{
      "id": "test-cluster-2",
      "name": "test-cluster-2",
      "status": "ACTIVE",
      "endpoint": "https://33B9E5614EA65CE64E0956176B0571D3.gr7.us-east-1.eks.amazonaws.com",
      "creationTimestamp": "2022-06-30 12:57:54",
      "addressRange": "10.100.0.0/16",
      "vpcName": "vpc-0c11473c060163620",
      "subnetNames": [
          "subnet-0788e84e9f74187fc",
          "subnet-06fcc57288a2df042",
          "subnet-04fd0e04992598e85"
      ],
      "totalMemory": 0.5,
      "totalVcpus": 1,
      "numberOfNodes": 1,
      "version": "1.22",
      "caCert": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeU1EY3hNekEwTlRFeE1Wb1hEVE15TURjeE1EQTBOVEV4TVZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENRQVFvQ2dnRUJBS3ZlCjA0QmhlZDUyWXFPTWgrVGRuQVpPVVZUaTlPblVPbmFKVlJDYzgrSUh2NUhUaFZwRUFXWktpQjByM3R4ckQ0UDUKWnh2UXVZVDR6c2NodXgxN0VDYWU4RnkrVFhnYjJQN1RNYW9TOXFLb2VyNlBMUHRLNlNnb2lLNisyK3AyQTNKawpSUU4xblJwNkhWNmxXbnY0eW5lNzBzeUk5Zm94SnVWQXV1Q1k5VlJ6TlVKbExOcEF4b0ZnN0FPbStISGhKSmFVCmhRMFRjNnFBTlZHc2VVYWNHdlJXYXBJc3ZEbWRRbHRDL21CcmVjZWdnLzBzektuVTk1TndWYldYeUhGalRSVngKb24yNXEvVXVhOURVRUlseWFWekNDbTZHS2t3cFptbFJwSkFOWjJhMld5SmZjN1AwZmlsSmg5Q25yaitOcmtOVgowVnZISUdmajUwaWhlR1ExRllrQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1DQWY4d0hRWURWUjBPQkJZRUZBb1ViMXJxTkU5TzlqUksxSWhFMktjZUtFNWpNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRGdnRUJBS1pLejZJNzR4WUtuWThGdVZLawpsMHBEbjY3Q08vMTB1cFZqT3lScHc4dUEjMVVFSmRxT0V6ODAvQlZEZ09reGY4bDdPRDE1WjQrTlIzb1NKeUZKCnNJN3A5S2IxYm5oVGFDMDdpQXdiS2VCc29vZlBpdEZhK01hN3M5V1pQTCtEZmwvN3VObFo4Y3c0cXE5L0tGZ3oKVVJlNXNkN2lQRHNzRy9oc05waUdzSEh4ZWNzOHNRNVlQUkx6OTF0bTQrOGlsWjlMSm1WV1c1aTlUYU03YldESAo2RUs3N1dlSGo0L3RDTHB6dW55UGNHTGs0OFdPb2VmZGJWTUp3NFpyUEdNU0FaekN4SXhFY2YwRTh3NGJlaWtvCitkbU9iSzlJVzkyZEttRFQ0ZERlMmZWdnBsWnNRNXg2Ujk1TWFJdGdadU42VGYrdlp0bEg0TWxxV1FqbVlqVSsKRUdzPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
      "amazonResourceName": "arn:aws:eks:us-east-1:818164164244:cluster/test-cluster-2"
    }
  ],
  "metadata": {
    "recordCount": 2
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`status` <br/> *string* | The status of the cluster.
`vpcName` <br/> *string* | The name of the VPC associated with this cluster.
`addressRange` <br/> *string* | The IP address range of the container pods in this cluster, in CIDR notation (e.g. 10.96.0.0/14).
`subnetNames` <br/> *List&lt;string&gt;* | The list of names of all subnets associated with this cluster.
`amazonResourceName` <br/> *string* | The Amazon Resource Name (ARN) that uniquely identifies the cluster.
`version` <br/> *string* | The version of Kubernetes that the cluster is using.
`id` <br/> *string* | The cluster is uniquely identified by its name.
`totalMemory` <br/> *double* | The total amount of memory across all nodes in GB in the cluster.
`totalVcpus` <br/> *integer* | The total amount of virtual CPUs across all nodes in the cluster.
`numberOfNodes` <br/> *integer* | The total number of nodes in the cluster.
`name` <br/> *string* | The name of the cluster.
`caCert` <br> *string* | The certificate authority data for the cluster.
<!-------------------- RETRIEVE A CLUSTER -------------------->

#### Retrieve a cluster

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/aws/test-area/clusters/test-cluster-1"
```
> The above command returns a JSON structured like this:

```json
{
  "data": {
    "id": "test-cluster-1",
    "name": "test-cluster-1",
    "status": "ACTIVE",
    "endpoint": "https://2CEF4912C1CF0F97B068143243A7720B.gr7.us-east-1.eks.amazonaws.com",
    "creationTimestamp": "2022-06-30 12:57:11",
    "addressRange": "10.100.0.0/16",
    "vpcName": "vpc-0c11473c060163620",
    "subnetNames": [
        "subnet-0788e84e9f74187fc",
        "subnet-07fbc2fe11acae389",
        "subnet-00d68e63b69ebebbc",
        "subnet-06fcc57288a2df042",
        "subnet-04fd0e04992598e85"
    ],
    "totalMemory": 2.0,
    "totalVcpus": 4,
    "numberOfNodes": 2,
    "version": "1.22",
    "caCert": "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUMvakNDQWVhZ0F3SUJBZ0lCQURBTkJna3Foa2lHOXcwQkFRc0ZBREFWTVJNd0VRWURWUVFERXdwcmRXSmwKY201bGRHVnpNQjRYRFRJeU1EY3hNekEwTlRBeE5Wb1hEVE15TURjeE1EQTBOVEF4TlZvd0ZURVRNQkVHQTFVRQpBeE1LYTNWaVpYSnVaWFJsY3pDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDQVFvQ2dnRUJBTWx5CmZ5QmZhTThUZENLSzJuZ7VlK3RIVC9EZjBPL2h4SEMrUi9LUU0rL3dTckNoRTRHdGdNT1hHc2tqbCsyWjFEWSsKbnRqTVlGOXVFaS9KWVlMaHB5blhkeCtZajd9bXVFK3JoQUhvQ0Y3dzg2VXN1Z1pITkFDcmE1YzNOWkpmWUdiRApqNkVxU0l0VUhVUG5NNkdnRlkwam9DcXlmUlI0Mk9JdWVQTjlDS2UrMzJyTjY0akVsZDc1THdQS2U2RWhRdllmClUyLzcyRFFJTHMyRHJXbGpOdGZmdi9DbGxQZy85TDVMSHpWdWRXNDcxeFBOZVZnQ3hOTlFMTlRaV1J1UFc4TGcKYnFqUWUvTEc4aHlQMWt2QlhMOXpPdGs0SFMxT01jejIzMzhlRjNvRk9Db1BVSytQTDE0N0ZXNENBZWRhWmtLagpJTVRVc3Z4dW5LZk1CTEhQek0wQ0F3RUFBYU5aTUZjd0RnWURWUjBQQVFIL0JBUURBZ0trTUE4R0ExVWRFd0VCCi93UUZNQU1CQWY4d0hRWURWUjBPQkJZRUZOY25DMVhjZG5xL1RtTCs0VWhRUVZsWG5UcnVNQlVHQTFVZEVRUU8KTUF5Q0NtdDFZbVZ5Ym1WMFpYTXdEUVlKS29aSWh2Y05BUUVMQlFBRXdnRUJBRGVOWm83UkdVWTJidFRZRVdFdwplYlFsUzh2WlBZWnhkUk9TR2I1cTNYTm5MTmNDNVA2TmJkT3Zkb1BIbDkzc2dFWFcxdnhvNWErTTF0WWp5dDB2CjZobkJxcFNydWhSVTVDVWFnYVRjcWNhMURkUWlMTzhuLm1uM003dHZiZ3BRYzJzY3hIdW10MUw4Zk9SdDg3YU8KTDNyMzN0VDhmNkFlL0xRVHY1RFBWcnJ1MHFveUtDdFA0YWRmS21TNW5tNXdUT2dqSDdkRHdtR3cyTFdlbDFGYgo2MUxJVWFKZFA0dXhXN3R2UExOUXBERmNKOUwxSSsyeHE2S2h2NGlFdjJEb3ArNHlLQjd6Z3cvbVdnOFhOS1M4Clc4cElxQzhFQmY5R0ZzMVUzbFpBMFFkWEVrNjRHWXlLL0lqb0tFTlBhaVRxSVNWNG5VQm82cW5YZUxtOEtTTFYKTlR3PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==",
    "amazonResourceName": "arn:aws:eks:us-east-1:818164164244:cluster/test-cluster-1"
  }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters/:cluster_id</a></code>


Attributes | &nbsp;
------- | -----------
`creationTimestamp`<br/>*string* | Creation timestamp in RFC3339 text format.
`endpoint`<br/>*string* | The IP address of the cluster's master node. All interactions with the Kubernetes API are done through the master node.
`status` <br/> *string* | The status of the cluster.
`vpcName` <br/> *string* | The name of the VPC associated with this cluster.
`addressRange` <br/> *string* | The IP address range of the container pods in this cluster, in CIDR notation (e.g. 10.96.0.0/14).
`subnetNames` <br/> *List&lt;string&gt;* | The list of names of all subnets associated with this cluster.
`amazonResourceName` <br/> *string* | The Amazon Resource Name (ARN) that uniquely identifies the cluster.
`version` <br/> *string* | The version of Kubernetes that the cluster is using.
`id` <br/> *string* | The cluster is uniquely identified by its name.
`totalMemory` <br/> *double* | The total amount of memory across all nodes in GB in the cluster.
`totalVcpus` <br/> *integer* | The total amount of virtual CPUs across all nodes in the cluster.
`numberOfNodes` <br/> *integer* | The total number of nodes in the cluster.
`name` <br/> *string* | The name of the cluster.
`caCert` <br> *string* | The certificate authority data for the cluster.
<!-------------------- Create A CLUSTER -------------------->

#### Create a cluster

```shell
curl -X POST \
   -H "Content-Type: application/json" \
   -H "MC-Api-Key: your_api_key" \
   -d "request body" \
   "https://cloudmc_endpoint/api/v2/services/aws-aaaa/test-env/clusters"
```
> Request body examples:

```js
// Create a cluster
{
  "name": "my-cluster",
  "version": "1.22",
  "vpcId": "vpc-1234",
  "subnetIds": ["subnet-1", "subnet-2"],
  "numberOfNodes": 2,
  "instanceType": "t3.medium",
  "diskSize": 20
}
  ```

> The above command returns a JSON structured like this:

```json
{
	"taskId": "3f045006-07db-470b-927b-6b2cfe9821af",
	"taskStatus": "PENDING"
}
```
  
<code>CREATE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters</code>

Create a new cluster.

Required | &nbsp;
------- | -----------
`name`<br/>*string* | The display name of the cluster (unique). It cannot be changed after creation.
`version`<br/>*string* | The Kubernetes version of the cluster.
`vpcId`<br/>*string* | The ID of the vpc used for the cluster resources.
`subnetIds`<br/>*List* | The subnet IDs in your VPC where the control plane may place elastic network interfaces (ENIs) to facilitate communication with your cluster.
`numberOfNodes` <br/>*int* | Number of nodes in the primary node group for this cluster. You can resize the cluster after creation.
`instanceType`<br/>*string* | Machine type of the nodes in the default node group for this cluster.
`diskSize`<br/>*int* | Size of the attached EBS volume for each node in GiB.

<!-------------------- DELETE A CLUSTER -------------------->

#### Delete a cluster

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/aws/test-area/clusters/test-cluster-1"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/clusters/:id</code>

Delete a cluster. A cluster can only be deleted if it is in ACTIVE or FAILED state.

> The above command returns a JSON structured like this:

```json
{
  "taskId":"c4e7adce-5944-410f-85e1-f74ee7ac215b",
  "taskStatus":"PENDING"
}
``` 
