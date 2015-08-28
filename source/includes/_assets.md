Assets API
==========

<aside class="info">
This API is available only if your account has the <strong>Assets</strong> feature.
</aside>

## Assets

Assets are files that you can upload to giosg system and that are publicly available. They are useful to hosts resources for you custom customized giosg products or your website components!

Even though asset contents are publicly available, they can only be accessed with an URL. In other words, only your company members are able to see the list of your company assets. When the asset is used somewhere, e.g. on your custom chat dialog or your website, anyone is (and need to be) able to download its contents and see its public attributes.

An asset resource has the following attributes.

Attribute     | Type      | Editable     | Description
--------------|-----------|--------------|------------
`id`            | string    | read-only    | [UUID][] string identifier
`name`          | string    | **required**     | Short, human-readable name.
`description`   | string    | **optional**     | Human-readable description
`company_id`    | integer   | read-only    | The ID of the owner company
`company`       | object    | read-only    | The owner company resource
`file_name`     | string    | read-only    | The original file name of the uploaded file
`url`           | string    | read-only    | The full URL for original, uploaded file. **Use this URL to link to your asset!**
`size`          | integer   | read-only    | Size of the uploaded file in bytes
`content_type`  | string    | read-only    | [Content type][] of the uploaded file, e.g. `image/jpeg` (or `null` if unknown)
`kind`          | string    | read-only    | What kind of file the asset is: `"image"`, `"css"`, `"javascript"`, `"font"` or `null` (unknown)
`charset`       | string    | read-only    | Character encoding for a text file, e.g. `UTF-8` (or `null` if binary or unknown)
`created_at`    | date/time | read-only | When the asset was created
`modified_at`   | date/time | read-only | When the asset name or description was last time modified
`creator_id` | integer | read-only | The ID of the person who created this asset
`creator` | object | read-only | The person resource who created this asset
`modifier_id` | integer | read-only | The ID of the person who last time modified this asset
`modifier` | object | read-only | The person resource who last time modified this asset
`width` | integer | read-only | The width of an image in pixels. Available for images only. It is `null` for other assets.
`height` | integer | read-only | The height of an image in pixels. Available for images only. It is `null` for other assets.

### Upload a new asset

Upload a file creating a new asset for a company.

`POST /api/v3/customer/assets`

**IMPORTANT!** In contrast to the all other API endpoints, this only accepts `multipart/form-data` requests, because you need to upload a file with the request. The request payload takes the following attributes.

Attribute   | Type   | Editable     | Description
------------|--------|--------------|------------
`upload`      | file   | **required** | The asset file to be uploaded. File name is required.
`name`        | string | **optional**     | Name for the newly created asset. If omitted, defaults to the file name. Otherwise, it must be a non-empty string value.
`description` | string | **optional**     | Description for this asset.

This endpoint returns an [asset][] resource. It results in a 400 response if the upload would exceed your company's free asset storage space.

### List assets

Get a paginated collection of all the assets of your company:

`GET /api/v3/customer/assets`

The endpoint accepts the following GET parameters.

Parameter | Type | Default | Description
----------|------|---------|------------
`ordering` | [ordering][] | `created_at` | Ordering of results with options `created_at`, `modified_at`, `name`, `kind`, `content_type`
`page` | integer | 1 | [Page][paginated collection] to get
`page_size` | integer | 50 | [Page size][paginated collection] for the pages, with max value of 100

### Retrieve a single asset

`GET /api/v3/customer/assets/[asset_id]`

### Update an asset
You may update the `name` and/or `description` attributes of an asset.

`PUT /api/v3/customer/assets/[asset_id]`

`PATCH /api/v3/customer/assets/[asset_id]`

### Delete an asset
You may delete your assets. Their size is freed for new asset uploads.

`DELETE /api/v3/customer/assets/[asset_id]`

### Retrieve company's storage information
You may check your company's current asset storage space usage:

`GET /api/v3/customer/quota`

This returns an object with the following attributes:

Attribute   | Type   | Description
------------|--------|--------------
`free_space` | integer | Total free space for new assets, in bytes
`usage` | integer | Sum of all your company asset sizes, in bytes
`limit` | The maximun allowed sum of your company asset sizes, in bytes
