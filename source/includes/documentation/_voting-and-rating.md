## Voting and Rating

End users have the ability vote on/rate a specific story. Potential applications include upvote/downvote, like/dislike, star rating etc.

Each story has multiple types of ratings ('magnitude')  whose value can be incremented using an API.

### 1. Configuring allowed magnitudes
This is a one-time setup, where the publisher needs to come up with a list of allowed magnitudes for their voting system. It could be `['upvote', 'downvote']`, `['like', 'dislike']`, `[1, 2, 3, 4, 5]`, etc.

Currently, there is no API to set this. Please contact us to make this change.

### 2. Authentication
Make sure the user is logged in, via one of our supported authentication methods.

Currently, we do not support anonymous voting.

### 3. Vote
Use the [POST Vote API](http://petstore.swagger.io/?url=https://itsman.quintype.com/sketches-swagger.json#!/vote/post_api_stories_story_id_votes) to vote on an article. You need to send an allowed magnitude.

### 4. Get votes for one or more stories
Use any one of the [GET Stories](http://petstore.swagger.io/?url=https://itsman.quintype.com/sketches-swagger.json#!/story) APIs, but make sure you pass `votes` in the fields list.

### 5. Get votes for a story for a user
Use the [GET Vote API](http://petstore.swagger.io/?url=https://itsman.quintype.com/sketches-swagger.json#!/vote/get_api_stories_story_id_votes) to get the votes for a particular story, for the currently logged-in member. Possible uses include finding if a user has voted or not, and the magnitude of their vote.
