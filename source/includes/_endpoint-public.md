## Public

### Crunchbox

A CrunchBox represents a snapshot of a crunch dataset. These snapshots are
intended for public proliferation and therefore the endpoints for interacting with
this data is housed under the unauthed API path.

#### Share

The share endpoint is for retrieving the HTML code for rendering the share page, complete
with the meta data utilized by social sharing platform crawlers in constructing
a share-preview. Among this metadata is a url to a preview image of the rendered crunchbox.

```http
GET /crunchbox/share/ HTTP/1.1
```

Required parameters for this endpoint:

Parameter | Type | Description
----------|------|-------------
data | string | crunchbox widget url (URL encoded)<br>e.g. "https%3A%2F%2Fs.crunch.io%2Fwidget%2Findex.html%23%2Fds%2Fa1b2c3d4e5f6g7h8%2Frow%2F000001%2Fcolumn%2F000000" (the encoded string of "https://s.crunch.io/widget/index.html#/ds/a1b2c3d4e5f6g7h8/row/000001/column/000000")

Optional parameters for this endpoint:

Parameter | Type | Description
----------|------|-------------
ref | string | referring url (URL encoded) to pull content from the referring page for inclusion on the crunchbox share page and provide a link back to the referrer<br>e.g. "http%3A%2F%2Fcrunch.io%2Fcrunching-the-data-of-politics" (the encoded string of "http://crunch.io/crunching-the-data-of-politics")

#### Preview

The preview endpoint is used to preemptively initiate rendering a raster image of a given crunchbox configuration for retrieval by a social network platform crawler for constructing a post share preview. As the preview rendering process can be time-consuming, it is preferable to initiate the process as far before a request for the image binary data will be made by a crawler as possible.

As this endpoint utilizes the POST method, a data payload is required. However, it will be ignored and can be any dummy data name/value pair. e.g. `data=foo`

This endpoint returns no data.

```http
POST /crunchbox/preview/ HTTP/1.1
```

Parameter | Type | Description
----------|------|-------------
data | string | crunchbox widget url (URL encoded)<br>e.g. "https%3A%2F%2Fs.crunch.io%2Fwidget%2Findex.html%23%2Fds%2Fa1b2c3d4e5f6g7h8%2Frow%2F000001%2Fcolumn%2F000000" (the encoded string of "https://s.crunch.io/widget/index.html#/ds/a1b2c3d4e5f6g7h8/row/000001/column/000000")
