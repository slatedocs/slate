# Web Socket RPC
You can make requests over rpc (Remote Procedure Call) using the socket api. Almost all rest endpoints can be invoked as rpc calls to the Web Socket Server.

Remote Procedure Call (RPC) is a protocol that one program can use to request a service from a program located in another computer in a network without having to understand network details. RPC uses the client/server model. The requesting program is a client and the service-providing program is the server.

The client sends request message to the server and then waits for the response. 
Socket connection needs to be [authenticated](/#authenticating-a-connection) to make RPC requests.

## Request Message
The request message must be JSON object with the following fields.

|Name|Type|Description|
|---|---|---|
|type|string|Type of request message.|
|payload|object|The payload object contains method, params and id.|
|method|string|The method to be invoked.|
|params|object|The parameters for the method that needs to be invoked.|
|id|string|An identifier of the request. If it is included, then the response will contain the same identifier|

```
// Socket RPC request message sample
{
    "type": "rpc",
    "payload" : {
        "method": "post/orders",
        "params" : {
            "order_type":"limit_order",
            "size":1,
            "side":"buy",
            "limit_price":"4200",
            "product_id":16,
            "post_only":"false",
            "reduce_only":"false",
            "time_in_force":"gtc"
        },
        "id": "1234"
    } 
}
```
## Response Message
The response message will be similar to the REST API.