## Caches

Whenever any entity objects is retrieved from the backend-service, the result of the fetch operation will be automatically cached temporarily to avoid any subsequent calls to the backend service.

This behaviour can be enabled/disabled per Service Connection by browsing to the Service Connection page under the Administration menu.

### Clear the Fetcher Cache

This operation will clear the current content of the cache containing entity objects retrieved from the backend-service by the Fetcher.

`DELETE /cache/fetcher`

```shell
curl -X DELETE \
"https://cloudmc_endpoint/rest/cache/fetcher?connectionId=f789261c-b2db-427e-bdff-dd3629192087&environmentId=099a86b2-0998-4d99-b036-0d85fa7c82a7" \
  -h "Mc-Api-Key: your_api_key"
```

> The above command returns no content (HTTP 204 No Content)

Clear the cache for the given environment within the given connection.

Query Params               | &nbsp;
-------------------------- | -----------
`connectionId`<br/>*UUID*  | The Connection ID
`environmentId`<br/>*UUID* | The Environment ID