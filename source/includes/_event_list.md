# Event list

## takeaway_assetpage

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
		Text: “Text from notes here”
	},
}

```

<b>A user creates or updates a note attached to a learning asset</b>

## launch_assetpage

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
	},
	Type: ui.scene
}

```

<b>Triggered navigation to learning asset URL</b>

## click_asset

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
	},
	Type: ui.scene
}

```

<b>Clicking an asset to obtain information on it</b>

## remove_playlistasset

```shell
```

> Structure: N/A

<b>Removing an asset from a playlist</b>

## add_playlistasset

```shell
```

> Structure: N/A

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

## learning_asset_complete

```shell
```

> Structure:

```js
{
   valueText: ‘Text here’,
   value: 2
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
