---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json
 

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Lightning API v0 Documentation

Thank you and welcome to SuredBits' API documentation. This API allows you to query our NFL data, including teams, players, games, scores, and statistics.

<aside class="success">IMPORTANT: Suredbits is a Lightning Application built on the Bitcoin protocol.  This initial release is only on testnet. </aside>

Not familiar with Bitcoin or Lightning but want to learn?  Here are some useful resources to help you get up and running with both.  Read and watch and come back when you're ready. 

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

<aside class="note">NOTE: All API requests must include the field type "channel".  However, 'channel" does not have to be the first field in the request. </aside>

Suredbits APIs are available via websockets with the following format:

1. A pull request implements a websocket channel for the requested <span style="color:red"> <*data*> </span>. 

2. Upon confirmation of a valid request, you will receive a Lightning Network Invoice that should appear similar to the one below:

3. **PLACEHOLDER**

## Error Message

If there is an error in your query, you will see a message similar to this:

Example data request

{"firstName": "Tom", "lastName": "Brady"}

*Error: JsError(List((,List(JsonValidationError(List('channel' is undefined on object: {"firstName":"Tom","lastName":"Brady"}),WrappedArray())))))*

# NFL

## Games
> Example of Games data

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

**Required fields**


1. <span style="color:red"> <*week*> </span> - <span style="color:red"> *Integer value* </span>
2. <span style="color:red"> <*seasonPhase*> </span> - <span style="color:red"> *Preaseason, Regular* </span> , or <span style="color:red"> *Postseason* </span>


**Optional fields**

1. <span style="color:red"> <*year*> -  <span style="color:red"> *Int* </span>
2. <span style="color:red"> <*teamId*> - String </span> ex: <span style="color:red"> *CHI, MIN, GB, MIA* </span> etc. <a href="#TeamID">See Team ID Table</a>

<aside class="warning"> Can everything below here be removed from Games? </aside>


## Players
> Example of Players data

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

This pull request implements a websocket channel called <span style="color:red"> *players* </span>. It returns a NFL player given a websocket request.

**Example Requests**

{"channel":"players", "lastName" : "Moss", "firstName" : "Randy"}

There are two required fields to request NFL Player data: 

1. <span style="color:red"> <*firstName*> </span>  example:  <span style="color:red"> <*Randy*> </span>
2. <span style="color:red"> <*lastName*> </span>  example:  <span style="color:red"> <*Moss*> </span>


## Team
>Example of Roster data

```json
[
  {
    "playerId":"00-0027981",
    "gsisName":"K.Rudolph",
    "fullName":"Kyle Rudolph",
    "firstName":"Kyle",
    "lastName":"Rudolph",
    "team":"MIN",
    "position":"TE",
    "profileId":2495438,
    "profileUrl":"http://www.nfl.com/player/kylerudolph/2495438/profile",
    "uniformNumber":82,
    "birthDate":"11/9/1989",
    "college":"Notre Dame",
    "yearsPro":8,"height":78,
    "weight":265,
    "status":"Active",
    "_type":"com.github.nfldb.models.NflPlayer",
  }
  ...
]
  
```

>Example of Schedule data

```json
[
  {
    "gsisId":"2017091001",
    "gameKey":"57236",
    "startTime":"20170910T170000.000Z",
    "week":"NflWeek1",
    "dayOfWeek":"Sunday",
    "seasonYear":2017,
    "seasonType":"Regular",
    "finished":true,
    "homeTeam":
      {
        "team":"CHI",
        "score":17,
        "scoreQ1":0,
        "scoreQ2":10,
        "scoreQ3":0,
        "scoreQ4":7,
        "turnovers":0
      },
    "awayTeam":
      {
        "team":"ATL",
        "score":23,
        "scoreQ1":3,
        "scoreQ2":7,
        "scoreQ3":3,
        "scoreQ4":10,
        "turnovers":1
      },
    "timeInserted":"20170804T182915.669Z",
    "timeUpdate":"20180608T192330.452Z",
    "_type":"com.github.nfldb.models.NflGame"
    }
  ...
]
```

This pull request implements a websocket channel called <span style="color:red"> *team* </span>. It returns the Roster or Schedule for a given NFL Team given a websocket request.

Example Data Request for Rosters:
{"channel": "team", "teamId": "MIN", "retrieve": "roster"}

Example Data Request for Schedules:
{"channel": "team", "teamId": "CHI", "retrieve": "schedule"}

There are two required Fields to request NFL Team & Roster data:

**Required fields**: 

1. <span style="color:red"> <*teamID*> </span>: example <span style="color:red"> *CHI* </span>, <span style="color:red"> *MIN* </span> etc.
2. <span style="color:red"> <*retrieve*> </span>: search by <span style="color:red"> *roster* </span> or <span style="color:red"> *schedule* </span>

<h3 id="TeamID"> Team ID Table</h3>

Team Id	| City & Name | TeamID | City & Name
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

> Example of Stats data

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

This pull request implements a websocket channel called <span style="color:red"> *stats* </span>.  It returns the data for an individual <span style="color:red"> *player* </span> or <span style="color:red"> *game* </span>.

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

<hr>

To query by <span style="color:red"> *name* </span> or <span style="color:red"> *week* </span>:

**Required fields**

1. <span style="color:red"> <*channel*> </span> example <span style="color:red"> *stats* </span>
2. <span style="color:red"> <*statType*> </span> example <span style="color:red"> *passing, rushing, receiving, defense* </span>
3. <span style="color:red"> <*year*> </span> <span style="color:red"> *2016, 2017* </span>
4. <span style="color:red"> <*week*> </span>  example <span style="color:red"> *1, 2* </span>... 
5. <span style="color:red"> <*seasonPhase}*> </span> example <span style="color:red"> *Preseason, Regular, Postseason* </span>
6. <span style="color:red"> <*firstName>*> </span> example <span style="color:red"> *Drew* </span>
7. <span style="color:red"> <*lastName>*> </span> example <span style="color:red"> *Brees* </span>

<hr>


Currently we only support requesting by:

1. <span style="color:red"> *statType* </span>
2. <span style="color:red"> *playerId* </span>
3. <span style="color:red"> *gameId* </span>

Eventually we will also support <span style="color:red"> *firstName* </span>, <span style="color:red"> *lastName* </span>, 
<span style="color:red"> *seasonPhase* </span>, <span style="color:red"> *year* </span> and <span style="color:red"> *week* </span>.



# Contact Support
Email us at support@suredbits.com

# Email Updates
<aside class="success">Sign up to be notified as we update and add to our APIs!</aside>
<form action="//suredbits.us12.list-manage.com/subscribe/post?u=6d2301935be3bfea5b7f29e4c&amp;id=16dc8b6ffb" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate="">
            <div id="mc_embed_signup_scroll">
                <input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="email address" required="">
                <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_6d2301935be3bfea5b7f29e4c_16dc8b6ffb" tabindex="-1" value=""></div>
                <div class="clear"><input type="submit" value="Subscribe" name="subscribe" id="mc-embedded-subscribe" class="button"></div>
            </div>
        </form>
