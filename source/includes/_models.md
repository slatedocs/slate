# Definitions

The following are the JSON data models referenced through the API documentation.

## Learning Asset Model

> Learning asset model:

```json
{
	"id": 8995,
	"hashID": "c872a5d2f4cabfa88149b03137896bb53279712e",
	"title": "Deadline Pressure Distorts Our Sense of Time",
	"description": "\u003cp\u003eThe difficulty of a task stretches out our perception of time. This time of year is deadline season for many people. It seems that wherever we look, there is a clock or a calendar pressuring us to move faster and stop dawdling. For some it is the end-of-semester crush, with papers to write and books to digest and comprehend, whereas others are rushing to tidy up a hundred loose ends before that big family vacation. Whatever the precise reason, the lament is the same: so much to do, so little time!\u003c/p\u003e\n",
	"mainImage": "",
	"screenshotImage": "/shot/la/c872a5d2f4cabfa88149b03137896bb53279712e-desktop.png",
	"screenshotImageMobile": "/shot/la/c872a5d2f4cabfa88149b03137896bb53279712e-mobile.png",
	"typeLabel": "Article",
	"lengthSeconds": "420",
	"lengthLabel": "7 minutes",
	"summaryUrl": "8995-deadline-pressure-distorts-our-sense-of-time",
	"directUrl": "https://www.scientificamerican.com/article/looming-deadlines/",
	"isFavourite": false,
	"launched": false,
	"dismissed": false,
	"completed": false,
	"notes": "",
	"restrictionCode": "free",
	"restrictionLabel": "Free",
	"provider": {
		"id": 310,
		"name": "",
		"image": "/shot/p/sq/310.png",
		"favicon": ""
	},
	"competencyList": [{
		"id": 21,
		"name": "Resilience \u0026 Adaptability"
	}]
}
```

<aside class="note">
A learning asset is a collection of metadata and user interactions with a learning entity
</aside>

Name | Type | Definition
--------- | ------- | -------
id | integer | The asset identifier
hashID | string | A hash of the asset identifier
title | string | The title of the asset
description | string | The description body used for the asset
mainImage | string | A custom image attached to the asset
screenshotImage | string | Desktop version screenshot taken through the asset URL
screenshotImageMobile | string | Mobile version screenshot taken through the asset URL
typeLabel | string | The type of the asset
lengthSeconds | string | Assumed length of asset consumption time
lengthLabel | string | Human readable length
summaryUrl | string | Internal asset URL
directUrl | string | External asset URL
isFavourite | boolean | Flag if asset has been bookmarked
launched | boolean | Flag if asset has been launched
dismissed | boolean | Flag if asset has been suppressed
completed | boolean | Flag if asset has been marked as completed
notes | string | User's personal notes regarding the asset
restrictedCode | string | Defines any restrictions for an asset through code
restrictedLabel | string | Human readable restriction for an asset
provider | object | Vendor/Owner associated to the asset
competencyList | object | Contains a list of competencies associated to the asset

## Competency Model

> Competency model:

```json
{
    "id": 10,
    "name": "Digital Collaboration"    
}
```

<aside class="note">
A link between an asset and a concept of interest to the user
</aside>

Name | Type | Definition
--------- | ------- | -------
id | integer | The competency identifier
name | string | The competency name

## Provider Model

> Provider model:

```json
{
    "id": 309,
    "name": "",
    "image": "/shot/p/sq/309.png",
    "favicon": ""
}
```

<aside class="note">
The vendor/owner of the original asset entity
</aside>

Name | Type | Definition
--------- | ------- | -------
id | integer | The provider identifier
name | string | The provider name
image | string | The provider image link
favicon | string | A favicon for the provider

## Playlist Model

> Playlist model:

```json
{
	"id": "21",
	"name": "Resilience \u0026 Adaptability",
	"type": "competency",
	"typeExtra": [{
		"id": 11,
		"name": "Personal Development"
	}, {
		"id": 21,
		"name": "Resilience \u0026 Adaptability"
	}],
	"laList": {}
}
```

<aside class="note">
A collection of assets based on a specific criteria or generated through an algorithm
</aside>

Name | Type | Definition
--------- | ------- | -------
id | string | The playlist identifier
name | string | The playlist name
type | string | The type of the playlist
typeExtra | array | The list of competencies present throughout all the contained assets
laList | object | An object containing the list of assets

## Profile Model

> Profile model:

```json
{
    "function": 9,
    "sector": 9,
    "seniority": 5
}
```

<aside class="note">
User related data that defines the basic input parameters for the recommendations
</aside>

Name | Type | Definition
--------- | ------- | -------
function | string | Defines the user's general area of practice
sector | string | Defines the user's sector of work
seniority | string | Defines the user's experience

## InputOption Model

> InputOption model:

```json
{
	"id": 1,
	"label": "CEO/C-suite",
	"sort": 1
}
```

<aside class="note">
Organisation specific input
</aside>

Name | Type | Definition
--------- | ------- | -------
id | integer | The identifier of the input
label | string | The text associated with the input
sort | integer | The priority of the input

## ChatScript Model

> ChatScript model:

```json
{
	"jsonrpc": "2.0",
	"result": {
		"stage1": {
			"messages": {
				"finish": {
					"type": "end"
				},
				"continue": {
					"type": "choice",
					"choices": [{
						"label": "continue",
						"value": 1,
						"trigger": "stage1Kai"
					}]
				},
				"stage1Kai": {
					"text": "By telling me a little about you, I can make some recommendations personalised for you.",
					"type": "text",
					"rawOverride": {
						"trigger": "stage1QuestSector"
					}
				},
				"stage1Intro": {
					"text": "Hi I'm magpie. I make recommendations from providers such as...",
					"type": "text",
					"rawOverride": {
						"trigger": "stage1AssetImage"
					}
				},
				"choiceFinish": {
					"type": "choice",
					"choices": [{
						"label": "finish",
						"value": 1,
						"trigger": "finish"
					}]
				},
				"stage1Sector": {
					"type": "dropDown",
					"profileKey": "sector",
					"rawOverride": {
						"trigger": "stage1QuestDept"
					}
				},
				"stage2Senior": {
					"type": "dropDown",
					"profileKey": "seniority",
					"rawOverride": {
						"trigger": "stage1GetPlaylist"
					}
				},
				"stage1QuestDept": {
					"text": "Secondly, which department do you work in?",
					"type": "text",
					"rawOverride": {
						"trigger": "stage1Department"
					}
				},
				"choiceRedoInputs": {
					"type": "choice",
					"choices": [{
						"label": "Update my role information",
						"value": 2,
						"trigger": "stage1QuestSector"
					}]
				},
				"stage1AssetImage": {
					"link": "https://learn.filtered.com/hubfs/provider-collage.png",
					"type": "image",
					"rawOverride": {
						"trigger": "continue"
					}
				},
				"stage1Department": {
					"type": "dropDown",
					"profileKey": "function",
					"rawOverride": {
						"trigger": "stage2QuestSenior"
					}
				},
				"stage1DisplayTray": {
					"type": "playlist",
					"rawOverride": {
						"trigger": "choiceRedoInputs"
					}
				},
				"stage1GetPlaylist": {
					"text": "Show some Recommendations",
					"type": "buttonAction",
					"clickAction": "getCompetencyPlaylists",
					"rawOverride": {
						"trigger": "stage1DisplayTray"
					}
				},
				"stage1QuestSector": {
					"text": "Which sector do you work in?",
					"type": "text",
					"rawOverride": {
						"trigger": "stage1Sector"
					}
				},
				"stage2QuestSenior": {
					"text": "Thanks. And how senior are you at your company?",
					"type": "text",
					"rawOverride": {
						"trigger": "stage2Senior"
					}
				}
			}
		}
	},
	"id": "5"
}
```

<aside class="note">
Organisation specific chat script
</aside>

Name | Type | Definition
--------- | ------- | -------
result | string | Json formatted chat script

## Goal Model

> Goal model:

```json
{
	"id": 1,
	"importance": 0.1,
	"confidence": 0.7
}
```

<aside class="note">
Entity to define a user's experience and expectation in relation to a competency
</aside>

Name | Type | Definition
--------- | ------- | -------
id | integer | The competency's identifier
importance | float | Value to define the importance of the competency
confidence | float | Value to define the confidence in the competency
