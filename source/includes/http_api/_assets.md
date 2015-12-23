Assets API
==========

## Assets

Assets are files that you can upload to giosg system and that are publicly available. They are useful to hosts resources for you custom customized giosg products or your website components!

Even though asset contents are publicly available, they can only be accessed with an URL. In other words, only your organization members are able to see the list of your organization assets. When the asset is used somewhere, e.g. on your custom chat dialog or your website, anyone is (and need to be) able to download its contents and see its public attributes.

An asset resource has the following attributes.

Attribute     | Type      | Editable     | Description
--------------|-----------|--------------|------------
`id`            | [ID][]    | read-only    | [UUID][] string identifier
`name`          | string    | **required**     | Short, human-readable name.
`description`   | string    | **optional**     | Human-readable description
`organization_id` | [ID][]   | read-only    | The ID of the owner organization
`organization`       | object    | read-only    | The owner organization resource
`file_name`     | string    | read-only    | The original file name of the uploaded file
`url`           | string    | read-only    | The full URL for original, uploaded file. **Use this URL to link to your asset!**
`size`          | integer   | read-only    | Size of the uploaded file in bytes
`content_type`  | string    | read-only    | [Content type][] of the uploaded file, e.g. `image/jpeg` (or `null` if unknown)
`kind`          | string    | read-only    | What kind of file the asset is: `"image"`, `"css"`, `"javascript"`, `"font"` or `null` (unknown)
`charset`       | string    | read-only    | Character encoding for a text file, e.g. `UTF-8` (or `null` if binary or unknown)
`created_at`    | date/time | read-only | When the asset was created
`created_by_user_id` | [ID][] | read-only | The ID of the person who created this asset
`created_by_user` | object | read-only | The person resource who created this asset
`updated_at`   | date/time | read-only | When the asset name or description was last time updated
`updated_by_user_id` | [ID][] | read-only | The ID of the person who last time updated this asset
`updated_by_user` | object | read-only | The person resource who last time updated this asset
`width` | integer | read-only | The width of an image in pixels. Available for images only. It is `null` for other assets.
`height` | integer | read-only | The height of an image in pixels. Available for images only. It is `null` for other assets.

### Upload a new asset

Upload a file creating a new asset for a organization.

`POST /api/v5/orgs/<organization_id>/assets`

<aside class="warning">
<strong>IMPORTANT!</strong> In contrast to the all other API endpoints, this only accepts <code>multipart/form-data</code> requests, because you need to upload a file with the request. The request payload takes the following attributes.
</aside>

Attribute   | Type   | Editable     | Description
------------|--------|--------------|------------
`upload`      | file   | **required** | The asset file to be uploaded. File name is required.
`name`        | string | **optional**     | Name for the newly created asset. If omitted, defaults to the file name. Otherwise, it must be a non-empty string value.
`description` | string | **optional**     | Description for this asset.

This endpoint returns an [asset][] resource. It results in a 400 response if the upload would exceed your organization's free asset storage space.

### List assets

Get a paginated collection of all the assets of your organization:

`GET /api/v5/orgs/<organization_id>/assets`

The endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at` or `-created_at`

### Retrieve a single asset

`GET /api/v5/orgs/<organization_id>/assets/<asset_id>`

### Update an asset
You may update the `name` and/or `description` attributes of an asset.

`PUT /api/v5/orgs/<organization_id>/assets/<asset_id>`

`PATCH /api/v5/orgs/<organization_id>/assets/<asset_id>`

### Delete an asset
You may delete your assets. Their size is freed for new asset uploads.

`DELETE /api/v5/orgs/<organization_id>/assets/<asset_id>`

### Retrieve organization's storage information
You may check your organization's current asset storage space usage:

`GET /api/v5/orgs/<organization_id>/quota`

This returns an object with the following attributes:

Attribute   | Type   | Description
------------|--------|--------------
`free_space` | integer | Total free space for new assets, in bytes
`usage` | integer | Sum of all your organization asset sizes, in bytes
`limit` | The maximun allowed sum of your organization asset sizes, in bytes
