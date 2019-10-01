#### Forwarding rules

<!-------------------- DELETE A FORWARDING RULE -------------------->

#### Delete a forwarding rule

```shell
curl -X DELETE \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/gcp/test-area/forwardingrules/5459493658413662148"
```

<code>DELETE /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/forwardingrules/:id</code>

Destroy an existing global forwaring rule.