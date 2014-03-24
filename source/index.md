---
title: St. Baldrick's Foundation API Reference

language_tabs:
  - shell
  - ruby

toc_footers:
 - <a href='#'>Sign Up for a Developer Key</a>
 - <a href="mailto:sbf@firespring.com?Subject=API%20documentation%20contact">Contact Us</a>

---

# Introduction

Welcome to the St. Baldrick's Foundation API! You can use our API to access St. Baldrick's Foundation 
API endpoints, which can get, create, and update information on various events, teams, participants, 
fundraisers, donations, etc.

We have language bindings in shell and Ruby. You can view code examples in the dark area to the right, 
and you can switch the programming language of the examples with the tabs in the top right.

# Getting Started

The purpose of the "Getting Started" section is to explain the core concepts of our API. 
In this section we will explain the relationships between our main entities, which are Users, 
Profiles, Events, Teams, Fundraisers, Participants, Kids, and Funds.  This section is conceptual 
and more of an overview, feel free to check out each entity for more information, and the 
<a href="#tutorial-section">tutorial section</a> for implementation.

One of the core concepts, is that none of the "core" entities (besides Users and Profiles) 
are possible without the Event or Fundraiser entities.  For example, you can't just have a team 
that isn't associated with an event.  If you look at the image below, you will see the necessity 
of either an Event (most cases) or a stand-alone Fundraiser.

<img src="/images/entity_associations.png">

For the moment ignore the Fund entity relationship, we will explain that beast in a moment, but as 
you can see, the Event entity is necessary for all of the other main entities to exist. A User and Profile 
is necessary in order to create a new event so these are critical entities as well, but we will 
explain them a bit later.

Let's start from scratch; we want to create a new event, so what does that entail?  First, we need to 
have a User associated with a Profile that has registered an event application to with the St. Baldrick's Foundation. 
When the event application is processed by the St. Baldrick's Foundation, an event is created, but will be inactive until
the new applicant (<a href="#participant">Participant</a>) has fulfilled his/her duty of meeting the <a href="#event-organizer">requirements</a> 
of starting an event.  Once the application is accepted this will automatically create a Participant 
entity which has a "role" of "<a href="#event-organizer">event organizer</a>" attached to it.  You may be asking yourself, 
"I thought participants were needed to have an event or a team to be associated with?".  You are correct, but participants can have a 
variety of "<a href="#roles">roles</a>".  One of those roles is event organizer, and this is exactly the role that is 
associated with the newly created event.  This participant can not leave the newly created event and is always 
associated with that event. 


# Tutorial Section

TODO- Sorry, you're sol atm.

# Authentication

> To authorize, use this code:

```ruby
require 'sbf'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "https://api.stbaldricks.org/v2"
  -H "Authorization: meowmeowmeow"
```

> Make sure to replace `meowmeowmeow` with your API key.

The St. Baldrick's Foundation uses API keys to allow access to the API. You can register a new SBF API key at our [developer portal](http://example.com/developers).

SBF expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace `meowmeowmeow` with your personal API key.
</aside>

# User

# Profile

# Event

# Team

# Participant

## Participant Shape

A participant entity is pretty much any person associated with an event that is not a kid. 
Participants can have a variety of roles and responsibilities, such as being a "shavee", barber, 
treasurer, registrar, event organizer, team captain, lead barber, lead treasurer, lead organizer, 
barber coordinator, or volunteer (you can learn more about these roles in the <a href="#roles">Roles</a> documentation ).

The purpose of a Participant entity keep track of a profiles' participation at different events. 
The main things to keep track of for a participant is what event they're at, whether they are on a <a href="#team">Team</a> 
or not, what their fund raising goal is, and if they have completed everything they need to become an 
active participant.

It's important to know that one <a href="#profile">Profile</a> can have multiple participants associated with their profile, 
and that multiple roles can be associated with each participant. For example, I could be a team captain, 
organizer, and shavee on team ABC at event X and just a shavee on no team at event Y. My profileID would 
be the same, but I would have two different participantIDs associated with it. One of my participantIDs 
would have 3 different roles associated to it, and the other participantID would only have one role 
associated with it. A participant can only be associated with one team, which can be changed or removed, 
unless the participant is a team captain, in which case they can not be removed from that team.


## Get Participant

```ruby
require 'sbf'

api = SBF::APIClient.authorize!('meowmeowmeow')
api.participants.get
```

```shell
curl "http://api.stbaldricks.org/v2/participants"
  -H "Authorization: meowmeowmeow"
```

> The above command returns JSON structured like this:

```json

{
  "id": 2,
  "event": {"content": "event hash"},
  "is_barber": false,
  "is_shavee": true
}

```

This endpoint retrieves one unique participant.

### HTTP Request

`GET https://api.stbaldricks.org/v2/participant`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_event | false | If set to true, the result will also include the event.
include_profile | false | If set to true, the result will also include the profile.
include_team | false | If set to true, the result will also include the team.
id |  | The ID of the participant to retrieve

<aside class="success">
Remember — a happy user is an authenticated user!
</aside>

# Roles

The Role is a component of a Participant, and every participant must have at least one role, but can have multiple roles 
if necessary. The most common will be the "Shavee" role, but you should familiarize yourself with the different types of 
roles below

## Shavee
The Shavee role is the most common role. The role means the participant is raising money by shaving their head at an event.
## Barber
The Barber role means that the participant is planning to shave other participant's heads at the event. Registering 
a participant with a barber role requires 4 extra parameters: BarberLicenseNumber, BarberLicensingBody, BarberSalonName, 
and SalonPhoneNumber.
## Treasurer
The Treasurer role means the participant will be collecting and managing the money for an event. Each event must recruit 
and register two treasurers to be responsible for submitting proceeds and documentation to the St. Baldrick's Foundation. 
Protecting the integrity of donations and the safety of our constituents is important to the reputation of the Foundation 
and its volunteers. Therefore, treasurers are asked to complete a background check before they receive instructions and 
materials.
## Registrar
The registrar oversees the entire registration process of volunteers, barbers and shavees, including walk-in participants. 
This person will work closely with both the Event Organizer and event Treasurers.
## Event Organizer
The Event Organizer role the role of the participant that setup and event. The Organizer will need to sign an agreement 
and complete a checklist before their event become active.
## Team Captain
The Team Captain role is the role of a participant that created a new team for an event. Generally a participant can 
join and remove themselves from teams, but as a Team Captain a participant is not allow to change teams or be removed 
from the team it created.
## Lead Barber
There can only be one Lead Barber per event, and this participant isn't allowed to switch teams.
## Lead Treasurer
There can only be one Lead Treasurer per event, and this participant isn't allowed to switch teams.
## Lead Organizer
## Barber Coordinator
The Barber Coordinator role will manage the barbers, ensure the rules and regulations are adhered to, 
and assist the Event Organizer in creating the official shave schedule. This volunteer does not have 
to be a licensed barber to fulfill this role.
## Volunteer

# Fundraiser

# Kid

# Reponses

# Errors

## Status Codes
The SBF API uses the following error codes:

Error Code | Meaning
---------- | -------
400 | Bad Request -- Your request sucks
401 | Unauthorized -- Your API key is wrong
403 | Forbidden -- The SBF requested is hidden for administrators only
404 | Not Found -- The specified SBF request doesn't exist bro
406 | Not Acceptable -- You requested a format that isn't json
408 | Request Timeout -- The SBF requested took way too long
415 | Unsupported Media Type -- This thing you were looking we don't support..
420 | Enhance Your Calm -- Whatever you where trying to do took too long, chill
500 | Internal Server Error -- We had a problem with our server. Try again later.
502 | Bad Gateway -- uh, this was a bad gateway..
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.

## Error Codes

Error code stuff:

### 1000 
InvalidVersion
### 1001
VersionDeprecated
### 1002 
HttpsRequired
### 1003 
InvalidFormat

### 1100
InvalidUserKey
### 1101
KeyLockedOrInactive
### 1102
MaxFailedLoginAttempts
### 1103
InvalidCredentials
### 1104
IpAddressNotAllowed
### 1105
NotAuthenticated
### 1106 
SudoRestriction

### 1200
RequestParameterRequired
### 1201
Validation

### 1300
CreditCardProcessor
### 1301
CreditCardProcessorValidations
### 1302
CreditCardProcessorProcessorDeclined
### 1303
CreditCardProcessorGatewayRejected

### 1400
FileSystem

### 1500
Facebook
### 1501
FacebookEmptyToken

### 1600
Twitter
### 1601
TwitterEmptyToken

### 1700
ElasticSearch

It looks like something went wrong with Elastic search, I know this probably doesn't help much, 
but that is why I've included a TODO here.

### 1800
Memcache

### 1900
MongoDB

### 2000
Redis

### 5001
Save
### 5002
Delete
### 5003
MissingRequiredParameter
### 5004
InvalidParameter
### 5005
InvalidRequest
### 5006
SaveFundRelationship

### 6000
UnrecognizedField
### 6001
InvalidField
### 6002
MissingRequiredField
### 6003
EntityValidation

### 7000
UnsupportedMethod