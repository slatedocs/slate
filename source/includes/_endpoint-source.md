## Sources

### Catalog

`/sources/`

A Shoji Catalog representing the Sources added by this User. POST a multipart form here, with an "uploaded_file" field containing the file to upload; 201 indicates success, and the returned Location header refers to the new Source resource.

The uploaded sources will use the file's filename as their .name attribute and will have blank description.

The catalog will include the sources' .name and .description

### Entity

`/sources/{id}/`

A Shoji Entity representing a single Source. Its "body" member contains:
name: A friendly name for the Source.
type: a string declaring the media type of the source. One of ("csv", "spss").
user_id: the id of the User who created the Source.
location: an absolute URI to the data. Currently, the only supported scheme is "crunchfile://", which indicates a file uploaded to Crunch.io.
settings: an object containing configuration for translating the source to crunch internals. Its members vary by type:
csv:
deleted_rows: an array of row indices to ignore.
delimiter: the character which separates fields within a row. Typically a comma (,).
header_rows: an array of row indices which should be used as headers.
quotechar: the character which delimits string fields. Typically a double-quote (").
quoting: one of the following integer codes:
0: QUOTE_MINIMAL. Exports should quote only those fields which contain special characters.
1: QUOTE_ALL. Exports should quote all fields.
2: QUOTE_NONNUMERIC. Imports should convert all non-quoted fields to numeric. Exports should quote all non-numeric fields.
3: QUOTE_NONE. Imports should not perform any special processing of quote characters. Exports should never quote fields.

A PUT must contain a JSON object with members from the Shoji Entity "body" which the client intends to update. 204 indicates success.

A DELETE destroys the Source resource. 204 indicates success.

`/sources/{id}/file/`

A GET returns the original source file.

`/sources/{id}/rows/`

An array of objects, one for each row in the Source's data, each of whose members are:
original_row_num: an incrementing integer index for each row
values: an ordered array of values for each Variable. The order matches that of /sources/{id}/colnames/, above.

`/sources/url_upload/`
This endpoint accepts only POST requests. It will expect a urlencoded payload with the `source_url` parameter that should point to a publicly accessible URL.
This endpoint will then download such file synchronously and verify that it is a valid source file. It will be made available for the current user sources catalog.