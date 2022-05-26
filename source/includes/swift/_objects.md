### Objects

Create and manage your objects.

<!-------------------- PREVIEW OBJECTS -------------------->

#### Preview objects

```shell
curl -X GET \
   -H "MC-Api-Key: your_api_key" \
   "https://cloudmc_endpoint/api/v2/services/swift/my-env/objects/my-private-bucket/my-object.jpg/redirect?operation=preview"
```
<code>GET /services/<a href="#administration-service-connections">:service_code</a>/<a href="#administration-environments">:environment_name</a>/objects/:id/redirect</code>

Preview both public and private objects. Previews of private objects will generate a temporary URL that provides GET access for limited time. The generated URL will expire after one hour.

<aside class="notice">
Preview of private objects requires <a href="https://docs.openstack.org/swift/latest/api/temporary_url_middleware.html">TempURL Middleware</a> be configured on the cluster with support for HTTP <code>GET</code> requests. Currently, private object preview supports digests <code>SHA-1</code>, <code>SHA-256</code> and <code>SHA-512</code>. The most secure digest configured on the cluster will be used.

<br/>
If the secret <code>X-Account-Meta-Temp-URL-Key</code> key does not already exist, the operation will set one on the user account.
</aside>