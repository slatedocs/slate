# Gateway Events

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
  App.ws = new WebSocket('ws://ec2-54-89-135-191.compute-1.amazonaws.com:8080/cable', ["actioncable-v1-json", "actioncable-unsupported"]);

  App.param = {channel: "GatewayEventChannel", gateway_id: "${GATEWAY_ID}"};

  App.ws.on('open', function open() {
    data = {
      command: "subscribe",
      identifier: JSON.stringify(App.param)
    }
    App.ws.send(JSON.stringify(data));
  });
  App.ws.on('message', function (event) {
    console.log(event);
  });
  function guid() {
   function s4() {
     return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
   }
   return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
  }
}

App.connect_server();
```

### Script Parameters

Parameter | Description
--------- | -----------
GATEWAY_ID | The ID of the associated gateway

> Then each time a new command is issued and/or updated, you will receive a message like this:

```json
{
  "identifier": {
    "channel":"GatewayEventChannel",
    "gateway_id": "0000000-0000-0000-0000-00000000000"
  },
  "message": {
    "id": "3333333-3333-3333-3333-33333333333",
    "status": "succeeded",
    "gateway_id": "0000000-0000-0000-0000-00000000000",
    "device_id": "1111111-1111-1111-1111-11111111111",
    "device_ieee": "00:00:00:00:00:00",
    "action": "lock_door",
    "properties": {},
    "created_at": "2020-01-01T12:34:56.789Z",
    "updated_at": "2020-01-01T12:34:56.789Z",
    "command_type": "device_action"
  }
}
```
