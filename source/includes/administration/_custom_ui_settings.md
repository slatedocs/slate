### Custom UI Settings

<!-------------------- FIND CUSTOM UI SETTINGS -------------------->

#### Find custom ui settings associated to an organization

`GET /reseller/settings/custom_ui/find?organizationId=:id`

Retrieve the custom ui settings associated to an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Retrieve the custom ui settings
curl "https://cloudmc_endpoint/api/v2/reseller/settings/custom_ui/find?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 1,
    "enabled": true,
    "customUIRootUrl": "https://newui.example.com",
    "domainToken": "example.com",
    "applyTags": [],
    "denyTags": [],
    "redirectRoles": []
  }
}
```

Retrieve the custom UI settings associated to an organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured custom UI settings' id.
`organization.id`<br/>*UUID* | The organization id that the custom UI settings are linked to. It cannot be changed.
`version`<br/>*integer* | The custom UI settings version.
`enabled`<br/>*boolean* | If the custom ui redirection is enabled or not.
`customUIRootUrl`<br/>*string* | The base root that the user will be redirected to once the user is login.
`domainToken`<br/>*string* | The domain name that will be used in the authentication cookie. The cookie must be acceptable by both the reseller organization custom domain and the url provided in this configuration.
`applyTags`<br/>*Array[string]* | The list of organization tags that will redirect the user of sub-organizations to the custom ui if they match.
`denyTags`<br/>*Array[string]* | The list of organization tags that will not redirect the user of sub-organizations to the custom ui if they match.
`redirectRoles`<br/>*Array[string]* | The list of roles that users of the reseller will be redirected to the new UI. Possible values are `reseller`,`admin`,`user`,`guest`.



<!-------------------- GET CUSTOM UI SETTINGS -------------------->
#### Retrieve custom UI settings

`GET /reseller/settings/custom_ui/:id`

```shell
# Retrieve custom UI settings
curl "https://cloudmc_endpoint/api/v2/reseller/settings/custom_ui/d785ffcb-9b03-478d-a49b-52a2ccedf1b8" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 1,
    "enabled": true,
    "customUIRootUrl": "https://newui.example.com",
    "domainToken": "example.com",
    "applyTags": [],
    "denyTags": [],
    "redirectRoles": []
  }
}
```

Retrieve the custom UI settings associated to the custom UI settings id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured custom UI settings' id.
`organization.id`<br/>*UUID* | The organization id that the custom UI settings are linked to. It cannot be changed.
`version`<br/>*integer* | The custom UI settings version.
`enabled`<br/>*boolean* | If the custom ui redirection is enabled or not.
`customUIRootUrl`<br/>*string* | The base root that the user will be redirected to once the user is login.
`domainToken`<br/>*string* | The domain name that will be used in the authentication cookie. The cookie must be acceptable by both the reseller organization custom domain and the url provided in this configuration.
`applyTags`<br/>*Array[string]* | The list of organization tags that will redirect the user of sub-organizations to the custom ui if they match.
`denyTags`<br/>*Array[string]* | The list of organization tags that will not redirect the user of sub-organizations to the custom ui if they match.
`redirectRoles`<br/>*Array[string]* | The list of roles that users of the reseller will be redirected to the new UI. Possible values are `reseller`,`admin`,`user`,`guest`.

<!-------------------- CREATE CUSTOM UI SETTINGS -------------------->
#### Create custom UI settings

`POST /reseller/settings/custom_ui`

Create new custom UI settings.

```shell
# Creates a new custom UI settings
curl -X POST "https://cloudmc_endpoint/api/v2/reseller/settings/custom_ui" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
  "organization": {
    "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
  },
  "enabled": true,
  "customUIRootUrl": "https://newui.example.com",
  "domainToken": "example.com",
  "applyTags": [],
  "denyTags": [],
  "redirectRoles": []
}
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 1,
    "enabled": true,
    "customUIRootUrl": "https://newui.example.com",
    "domainToken": "example.com",
    "applyTags": [],
    "denyTags": [],
    "redirectRoles": []
  }
}
```

Required | &nbsp;
---------- | -----------
`enabled`<br/>*boolean* | If the custom ui redirection is enabled or not.

Optional | &nbsp;
---------- | -----------
`organization.id`<br/>*UUID* | The organization id that the custom UI settings are linked to. If the `organizationId` is omitted, the authenticated user's organization will be used.
`customUIRootUrl`<br/>*string* | The base root that the user will be redirected to once the user is login. Required if the custom ui is enabled.
`domainToken`<br/>*string* | The domain name that will be used in the authentication cookie. The cookie must be acceptable by both the reseller organization custom domain and the url provided in this configuration. Required if the custom ui is enabled.
`applyTags`<br/>*Array[string]* | The list of organization tags that will redirect the user of sub-organizations to the custom ui if they match.
`denyTags`<br/>*Array[string]* | The list of organization tags that will not redirect the user of sub-organizations to the custom ui if they match.
`redirectRoles`<br/>*Array[string]* | The list of roles that users of the reseller will be redirected to the new UI. Possible values are `reseller`,`admin`,`user`,`guest`.

<!-------------------- UPDATE CUSTOM UI SETTINGS -------------------->
#### Update custom UI settings

`PUT /reseller/settings/custom_ui/:id`

Updates the custom UI settings of an organization.

```shell
# Updates an existing custom UI settings for an organization
curl -X PUT "https://cloudmc_endpoint/api/v2/reseller/settings/custom_ui/d785ffcb-9b03-478d-a49b-52a2ccedf1b8 \
   -H "MC-Api-Key: your_api_key"
   -H "Content-Type: application/json" \
   -d "request-body"
```

> Request body example:

```json
{
  "organization": {
    "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
  },
  "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
  "version": 1,
  "enabled": true,
  "customUIRootUrl": "https://newui.example.com",
  "domainToken": "example.com",
  "applyTags": [],
  "denyTags": [],
  "redirectRoles": []
}
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 1,
    "enabled": true,
    "customUIRootUrl": "https://newui.example.com",
    "domainToken": "example.com",
    "applyTags": [],
    "denyTags": [],
    "redirectRoles": []
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured custom UI settings' id.
`organization.id`<br/>*UUID* | The organization id that the custom UI settings are linked to. It cannot be changed.
`enabled`<br/>*boolean* | If the custom ui redirection is enabled or not.

Optional | &nbsp;
---------- | -----------
`customUIRootUrl`<br/>*string* | The base root that the user will be redirected to once the user is login. Required if the custom ui is enabled.
`domainToken`<br/>*string* | The domain name that will be used in the authentication cookie. The cookie must be acceptable by both the reseller organization custom domain and the url provided in this configuration. Required if the custom ui is enabled.
`applyTags`<br/>*Array[string]* | The list of organization tags that will redirect the user of sub-organizations to the custom ui if they match.
`denyTags`<br/>*Array[string]* | The list of organization tags that will not redirect the user of sub-organizations to the custom ui if they match.
`redirectRoles`<br/>*Array[string]* | The list of roles that users of the reseller will be redirected to the new UI. Possible values are `reseller`,`admin`,`user`,`guest`.

<!-------------------- DELETE CUSTOM UI SETTINGS -------------------->
#### Delete custom UI settings

`DELETE /reseller/settings/custom_ui/:id`

Delete an existing custom UI settings.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v2/reseller/settings/custom_ui/d785ffcb-9b03-478d-a49b-52a2ccedf1b8" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "26022b83-9797-44c0-883c-7e82ecb757e9",
  "taskStatus": "SUCCESS"
}
```
