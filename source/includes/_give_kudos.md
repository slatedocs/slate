# Kudos Endpoints

## Give Kudos 

This endpoint creates a Kudos message.

```shell
$ curl -i -X POST -H 'Content-Type: application/json' --url 'https://api-client.kudosnow.com/v1/kudos?apikey=your_key_here' 
    --data '{
              "sender": {
                "kind": "email",
                "value": "sender@example.com"
              },
              "recipients": [
                {
                  "kind": "email",
                  "value": "receiver@example.com"
                }
              ],
              "message": {
                "body": "You done good"
              },
              "level": "good_job",
              "qualities": [
                {
                  "kind": "name",
                  "value": "Skillful"
                }
              ]
            }'
```
```javascript
var request = require('request');

var options = {
  uri: 'https://api-client.kudosnow.com/v1/kudos',
  method: 'POST',
  headers: {
    "apikey": "your_key_here"
  },
  json: {
          "sender": {
            "kind": "email",
            "value": "sender@example.com"
          },
          "recipients": [
            {
              "kind": "email",
              "value": "receiver@example.com"
            }
          ],
          "message": {
            "body": "You done good"
          },
          "level": "good_job",
          "qualities": [
            {
              "kind": "name",
              "value": "Skillful"
            }
          ]
        }
};

request(options, function (error, response, body) {
  ...
});
```

### HTTP Request 
`POST /kudos` 

**Parameters**

| Name | Located in | Description | Required | Type |
| ---- | ---------- | ----------- | -------- | ---- |
| kudos | body | Kudos message | Yes | [kudos](#kudos) |

**Responses**

| Code | Description |
| ---- | ----------- |
| 200 | successful operation |

