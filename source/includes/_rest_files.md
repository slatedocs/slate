# File Endpoints

All files deployed by Netlify can be read through the API. Where the public URL of a file will serve the processed version for HTML pages, the files accessed through the API are the original uploaded files.

Netlify is based on a concept of *atomic deploys*. This means you never work on individual files. If you want to change a file, simply do a new deploy with a new version of the site. To delete a file, simply create a new deploy without the file. The file digest based deployment method, means that these operations are fast and low-cost. Atomic deploys guarantees that your site is never in an inconsistent state where some files are being uploaded and where users might get HTML files that are not in synch with the CSS or image files, etc...

<!-- TODO: can we link the 'file digest based deployment method' somewhere? -->

## Get All Files

Returns a list of all the files in the *current* deploy

### HTTP Request
`GET /api/v1/sites/{:site_id}/files`

> Response:

```json
[
  {"id":"/index.html",
  "path":"/index.html",
  "sha":"20828dcdf2cd07e5980fe52759101591bf5014ab",
  "mime_type":"text/html",
  "size":27232
  }
]
```

## Get A File

Returns the file in the current deploy
<!-- TODO @matt: can we do access a file from any deploy through the API? -->

### HTTP Request
`GET /api/v1/sites/{:site_id}/files/{:path-to-file}`

> Response:

```json
{
  "id":"/index.html",
  "path":"/index.html",
  "sha":"20828dcdf2cd07e5980fe52759101591bf5014ab",
  "mime_type":"text/html",
  "size":27232
}
```

<!-- TODO add example here -->

<aside class=notice>
You can get the raw contents of the file by the header <code>Content-Type: "application/vnd.bitballoon.v1.raw"</code> on your HTTP request.
</aside>
