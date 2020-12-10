# Deauthorize

```shell
# With shell, you can revoke access to an application
curl -X "DELETE" "<base_url>/v1/permissions"
  -H "Authorization: Bearer <Token>"
```

Application access can be revoked by sending a request to delete all permissions.


### HTTP Request

`DELETE https://api.wahooligan.com/v1/permissions`