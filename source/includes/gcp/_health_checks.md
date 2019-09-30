### Health checks

<!-------------------- DELETE A HEALTH CHECK -------------------->

#### Delete a health check

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/healthchecks/6938691570659391640"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/healthchecks/:id</code>

Destroy an existing health check. A health check can only be deleted if it's not used by a [backend service](#gcp-backend-services).
