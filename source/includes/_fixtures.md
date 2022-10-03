# Fixtures

## Get fixtures

```shell
curl --location --request GET 'https://api.sx.bet/fixture/active?leagueId=2'
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": [
    {
      "participantOneName": "Nevada Wolf Pack",
      "participantTwoName": "North Dakota State",
      "startDate": "2020-11-25T20:00:00.000Z",
      "status": 1,
      "leagueId": 2,
      "leagueLabel": "NCAA",
      "sportId": 1,
      "eventId": "L6206070"
    },
    {
      "participantOneName": "UMass Lowell River Hawks",
      "participantTwoName": "San Francisco Dons",
      "startDate": "2020-11-25T20:00:00.000Z",
      "status": 1,
      "leagueId": 2,
      "leagueLabel": "NCAA",
      "sportId": 1,
      "eventId": "L6208648"
    },
    {
      "participantOneName": "William Jewell",
      "participantTwoName": "Indianapolis",
      "startDate": "2020-11-28T03:45:00.000Z",
      "status": 1,
      "leagueId": 2,
      "leagueLabel": "NCAA",
      "sportId": 1,
      "eventId": "L6217784"
    }
  ]
}
```

This endpoint returns current active fixtures for a particular league. A fixture can also be thought of as an event and multiple markets are under a particular event. Note that this endpoint only returns fixtures that have a status of either `1`, `2`, `6`, `7`, `8`, or `9`. See [the status table in this section](#get-fixture-status) for more details.

### HTTP Request

`GET https://api.sx.bet/fixture/active`

### Query parameters

| Name     | Required | Type   | Description          |
| -------- | -------- | ------ | -------------------- |
| leagueId | true     | number | The ID of the league |

### Response format

| Name   | Type      | Description                                            |
| ------ | --------- | ------------------------------------------------------ |
| status | string    | `success` or `failure` if the request succeeded or not |
| data   | Fixture[] | The active fixtures for this particular league         |

A `Fixture` object looks like this

| Name               | Type      | Description                                                                                              |
| ------------------ | --------- | -------------------------------------------------------------------------------------------------------- |
| participantOneName | string?   | The first participant in the fixture. Present if it's a two-participant event.                           |
| participantTwoName | string?   | The second participant in the fixture. Present if it's a two-participant event.                          |
| participants       | string[]? | All the participants in the fixture. Present if it's an n-participant event.                             |
| startDate          | string    | The start date of the event in UTC time                                                                  |
| status             | number    | The status of the fixture. See [the status table in this section](#get-fixture-status) for more details. |
| leagueId           | number    | The ID of the league this fixture belongs to                                                             |
| leagueLabel        | string    | The name of the league this fixture belongs to                                                           |
| sportId            | number    | The ID of the sport this fixture belongs to                                                              |
| eventId            | string    | The ID of this fixture                                                                                   |
|                    |

## Get fixture status

```shell
curl --location --request POST 'https://api.sx.bet/fixture/status' \
--header 'Content-Type: application/json' \
--data-raw '{
    "sportXeventIds": ["L6217784"]
}'
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": {
    "L6217784": 1
  }
}
```

This endpoint returns the status of the passed event IDs.

### HTTP Request

`POST https://api.sx.bet/fixture/status`

### Request payload

| Name           | Required | Type     | Description           |
| -------------- | -------- | -------- | --------------------- |
| sportXeventIds | true     | string[] | An array of event IDs |

### Response format

| Name   | Type   | Description                                                     |
| ------ | ------ | --------------------------------------------------------------- |
| status | string | `success` or `failure` if the request succeeded or not          |
| data   | obj    | Mapping from event Id to a status flag for each event's status. |

The possible statuses for a fixture are the following

| ID  | Name            | Description                                                                                                                                                                                                                                                                                                                         |
| --- | --------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| 1   | Not started yet | The event has not started yet                                                                                                                                                                                                                                                                                                       |
| 2   | In progress     | The event is live                                                                                                                                                                                                                                                                                                                   |
| 3   | Finished        | The event is finished                                                                                                                                                                                                                                                                                                               |
| 4   | Cancelled       | The event has been cancelled                                                                                                                                                                                                                                                                                                        |
| 5   | Postponed       | The event has been postponed. Postponed is sent for events which are postponed and will be played at a later time. In case no new start date/time is available within 48 hours, the event will be cancelled. In case a new start time is available within 48 hours, we will update it to "Not started yet" with the new start time. |
| 6   | Interrupted     | The event has been interrupted. Interrupted is sent for interrupted events (for example - rain delay). We will continue the coverage once the event is renewed, under the same event ID.                                                                                                                                            |
| 7   | Abandoned       | The event has been abandoned. Abandoned is a final status sent for abandoned events (player injury in Tennis for example), these matches will not resume.                                                                                                                                                                           |
| 8   | Coverage lost   | The coverage for this event has been lost                                                                                                                                                                                                                                                                                           |
| 9   | About to start  | The event has not started but is about to. Note: this status will be shown up to 30 minutes before the event has started.                                                                                                                                                                                                           |
