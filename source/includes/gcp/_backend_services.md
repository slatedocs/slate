#### Backend services

<!-------------------- DELETE A BACKEND SERVICE -------------------->

##### Delete a backend service

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/backendservices/2570199154720991429"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/backendservices/:id</code>

Delete an existing backend service.