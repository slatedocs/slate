# Files

## Get Files

```shell
curl https://api.simplyprint.io/{id}/files/GetFiles?f=123&search=benchy \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": null,
  "files": [
    {
      "id": "d82ab9e1cc3c20850d94d5cf539390c0",
      "name": "3DBenchy",
      "ext": "stl",
      "type": "model",
      "size": 11285384,
      "created": "December 23, 2022, 17:35",
      "createdint": 1671813336,
      "printData": {
        "printsDone": 0,
        "printsCancelled": 0,
        "printsFailed": 0,
        "timesSliced": 0
      },
      "user_id": 6044,
      "thumbnail": 1,
      "folder": 0,
      "user": 6044
    }
  ],
  "folders": [
    {
      "id": 5290,
      "name": "random_folder_called_benchy",
      "items": {
        "files": 0,
        "folders": 0
      },
      "created": "December 23, 2022",
      "createdInt": 1671814215,
      "parent_folder_id": 0,
      "depth": 0
    }
  ],
  "path": [
    [
      "Your search...",
      0
    ]
  ],
  "sort_type": "",
  "space": 10000000000,
  "space_used": 131446609
}
```

This endpoint returns a list of files and folders in a given folder. If no folder is specified, the root folder is used.

### Request

`GET /{id}/files/GetFiles`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `f` | integer | no | Folder ID to get files for. **Defaults to 0 (root folder)** |
| `search` | string | no | Search string to filter files by. |
| `global_search` | boolean | no | If true, search all files in the account, not just the folder specified by `f`. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Error message if `status` is false. |
| `files` | array | Array of file objects. |
| `folders` | array | Array of folder objects. |
| `path` | array | Array of arrays containing the path to the current folder. |
| `sort_type` | string | Sort type from user's settings. |
| `space` | integer | The total space available in bytes. |
| `space_used` | integer | The total space used in bytes. |

## Move File(s) to Folder

```shell
curl https://api.simplyprint.io/{id}/files/MoveFiles?files=d82ab9e1cc3c20850d94d5cf539390c0&folder=5290 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": "Moved 1 files"
}
```

This endpoint moves one or more files to a given folder.

### Request

`GET /{id}/files/MoveFiles`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `files` | array | yes | Array of file IDs to move. Separate multiple IDs with a comma. |
| `folder` | integer | yes | Folder ID to move files to. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |

## Get Folder Details - TODO

```shell
curl https://api.simplyprint.io/{id}/files/GetFolder?id=5290 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
```

This endpoint returns details about a given folder.

### Request

`GET /{id}/files/GetFolder`

## Move Folder

```shell
curl https://api.simplyprint.io/{id}/files/MoveFolder?folder=5290&target=5291 \
  -H 'accept: application/json' \
  -H 'X-API-KEY: {API_KEY}'
```

> Success response

```json
{
  "status": true,
  "message": "Moved folder 5298 to folder 5297"
}
```

This endpoint moves a folder to a given folder.

Please note that the root folder cannot be moved, but folders can be moved into the root folder by setting `target=0`.
Also, folders cannot be moved into themselves.

### Request

`GET /{id}/files/MoveFolder`

| Parameter | Type | Required | Description |
| --------- | ---- | -------- | ----------- |
| `folder` | integer | yes | Folder ID to move. |
| `target` | integer | yes | Folder ID to move to. |

### Response

| Parameter | Type | Description |
| --------- | ---- | ----------- |
| `status` | boolean | True if the request was successful. |
| `message` | string | Success message or error message if `status` is false. |
