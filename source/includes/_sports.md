# Sports

## Get sports

```shell
curl --location --request GET 'https://api.sx.bet/sports'
```

> The above command returns JSON structured like this:

```json
{
  "status": "success",
  "data": [
    {
      "sportId": 1,
      "label": "Basketball"
    },
    {
      "sportId": 2,
      "label": "Hockey"
    },
    {
      "sportId": 3,
      "label": "Baseball"
    },
    {
      "sportId": 4,
      "label": "Golf"
    },
    {
      "sportId": 5,
      "label": "Soccer"
    },
    {
      "sportId": 6,
      "label": "Tennis"
    },
    {
      "sportId": 7,
      "label": "Mixed Martial Arts"
    },
    {
      "sportId": 8,
      "label": "Football"
    },
    {
      "sportId": 9,
      "label": "E Sports"
    },
    {
      "sportId": 10,
      "label": "Custom"
    },
    {
      "sportId": 11,
      "label": "Rugby Union"
    },
    {
      "sportId": 12,
      "label": "Racing"
    },
    {
      "sportId": 13,
      "label": "Boxing"
    },
    {
      "sportId": 14,
      "label": "Crypto"
    },
    {
      "sportId": 15,
      "label": "Cricket"
    },
    {
      "sportId": 16,
      "label": "Economics"
    },
    {
      "sportId": 17,
      "label": "Politics"
    },
    {
      "sportId": 18,
      "label": "Entertainment"
    },
    {
      "sportId": 19,
      "label": "Medicinal"
    },
    {
      "sportId": 20,
      "label": "Rugby League"
    }
  ]
}
```

This endpoint retrieves all sports available on the exchange

### HTTP Request

`GET https://api.sx.bet/sports`

### Response format

| Name   | Type    | Description                                            |
| ------ | ------- | ------------------------------------------------------ |
| status | string  | `success` or `failure` if the request succeeded or not |
| data   | Sport[] | Sports available on the exchange                       |

A `Sport` object looks like

| Name    | Type   | Description         |
| ------- | ------ | ------------------- |
| sportId | number | The ID of the sport |
| label   | string | The sport name      |
