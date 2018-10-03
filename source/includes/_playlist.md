# Playlist

## FetchAllPlaylists

```shell
curl --data-binary '{"id":"5", "method":"playlist.FetchAllPlaylists", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": [{
		"id": "19",
		"name": "Using Financials",
		"type": "competency",
		"typeExtra": [{
			"id": 19,
			"name": "Using Financials"
		}],
		"laList": {
			"18": {
				"id": "2096012a912d5d8d7a9501dbf706c8df6df03803",
				"title": "A rare interview with the mathematician who cracked Wall Street",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "82800",
				"lengthLabel": "23 hours ",
				"summaryUrl": "18-a-rare-interview-with-the-mathematician-who-cracked-wall-street",
				"directUrl": "https://www.ted.com/talks/jim_simons_a_rare_interview_with_the_mathematician_who_cracked_wall_street",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 19,
					"name": "Using Financials"
				}]
			},
			"187": {
				"id": "1a44a5d5eaf7dc5d504984c12910c6f6b5de87f6",
				"title": "The surprisingly logical minds of babies",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "72000",
				"lengthLabel": "20 hours ",
				"summaryUrl": "187-the-surprisingly-logical-minds-of-babies",
				"directUrl": "https://www.ted.com/talks/laura_schulz_the_surprisingly_logical_minds_of_babies",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 12,
					"name": "Problem Solving \u0026 Decision Making"
				}]
			}
		}
	}, {
		"id": "12",
		"name": "Personal Development",
		"type": "group",
		"typeExtra": [{
			"id": 11,
			"name": "Personal Development"
		}],
		"laList": {
			"107": {
				"id": "1c0e4d49de0e9285a246fc501501caa284e00951",
				"title": "How to Run a Brainstorming Session",
				"description": "",
				"mainImage": "",
				"typeLabel": "Article",
				"lengthSeconds": "21600",
				"lengthLabel": "6 hours ",
				"summaryUrl": "107-how-to-run-a-brainstorming-session",
				"directUrl": "http://www.inc.com/guides/2010/11/how-to-run-a-brainstorming-session.html",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 32,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 1,
					"name": "Planning \u0026 Organizing"
				}]
			}
		}

	}],
	"id": "5"
}
```

Returns an user’s playlists (competency, group, favorite, bifrost) in order.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
limit (optional) | integer | number of playlists (default limit is 10| maximum limit is 25)
offset (optional) | integer | starting from

<aside class="success">
Returns — Matrix of Playlist Models - all playlists belonging to an user’s grouped by types
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32605 | No playlists found

## FetchFavouritePlaylist

```shell
curl --data-binary '{"id":"5","method":"playlist.FetchFavouritePlaylist","jsonrpc": "2.0"}'
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
-32605 | Playlists not found

## FetchCompetencyPlaylists

```shell
curl --data-binary '{"id":"5", "method":"playlist.FetchCompetencyPlaylists", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": [{
		"id": "19",
		"name": "Using Financials",
		"type": "competency",
		"typeExtra": [{
			"id": 19,
			"name": "Using Financials"
		}],
		"laList": {
			"18": {
				"id": "2096012a912d5d8d7a9501dbf706c8df6df03803",
				"title": "A rare interview with the mathematician who cracked Wall Street",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "82800",
				"lengthLabel": "23 hours ",
				"summaryUrl": "18-a-rare-interview-with-the-mathematician-who-cracked-wall-street",
				"directUrl": "https://www.ted.com/talks/jim_simons_a_rare_interview_with_the_mathematician_who_cracked_wall_street",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 19,
					"name": "Using Financials"
				}]
			},
			"187": {
				"id": "1a44a5d5eaf7dc5d504984c12910c6f6b5de87f6",
				"title": "The surprisingly logical minds of babies",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "72000",
				"lengthLabel": "20 hours ",
				"summaryUrl": "187-the-surprisingly-logical-minds-of-babies",
				"directUrl": "https://www.ted.com/talks/laura_schulz_the_surprisingly_logical_minds_of_babies",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 12,
					"name": "Problem Solving \u0026 Decision Making"
				}]
			}
		}
	}, {
		"id": "12",
		"name": "Personal Development",
		"type": "competency",
		"typeExtra": [{
			"id": 11,
			"name": "Personal Development"
		}],
		"laList": {
			"107": {
				"id": "1c0e4d49de0e9285a246fc501501caa284e00951",
				"title": "How to Run a Brainstorming Session",
				"description": "",
				"mainImage": "",
				"typeLabel": "Article",
				"lengthSeconds": "21600",
				"lengthLabel": "6 hours ",
				"summaryUrl": "107-how-to-run-a-brainstorming-session",
				"directUrl": "http://www.inc.com/guides/2010/11/how-to-run-a-brainstorming-session.html",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 32,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 1,
					"name": "Planning \u0026 Organizing"
				}]
			}
		}

	}],
	"id": "5"
}
```

Retrieve an user’s list of competency playlists.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
limit (optional) | integer | number of playlists (default limit is 10| maximum limit is 25)
offset (optional) | integer | starting from

<aside class="success">
Returns - List of Playlist Models - an user’s playlists generated for the organisation’s competencies
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32605 | No playlists found

## FetchCompetencyPlaylist

```shell
curl --data-binary '{"id":"5", "method":"playlist.FetchCompetencyPlaylists", "params":{"id":"1"}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"id": "1",
		"name": "Planning \u0026 Organizing",
		"type": "competency",
		"typeExtra": [{
			"id": 1,
			"name": "Planning \u0026 Organizing"
		}],
		"laList": {
			"1": {
				"id": "7c034040a580506bf7b4776d26c2ad44d79e888a",
				"title": "Multi-tasking: you're making yourself slower and dumber",
				"description": "\u003cp\u003eDoing two things at once is actually a very bad idea. Your productivity drops by 40%. By focussing on a single task and clustering various smaller ones you become less distracted, less stressed and more productive.\u003c/p\u003e\n",
				"mainImage": "",
				"typeLabel": "Podcast",
				"lengthSeconds": "14400",
				"lengthLabel": "4 hours ",
				"summaryUrl": "1-multi-tasking-youre-making-yourself-slower-and-dumber",
				"directUrl": "https://www.bbc.co.uk/programmes/p047v0xc",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 4,
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
			},
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
				"notes": "",
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

Returns a specific competency playlist for an user.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
id | string | the playlist's identifier

<aside class="success">
Returns - Playlist Model - specific competency playlist
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32605 | No playlists found
-32013 | Unsupported competency

## FetchGroupPlaylists

```shell
curl --data-binary '{"id":"5", "method":"playlist.FetchGroupPlaylists", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": [{
		"id": "19",
		"name": "Using Financials",
		"type": "group",
		"typeExtra": [{
			"id": 19,
			"name": "Using Financials"
		}],
		"laList": {
			"18": {
				"id": "2096012a912d5d8d7a9501dbf706c8df6df03803",
				"title": "A rare interview with the mathematician who cracked Wall Street",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "82800",
				"lengthLabel": "23 hours ",
				"summaryUrl": "18-a-rare-interview-with-the-mathematician-who-cracked-wall-street",
				"directUrl": "https://www.ted.com/talks/jim_simons_a_rare_interview_with_the_mathematician_who_cracked_wall_street",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 19,
					"name": "Using Financials"
				}]
			},
			"187": {
				"id": "1a44a5d5eaf7dc5d504984c12910c6f6b5de87f6",
				"title": "The surprisingly logical minds of babies",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "72000",
				"lengthLabel": "20 hours ",
				"summaryUrl": "187-the-surprisingly-logical-minds-of-babies",
				"directUrl": "https://www.ted.com/talks/laura_schulz_the_surprisingly_logical_minds_of_babies",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 12,
					"name": "Problem Solving \u0026 Decision Making"
				}]
			}
		}
	}, {
		"id": "12",
		"name": "Personal Development",
		"type": "group",
		"typeExtra": [{
			"id": 11,
			"name": "Personal Development"
		}],
		"laList": {
			"107": {
				"id": "1c0e4d49de0e9285a246fc501501caa284e00951",
				"title": "How to Run a Brainstorming Session",
				"description": "",
				"mainImage": "",
				"typeLabel": "Article",
				"lengthSeconds": "21600",
				"lengthLabel": "6 hours ",
				"summaryUrl": "107-how-to-run-a-brainstorming-session",
				"directUrl": "http://www.inc.com/guides/2010/11/how-to-run-a-brainstorming-session.html",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 32,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 1,
					"name": "Planning \u0026 Organizing"
				}]
			}
		}

	}],
	"id": "5"
}
```

Retrieve an user’s list of group playlists.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
limit (optional) | integer | number of playlists (default limit is 10| maximum limit is 25)
offset (optional) | integer | starting from

<aside class="success">
Returns - List of Playlist Models - an user’s group afferent playlists
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32605 | No playlists found

## FetchBifrostPlaylists

```shell
curl --data-binary '{"id":"5", "method":"playlist.FetchBifrostPlaylists", "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": [{
		"id": "19",
		"name": "Using Financials",
		"type": "algorithm",
		"typeExtra": [{
			"id": 19,
			"name": "Using Financials"
		}],
		"laList": {
			"18": {
				"id": "2096012a912d5d8d7a9501dbf706c8df6df03803",
				"title": "A rare interview with the mathematician who cracked Wall Street",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "82800",
				"lengthLabel": "23 hours ",
				"summaryUrl": "18-a-rare-interview-with-the-mathematician-who-cracked-wall-street",
				"directUrl": "https://www.ted.com/talks/jim_simons_a_rare_interview_with_the_mathematician_who_cracked_wall_street",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 19,
					"name": "Using Financials"
				}]
			},
			"187": {
				"id": "1a44a5d5eaf7dc5d504984c12910c6f6b5de87f6",
				"title": "The surprisingly logical minds of babies",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "72000",
				"lengthLabel": "20 hours ",
				"summaryUrl": "187-the-surprisingly-logical-minds-of-babies",
				"directUrl": "https://www.ted.com/talks/laura_schulz_the_surprisingly_logical_minds_of_babies",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 12,
					"name": "Problem Solving \u0026 Decision Making"
				}]
			}
		}
	}, {
		"id": "12",
		"name": "Personal Development",
		"type": "algorithm",
		"typeExtra": [{
			"id": 11,
			"name": "Personal Development"
		}],
		"laList": {
			"107": {
				"id": "1c0e4d49de0e9285a246fc501501caa284e00951",
				"title": "How to Run a Brainstorming Session",
				"description": "",
				"mainImage": "",
				"typeLabel": "Article",
				"lengthSeconds": "21600",
				"lengthLabel": "6 hours ",
				"summaryUrl": "107-how-to-run-a-brainstorming-session",
				"directUrl": "http://www.inc.com/guides/2010/11/how-to-run-a-brainstorming-session.html",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 32,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 1,
					"name": "Planning \u0026 Organizing"
				}]
			}
		}

	}],
	"id": "5"
}
```

Retrieve an user’s list of bifrost playlists.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
limit (optional) | integer | number of playlists (default limit is 10| maximum limit is 25)
offset (optional) | integer | starting from

<aside class="success">
Returns - List of Playlist Models - an user’s ML aglorithm generated playlists
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32605 | No playlists found

## FetchPlaylistsByTypes

```shell
curl --data-binary '{"id":"5", "method":"playlist.FetchPlaylistsByTypes", "params":{"types":["competency", "group"]}, "jsonrpc":"2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": [{
		"id": "19",
		"name": "Using Financials",
		"type": "competency",
		"typeExtra": [{
			"id": 19,
			"name": "Using Financials"
		}],
		"laList": {
			"18": {
				"id": "2096012a912d5d8d7a9501dbf706c8df6df03803",
				"title": "A rare interview with the mathematician who cracked Wall Street",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "82800",
				"lengthLabel": "23 hours ",
				"summaryUrl": "18-a-rare-interview-with-the-mathematician-who-cracked-wall-street",
				"directUrl": "https://www.ted.com/talks/jim_simons_a_rare_interview_with_the_mathematician_who_cracked_wall_street",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 19,
					"name": "Using Financials"
				}]
			},
			"187": {
				"id": "1a44a5d5eaf7dc5d504984c12910c6f6b5de87f6",
				"title": "The surprisingly logical minds of babies",
				"description": "",
				"mainImage": "",
				"typeLabel": "Video",
				"lengthSeconds": "72000",
				"lengthLabel": "20 hours ",
				"summaryUrl": "187-the-surprisingly-logical-minds-of-babies",
				"directUrl": "https://www.ted.com/talks/laura_schulz_the_surprisingly_logical_minds_of_babies",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 56,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 12,
					"name": "Problem Solving \u0026 Decision Making"
				}]
			}
		}
	}, {
		"id": "12",
		"name": "Personal Development",
		"type": "group",
		"typeExtra": [{
			"id": 11,
			"name": "Personal Development"
		}],
		"laList": {
			"107": {
				"id": "1c0e4d49de0e9285a246fc501501caa284e00951",
				"title": "How to Run a Brainstorming Session",
				"description": "",
				"mainImage": "",
				"typeLabel": "Article",
				"lengthSeconds": "21600",
				"lengthLabel": "6 hours ",
				"summaryUrl": "107-how-to-run-a-brainstorming-session",
				"directUrl": "http://www.inc.com/guides/2010/11/how-to-run-a-brainstorming-session.html",
				"isFavourite": false,
				"launched": false,
				"dismissed": false,
				"completed": false,
				"notes": "",
				"restrictionCode": "free",
				"restrictionLabel": "Free",
				"provider": {
					"id": 32,
					"name": "",
					"image": ""
				},
				"competencyList": [{
					"id": 1,
					"name": "Planning \u0026 Organizing"
				}]
			}
		}

	}],
	"id": "5"
}
```

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
types | array of strings | the types for the desired playlists(competency, group, user, algorithm, nexRex)
limit (optional) | integer | number of playlists (default limit is 10| maximum limit is 25)
offset (optional) | integer | starting from

<aside class="success">
Returns - List of Playlist Models - an user’s specific type playlists
</aside>

### Errors

Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32605 | No playlists found
-32015 | Non-existing playlist type

## FetchPlaylistByID

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

Parameter | Type | Description
--------- | ------- | -----------
id | string | the playlist's identifier

<aside class="success">
Returns - Playlist Model - specific playlist
</aside>

## ArePlaylistsGenerated

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
Returns - Boolean - flag if any playlists of any type have been generated for the user
</aside>
