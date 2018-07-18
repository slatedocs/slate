---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json
 

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# API Documentation

Welcome to SuredBits' API documentation. This API allows you to query sports data, including teams, players, games, scores, and statistics.

Currently, our API only supports NFL data feeds.

<aside class="success">IMPORTANT: Suredbits is a Lightning Application built on the Bitcoin protocol.  Our NFL APIs are available exclusively via Lightning protocol. </aside>

Here are some useful resources to help you get up and running with Bitcoin and Lightning:

1. <a href="https://bitcoin.org/en/download">Download Bitcoin Core</a>
2. <a href="https://lbtc.io/">Lightning Bitcoin, Downloads and Wallets</a>
3. <a href="http://lightning.network/">Lightning Network Background</a>
4. <a href="https://lightning.network/lightning-network-paper.pdf">Lightning Whitepaper</a>
5. <a href="https://www.youtube.com/watch?v=l1si5ZWLgy0">Introduction to Bitcoin</a>

## Connect to Suredbits Lightning Node
In order to access our APIs, you will need to connect to our lightning node via a websocket client of your choosing.   The url is <span style="color:blue"> *[nodeId]@ln.test.suredbits.com* </span>

## Format 

> Example Data Returned

```json 
[
 {
    "playerId":"00-0011754",
    "gsisName":"R.Moss",
    "fullName":"Randy Moss",
    "firstName":"Randy",
    "lastName":"Moss",
    "team":"UNK",
    "position":"UNK",
    "profileId":2502220,
    "profileUrl":"http://www.nfl.com/player/randymoss/2502220/profile",
    "birthDate":"2/13/1977",
    "college":"Marshall",
    "yearsPro":14,
    "height":76,
    "weight":210,"status":
    "Unknown","_type":
    "com.github.nfldb.models.NflPlayer"
  }
]
```
> This is a sample Lightning Invoice.
> lnbcrt10n1pd5v2mwpp5ulxpj8ht4gvtqnyl8zuykfk4wcv6sz455ce5dy0e0lqt2wvhthpsdqqxqrrssn39f5saxgtqmzsdvg0uh3twrmxmnnl2mra6kcuprwc2pzplneka953svu87ajz29mf8623qefe3jpkqsmsu05l9n05xf98uqq2mf25gqvzwkq3

Requests for data follow this sample format:

{"channel":"players", "lastName" : "Moss", "firstName" : "Randy"}

<aside class="note">NOTE: All API requests must include the field type "channel".  However, that does not have to be the first field in the request. </aside>

Suredbits APIs are available via websockets with the following format:

1. A pull request implements a websocket channel for the requested <span style="color:red"> *data* </span>. 

2. Upon confirmation of a valid request, you will receive a Lightning Network Invoice that should appear similar to the one below:

3. **PLACEHOLDER**

# NFL

## Games
> Example Data Returned

```json
[
  {
    "gsisId":"2017091006",
    "gameKey":"57241",
    "startTime":"2017-09-10T17:00:00.000Z",
    "week":"NflWeek1",
    "dayOfWeek":"Sunday",
    "seasonYear":2017,
    "seasonType":"Regular",
    "finished":true,
    "homeTeam":{
      "team":"MIA",
      "score":0,
      "scoreQ1":0,
      "scoreQ2":0,
      "scoreQ3":0,
      "scoreQ4":0,
      "turnovers":0
    },
    "awayTeam":{
      "team":"TB",
      "score":0,
      "scoreQ1":0,
      "scoreQ2":0,
      "scoreQ3":0,
      "scoreQ4":0,
      "turnovers":0
    },
    "timeInserted":"2017-08-04T18:29:15.669Z",
    "timeUpdate":"2018-06-08T19:34:44.063Z",
    "_type":"com.github.nfldb.models.NflGame"
  },
    ...
  ]
```

Example Data Request 

{"channel":"games", "week":1, "seasonPhase" : "Regular", "year" : 2017}

There are two required fields to query NFL Games data:

**Required**


1. <span style="color:red"> <*week*> </span> - <span style="color:red"> *Integer value* </span>
2. <span style="color:red"> <*seasonPhase*> - <span style="color:red"> *Preaseason, Regular, Postseason* </span>


**Optional**

1. <span style="color:red"> <*year*> -  <span style="color:red"> *Int* </span>
2. <span style="color:red"> <*teamId*> - String (ex: CHI, MIN, GB, MIA* </span> etc)
`

<aside class="warning"> Can everything below here be removed from Games? </aside>

Search NFL games by team, year, and/or week.

<a href="http://api.suredbits.com/nfl/v0/games">http://api.suredbits.com/nfl/v0/games</a>

### Keywords
Keywords  | Type  | Description
--------- | ----- | -----------
<span style="color:red"> *team* </span>	  | String | The Team ID <a href="../team/#team-id-table">(Refer to this table of teams and their teamIDs.)</a>
<span style="color:red"> *year*	</span> | Integer | Year of Play
<span style="color:red"> *rank* </span>     | Integer | Week of play (ex. '6' for Week 6)

Usage   | Description  |   Example
---------- | ------------ |  --------- 
/games	| All games for current week | 	<a href="http://api.suredbits.com/nfl/v0/games">http://api.suredbits.com/nfl/v0/games</a>
/games/team |	All games for a given team for the current week. | <a href="http://api.suredbits.com/nfl/v0/games/min">http://api.suredbits.com/nfl/v0/games/min</a>
/games/team/year/ | All games for a given team in a given year. (Regular season only) | <a href="http://api.suredbits.com/nfl/v0/games/min/2015">http://api.suredbits.com/nfl/v0/games/min/2015</a>
/games/team/year/week | A single game a given team played in a given year in a given week. | <a href="http://api.suredbits.com/nfl/v0/games/min/2014/15">http://api.suredbits.com/nfl/v0/games/min/2014/15</a>
/games/year | All games played for a given year. | <a href="http://api.suredbits.com/nfl/v0/games/2016">http://api.suredbits.com/nfl/v0/games/2016</a?
/games/year/week | All games played for a given week in a given year. | <a href="http://api.suredbits.com/nfl/v0/games/2016/1">http://api.suredbits.com/nfl/v0/games/2016/1</a>


## Players
> Example Data Returned

```json 
[{"playerId":"00-0011754",
"gsisName":"R.Moss",
"fullName":"Randy Moss",
"firstName":"Randy",
"lastName":"Moss",
"team":"UNK",
"position":"UNK",
"profileId":2502220,
"profileUrl":"http://www.nfl.com/player/randymoss/2502220/profile",
"birthDate":"2/13/1977",
"college":"Marshall",
"yearsPro":14,
"height":76,
"weight":210,"status":
"Unknown","_type":
"com.github.nfldb.models.NflPlayer"}]
```

To request Player data, you must submit both a <span style="color:red"> <*firstName*> </span> and <span style="color:red"> <*lastName*> </span> into the request. 

**Example Requests**

{"channel":"players", "lastName" : "Moss", "firstName" : "Randy"}


## Team
> Sample Roster Data

```json
[{
  "weight": 218,
  "profileId": 2559252,
  "gsisName": "",
  "uniformNumber": 1,
  "fullName": "Kyle Sloter",
  "height": 76,
  "lastName": "Sloter",
  "firstName": "Kyle",
  "birthDate": "2/7/1994",
  "profileUrl": "http://www.nfl.com/player/kylesloter/2559252/profile",
  "status": "Active",
  "team": "MIN",
  "playerId": "00-0033672",
  "position": "QB",
  "yearsPro": 2,
  "college": "Northern Colorado"
}, {
  "weight": 197,
  "profileId": 2505552,
  "gsisName": "T.Newman",
  "uniformNumber": 23,
  "fullName": "Terence Newman",
  "height": 70,
  "lastName": "Newman",
  "firstName": "Terence",
  "birthDate": "9/4/1978",
  "profileUrl": "http://www.nfl.com/player/terencenewman/2505552/profile",
  "status": "Active",
  "team": "MIN",
  "playerId": "00-0022045",
  "position": "DB",
  "yearsPro": 16,
  "college": "Kansas State"
}
```

Search NFL team information by team ID.

<a href="http://api.suredbits.com/nfl/v0/team/">http://api.suredbits.com/nfl/v0/team/</a>

Usage | Description | Example 
-------- | ----------- | -------
/team/teamID/roster | Find a team's current roster | <a href="http://api.suredbits.com/nfl/v0/team/min/roster">http://api.suredbits.com/nfl/v0/team/min/roster</a>
/team/teamID/schedule | Find a team's schedule for the current season | <a href="http://api.suredbits.com/nfl/v0/team/min/schedule">http://api.suredbits.com/nfl/v0/team/min/schedule</a>


### Team ID Table
TeamID	| City & Name | TeamID | City & Name
-------- | ----------- | ------ | ---------
ARI	| Arizona Cardinals	| LA   | Los Angeles Rams
ATL	| Atlanta Falcons	| MIA  | Miami Dolphins
BAL	| Baltimore Ravens	| MIN | Minnesota Vikings
BUF	| Buffalo Bills	NE	| NE  | New England Patriots
CAR	| Carolina Panthers	| NO | New Orleans Saints
CHI	| Chicago Bears	NYG	| NYG | New York Giants
CIN	| Cincinnati Bengals	| NYJ	| New York Jets
CLE	| Cleveland Browns	| OAK	| Oakland Raiders
DAL	| Dallas Cowboys	| PHI	| Philadelphia Eagles
DEN	| Denver Broncos	| PIT	| Pittsburgh Steelers
DET	| Detroit Lions	SD	| SD   | San Diego Chargers
GB	| Green Bay Packers	| SEA	| Seattle Seahawks
HOU	| Houston Texans	| SF	| San Francisco 49ers
IND	| Indianpolis Colts	| TB	| Tampa Bay Buccaneers
JAC	| Jacksonville Jaguars	| TEN	| Tennessee Titans
KC	| Kansas City Chiefs	| WAS	| Washington Redskins


## Stats 

> Example Data Return

```json

[
  {
    "att":37,
    "cmp":27,
    "cmpAirYds":167,
    "inCmp":10,
    "inCmpAirYds": 75,
    "passingInt":0,
    "sack":1,
    "sackYds":-7,
    "passingTds":1,
    "passingTwoPointAttempt":0,
    "passingTwoPointAttemptMade":0,
    "passingTwoPointAttemptMissed":0,
    "passingYds":291,
  }
 ]
```

Example Data Requests

 {
  "channel":"stats", 
  "statType" : "passing", 
  "gameId" : "2016101604", 
  "playerId" : "00-0027973"
 }


  {
    "channel":"stats", 
    "lastName" : "Brees", 
    "firstName" : "Drew", 
    "year": 2017, "week" : 1, 
    "seasonPhase" : "Regular", 
    "statType" : "passing"
   }



To query by <span style="color:red"> *gameId* </span> or <span style="color:red"> *playerId* </span>:

**Required fields**


1. <span style="color:red"> <*channel*> </span> example: <span style="color:red"> *stats* </span>
2. <span style="color:red"> <*statType*> </span> example: <span style="color:red"> *passing, rushing, receiving, defense* </span>
3. <span style="color:red"> <*gameId>*> </span> example:  <span style="color:red"> *2016101604* </span>
4. <span style="color:red"> <*playerId*> </span> example: <span style="color:red"> *00-0027973* </span> 


To query by <span style="color:red"> *name* </span> or <span style="color:red"> *week* </span>:

**Required fields**

1. <span style="color:red"> <*channel*> </span> example <span style="color:red"> *stats* </span>
2. <span style="color:red"> <*statType*> </span> example <span style="color:red"> *passing, rushing, receiving, defense* </span>
3. <span style="color:red"> <*year*> </span> <span style="color:red"> *2016, 2017* </span>
4. <span style="color:red"> <*week*> </span>  example <span style="color:red"> *1, 2* </span>... 
5. <span style="color:red"> <*seasonPhase}*> </span> example <span style="color:red"> *Preseason, Regular, Postseason* </span>
6. <span style="color:red"> <*firstName>*> </span> example <span style="color:red"> *Drew* </span>
7. <span style="color:red"> <*lastName>*> </span> example <span style="color:red"> *Brees* </span>


Currently we only support requesting by:

1. <span style="color:red"> *statType* </span>
2. <span style="color:red"> *playerId* </span>
3. <span style="color:red"> *gameId* </span>

Eventually we will also support <span style="color:red"> *firstName* </span>, <span style="color:red"> *lastName* </span>, 
<span style="color:red"> *seasonPhase* </span>, <span style="color:red"> *year* </span> and <span style="color:red"> *week* </span>.

<aside class="warning"> What do we need from old documentation below? </aside>

Search NFL player stats in a given game for a given player.

Omitting a footballStat will return all statistics.

<a href="http://api.suredbits.com/nfl/v0/stats/footballStat/gameID/playerID">http://api.suredbits.com/nfl/v0/stats/footballStat/gameID/playerID</a>

<a href="http://api.suredbits.com/nfl/v0/stats/footballStat/lastName/firstName/year/week">http://api.suredbits.com/nfl/v0/stats/footballStat/lastName/firstName/year/week</a>

You can find a <a href="../players/">player's playerID</a> and a <a href="../games/">game's gameID</a> using this API.

Optional - specify a seasonType (for season stats and game by name):

- "reg" = Regular season

- "post" = Postseason

- "pre" = Preseason

<a href="http://api.suredbits.com/nfl/v0/stats/footballStat/lastName/firstName/year/week/seasonType">http://api.suredbits.com/nfl/v0/stats/footballStat/lastName/firstName/year/week/seasonType</a>

<aside class="notice"> SeasonType will always default to Regular season unless a different seasonType is specified.</aside>


### Keywords
Keywords | Type	| Description
-------- | ---- | ------------
<span style="color:red"> *passing* </span>	| String | Searches passing statistics.
<span style="color:red"> *rushing* </span>	| String | Searches rushing statistics.
<span style="color:red"> *receiving* </span> | String | Searches receiving statistics.
<span style="color:red"> *defensive* </span> | String | Searches defensive statistics.

#
# Email Updates
<aside class="success">Sign up to be notified as we update and add to our APIs!</aside>
<form action="//suredbits.us12.list-manage.com/subscribe/post?u=6d2301935be3bfea5b7f29e4c&amp;id=16dc8b6ffb" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate="">
            <div id="mc_embed_signup_scroll">
                <input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required="">
                <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_6d2301935be3bfea5b7f29e4c_16dc8b6ffb" tabindex="-1" value=""></div>
                <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
            </div>
        </form>
