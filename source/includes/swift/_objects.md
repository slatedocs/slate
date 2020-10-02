### Objects

Create and manage your objects.

<!-------------------- PREVIEW OBJECTS -------------------->

#### Preview objects

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/v1/services/swift/my-env/objects/my-private-bucket/my-object.jpg/redirect?operation=preview"
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/objects/:id/redirect</code>

Preview private objects by generating a temporary URL that provides GET access for limited time. The generated URL will expire after one hour.

<aside class="notice">
Object preview is only available for private objects. The Get URL operation is preferred for public objects.
<br/>
Object preview requires  <a href="https://docs.openstack.org/swift/latest/api/temporary_url_middleware.html">TempURL Middleware</a>  be configured on the cluster. At time of writing, object preview only supports <code>SHA-1</code> digests. Ensure HTTP <code>GET</code> requests and digest <code>SHA-1</code> is allowed on the cluster.
<br/>
If the secret <code>X-Account-Meta-Temp-URL-Key</code> key does not already exist, the operation will set one on the user account.
</aside>