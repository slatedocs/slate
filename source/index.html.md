---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - json
 

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

search: true
---

# Lightning API v0 Documentation

## Background Resources
Thank you and welcome to SuredBits' Lightning App API documentation. This API allows you to query our NFL data, including teams, players, games, scores, and statistics.

We are currently focused primarily on developers already familiar with Bitcoin and know Lightning or are interested in building apps using the Lightning protocol. However, if you are just starting out in cryptocurrency development, we have included some helpful links below.

<aside class="success">IMPORTANT: Suredbits is a Lightning Application built on the Bitcoin protocol.  This initial release is only on testnet. </aside>

Here are some useful resources to help you learn and get started with Bicoin and Lightning Network.  Read and watch and come back when you're ready. 

1. <a href="https://bitcoin.org/en/download">Download Bitcoin Core</a>
2. <a href="https://lbtc.io/">Lightning Bitcoin, Downloads and Wallets</a>
3. <a href="http://lightning.network/">Lightning Network Background</a>
4. <a href="https://lightning.network/lightning-network-paper.pdf">Lightning Whitepaper</a>
5. <a href="https://www.youtube.com/watch?v=l1si5ZWLgy0">Introduction to Bitcoin</a>

## Suredbits Lightning Node
In order to access our APIs, you will need to connect to our lightning node via your preferred lightning client.   

The url is:

<span style="color:blue"> *0338f57e4e20abf4d5c86b71b59e995ce4378e373b021a7b6f41dabb42d3aad069@ln.test.suredbits.com* </span>


## Suredbits Lightning Payment 

Here is our custom drop-in solution in nodejs client for our API: <a href="https://github.com/suredbits/lightning-charge">https://github.com/suredbits/lightning-charge</a>

## Suredbits Websocket Endpoint
Here is the websocket channel for Suredbits: <a href="wss://test.api.suredbits.com/nfl/v0">wss://test.api.suredbits.com/nfl/v0</a>

## UUID
> Example Data Returned with valid UUID

```json
{
  "uuid":"123e4567-e89b-12d3-a456-426655440000",
  "data":
    {
      "version":"8",
      "lastRosterDownload":"20180720T141610.664Z",
      "seasonType":"Regular",
      "seasonYear":2017,
      "week":"NflWeek17" 
    }
 }
```

If you want to track specific requests, you can enter an optional field called <span style="color:red"> *`uuid`* </span> to any request.  

A valid <span style="color:red"> *`uuid`* </span> request will show up on the invoice, response, and any error message that is returned.  If no <span style="color:red"> *`uuid`* </span> is specified in a websocket request then this field will be omitted from that request's responses.

## Format 

> Example Data Returned

```json 
{  
  "data":
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
      "Unknown",:
    }
  ]
}
```

Suredbits APIs are available via websockets with the following format:

**Example requests**

{"channel":"players", "lastName" : "Moss", "firstName" : "Randy"}

<aside class="note">NOTE: All API requests must include the field type "channel".  However, "channel" does not have to be the first field in the request. </aside>


1. Send a request over the websocket (see <a href="#NFLData">NFL Data</a>). 

2. Upon confirmation of a valid request, you will receive a Lightning Network Invoice that should appear similar to the one below.

3. Pay that ln invoice in your lightning client 

4. Receive data :)

### Sample Lightning Invoice

A successful request will generate a lightning invoice that will look simiar to the example below:

<span style="color:red"> *lnbcrt10n1pd5v2mwpp5ulxpj8ht4gvtqnyl8zuykfk4wcv6sz455ce5dy0e0lqt2wvhthpsdqqxqrrssn39f5saxgtqmzs...* </span>


<h1 id="NFLData"> NFL Data</h1>

## Games
> Example of Games data

```json

 {
   "data":
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
     },
     ...
    ]
 }
```

**Example Requests**

{"channel":"games", "week":1, "seasonPhase" : "Regular", "year" : 2017}

There are two required fields to query NFL Games data:

**Required fields**

Field | Type | Example
------ | ------- | ------
<span style="color:red"> <*week*> </span> | Integer | <span style="color:red"> </span> <span style="color:red"> *1, 2, 3* </span> etc...
<span style="color:red"> <*seasonPhase*> </span> | String |  <span style="color:red"> *Preaseason, Regular* </span> , or <span style="color:red"> *Postseason* </span>


**Optional fields**

Field | Type | Example
------ | ------- | --------
<span style="color:red"> <*year*> </span> | Integer |  <span style="color:red"> *2009, 2010, 2011,* etc. </span>
<span style="color:red"> <*teamId*> </span> | String  |  <span style="color:red"> *CHI, MIN, GB, MIA* </span> etc. <a href="#TeamID">See Team ID Table</a>
<span style="color:red"> <*realtime*> </span> | Boolean | <span style="color:red"> *true* </span>



*Note about 

## Players
> Example of Players data

```json 

{
  "data":
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
        "Unknown",:
       }
    ]
  }
```

This request implements a websocket channel called <span style="color:red"> *players* </span>. It returns a NFL player given a websocket request.

**Example Requests**

{"channel":"players", "lastName" : "Moss", "firstName" : "Randy"}

Required fields to request NFL Player data: 

**Required Fields**

Field | Type | Example
------ | ----- | -----
<span style="color:red"> <*firstName*> </span> | String |  <span style="color:red"> <*Randy*> </span>
<span style="color:red"> <*lastName*> </span>  | String |  <span style="color:red"> <*Moss*> </span>


## Team
>Example of Roster data

```json

{
  "data":
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
       },
       ...
    ]
  }
  
  
```

>Example of Schedule data

```json

 {
   "data":
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
    },
    ...
   ]
 }
```

This request implements a websocket channel called <span style="color:red"> *team* </span>. It returns the Roster or Schedule for a given NFL Team given a websocket request.

**Example requests**

For Rosters:
{"channel": "team", "teamId": "MIN", "retrieve": "roster"}

For Schedules:
{"channel": "team", "teamId": "CHI", "retrieve": "schedule"}

For Year:
{"channel": "team", "teamId": "CHI", "retrieve": "schedule", year: 2018}

There are two required Fields to request NFL Team & Roster data:

**Required fields**: 

Field | Type | Example 
------ | ----- | ------
<span style="color:red"> <*teamID*> </span> | String |  <span style="color:red"> *CHI* </span>, <span style="color:red"> *MIN* </span> etc.
<span style="color:red"> <*retrieve*> </span> | String |  <span style="color:red"> *roster* </span> or <span style="color:red"> *schedule* </span>

**Optional Field**

Field | Type | Example
------| ----- | ------
<span style="color:red"> <*year*> </span> | Integer | <span style="color:red"> *2018* </span> , <span style="color:red"> *2015* </span> , <span style="color:red"> *2011* </span> , etc. 

<aside class="notice">NOTE: the <span style="color:red"> year </span> field defaults to current year. </aside>

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


{
  "data":
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
       },
       ...
    ]
  }

```

This request implements a websocket channel called <span style="color:red"> *stats* </span>.  It returns the data for an individual <span style="color:red"> *player* </span> or <span style="color:red"> *game* </span>.

**Example Data Requests**

 Example 1 {
  "channel":"stats", 
  "statType" : "passing", 
  "gameId" : "2016101604", 
  "playerId" : "00-0027973"
 }


  Example 2 {
    "channel":"stats", 
    "lastName" : "Brees", 
    "firstName" : "Drew", 
    "year": 2017, "week" : 1, 
    "seasonPhase" : "Regular", 
    "statType" : "passing"
   }


To query by <span style="color:red"> *gameId* </span> and <span style="color:red"> *playerId* </span>:

**Required fields**


Field | Type | Example
------ | ----- | -------
<span style="color:red"> <*channel*> </span> | String| <span style="color:red"> *stats* </span>
<span style="color:red"> <*statType*> </span> | String | <span style="color:red"> *passing, rushing, receiving, defense* </span>
<span style="color:red"> <*gameId>*> </span> | String | <span style="color:red"> *2016101604* </span>
<span style="color:red"> <*playerId*> </span> | String | <span style="color:red"> *00-0027973* </span> 


To query by <span style="color:red"> *name* </span> and <span style="color:red"> *week* </span>:

**Required fields**

Field | Example
------ | -------
<span style="color:red"> <*channel*> </span> | <span style="color:red"> *stats* </span>
<span style="color:red"> <*statType*> </span> | <span style="color:red"> *passing, rushing, receiving, defense* </span>
<span style="color:red"> <*year*> </span> | <span style="color:red"> *2016, 2017* </span>
<span style="color:red"> <*week*> </span> |  <span style="color:red"> *1, 2* </span>... 
<span style="color:red"> <*seasonPhase*> | </span> <span style="color:red"> *Preseason, Regular, Postseason* </span>
<span style="color:red"> <*firstName*>  | </span> <span style="color:red"> *Drew* </span>
<span style="color:red"> <*lastName*> | </span> <span style="color:red"> *Brees* </span>


# Contact Us
Follow us on twitter <a href="https://twitter.com/SuredBits">@Suredbits</a>

Join our Slack channel <a href="https://suredbits.slack.com/">Suredbits Slack</a>
 
Email us at <a href="mailto:support@suredbits.com">support@suredbits.com</a>

