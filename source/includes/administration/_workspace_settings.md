## Workspace Settings

<!-------------------- FIND WORKSPACE SETTINGS -------------------->

### Find workspace settings associated to an organization

`GET /reseller/settings/workspace/find?organizationId=:id`

Retrieve the workspace settings associated to an organization. If the `organizationId` is omitted, the authenticated user's organization will be used.

```shell
# Retrieve the workspace settings
curl "https://cloudmc_endpoint/api/v2/reseller/settings/workspace/find?organizationId=10572c3d-16e5-450f-8af8-a01e50dc52d4" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "f7ad28a8-1227-44de-9785-6dbd556f3bda",
    "version": 1,
    "detailsViewSummaryFieldsLayout": "CONDENSED",
    "supportsMultiStep": false,
  }
}
```

Retrieve the workspace settings associated to an organization.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured workspace settings' id.
`organization.id`<br/>*UUID* | The organization id that the workspace settings are linked to. It cannot be changed.
`version`<br/>*integer* | The workspace settings version.
`detailsViewSummaryFieldsLayout`<br/>*enum* | The layout to render summary fields in detail views. It could be either "DEFAULT" or "CONDENSED".
`supportsMultiStep`<br/>*boolean* | If true, the operation's (create/edit) forms for the service connection of an organization will appear in multi-step mode.

<!-------------------- GET WORKSPACE SETTINGS -------------------->
### Retrieve workspace settings

`GET /reseller/settings/workspace/:id`

```shell
# Retrieve workspace settings
curl "https://cloudmc_endpoint/api/v2/reseller/settings/workspace/f7ad28a8-1227-44de-9785-6dbd556f3bda" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "f7ad28a8-1227-44de-9785-6dbd556f3bda",
    "version": 1,
    "detailsViewSummaryFieldsLayout": "CONDENSED",
    "supportsMultiStep": false,
  }
}
```

Retrieve the workspace settings associated to the workspace settings id.

Attributes | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured workspace settings' id.
`organization.id`<br/>*UUID* | The organization id that the workspace settings are linked to. It cannot be changed.
`version`<br/>*integer* | The workspace settings version.
`detailsViewSummaryFieldsLayout`<br/>*enum* | The layout to render summary fields in detail views. It could be either "DEFAULT" or "CONDENSED".
`supportsMultiStep`<br/>*boolean* | If true, the operation's (create/edit) forms for the service connection of an organization will appear in multi-step mode.

<!-------------------- CREATE WORKSPACE SETTINGS -------------------->
### Create workspace setting

`POST /reseller/settings/workspace`

Create a new workspace settings.

```shell
# Creates a new workspace settings
curl -X POST "https://cloudmc_endpoint/api/v2/reseller/settings/workspace" \
   -H "MC-Api-Key: your_api_key"
```

> Request body example:

```json
{
 "organization": {
  "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
 },
 "detailsViewSummaryFieldsLayout": "CONDENSED",
 "supportsMultiStep": false,
}
```

> The above command return JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 1,
    "detailsViewSummaryFieldsLayout": "CONDENSED",
    "supportsMultiStep": false,
  }
}
```

Required | &nbsp;
---------- | -----------
`detailsViewSummaryFieldsLayout`<br/>*enum* | The layout to render summary fields in detail views. It could be either "DEFAULT" or "CONDENSED".
`supportsMultiStep`<br/>*boolean* | If true, the operation's (create/edit) forms for the service connection of an organization will appear in multi-step mode.

Optional | &nbsp;
---------- | -----------
`organization.id`<br/>*UUID* | The organization id that the workspace settings are linked to. If the `organizationId` is omitted, the authenticated user's organization will be used.

<!-------------------- UPDATE WORKSPACE SETTINGS -------------------->
### Update workspace settings

`PUT /reseller/settings/workspace/:id`

Updates the workspace settings of an organization.

```shell
# Updates an existing workspace settings for an organization
curl -X PUT "https://cloudmc_endpoint/api/v2/reseller/settings/workspace/d785ffcb-9b03-478d-a49b-52a2ccedf1b8 \
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
 "detailsViewSummaryFieldsLayout": "DEFAULT",
 "supportsMultiStep": false,
}
```

> The above command return JSON structured like this:

```json
{
  "data": {
    "organization": {
      "id": "10572c3d-16e5-450f-8af8-a01e50dc52d4"
    },
    "id": "d785ffcb-9b03-478d-a49b-52a2ccedf1b8",
    "version": 2,
    "detailsViewSummaryFieldsLayout": "DEFAULT",
    "supportsMultiStep": false,
  }
}
```

Required | &nbsp;
---------- | -----------
`id`<br/>*UUID* | The configured workspace settings' id.
`organization.id`<br/>*UUID* | The organization id that the workspace settings are linked to. It cannot be changed.
`detailsViewSummaryFieldsLayout`<br/>*enum* | The layout to render summary fields in detail views. It could be either "DEFAULT" or "CONDENSED".
`supportsMultiStep`<br/>*boolean* | If true, the operation's (create/edit) forms for the service connection of an organization will appear in multi-step mode.

<!-------------------- DELETE WORKSPACE SETTINGS -------------------->
### Delete workspace settings

`DELETE /reseller/settings/workspace/:id`

Delete an existing workspace settings.

```shell
curl -X DELETE "https://cloudmc_endpoint/api/v2/reseller/settings/workspace/d785ffcb-9b03-478d-a49b-52a2ccedf1b8" \
   -H "MC-Api-Key: your_api_key"
```

> The above command returns a JSON structured like this:

```json
{
  "taskId": "26022b83-9797-44c0-883c-7e82ecb757e9",
  "taskStatus": "SUCCESS"
}
```
