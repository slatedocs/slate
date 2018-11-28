# Chat

## FetchScript

```shell
curl --data-binary '{"id":"2","method":"chat.FetchScript", "jsonrpc": "2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
	"jsonrpc": "2.0",
	"result": "{\"stage1\": {\"messages\": {\"stage1QuestDept\": {\"text\": \"Secondly, what’s your function within MCI?\"}}}, \"stage2\": {\"messages\": {\"stage2Recap\": {\"text\": \"To recap then, you work in {SECTOR} in the {FUNCTION} department and are at the {SENIORITY} level at MCI.\"}, \"stage2AtMoment\": {\"text\": \"Our curation team (of humans \u0026 algorithms) have sifted through thousands of the world's best learning assets. I want to recommend the most relevant of these to you. The more you tell me about yourself the better those recommendations will be.\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage2Results\"}}, \"stage2QuestSenior\": {\"text\": \"Thanks. And how senior are you at MCI?\"}}}, \"loggedIn\": {\"messages\": {\"stage1Kai\": {\"text\": \"By telling me a little about you, I can recommend content and knowledge to help you become smarter and better at what you do at MCI\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage1AskName\"}}, \"stage1Name\": {\"type\": \"validate\", \"language\": \"en\", \"validator\": \"name\", \"rawOverride\": {\"user\": true, \"trigger\": \"stage1QuestSector\"}}, \"stage1Intro\": {\"text\": \"Hi I'm RoSe. I make recommendations like this:\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage1AssetImage\"}}, \"stage1AskName\": {\"text\": \"Let’s start. What’s your name?\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage1Name\"}}, \"stage1AssetImage\": {\"meta\": {\"numAssetsToShow\": 1}, \"type\": \"asset-image\", \"rawOverride\": {\"trigger\": \"stage1Kai\"}}}}, \"loggedOut\": {\"messages\": {\"chatbot\": {\"meta\": {\"id\": \"chatbot\"}, \"type\": \"conversation-link\"}, \"stage1Kai\": {\"text\": \"By telling me a little about you, I can recommend content and knowledge to help you become smarter and better at what you do at MCI\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage1AskName\"}}, \"stage1Name\": {\"type\": \"validate\", \"language\": \"en\", \"validator\": \"name\", \"rawOverride\": {\"user\": true, \"trigger\": \"stage1QuestSector\"}}, \"stage1Intro\": {\"text\": \"Hi I'm RoSe. I make recommendations like this:\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage1AssetImage\"}}, \"stage1AskName\": {\"text\": \"Let’s start. What’s your name?\", \"type\": \"text\", \"rawOverride\": {\"trigger\": \"stage1Name\"}}, \"stage1AssetImage\": {\"meta\": {\"numAssetsToShow\": 1}, \"type\": \"asset-image\", \"rawOverride\": {\"trigger\": \"stage1Kai\"}}}}}",
	"id": "2"
}
```

Retrieve the chatbot afferent relevant to the organisation

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

<aside class="notice"><code>No parameters</code></aside>

<aside class="success">
Returns — Script Model - the organisation’s afferent chat script
</aside>

### Errors

 Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
-32607 | Organisation is missing chat script

## Complete

```shell
curl --data-binary '{"id":"2","method":"chat.Complete", "params":{"chatCompleted":true}, "jsonrpc": "2.0"}'
  -H 'Authorization: Bearer 5dc78bab-4988-4a15-96a2-9eb084fba6f6 genrated.jwt.token'
  -H 'content-type:application/json;'
```

> The above command returns JSON structured like this:

```json
{
  "jsonrpc": "2.0",
  "result": "success",
  "id": "2"
}
```

Mark a chat as complete for an user.

### HTTP Request

`POST https://api.test.filtered.com/v2/jsonrpc/jwt`

### Parameters

Parameter | Type | Description
--------- | ------- | -----------
chatCompleted | boolean | the true/false status

<aside class="success">
Returns — an user’s chat progress
</aside>

### Errors

 Error Code | Meaning
---------- | -------
-32603 | Internal Server Error
-32003 | Mandatory JWT Claim missing
-32600 | The JSON sent is not a valid Request object
