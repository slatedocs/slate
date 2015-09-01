## Sources

### Catalog

`/sources/`

A Shoji Catalog representing the Sources added by this User. POST a multipart form here, with an "uploaded_file" field containing the file to upload; 201 indicates success, and the returned Location header refers to the new Source resource.

The uploaded sources will use the file's filename as their .name attribute and will have blank description.

The catalog will include the sources' .name and .description

Alternately, you may POST a urlencoded payload with a `source_url` parameter that points to a publicly accessible URL. Both "http" and the "s3" scheme are supported. This endpoint will then download such file synchronously and verify that it is a valid source file. It will be made available for the current user sources catalog.

### Entity

`/sources/{id}/`

A Shoji Entity representing a single Source. Its "body" member contains:

 * name: A friendly name for the Source.
 * type: a string declaring the media type of the source. One of ("csv", "spss").
 * user_id: the id of the User who created the Source.
 * location: an absolute URI to the data. Currently, the only supported scheme is "crunchfile://", which indicates a file uploaded to Crunch.io.
 * settings: an object containing configuration for translating the source to crunch internals. Its members vary by type:
   * csv:
     * strict: an integer. If 1, extra columns or undefined category ids in the CSV will raise an error. If 0, they will be added to the dataset.

A PUT must contain a JSON object with members from the Shoji Entity "body" which the client intends to update. 204 indicates success.

A DELETE destroys the Source resource. 204 indicates success.

`/sources/{id}/file/`

A GET returns the original source file.
