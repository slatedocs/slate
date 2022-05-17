### Images

Images are virtual machine images that have a virtual disk that contains a bootable operating system.

#### List images

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/images"
```
> The above command returns a JSON structured like this:

```json
{
   "data": [
      {
         "id": "22f53310-798d-4029-bb00-747a52d2a376",
         "name": "ubuntu"
      },
      {
         "id": "68f9027d-cf64-4648-a0fa-4667d5618b6b",
         "name": "centos7"
      }
   ],
   "metadata": {
      "recordCount": 2
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/images</code>

Retrieve a list of available images.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The image's id.
`name`<br/>*string* | The image name.

#### Retrieve an image

```shell
curl -H "MC-Api-Key: your_api_key" \
    "https://cloudmc_endpoint/api/v1/services/compute-os/devel/images/22f53310-798d-4029-bb00-747a52d2a376"
```
> The above command returns a JSON structured like this:

```json
{
   "data": {
      "id": "22f53310-798d-4029-bb00-747a52d2a376",
      "name": "ubuntu"
   }
}
```

<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/images/:id</code>

Retrieve information about an image.

Attributes | &nbsp;
------- | -----------
`id`<br/>*UUID* | The image's id.
`name`<br/>*string* | The image name.
