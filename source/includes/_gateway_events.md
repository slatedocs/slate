# GATEWAY EVENTS

## Subscribing to Gateway Events

You can listen to command events on the GatewayEventChannel using your gateway_id as a parameter. See example to the right:

```javascript
var App = {};

App.sendmessage = function(send) {
  data = {
    message : send,
    action : "speak"
  };
  message = {
    command: "message",
    identifier: JSON.stringify(App.param),
    data: JSON.stringify(data)
  };
  App.ws.send(JSON.stringify(message));
}

App.connect_server = function() {
  const WebSocket = require('ws');
  App.ws = new WebSocket('ws://ec2-35-173-199-89.compute-1.amazonaws.com:8080/cable', ["actioncable-v1-json", "actioncable-unsupported"]);

  App.param = {channel: "GatewayEventChannel", gateway_id: "${GATEWAY_UUID}"};

  App.ws.on('open', function open() {
    data = {
      command: "subscribe",
      identifier: JSON.stringify(App.param)
    }
    App.ws.send(JSON.stringify(data));
  });
  App.ws.on('message', function (event) {
    console.log(JSON.parse(event));
  });
}

App.connect_server();
```

### Script Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the associated gateway

> Then each time a new command is issued and/or updated, you will receive a message like the one below:

```json
{
  "identifier": {
    "channel":"GatewayEventChannel",
    "gateway_id": "486044af-5b15-436e-a356-d5f28c28f22a"
  },
  "message": {
    "id": "fa3e7833-2839-46d6-9742-b73f30a6db46",
    "status": "completed",
    "device_id": "9980a513-7a7b-434c-801f-27008fd0fcda",
    "created_at": "2020-02-09T22:56:20.565Z",
    "updated_at": "2020-02-09T22:56:23.039Z",
    "name": "lock",
    "properties": {}
  }
}
```
