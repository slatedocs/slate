# Exporting API

## Report Exports

A report export has the following attributes:

Attribute | Type | Editable | Description
:---------|:-----|:---------|------------
`id` | [ID][] | read-only | An unique ID for the export
`starting_at` | [date/time][] | **required** | The start time of the exported time range (inclusive)
`ending_at` | [date/time][] | **required** | The end time of the exported time range (exclusive)
`room_id` | [ID][] | **required** | The ID of the [room][] from which the data is exported
`type` | string | **required** | Either `logs` or `stats`
`format` | string | **required** | The format of the file being exported. If type is `logs`, then the allowed options are `csv`, `xlsx` or `txt`. If type is `stats`, then the allowed options are `csv` or `xlsx`.
`is_real_conversation` | boolean | optional | Available only if type is `logs`. If `true`, then only export real conversations. If `false`, then only export non-real conversations. If `null` (the default) then do not filter.
`min_message_count` | integer | optional | Available only if type is `logs`. Defines the minimum number of actual messages that the chat should have to be included in the export. If omitted, then defaults to 0.
`created_at` | [date/time][] | read-only | When the export was started
`created_by_user_id` | [ID][] | read-only | ID of the user who started this export
`updated_at` | [date/time][] | read-only | When the export was last time modified
`completed_at` | [date/time][] | read-only | When the export completed (either successfully or with an error). It is `null` if the exporting is still in progress.
`is_failed` | boolean | read-only | `true` if the exporting has failed, `failed` if the export was successful, `null` if the export is still in progress
`url` | string | read-only | The full absolute `url` at which the exported report file can be downloaded. Only available if the export has completed successfully, otherwise `null`


### Start exporting a report

You can start a new report export:

`POST /api/v5/orgs/<organization_id>/users/<user_id>/reportexports`

You need to provide the required attributes as a payload. This returns the created report export resource in incomplete state. You can then later make a request to resolve if the export has finished.

This returns 201 when a export was started successfully. Returns 403 if you do not have access to the organization or the user, or **if you are not a manager**. Returns 404 if the organization is not found, or if the user does not belong to the user.

<aside class="info">
The real-time channel support will be added later!
</aside>

### Retrieve a report export

You can check if the report export has completed and where the final report file can be downloaded:

`GET /api/v5/orgs/<organization_id>/users/<user_id>/reportexports/<report_id>`

This returns 200 when successful. Returns 403 if you do not have access to the organization or the user. Returns 404 if the organization is not found, or if the user does not belong to the user.

<aside class="success">
Use the <code>url</code> attribute to start the download for the generated report file!
</aside>


### List report exports by a user

You can list all report exports created by a user as a [paginated collection][]. The results are sorted by the `created_at` timestamp in descending order, the newest first.

`GET /api/v5/orgs/<organization_id>/users/<user_id>/reportexports`

This returns 200 when successful. Returns 403 if you do not have access to the organization or the user. Returns 404 if the organization is not found, or if the user does not belong to the user.
