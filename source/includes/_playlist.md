# Playlist

## FetchPlaylists

```shell
```

> The above command returns JSON structured like this:

```json
{
}
```

<aside class="warning">
Method not yet implemented
</aside>

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — Matrix of Playlist Models - all an user’s playlists split into types
</aside>

## FetchFavouritePlaylist

```shell
curl --data-binary '{"id":"5","method":"playlist.FetchFavouritePlaylist","params":[], "jsonrpc": "2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"id": "",
		"name": "Favourites",
		"type": "favourite",
		"typeExtra": [{
			"id": 1,
			"name": "Planning \u0026 Organizing"
		}, {
			"id": 4,
			"name": "Productivity"
		}],
		"laList": {
			"10": {
				"id": "f6e5fa16cf5cde2885064ca4d29d9d801c28ae18",
				"title": "To-Do Lists Don't Work",
				"description": "\u003cp\u003eMarkovitz uses research to explain why to-do lists don’t work and presents a case for using our calendars - the best measure of our capacity - as a means for project management and becoming more productive. He proposes “living in your calendar” as a solution.\u003c/p\u003e\n",
				"mainImage": "",
				"typeLabel": "Article",
				"lengthSeconds": "18000",
				"lengthLabel": "5 hours ",
				"summaryUrl": "10-to-do-lists-dont-work",
				"directUrl": "https://hbr.org/2012/01/to-do-lists-dont-work",
				"isFavourite": true,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": {
					"String": "",
					"Valid": false
				},
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 31,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 1,
					"name": "Planning \u0026 Organizing"
				}, {
					"id": 4,
					"name": "Productivity"
				}]
			}
		}
	},
	"id": "5"
}
```

Retrieve an user’s favourite playlist.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — Playlist Model - an user’s playlist of  assets marked as favourite
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32610 | Unsupported function input
-32609 | Unsupported seniority input
-32608 | Unsupported sector input
