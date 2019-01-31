# Event list

## asset_note_update

```shell
```

> Structure:

```js

{
	Playlist: {
		ID: String(playlistData.id),
		Order: playlistData.position
	},
	Asset: {
		ID: String(assetData.id),
		Order: assetData.position
	}
	Type: ui.scene
	Target: {
		Text: “Text from notes here”
	},
	TimeInfo: {
		CurrentTime: String(”2019-01-16T12:35:07+00:00”),
		ZoneName: String(”GMT”),
		ZoneOffset: 0
	}
}

```

<b>A user creates or updates a note attached to a learning asset</b>

## asset_launch

```shell
```

> Structure:

```js

{
	Playlist: {
		ID: String(playlistData.id),
		Type: String(playlistData.type)
	},
	Asset: {
		ID: String(assetData.id),
		Order: assetData.position
	},
	Type: ui.scene,
	Mode: ui.ClientPage,
	TimeInfo: {
		CurrentTime: String(”2019-01-16T12:35:07+00:00”),
		ZoneName: String(”GMT”),
		ZoneOffset: 0
	}
}

```

<b>Triggered navigation to learning asset URL</b>

## asset_open

```shell
```

> Structure:

```js

{
	"Asset" : {
		"ID" : "13429",
		"Name" : "Is it ok to cry at work?",
		"Order" : 0,
		"Text" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n"
	},
	"AssetInfo" : {
		"Competencies" : [
			{
				"ID" : "615",
				"Name" : "Resilience"
			},
			{
				"ID" : "631",
				"Name" : "People Management"
			}
		],
		"Completed" : false,
		"CompletedStatus" : "",
		"Description" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n",
		"Duration" : "360",
		"ProviderID" : "4",
		"ProviderName" : "BBC",
		"ProviderURL" : "bbc.co.uk",
		"Type" : "Podcast",
		"URL" : "https://www.bbc.co.uk/programmes/p040hgb5"
	},
	"Function" : {
		"ID" : "5",
		"Name" : "Manufacturing"
	},
	"Group" : {
		"ID" : "ht2labs-main",
		"Name" : "HT2Labs-main"
	},
	"HasGDPR" : {
		"Bool" : false,
		"Valid" : false
	},
	"ID" : "https://172.31.0.2/#/learning-asset/13429-is-it-ok-to-cry-at-work",
	"JobTitle" : {
		"ID" : "-1",
		"Name" : "-"
	},
	"Mode" : "",
	"Organisation" : {
		"ID" : "ht2labs",
		"Name" : "HT2Labs"
	},
	"Playlist" : {
		"ID" : "615",
		"Name" : "Resilience",
		"Order" : 6
	},
	"Referer" : "",
	"Sector" : {
		"ID" : "8",
		"Name" : "Education"
	},
	"Seniority" : {
		"ID" : "1",
		"Name" : "CEO/C-suite"
	},
	"Target" : {
		"Text" : ""
	},
	"TimeInfo" : {
		"CurrentTime" : "2019-01-29T16:38:13Z",
		"ZoneName" : "UTC",
		"ZoneOffset" : 0
	},
	"Type" : "api"
}

```

<b>Clicking an asset to obtain information on it</b>

## asset_bookmark_remove

```shell
```

> Structure:

```js
{
	"Asset" : {
		"ID" : "13429",
		"Name" : "Is it ok to cry at work?",
		"Order" : 0,
		"Text" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n"
	},
	"AssetInfo" : {
		"Competencies" : [
			{
				"ID" : "615",
				"Name" : "Resilience"
			},
			{
				"ID" : "631",
				"Name" : "People Management"
			}
		],
		"Completed" : false,
		"CompletedStatus" : "",
		"Description" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n",
		"Duration" : "360",
		"ProviderID" : "4",
		"ProviderName" : "BBC",
		"ProviderURL" : "bbc.co.uk",
		"Type" : "Podcast",
		"URL" : "https://www.bbc.co.uk/programmes/p040hgb5"
	},
	"Function" : {
		"ID" : "5",
		"Name" : "Manufacturing"
	},
	"Group" : {
		"ID" : "ht2labs-main",
		"Name" : "HT2Labs-main"
	},
	"HasGDPR" : {
		"Bool" : false,
		"Valid" : false
	},
	"ID" : "https://172.31.0.2/#/learning-asset/13429-is-it-ok-to-cry-at-work",
	"JobTitle" : {
		"ID" : "-1",
		"Name" : "-"
	},
	"Mode" : "",
	"Organisation" : {
		"ID" : "ht2labs",
		"Name" : "HT2Labs"
	},
	"Playlist" : {
		"ID" : "615",
		"Name" : "Resilience",
		"Order" : 6
	},
	"Referer" : "",
	"Sector" : {
		"ID" : "8",
		"Name" : "Education"
	},
	"Seniority" : {
		"ID" : "1",
		"Name" : "CEO/C-suite"
	},
	"Target" : {
		"Text" : ""
	},
	"TimeInfo" : {
		"CurrentTime" : "2019-01-29T16:38:13Z",
		"ZoneName" : "UTC",
		"ZoneOffset" : 0
	},
	"Type" : "api"
}
```

<b>Removing an asset from a playlist</b>

## asset_bookmark_add

```shell
```

> Structure:

```js
{
	"Asset" : {
		"ID" : "13429",
		"Name" : "Is it ok to cry at work?",
		"Order" : 0,
		"Text" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n"
	},
	"AssetInfo" : {
		"Competencies" : [
			{
				"ID" : "615",
				"Name" : "Resilience"
			},
			{
				"ID" : "631",
				"Name" : "People Management"
			}
		],
		"Completed" : false,
		"CompletedStatus" : "",
		"Description" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n",
		"Duration" : "360",
		"ProviderID" : "4",
		"ProviderName" : "BBC",
		"ProviderURL" : "bbc.co.uk",
		"Type" : "Podcast",
		"URL" : "https://www.bbc.co.uk/programmes/p040hgb5"
	},
	"Function" : {
		"ID" : "5",
		"Name" : "Manufacturing"
	},
	"Group" : {
		"ID" : "ht2labs-main",
		"Name" : "HT2Labs-main"
	},
	"HasGDPR" : {
		"Bool" : false,
		"Valid" : false
	},
	"ID" : "https://172.31.0.2/#/learning-asset/13429-is-it-ok-to-cry-at-work",
	"JobTitle" : {
		"ID" : "-1",
		"Name" : "-"
	},
	"Mode" : "",
	"Organisation" : {
		"ID" : "ht2labs",
		"Name" : "HT2Labs"
	},
	"Playlist" : {
		"ID" : "615",
		"Name" : "Resilience",
		"Order" : 6
	},
	"Referer" : "",
	"Sector" : {
		"ID" : "8",
		"Name" : "Education"
	},
	"Seniority" : {
		"ID" : "1",
		"Name" : "CEO/C-suite"
	},
	"Target" : {
		"Text" : ""
	},
	"TimeInfo" : {
		"CurrentTime" : "2019-01-29T16:38:13Z",
		"ZoneName" : "UTC",
		"ZoneOffset" : 0
	},
	"Type" : "api"
}
```

<b>Adding an asset to a playlist</b>

## add_profile_sector

```shell
```

> Structure:

```js
{
   valueText: ‘Text here’,
   value: 2
}
```

<b>Track when a user answers the sector input</b>

## asset_complete

```shell
```

> Structure:

```js
{
	"Asset" : {
		"ID" : "13429",
		"Name" : "Is it ok to cry at work?",
		"Order" : 0,
		"Text" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n"
	},
	"AssetInfo" : {
		"Competencies" : [
			{
				"ID" : "615",
				"Name" : "Resilience"
			},
			{
				"ID" : "631",
				"Name" : "People Management"
			}
		],
		"Completed" : false,
		"CompletedStatus" : "",
		"Description" : "<p>Is crying at work still taboo? And how can we best support our work colleagues when they become tearful? Jane Garvey talks to Dr Emily Grossman and Nell Frizzell on the politics of crying at work.</p>\n",
		"Duration" : "360",
		"ProviderID" : "4",
		"ProviderName" : "BBC",
		"ProviderURL" : "bbc.co.uk",
		"Type" : "Podcast",
		"URL" : "https://www.bbc.co.uk/programmes/p040hgb5"
	},
	"Function" : {
		"ID" : "5",
		"Name" : "Manufacturing"
	},
	"Group" : {
		"ID" : "ht2labs-main",
		"Name" : "HT2Labs-main"
	},
	"HasGDPR" : {
		"Bool" : false,
		"Valid" : false
	},
	"ID" : "https://172.31.0.2/#/learning-asset/13429-is-it-ok-to-cry-at-work",
	"JobTitle" : {
		"ID" : "-1",
		"Name" : "-"
	},
	"Mode" : "",
	"Organisation" : {
		"ID" : "ht2labs",
		"Name" : "HT2Labs"
	},
	"Playlist" : {
		"ID" : "615",
		"Name" : "Resilience",
		"Order" : 6
	},
	"Referer" : "",
	"Sector" : {
		"ID" : "8",
		"Name" : "Education"
	},
	"Seniority" : {
		"ID" : "1",
		"Name" : "CEO/C-suite"
	},
	"Target" : {
		"Text" : ""
	},
	"TimeInfo" : {
		"CurrentTime" : "2019-01-29T16:38:13Z",
		"ZoneName" : "UTC",
		"ZoneOffset" : 0
	},
	"Type" : "api"
}
```

<b>Triggered when an asset is marked as complete</b>

## feedback_asset

```shell
```

> Structure:

```js
{
	ID: location.protocol + '//' + location.host + location.pathname + '#/learning-asset/' + assetData.niceName,
	Playlist: {
		ID: String(playlistData.id),
		Name: playlistData.name,
		Order: playlistData.position
	},
	Asset: {
		ID: String(assetData.id),
		Name: assetData.name,
		Text: assetData.niceName,
		Order: assetData.position
	},
	AssetInfo: {
		URL: assetData.url,
		Type: assetData.type,
		Description: assetData.desc,
		Duration: formatISODuration(assetData.duration),
		ProviderID: String(assetData.providerId),
		ProviderName: providerData.name,
		ProviderURL: providerData.url,
		Competencies: mappedCompetencies,
		Completed: assetData.completed,
		CompletedStatus: assetData.completedStatus
	}
	Type: ui.scene
	Target: {
		Text: “0”,
		Name: ‘useful’
	},
}
```

<b>Triggered when an asset is completed with one of the states (<i>this was useful</i>, <i>i knew this already</i>, <i>this was not relevant</i>)</b>

## click_nugget_article

```shell
```

> Structure:

```js
{
    url: ‘ /learning-asset/125 - nice - name’,
    message: 'see Steve jobs article'
}
```

<b>Triggered when chat recommended learning asset is clicked</b>

## open_searchbar

```shell
```

> Structure: N/A

<b>Triggered when search UI is opened</b>

## click_searchbar_asset

```shell
```

> Structure:

```js
{
	searchQuery: this.state.valueTyped,
	selected: suggestion.learningAsset,
	selectedMethod: method,
	suggestedList: getSuggestedList
}
```

<b>Triggered when suggested search returned asset is clicked</b>

## complete_profilesection

```shell
```

> Structure:

```js
{
    ID: window.location.href,
    Name: event.section,
    Response: JSON.stringify({
        result: event.result
    })
}
```

<b>Triggered when a profile section is completed. (<i>Role</i>, <i>Goals</i>, <i>Your day</i>)</b>

## add_timework_individual

```shell
```

> Structure:

```js
{
    message: ‘Text here’,
    valueText: ‘Text here’,
    value: 2
}
```

<b>Triggered when user interacts with <i>Your day</i> section inputs</b>

## scroll_tray

```shell
```

> Structure:

```js
{
	ID: window.location.href,
	Name: 'Tray Scroll',
	Direction: direction
}
```

<b>Triggered when a user clicks through individual tray, either left or right</b>

## view_profile

```shell
```

> Structure: N/A

<b>Event is sent when user lands on the profile page</b>

## view_dashboard

```shell
```

> Structure: N/A

<b>Event is sent when user lands on the dashboard</b>

## view_learningasset

```shell
```

> Structure: N/A

<b>When a user navigates from dashboard to LA page or straight to La page</b>
