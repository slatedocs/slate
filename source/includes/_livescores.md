# Live scores

## Get live scores

```shell
curl --location --request POST 'https://api.sx.bet/live-scores' \
--header 'Content-Type: application/json'
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": [
    {
      "createdAt": "2021-07-08T17:57:38.057Z",
      "currentPeriod": "8th Inning",
      "extra": "[{\"Name\":\"Strikes\",\"Value\":\"0\"},{\"Name\":\"Turn\",\"Value\":\"2\"},{\"Name\":\"Balls\",\"Value\":\"1\"},{\"Name\":\"Outs\",\"Value\":\"2\"},{\"Name\":\"Bases\",\"Value\":\"0/0/0\"}]",
      "leagueId": 171,
      "periodTime": "-1",
      "periods": [
        {
          "label": "1st Inning",
          "isFinished": true,
          "teamOneScore": "0",
          "teamTwoScore": "2"
        },
        {
          "label": "2nd Inning",
          "isFinished": true,
          "teamOneScore": "0",
          "teamTwoScore": "0"
        },
        {
          "label": "3rd Inning",
          "isFinished": true,
          "teamOneScore": "0",
          "teamTwoScore": "0"
        },
        {
          "label": "4th Inning",
          "isFinished": true,
          "teamOneScore": "0",
          "teamTwoScore": "0"
        },
        {
          "label": "5th Inning",
          "isFinished": true,
          "teamOneScore": "0",
          "teamTwoScore": "0"
        },
        {
          "label": "6th Inning",
          "isFinished": true,
          "teamOneScore": "0",
          "teamTwoScore": "0"
        },
        {
          "label": "7th Inning",
          "isFinished": true,
          "teamOneScore": "1",
          "teamTwoScore": "0"
        },
        {
          "label": "8th Inning",
          "isFinished": false,
          "teamOneScore": "0",
          "teamTwoScore": "0"
        }
      ],
      "sportId": 3,
      "teamOneScore": 1,
      "teamTwoScore": 2,
      "updatedAt": "2021-07-08T20:35:21.607Z",
      "sportXeventId": "L7187811"
    }
  ]
}
```

This endpoint retrieves live scores for a particular event ID.

### HTTP Request

`POST https://api.sx.bet/live-scores`

### Request payload

| Name           | Required | Type     | Description           |
| -------------- | -------- | -------- | --------------------- |
| sportXEventIds | true     | string[] | An array of event IDs |

<aside class="notice">
Up to 50 event IDs can be supplied at a time. 
</aside>

### Response format

| Name   | Type    | Description                                            |
| ------ | ------- | ------------------------------------------------------ |
| status | string  | `success` or `failure` if the request succeeded or not |
| data   | Score[] | The resulting scores for the fixtures passed in        |

A `Score` object has the following format

| Name          | Type     | Description                                                                     |
| ------------- | -------- | ------------------------------------------------------------------------------- |
| currentPeriod | string   | The current period label                                                        |
| extra         | string   | Extra data for this match                                                       |
| leagueId      | number   | The league ID for this match                                                    |
| periodTime    | number   | The time in the period. If it's -1, it is not available or the game is finished |
| periods       | Period[] | All of the periods in the match                                                 |
| sportId       | number   | The ID of the sport for this match                                              |
| teamOneScore  | number   | The current score for team one                                                  |
| teamTwoScore  | number   | The current score for team two                                                  |
| sportXeventId | string   | The event ID for this match                                                     |

A `Period` object has the following format

| Name         | Type    | Description                          |
| ------------ | ------- | ------------------------------------ |
| label        | string  | The current period name              |
| isFinished   | boolean | `true` if the period is over         |
| teamOneScore | string  | The score of team one in this period |
| teamTwoScore | string  | The score of team two in this period |
